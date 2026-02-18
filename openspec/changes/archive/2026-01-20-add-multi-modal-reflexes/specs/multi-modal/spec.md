# Spec: Multi-Modal Reflexes

## ADDED Requirements

### Requirement: Auditory Perception
The system SHALL perceive audio data to drive visual reflexes.

#### Scenario: Loud Noise Startle
- **WHEN** Audio volume exceeds threshold (0.8) instantaneously (>0.5 delta/frame)
- **THEN** System triggers `StartleReflex`
- **VISUAL** Global brightness reduces by 50% (Dampening) and `void_stare` is engaged for 200ms

#### Scenario: Rhythmic Entrainment
- **WHEN** Low-frequency energy (20-100Hz) peaks regularly (Beat detected)
- **THEN** System synchronizes `PulseReflex`
- **VISUAL** Global scale/zoom modulates slightly (1.0 -> 1.02) in phase with beat

### Requirement: Kinetic Perception
The system SHALL perceive user input velocity.

#### Scenario: Focus Mode
- **WHEN** Input events (Mouse/Keys) exceed frequency threshold (>5 events/sec)
- **THEN** System triggers `FocusReflex`
- **VISUAL** Entropy reduces (Sharpening), Red Dominance increases (Excitement/Alertness)
