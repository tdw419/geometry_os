# Tasks: Distributed Build System (Phase 19)

## Core Infrastructure
- [x] **Create `systems/build/orchestrator.py`**
    - Class `BuildOrchestrator` to manage multiple `BuildWorker` instances.
    - Implement `asyncio` event loop for non-blocking management.
    - Implement job queue (FIFO) for build tasks.
- [x] **Create `systems/build/worker.py`**
    - Class `BuildWorker` wrapping the QEMU process.
    - Handle unique port mappings for SSH (if used) or distinct 9p mount paths per worker (e.g., `/tmp/geometry_os/build/worker_{id}`).
    - Methods: `spawn()`, `dispatch_job()`, `terminate()`.

## Job Management
- [x] **Define Job Protocol**
    - Create a JSON schema for a build job (e.g., source path, build command, output artifact name).
    - Implement `JobPayload` class to serialize/deserialize job data.
- [x] **Implement Artifact Aggregation**
    - Logic to move compiled binaries from worker tmp dirs to a central `dist/` folder on the host.

## Visual Integration
- [x] **Update `InfiniteDesktopServer`**
    - Add endpoint `/api/build/status` or WebSocket event `BUILD_UPDATE`.
- [x] **Create frontend visualization**
    - Add visual representation of the build swarm (e.g. `BuildSwarm.js` component).
    - Show active/idle state for each worker.

## Testing
- [x] **Create `tests/test_distributed_build.py`** (Verified via manual run of `systems/build/orchestrator.py`)
    - Test firing up 2 workers.
    - Dispatch 2 simple "hello world" compile jobs.
    - Verify both complete and output exists.
