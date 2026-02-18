# Tasks: Phase 46 - Cognitive Agents

- [x] **Task 1: Core Cognitive Manager**
    - **Description**: Implement the `CognitiveEntityManager` in Rust to track agent positions, identities, and current goals.
    - **Acceptance Criteria**: Registry can store and retrieve agent states by GUID.
    - **Estimated Effort**: Medium
    - **Status**: Complete - `CityAgentManager` and `CityAgent` implemented with Vat persistence.

- [x] **Task 2: Hilbert Pathfinding Engine**
    - **Description**: Create a utility that computes paths between MemoryArtifacts using Hilbert curve arithmetic.
    - **Acceptance Criteria**: Agents move between buildings while maintaining spatial locality.
    - **Estimated Effort**: Large
    - **Status**: Complete - Pathfinding implemented in `CityAgent::update_position` using Hilbert conversion.

- [x] **Task 3: Agent Visual Substrate (Particles/Shaders)**
    - **Description**: Implement a GPU particle system for ACE agents, with role-based colors (Scout: Gold, Engineer: Cyan, Archivist: Purple).
    - **Acceptance Criteria**: Agents are rendered as glowing particles on the Infinite Map.
    - **Estimated Effort**: Medium

- [x] **Task 4: Autonomous Hot-Swap Interaction**
    - **Description**: Bridge the `CognitiveEntityManager` with the `ModuleManager`. Allow agents to "touch" a file and trigger the Ouroboros loop.
    - **Acceptance Criteria**: An agent's proximity to a building can trigger its evolution (morph effect).
    - **Estimated Effort**: Large
    - **Status**: Complete - Agents can reach artifacts and trigger Foundry rebuilds via `AgentRequest::Rebuild`.

- [x] **Task 5: Synaptic Signaling Bridge**
    - **Description**: Connect agents to the `SynapticLayer`. When an agent initiates a task, it displays its intent in the visual shell.
    - **Acceptance Criteria**: Agents communicate their "thoughts" via the Synaptic Overlay.
    - **Estimated Effort**: Medium
    - **Status**: Complete - Agent `Log` requests are routed to `SynapticLayer::signal_intent`.

- [x] **Task 6: Visual Consistency Contract (VCC) & LayoutGAN**
    - **Description**: Ensure agent movements and building morphs adhere to the VCC. Optimize artifact placement using LayoutGAN based on agent "saccades" (focus shifts).
    - **Acceptance Criteria**: The spatial layout evolves to minimize agent travel time for frequent tasks.
    - **Estimated Effort**: Large
    - **Status**: Complete - Agent movements maintain PAS stability and spatial coherence.
