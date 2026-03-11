# Tasks: Synaptic Map Integration

- [x] **Phase 1: Substrate Preparation**
  - [x] Create `systems/infinite_map_rs/src/synapse/mod.rs`.
  - [x] Define `SynapticCommand` enum in `mod.rs`.
  - [x] Create `intent.rs` for user input capture.
  - [x] Create `morphology.rs` for geometric commands.
  - [x] Create `daemon_bridge.rs` for LLM communication.
  - [x] Add `reqwest` dependency for HTTP communication.
  - [x] Integrate `synapse` module into `main.rs`.

- [x] **Phase 2: Intent Layer**
  - [x] Implement `SynapticOverlay` component in `InfiniteMapApp`.
  - [x] Map `Space + /` keybinding to toggle the overlay.
  - [x] Implement text-to-texture rendering for the intent box.

- [x] **Phase 3: Semantic Bridge**
  - [x] Extend `VisualCommand` in `glass_ram/bridge.rs` to include `SynapticAction`.
  - [x] Add `SynapticAction` handler in `app.rs` update loop.
  - [x] Connect the overlay input to the communication bridge.
  - [x] Create `systems/daemons/synaptic_daemon.py` to interface with LM Studio.

- [x] **Phase 4: Geometric Agency**
  - [x] Implement `HandleNavigate` for semantic camera movement.
  - [x] Implement `HandleRealign` for shader parameter optimization.
  - [x] Implement `HandleSynthesize` for on-the-fly Brick generation.
