# Tasks: Phase 46.5 - Stabilization & Validation

- [x] **Task 1: Observational Telemetry**
    - **Description**: Add logging for agent task throughput and path efficiency.
    - **Acceptance Criteria**: `CityAgentManager` can report rolling average of tasks/min.
    - **Status**: Complete (Telemetry reports every 5s in logs).

- [x] **Task 2: Stress Test Implementation**
    - **Description**: Add a CLI flag or hotkey to spawn many agents (up to 200).
    - **Acceptance Criteria**: System remains interactive at 100 agents on standard hardware.
    - **Status**: Complete ('K' key spawns 10 agents).

- [/] **Task 3: Memory Pruning & Persistence Fixes**
    - **Description**: Ensure agent memories are pruned and Vat serialization is complete (include `goal_type`).
    - **Acceptance Criteria**: Memory usage is constant after 1 hour of runtime.
    - **Status**: Partially Complete (Vat restoration for goal roles improved, memory capped at 1000).

- [x] **Task 4: Behavior Tuning**
    - **Description**: Adjust agent speeds and arrival thresholds (0.05 -> 0.01).
    - **Acceptance Criteria**: Agents arrive exactly at artifact centers without jitter.
    - **Status**: Complete (Thresholds synchronized to 0.01).

- [x] **Task 5: Synaptic Signal Grouping**
    - **Description**: Group similar agent logs in the visual shell to reduce noise.
    - **Acceptance Criteria**: Multiple agents performing the same task show a "Coordinated Action" signal.
    - **Status**: Complete (Signal grouping every 5 identical actions).

- [x] **Task 6: Final PAS Verification**
    - **Description**: Run SHM report after 24h stability test.
    - **Acceptance Criteria**: PAS score remains above 0.90.
    - **Estimated Effort**: Large
