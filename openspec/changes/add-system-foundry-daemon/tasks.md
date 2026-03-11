# System Foundry Daemon - Implementation Tasks

## Phase 1: Protocol & Tasks
- [x] **Task Definition**
    - [x] Define `FoundryTask` schema in `openspec/changes/add-system-foundry-daemon/schema.json`.
    - [x] Implement `TaskMonitor` to watch `openspec/tasks/system_foundry/*.task.json`.
- [x] **OpenSpec Integration**
    - [x] Update OpenSpec to support "foundry-v2" task type.

## Phase 2: System Foundry Daemon
- [x] **Core Daemon**
    - [x] Create `systems/foundry/system_foundry_daemon.py`.
    - [x] Integrate `tensor_fold.py` as a library.
- [x] **LM Studio Analysis**
    - [x] Create `AnalysisEngine` module to interface with LM Studio.
    - [x] Implement `summarize_binary(path)` using `objdump` and LLM.
    - [x] Implement `detect_vulnerability(path)` (Geometric Analysis).

## Phase 3: Linux → Brick Pipeline
- [x] **Binary Folding**
    - [x] Implement conversion of ELF sections (.text, .data) to bricks.
    - [x] Create `system_snapshot.py` utility for bulk dir-to-brick conversion.
- [x] **Metagenetics**
    - [x] Embed LLM-generated summaries into PNG metadata of the brick.

## Phase 4: PixiJS Integration
- [x] **Infinite Map Loading**
    - [x] Ensure `systems/infinite_map_rs` can load the generated `.brick` files.
    - [x] Create a "System District" area agent for the infinite map.

## Phase 5: Continuous Mode
- [x] **Watch Mode**
    - [x] Implement `inotify` watcher to auto-rebuild bricks on file change.
    - [x] Live updates of `/proc/meminfo` to a dynamic brick.

## Phase 6: Hardware & Driver Substrate
- [x] **The Silicon District**
    - [x] Implement `SiliconAgent` to visualize Linux Driver states (`/dev`, `/sys/class`).
    - [x] Map `/dev/input` events to realtime Hilbert clusters on the map.
- [x] **Driver Analysis**
    - [x] Run automated vulnerability scanning on local `.ko` (Kernel Object) files.
    - [x] Generate "Safety Bricks" with embedded LLM warnings for high-risk driver code.
