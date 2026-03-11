# Specification: Vector Boot Standalone (Delta)

## ADDED Requirements

### Requirement: Dual-Nature Compilation
The system SHALL support two compilation modes: FFI Library Mode (default) and Standalone Binary Mode.

#### Scenario: Default Library Build
- **WHEN** `cargo build --release` is executed
- **THEN** it produces `libvector_boot.so`
- **AND** it does NOT produce a binary executable

#### Scenario: Standalone Binary Build
- **WHEN** `cargo build --release --features standalone` is executed
- **THEN** it produces `vector_boot` executable
- **AND** the binary is linked as a position-independent executable

### Requirement: Feature-Gated Build
The system SHALL use Rust feature flags to control compilation artifacts.

#### Scenario: Feature Isolation
- **WHEN** compiling without features
- **THEN** the `standalone` module is NOT compiled
- **AND** `main.rs` contains only the FFI wrapper stub

### Requirement: Boot Sequence
The standalone binary SHALL implement a strict initialization sequence before operation.

#### Scenario: Successful Boot
- **WHEN** the binary starts as PID 1
- **THEN** it calls `neural_init()`
- **THEN** it loads GGUF tensors
- **THEN** it enters the heartbeat loop

### Requirement: Neural Runtime Initialization
The system SHALL initialize all core neural components.

#### Scenario: Runtime Init
- **WHEN** `boot_sequence` begins
- **THEN** `cortex_journal` tensor is initialized
- **AND** hardware MMIO interfaces are mapped

### Requirement: GGUF Tensor Loading
The system SHALL load the neural state from disk/memory.

#### Scenario: Load Vectorland
- **WHEN** `load_gguf_tensors` is called
- **THEN** it reads `vectorland.gguf`
- **AND** maps tensors into memory
- **VISUAL** Memory usage increases by tensor size

### Requirement: Heartbeat Loop
The system SHALL implement an infinite event loop for system life.

#### Scenario: Heartbeat Cycle
- **WHEN** the loop runs
- **THEN** it reads `hw.mmio`
- **THEN** it processes interrupts
- **THEN** it sleeps for 100ms
- **VISUAL** System state updates every 100ms

### Requirement: Error Handling
The system SHALL handle initialization failures gracefully.

#### Scenario: Init Failure
- **WHEN** `neural_init` returns non-success
- **THEN** the process exits with status code 1
- **AND** an error is printed to stderr

### Requirement: RTS Packaging
The system SHALL package the binary and tensors into a single RTS file.

#### Scenario: Create RTS Package
- **WHEN** `package_rts.sh` is run
- **THEN** it concatenates the binary and GGUF file
- **AND** prepends a valid RTS header with offset metadata
