# Delta for visual-shell

## ADDED Requirements

### Requirement: Frame-Time Stability (60 FPS)
The Visual Shell SHALL maintain a target frame rate of 60 FPS (16.6ms per frame) under standard production loads.

#### Scenario: 100 Tile Stress
- **WHEN** 100 active `VMMonitorTile` instances are rendered on the Infinite Map
- **THEN** the mean frame time SHALL NOT exceed 16.6ms.
- **AND** the 99th percentile frame jitter SHALL NOT exceed 5ms.

### Requirement: Resource Scaling
The Infinite Map SHALL scale its rendering pipeline to handle massive geometric complexity.

#### Scenario: 37 Million Particles
- **WHEN** the WebGPU particle compute shader is active with 37,000,000 particles
- **THEN** the compositor SHALL maintain 60 FPS by utilizing RenderGroup isolation and GPU-native updates.
