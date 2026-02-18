# Proposal: System Brick Foundry Daemon (Linux-to-Brick Pipeline)

## Problem  
While we have the `Foundry Daemon` for converting NL intents into code bricks, we lack an automated, task-driven pipeline for converting **live Linux system artifacts** (binaries, file systems, memory maps) into `.brick` files for spatial visualization on the PixiJS Infinite Map.

## Solution  
Implement the **System Foundry Daemon**, a persistent process that:
1.  **Monitors OpenSpec Tasks**: Watches for `FoundryTask` definitions in `openspec/tasks/system_foundry`.
2.  **Analyzes Artifacts via LM Studio**: Uses local LLMs (e.g., `qwen2.5-coder`) to analyze binaries, headers, or logs and generate "Semantic Metadata".
3.  **Folds via Hilbert Curves**: Uses `tensor_fold.py` to create V2 Spatial Bricks (.brick) with preserved data locality.
4.  **Continuous Synchronization**: Can be set to "Watch Mode" for specific Linux paths, updating the brick in real-time as the system state changes.

## Architecture
- **Daemon**: `system_foundry_daemon.py`
- **Dependency**: `tensor_fold.py` (V2BR format)
- **AI Bridge**: LM Studio (Local Inference)
- **Task Management**: OpenSpec `FoundryTask` protocol.

## Impact
- **Spatial Linux**: Users can navigate `/usr/bin`, `/proc`, or `/etc` as 2D spatial "districts" on the Infinite Map.
- **Pattern Recognition**: AI-labeled bricks allow users to "see" security vulnerabilities, code complexity, or memory leaks as visual fractures.
- **Bootable Snapshots**: Bricks can be extracted back into binaries for execution on the Pixel CPU.

## Tasks (Proposed)
1.  **Protocol Definition**: Create `FoundryTask` JSON schema.
2.  **Daemon Core**: Implement the watch loop and OpenSpec task parser.
3.  **LM Studio Labeling**: Implement a module that sends disasm/hex snippets to LM Studio for semantic tagging.
4.  **Queue Integration**: Link to `systems/builder/queue` for PixiJS shell ingestion.
