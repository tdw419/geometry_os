# Capability: PixelRTS Format

## MODIFIED Requirements

### Requirement: Metadata Schema Support
The PixelRTS format SHALL support an extensible metadata schema embedded within standard image chunks (e.g., PNG tEXt/zTXt or KTX2 key/value pairs).

#### Scenario: Logic Kernel Embedding
- **WHEN** a `.pixelrts` file contains a `Logic_Kernel` metadata key
- **THEN** the decoder SHALL interpret the value as a valid WGSL Compute Shader string
- **AND** compile it for execution on the GPU.

#### Scenario: Neural State Mapping
- **WHEN** a `.pixelrts` file contains a `State_Vector_Dim` metadata key
- **THEN** the decoder SHALL allocate a StorageBuffer of size `sizeof(f32) * State_Vector_Dim`
- **AND** bind it to the Compute Kernel as `group(0) binding(1)`.

### Requirement: Hilbert Brain Texture
The PixelRTS format SHALL supports a specialized "Brain Texture" layout using Hilbert Curve mapping for localized neural state storage.

#### Scenario: Agent Texture Layout
- **WHEN** a texture is identified as an "Agent" via metadata
- **THEN** it SHALL be treated as a read-write storage texture in the compute pass
- **AND** the Red channel SHALL represent Confidence/Activation (0.0-1.0).
