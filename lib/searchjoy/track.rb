module Searchjoy
  module Track

    def search_with_track(term, options = {})
      results = search_without_track(term, options)

      if options[:track]
        attributes = options[:track] == true ? {} : options[:track]
        results.search = Searchjoy::Search.create({search_type: self.name, query: term, results_count: results.total_results}.merge(attributes))
      end

      results
    end

  end
end
