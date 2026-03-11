# Tasks

- [x] **Task 1**: Implement Synaptic Data Structures
  - **Description**: Define `Synapse`, `SynapseAction`, and `SynapticLayer` structs in `systems/infinite_map_rs`.
  - **Acceptance Criteria**:
    - `Synapse` struct defined with vector storage.
    - `SynapticLayer` manages a set of synapses.
    - Unit tests for adding/removing synapses.
  - **Estimated Effort**: Medium

- [x] **Task 2**: Implement Resonance Logic
  - **Description**: Implement cosine similarity function to check if an input vector triggers a synapse.
  - **Acceptance Criteria**:
    - `calculate_resonance(input, synapse)` returns 0.0-1.0.
    - `fire_check(input)` iterates all synapses and returns list of triggered IDs.
  - **Estimated Effort**: Small

- [x] **Task 3**: Create Synapse API Endpoints
  - **Description**: Implement `POST /api/synapse/register` and `POST /api/synapse/signal` in `api_server.rs`.
  - **Acceptance Criteria**:
    - Can register a synapse via curl.
    - Can send a signal via curl and receive "fired" response if threshold met.
    - Note: For MVP, allow text description instead of raw vector (requires simple embedding or keyword match backup).
  - **Estimated Effort**: Medium

- [x] **Task 4**: Visual Rendering of Synapses
  - **Description**: Draw capabilities in `app.rs` to visualize active synapses.
  - **Acceptance Criteria**:
    - Lines drawn from a source point to target windows.
    - Line alpha/brightness correlates with resonance.
  - **Estimated Effort**: Large
