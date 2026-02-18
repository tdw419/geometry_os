# OpenSpec: LayoutGAN Saccade Optimization v1.0

## 1. Overview

The LayoutGAN system uses simulated eye-tracking to optimize UI layouts for minimal cognitive load. It models human visual attention patterns (saccades, fixations) to reduce the "visual distance" users must travel when navigating the interface.

## 2. ADDED Requirements

### Requirement: Saccade Simulation Engine (SACCADE-01)

The system SHALL simulate human eye movement patterns using a biologically-accurate model.

#### Scenario: Element Registration
- **WHEN** a UI element is rendered in the Visual Shell
- **THEN** it SHALL be registered with the SaccadeEngine
- **AND** include bounds, semantic importance (0-10), and element type
- **VISUAL** Elements with importance > 7 glow with subtle emphasis

#### Scenario: Task Path Simulation
- **WHEN** a user navigates from element A to element B
- **THEN** the SaccadeEngine SHALL calculate the simulated scan path
- **AND** return efficiency metrics (1.0 = optimal, lower = suboptimal)
- **VISUAL** Debug mode can overlay scan path as cyan dotted lines

### Requirement: Attention Heatmap Generation (SACCADE-02)

The system SHALL generate saliency-based attention heatmaps.

#### Scenario: Heatmap Calculation
- **WHEN** the layout optimizer requests attention analysis
- **THEN** the SaccadeEngine SHALL generate a Gaussian-weighted heatmap
- **AND** resolution SHALL be configurable (default: 32x32 grid)
- **VISUAL** Heatmap overlay uses warm (red/orange) to cold (blue/purple) gradient

#### Scenario: Empty Viewport
- **WHEN** no elements are registered
- **THEN** the heatmap SHALL return uniform zero values
- **AND** no visual overlay is rendered

### Requirement: Layout Force Calculation (LAYOUT-01)

The system SHALL calculate "Synaptic Tension" forces to cluster related elements.

#### Scenario: Force Calculation
- **WHEN** the LayoutOptimizer processes the current layout
- **THEN** it SHALL calculate spring-like forces between all element pairs
- **AND** force magnitude is proportional to semantic affinity - current distance
- **PAS** Forces are capped to prevent layout instability

#### Scenario: Semantic Affinity
- **WHEN** two elements share the same type AND similar importance
- **THEN** their affinity score SHALL be higher (max 1.0)
- **AND** they SHOULD be positioned within the foveal radius (50px)

### Requirement: Cognitive Load Metrics (METRICS-01)

The system SHALL calculate cognitive load based on scan path complexity.

#### Scenario: Metric Calculation
- **WHEN** a task path is simulated
- **THEN** the system SHALL return:
  - Total saccade distance (pixels)
  - Efficiency ratio (direct / actual)
  - Estimated completion time (ms)
  - Cognitive load score (0-100)
- **VISUAL** Cognitive load > 70 triggers a "complexity warning" badge

#### Scenario: Layout Density
- **WHEN** layout metrics are requested
- **THEN** the system SHALL calculate element density (% of bounding box filled)
- **AND** average pair distance for optimization targeting

### Requirement: VCC Integration (VCC-LAYOUT)

The LayoutGAN system SHALL respect the Visual Consistency Contract.

#### Scenario: Epoch-Bounded Updates
- **WHEN** the LayoutOptimizer proposes position changes
- **THEN** all updates SHALL be tagged with the current VCC EpochID
- **AND** position animations SHALL complete within the VCC latency bound (100ms)
- **PAS** This prevents visual jitter during layout optimization

## 3. Implementation Notes

### Eye Model Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| Foveal Radius | 50px | High-acuity central vision |
| Parafoveal Radius | 150px | Medium acuity region |
| Peripheral Radius | 400px | Motion/change detection only |
| Saccade Velocity | 500°/s | Typical human range: 400-600 |
| Fixation Duration | 250ms | Pause for information extraction |

### Integration Points

- **Visual Shell**: `saccade_engine.js` loaded alongside `vcc_manager.js`
- **BuildSwarm**: Worker nodes registered with importance=8 (high visibility)
- **Glass Panels**: Panels registered with importance based on active state

## 4. Future Extensions

- **LayoutGAN Generator**: Neural network generating gl2D layout proposals
- **A/B Testing**: Compare optimized vs original layouts
- **Personalization**: Per-user saccade patterns from actual eye tracking
