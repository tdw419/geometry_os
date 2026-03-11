# GPU Evolution Orchestrator

## ADDED Requirements

### Requirement: Neural Perception WGSL Integration
The system SHALL compile the GPU perception and feedback pipelines from `systems/vectorland/kernels/neural_perception_feedback.wgsl` instead of using inline WGSL strings.

#### Scenario: Load external WGSL
- **WHEN** the GPU evolution orchestrator initializes its compute pipelines
- **THEN** it loads the WGSL source from the `neural_perception_feedback.wgsl` file
- **AND** uses the file-defined entry points to build the compute pipelines

### Requirement: Multi-Stage Perception and Feedback
The system SHALL execute multi-stage perception and feedback passes using the entry points defined in the neural perception WGSL.

#### Scenario: Perception and feedback execution
- **WHEN** the evolution loop processes a frame
- **THEN** it runs `extract_perception` followed by `finalize_perception`
- **AND** it runs `generate_feedback` followed by `finalize_feedback`
- **AND** the feedback buffer reflects the advanced perception features
