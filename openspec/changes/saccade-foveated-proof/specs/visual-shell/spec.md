# Delta for visual-shell

## ADDED Requirements

### Requirement: Foveated Rendering Optimization
The Visual Shell SHALL implement foveated rendering to optimize GPU resource allocation based on visual focus.

#### Scenario: Focus-Based Sampling
- **WHEN** a Focus Point is defined on the Infinite Map
- **THEN** pixels within the foveal radius SHALL be rendered at full resolution (1:1).
- **AND** pixels outside the foveal radius SHALL be rendered at reduced resolution (e.g., 1:4 or 1:16).
- **AND** the transition SHALL be smoothed to prevent visible artifacts.

### Requirement: GPU Load Target
The foveated rendering system SHALL achieve a significant reduction in GPU compute time.

#### Scenario: Peripheral Load Reduction
- **WHEN** foveated rendering is enabled in a complex scene (>20 tiles)
- **THEN** the total GPU compute time per frame SHALL decrease by at least 50% compared to full-resolution rendering.
