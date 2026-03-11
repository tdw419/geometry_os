## ADDED Requirements

### Requirement: Optical Shader Loading
The system SHALL support loading WGSL shaders from V2 Spatial Brick textures (`.brick`) as the primary source of truth.

#### Scenario: Self-Hosted Rendering Start
- **WHEN** the `infinite_map_rs` engine initializes
- **THEN** it SHALL load `pixel_cpu.brick` from the assets directory
- **AND** unfold it into valid WGSL source code
- **AND** report the **Entropy** of the loaded brick to the system metrics
- **VISUAL** The system renders the infinite map using logic derived purely from the loaded texture.

#### Scenario: Optical Hot Reload (Foundry Loop)
- **WHEN** the `pixel_cpu.wgsl` file is modified and the Foundry Daemon updates `pixel_cpu.brick`
- **THEN** the engine SHALL detect the file change on the `.brick` asset
- **AND** reload the texture data into Glass RAM
- **AND** recompile the compute pipeline immediately (Hot Swap)
- **VISUAL** The rendering behavior updates effectively instantly to reflect the new logic.

### Requirement: V2 Brick Standardization
The system SHALL enforce the V2 Spatial Brick format for all shader assets.
- **Format**: 256x256 or 512x512 RGBA texture (Power of Two).
- **Metadata**: Header must include `entropy` (float) and `original_size` (u32).
- **Mapping**: Hilbert Curve Data Integrity mapping.

#### Scenario: Verify Brick Compliance
- **WHEN** the `OpticalLoader` attempts to map a `.brick` file
- **THEN** it SHALL validate the `V2BR` magic bytes and protocol version
- **AND** it SHALL parse the `entropy` field
- **AND** reject the file if the resolution is not a Power of Two
- **VISUAL** If validation fails, the system logs an error and refuses to render the corrupted brick (fallback to text or error state).
