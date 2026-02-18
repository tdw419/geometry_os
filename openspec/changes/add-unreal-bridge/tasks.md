# Implementation Tasks: Unreal Bridge

## Phase 1: The Rust Transmitter
- [x] **Dependency**: Add `shared_memory` crate to `infinite_map_rs`.
- [x] **Struct**: Define `UnrealBridge` struct in `systems/infinite_map_rs/src/bridge/unreal.rs`.
- [x] **Protocol**: Implement the `TectonicUpdatePacket` serialization logic.
- [x] **Integration**: Hook `UnrealBridge::update()` into `App::update()` in `app.rs`.

## Phase 2: The "Ghost" Receiver (Simulation)
- [x] **Test Utility**: Create a small Python script `systems/bridge_tester.py` that reads the shared memory and validates packets (acting as a mock Unreal Engine).
- [x] **Validation**: Verify throughput (MB/s) and latency.

## Phase 3: The Unreal Plugin (External)
- [x] *Note: This phase happens in the UE5 environment, but we define the header here.*
- [x] Create `GeometryOSBridge.h` reference file for the C++ side.
