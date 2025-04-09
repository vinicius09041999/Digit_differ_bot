import 'package:flutter/material.dart';

void main() {
  runApp(DerivBotApp());
}

class DerivBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DerivBot Pro',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BotHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BotHomePage extends StatefulWidget {
  @override
  _BotHomePageState createState() => _BotHomePageState();
}

class _BotHomePageState extends State<BotHomePage> {
  String apiToken = '';
  String botSelecionado = 'Rise/Fall';
  String status = 'Aguardando início...';

  void iniciarBot() {
    setState(() {
      status = 'Executando $botSelecionado com API: $apiToken\n\n(Exemplo de simulação - integração real será feita via WebSocket)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DerivBot Pro')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Cole sua API da Deriv'),
              onChanged: (value) => apiToken = value,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: botSelecionado,
              items: ['Rise/Fall', 'Digit Differ'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  botSelecionado = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: iniciarBot,
              child: Text('Iniciar Bot'),
            ),
            SizedBox(height: 30),
            Text(status),
          ],
        ),
      ),
    );
  }
}
