# Proposal: Integrate Foundry Daemon with RAG

## Why
The `FoundryDaemon` is responsible for transmuting symbolic code into visual bricks. Currently, its shader generation capabilities (`.intent` -> `.wgsl`) are limited by a lack of project context. It cannot see existing shader libraries or conventions. By integrating Retrieval Augmented Generation (RAG) via LanceDB, the daemon can fetch relevant code snippets to guide the LLM, producing more compatible and idiomatic WGSL shaders.

## What Changes
1.  **RAG Integration**: Ensure `FoundryHandler` in `foundry_daemon.py` initializes `lancedb` and `sentence_transformers` correctly.
2.  **Context Injection**: Update `process_intent` to query the vector DB and inject relevant snippets into the LLM system prompt.
3.  **Dependencies**: Handle cases where RAG dependencies are missing by gracefully degrading to context-free generation.
