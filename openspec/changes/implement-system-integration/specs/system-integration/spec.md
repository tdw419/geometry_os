# Requirement: System Integration

The system SHALL operate as a single unified process for both visual composition and neural processing.

## ADDED Requirements

### Requirement: Embedded Python Runtime
The system SHALL initialize a Python 3.10+ interpreter within the main Rust process at startup.
- **Scenario: Startup**
    - **WHEN** the `geometry_os` binary executes
    - **THEN** it must initialize the Python runtime before the main event loop
    - **AND** load the `evolution_daemon` module successfully.

### Requirement: In-Process Message Passing
The system SHALL provide a thread-safe mechanism to exchange data between Rust and Python without socket serialization.
- **Scenario: Neural Update**
    - **WHEN** the Python daemon calculates a new neural state
    - **THEN** it must directly update the shared Rust memory structures
    - **VISUAL** The update applies to the next rendered frame immediately.

## MODIFIED Requirements

### Requirement: Daemon Execution (Deprecated)
The system SHALL NOT require an external `systemd` service or background script for `evolution_daemon_v8.py`.
- **Reason**: Merged into main process.

## REMOVED Requirements

### Requirement: Socket Communication
The system is no longer required to listen on localhost ports for IPC.
