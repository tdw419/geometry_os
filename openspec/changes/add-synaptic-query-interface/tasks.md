# Tasks: Synaptic Query Interface

## Phase 1: Data Acquisition & Heuristics
- [x] **Bridge Extension**: Add `read_page(address) -> Vec<u8>` to `SharedMemoryBridge`.
- [x] **Heuristics Module**: Create `systems/infinite_map_rs/src/synapse/heuristics.rs`.
    - [x] `calculate_entropy(data) -> f32`
    - [x] `extract_strings(data) -> Vec<String>`
    - [x] `detect_magic_numbers(data) -> Option<String>`

## Phase 2: Synapse Integration
- [x] **Request Types**: Define `MemoryAnalysisRequest` in `synapse/mod.rs`.
- [x] **Daemon Bridge**: Add `analyze_memory(request)` to `CognitiveDaemonBridge`.
- [x] **Prompt Engineering**: Create the system prompt for "Memory Analyst Persona" in the daemon or bridge.

## Phase 3: UI Implementation
- [x] **Introspection Window**: Create `ui/introspection_window.rs`.
- [x] **Event Handling**: Wire `InfiniteMapApp` click events to trigger window creation.
- [x] **Async Flow**: Handle the async response from the LLM without freezing the UI.

## Phase 4: Validation
- [x] **Unit Test**: Test heuristics on known data (e.g., zero page vs random noise).
- [x] **Integration Test**: Verify end-to-end flow with a mock LLM response.
