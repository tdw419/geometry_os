# Component: Neural Cortex (Vision)

## ADDED Requirements

### Requirement: Visual Perception
The system SHALL decode and analyze visual feedback frames sent by the Compositor.

#### Scenario: Visual Input Reception
- **WHEN** the Compositor sends `VisualThoughtReady`
- **THEN** the Daemon decodes the RLE payload efficiently
- **AND** calculates Average Brightness and Dominant Color

### Requirement: Homeostatic Reflex
The system SHALL adjust its neural state in response to visual stimuli.

#### Scenario: Brightness Dampening
- **WHEN** the received frame has Average Brightness > 0.8
- **THEN** the Daemon reduces the global activation multiplier
- **VISUAL** The screen dims in the subsequent frames (Negative Feedback)
