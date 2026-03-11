## ADDED Requirements

### Requirement: Native Performance FUSE Driver
The system SHALL provide a Rust-based FUSE driver (`rts_rs`) that mounts `.rts` (PNG) files as a read-write filesystem.

#### Scenario: Mounting
- **WHEN** user runs `rts_rs mount image.rts /mnt`
- **THEN** the image is mounted at `/mnt`
- **AND** standard filesystem operations (ls, cp, cat) work immediately.

#### Scenario: Hilbert Compatibility
- **WHEN** data is written to a specific offset
- **THEN** it maps to the exact same (X, Y) pixel coordinates as the Python reference implementation.
- **VISUAL** The resulting PNG image is pixel-for-pixel identical to one produced by Python for the same data.

#### Scenario: Performance
- **WHEN** reading/writing large files (>10MB)
- **THEN** throughput exceeds 50MB/s (Python limit ~2-5MB/s).

#### Scenario: Crash Recovery
- **WHEN** the driver panics or is killed
- **THEN** the data written up to the last `flush` is preserved in the PNG.
