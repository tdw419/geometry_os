## ADDED Requirements

### Requirement: Native Infinite Map Compositor
The system SHALL provide a hardware-accelerated (Rust/WGPU) Visual Shell that renders an infinite 2D navigation plane.

#### Scenario: Boot to Map
- **WHEN** the OS boots
- **THEN** it launches the `infinite_map` binary instead of a standard session manager
- **VISUAL** Users see a zoomable grid representing the `geometry_os.rts` substrate

### Requirement: RTS Texture Binding
The background of the Infinite Map SHALL correspond to the actual data layout of the RTS filesystem.

#### Scenario: Visual Inspection
- **WHEN** the user zooms into a region
- **THEN** they see the pixel representation of the files stored at those Hilbert coordinates
- **VISUAL** Code appears as cyan static; Audio as purple waves
