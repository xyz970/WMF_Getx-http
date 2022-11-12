import 'dart:convert';
import 'package:http/http.dart';
import 'package:tugas/models/popular_movies.dart';

class ApiProvider {
  String apiKey = '9f1001e8571bef93f01c6ac382c6a82a';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}