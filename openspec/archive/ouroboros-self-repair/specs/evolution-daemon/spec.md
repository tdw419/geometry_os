# Delta for evolution-daemon

## ADDED Requirements

### Requirement: Visual Fracture Detection
The Evolution Daemon SHALL monitor the system's visual output for structural anomalies (fractures).

#### Scenario: PAS Score Drop
- **WHEN** the Phase Alignment Stability (PAS) score drops below 0.5
- **THEN** the system SHALL trigger an Ouroboros Repair Cycle.

### Requirement: Autonomous Self-Repair
The Evolution Daemon SHALL apply restorative actions when a visual fracture is detected.

#### Scenario: Automated Rollback
- **WHEN** a repair cycle is triggered
- **AND** a recently modified file is identified as the probable cause
- **THEN** the system SHALL attempt to revert the file to the last known-good state via version control.
