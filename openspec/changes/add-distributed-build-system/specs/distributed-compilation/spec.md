# Spec: Distributed Compilation

## ADDED Requirements

### Requirement: Distributed Build Orchestration
The system SHALL provide a `BuildOrchestrator` capable of managing the lifecycle of multiple concurrent `BuildWorker` instances (VMs).

#### Scenario: Spawning the Swarm
- **WHEN** the orchestrator is initialized with `worker_count=N`.
- **THEN** it spawns N instances of the `ubuntu.rts.png` container (or equivalent builder).
- **AND** each worker is assigned a unique filesystem isolation path.
- **VISUAL** The Infinite Desktop displays N new "cells" in the Build Hive.

### Requirement: Parallel Job Execution
The system SHALL support dispatching distinct build jobs to separate workers simultaneously.

#### Scenario: Parallel Compile
- **WHEN** a build manifest containing multiple independent crates/modules is submitted.
- **THEN** the orchestrator splits the manifest into unit jobs.
- **AND** dispatches jobs to available idle workers.
- **AND** workers execute the compilation in parallel.
- **VISUAL** multiple Hive cells light up simultaneously.

### Requirement: Artifact Aggregation
The system SHALL collect output artifacts from all workers into a coherent build output.

#### Scenario: Collecting Binaries
- **WHEN** a worker completes a job successfully.
- **THEN** the resulting binary is moved from the worker's shared mount to the host's central build directory.
- **AND** the worker is marked as IDLE and ready for the next job.
