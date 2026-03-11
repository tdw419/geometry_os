## ADDED Requirements

### Requirement: Unreal Engine State Broadcast
The system SHALL provide a mechanism to broadcast terrain and memory state updates via Shared Memory to an external visualization client (Unreal Engine 5).

#### Scenario: Active Bridge Connection
- **WHEN** the `UnrealBridge` is initialized in `config.toml`
- **AND** the `infinite_map_rs` app is running
- **THEN** it SHALL write `TectonicUpdatePacket` structs to the named shared memory region `geometry_os_unreal_bridge_01` at 60Hz.
- **VISUAL** No direct visual change in the Rust app, but "Bridge Active" indicator may appear in debug overlay.
