# Tasks: Upgrade Evolution Daemon to V7

## Phase 1: Foundation
- [x] **Task 1.1: Create V7 File Structure**
    - Copy `evolution_daemon_v6.py` to `evolution_daemon_v7.py`.
    - Update class name and docstrings.
    - Import `RustNeuralBridge`.
- [x] **Task 1.2: Integrate Rust Bridge**
    - Initialize `self.rust_bridge = RustNeuralBridge()` in `__init__`.
    - Add `self.rust_bridge.initialize()` call (guarded by try/except).
    - Add logging to confirm connection: "⚡ Connected to Rust Neural Runtime via FFI".

## Phase 2: Runtime Interaction
- [x] **Task 2.1: Implement Stats Polling**
    - Update `_perform_health_check` to query `self.rust_bridge.get_stats()`.
    - Log Rust runtime metrics (pixel count, buffer usage) alongside Python metrics.
- [x] **Task 2.2: Implement Neural Injection**
    - Modify `initiate_neural_evolution` to support a new injection mode.
    - If `self.rust_bridge` is active, send the "Evolved Kernel" signal via FFI.

## Phase 3: Verification
- [x] **Task 3.1: Integration Test**
    - Create `tests/test_evolution_v7.py`.
    - Verify the daemon can start and connect to the Rust shared library.
    - Graceful failure check.
