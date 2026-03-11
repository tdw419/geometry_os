# Capability: connect-shared-memory

## ADDED Requirements

### Requirement: Zero-Copy RAM Access
The system SHALL provide a mechanism to map guest physical RAM into the host address space without copying.

#### Scenario: VMI Snapshot
- **WHEN** the visualization engine requests a memory update for VM `{id}`
- **THEN** access the `/dev/shm/qemu_ram_{id}` file via `mmap`
- **AND** return a slice to the raw bytes within < 1ms (for 64MB).
- **VISUAL** The corresponding "Brick" in the Infinite Map updates its texture data.

### Requirement: QMP Lifecycle Awareness
The system SHALL use QMP to monitor VM status and configuration.

#### Scenario: VM Launch
- **WHEN** a new QEMU instance is detected
- **THEN** query `qmp_capabilities` and `query-memdev`
- **AND** verify `share: true` and `mem-path` existence
- **THEN** initialize the `SharedMemoryBridge`.
