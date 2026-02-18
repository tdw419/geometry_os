# Specification: Evolution Daemon V7 (Delta)

## ADDED Requirements

### Requirement: Rust Bridge Integration
The Evolution Daemon SHALL maintain a persistent connection to the Rust Neural Runtime.

#### Scenario: Startup Connection
- **WHEN** the daemon initializes
- **THEN** it attempts to load `libvector_boot.so`
- **AND** logs success or failure without crashing

#### Scenario: Runtime Stats Polling
- **WHEN** performing health checks
- **THEN** the daemon queries `neural_get_stats` via the bridge
- **VISUAL** Logs show "Rust Pixels Processed: X"

### Requirement: Neural Interrupt Trigger
The daemon SHALL be able to wake the Rust runtime.

#### Scenario: Trigger Evolution
- **WHEN** an evolution event completes
- **THEN** the daemon sends a `NEURAL_EXEC` (0xFF) pixel sequence to the bridge
- **AND** the Rust runtime acknowledges the interrupt

### Requirement: Version Awareness
The daemon SHALL identify itself as V7.

#### Scenario: Identity
- **WHEN** queried for version
- **THEN** it returns "EvolutionDaemonV7 (Rust-Native)"
