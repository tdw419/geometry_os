# Foundry Daemon - Implementation Tasks

## Phase 1: Setup & Connection
- [x] **Infrastructure**
    - [x] Create `systems/foundry/` directory structure (`intents/`, `logs/`, `config/`).
    - [x] Create `foundry_daemon.py` using `geometry_os.daemons.BaseDaemon`.
- [x] **LM Studio Bridge**
    - [x] Implement `LMStudioClient` class (using `openai` or `requests`).
    - [x] Create system prompt template describing `GeometryOS` Python API.
    - [x] Verify connection to `localhost:1234`.

## Phase 2: Intent Processing
- [x] **File Watcher**
    - [x] Monitor `foundry/intents/*.md`.
    - [x] Parse Frontmatter (model, temperature) and Body (prompt).
- [x] **Code Generation**
    - [x] Send prompt to LM Studio.
    - [x] Extract code blocks (Python) from response.
    - [x] (Optional) Run static analysis / lint check on generated code.

## Phase 3: Brick Manufacturing
- [x] **Assembly**
    - [x] Use `PixelTextEncoder` (or `RtsAsset.create`) to encode code into PNG.
    - [x] Embed metadata (Author: AI, Model: [ModelName], Prompt: [original_prompt]).
- [x] **Deployment**
    - [x] Move generated brick to `systems/builder/queue/`.
    - [x] Archive processed intent to `foundry/archive/`.

## Phase 4: Integration Test
- [x] Create `tests/foundry/test_ai_build.py`.
- [x] detailed "End-to-End" test flow: Intent -> AI -> Code -> Brick -> Map -> Execution.
