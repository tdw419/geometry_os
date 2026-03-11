# Implementation Tasks: Connect SDK Bridge

- [x] **1. Rust Infrastructure (The Receiver)**
    - [x] Create `systems/infinite_map_rs/src/glass_ram/bridge.rs`.
    - [x] Implement `BridgeServer` struct using `tokio::net::UnixListener?` (or std if blocking is fine for MPV).
    - [x] Define `VisualCommand` enum (`Alloc`, `Color`, `Pulse`).
    - [x] Integrate `BridgeServer` into `main.rs` loop (consumer side).

- [x] **2. Python SDK (The Emitter)**
    - [x] Create `geometry_sdk/visual/` directory.
    - [x] Implement `geometry_sdk/visual/cryo.py` (Client logic).
    - [x] Implement `geometry_sdk/visual/types.py` (Color, Shape enums).
    - [x] Add `visual_test.py` script.

- [x] **3. Integration & Testing**
    - [x] Wire up the command channel: Python sends -> Rust receives -> Console Log (Step 1).
    - [x] Wire up visualization: Rust receives -> Updates `DensityRenderer` resources.
    - [x] Verify latency / smoothness.

- [x] **4. Agent Zero Upgrade (Optional)**
    - [x] Give Agent Zero a simple "heartbeat" script that pulses a tower on the screen.
