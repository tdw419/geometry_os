# Design: Foundry RAG Pipeline

## Visual Impact
- **Console**: The daemon will output "🔍 Searching Knowledge Base..." and "✨ Generated Shader: ...".
- **Visual Shell**: No direct visual change, but the resulting shaders will be higher quality, leading to better visuals in the OS.

## Architecture
1.  **Watcher**: `FoundryDaemon` watches `src/intents/*.intent`.
2.  **Trigger**: User saves a file like `ocean.intent` containing "Create a shifting blue ocean shader".
3.  **Retrieval**: Daemon embeds query, searches `data/vector_db` via LanceDB.
4.  **Generation**: LLM receives Prompt + Context.
5.  **Output**: Daemon writes `ocean.wgsl`.
6.  **Loop**: Use `tensor_fold.py` (existing watcher) to fold `.wgsl` -> `.brick`.

## Constraints
- **Latency**: RAG lookup + LLM gen takes 2-10s.
- **Dependencies**: `lancedb` and `sentence-transformers` are heavy. Must not crash if missing.
