require 'rails_helper'

describe MoviesController, :type => :controller do
    describe 'Search Movie by Same Director' do
        it 'should call Movie.similar_movies' do
            expect(Movie).to receive(:similar_movies).with('Aladdin')
            get :search, {title: 'Aladdin'}
        end

        
        it "should redirect to home page if no director info" do
            Movie.stub(:similar_movies).with('No name').and_return(nil)
            get :search, { title: 'No name' }
            expect(response).to redirect_to(root_url)
        end
    end
end