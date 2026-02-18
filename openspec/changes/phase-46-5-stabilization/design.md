# Design: Phase 46.5 - Stabilization & Validation

## Architecture Enhancements for Observability

### 1. Agent Pulse Telemetry
Add a diagnostic mode to the `CityAgentManager` to report aggregate statistics:
- Active agent count by role.
- Completed tasks per minute.
- Average distance traveled per task.
- Memory size per agent.

### 2. Synaptic Signal Pruning
Refine the `SynapticLayer` to handle higher volumes of agent signals without cluttering the visual shell.
- Grouping of identical signals from nearby agents.
- Decay rates for visible thoughts.

### 3. Stress Test Rig
Implement a developer command or hotkey to:
- Spawn varying batches of agents.
- Clear all agents.
- Force all agents to a single high-density district to test pathfinding under congestion.

## Testing Strategy

### Scenario: High-Density Congestion
Force 50 agents to navigate into the same `systems/` district.
- **Metric**: Frame rate (WGPU) and CPU time per tick.
- **Validation**: Ensure no clipping or "vibrating" agents near target locations.

### Scenario: Long-Term Persistence
Run the system for 4 hours with 20 active agents.
- **Metric**: Heap memory usage.
- **Validation**: Ensure the `VatRegistry` size does not grow linearly if state is supposed to be stable.

### Scenario: Role Correctness
Inject "Code Rot" (manually lower stability metric of a building).
- **Validation**: A Scout should detect the rot and an Engineer should eventually trigger a Rebuild.
