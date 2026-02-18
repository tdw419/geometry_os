# Visual Cortex Dioxus Integration

## ADDED Requirements

### Requirement: Dioxus Native Visual Cortex
The system SHALL implement the Geometry OS Visual Shell using Dioxus Native framework with Vello rendering.

#### Scenario: Initialize Dioxus Native Visual Cortex
- **WHEN** the Geometry OS Visual Shell initializes
- **THEN** it creates a Dioxus Native application with Vello renderer
- **AND** the Visual Cortex runs at 120+ FPS for complex vector scenes
- **AND** input-to-photon latency is <8ms

### Requirement: Bionic Architecture
The system SHALL implement a Bionic Architecture with Python Neural Cortex and Rust Visual Cortex connected via Shared Memory.

#### Scenario: Python-Rust State Synchronization
- **WHEN** the Neural Cortex (Python) updates system state
- **THEN** it writes to the Shared Memory (SHM) bridge
- **AND** the Visual Cortex (Rust) reads the state at 60Hz
- **AND** the UI updates reactively based on neural state changes

### Requirement: Compute-Centric Rendering
The system SHALL move 100% of 2D path rendering to WGSL Compute Shaders via Vello.

#### Scenario: GPU-Accelerated Vector Rendering
- **WHEN** the Visual Cortex renders vector graphics
- **THEN** Bezier flattening, sorting, tile binning, and fine rasterization execute on GPU
- **AND** CPU utilization remains <5% during rendering
- **AND** the system supports 1000+ animated elements at 120 FPS

### Requirement: Subsecond Hot-Patching
The system SHALL support Dioxus Subsecond Hot-Patching for real-time UI component mutation.

#### Scenario: Evolution Daemon Hot-Patch
- **WHEN** the Evolution Daemon generates new UI component code
- **THEN** Dioxus Subsecond Hot-Patching compiles and injects the component in <500ms
- **AND** the visual frame is not dropped during hot-patch
- **AND** the OS displays a "glitch" or "shimmer" effect to indicate mutation

### Requirement: WGSL Neural Shaders
The system SHALL support "Neural Shaders" that live inside Dioxus UI components.

#### Scenario: Neural Shader Integration
- **WHEN** a Dioxus component requires custom GPU effects
- **THEN** it can define WGSL shaders inline or load from `systems/visual_cortex/shaders/`
- **AND** the shader receives neural state as input
- **AND** the shader output drives visual parameters (opacity, color, position)

### Requirement: Phase Alignment Stability (PAS)
The system SHALL ensure all UI renders align to the Hilbert Curve mapping of the PixelRTS container.

#### Scenario: PAS Verification
- **WHEN** the Visual Cortex completes a render pass
- **THEN** it runs a PAS Compute Pass to verify geometric integrity
- **AND** PAS score must be >0.95
- **AND** renders failing PAS verification are rejected

### Requirement: Text Rendering
The system SHALL provide sub-pixel anti-aliased text rendering via Parley/Vello.

#### Scenario: High-Quality Text Display
- **WHEN** the Visual Cortex renders text
- **THEN** it uses Parley for text shaping
- **AND** Vello provides sub-pixel anti-aliasing
- **AND** text remains crisp at all scaling factors

### Requirement: Windowing Integration
The system SHALL create a winit surface binding for Dioxus Native window.

#### Scenario: Window Creation
- **WHEN** the Visual Cortex starts
- **THEN** it creates a winit window with appropriate dimensions
- **AND** the window supports high-DPI displays
- **AND** the window integrates with PixelRTS texture output

## MODIFIED Requirements

### Requirement: Evolution Daemon Integration
The Evolution Daemon SHALL connect to the Dioxus hot-patching system for real-time mutations.

#### Scenario: Daemon-Driven Evolution
- **WHEN** the Evolution Daemon identifies an opportunity for UI improvement
- **THEN** it generates new Rust component code
- **AND** it triggers Dioxus Subsecond Hot-Patching
- **AND** the mutation is applied without system restart

### Requirement: Performance Targets
The system SHALL meet the following performance targets for the Visual Cortex.

#### Scenario: Performance Validation
- **WHEN** the Visual Cortex is under load
- **THEN** rendering maintains 120+ FPS for complex vector scenes
- **AND** input-to-photon latency is <8ms
- **AND** hot-patch time is <500ms
- **AND** memory usage is <100MB for full Visual Cortex runtime
- **AND** CPU utilization is <5% (GPU-bound rendering)
