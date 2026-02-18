# Visual Shell Spec Delta

## ADDED Requirements

### Requirement: Tectonic Bridge
The system SHALL visualize arbitrary memory segments on the Infinite Map surface.

#### Scenario: QEMU Visualization
-   **WHEN** a QEMU VM is active
-   **THEN** its physical RAM is mapped to the "Outer Ring" of the map
-   **VISUAL** The pixels reflect the raw byte values of the RAM (Green=Byte Value, Red=Heat/Change)

### Requirement: Tectonic Interaction
The system SHALL allow users to terminate processes/memory regions via direct manipulation.

#### Scenario: Click-to-Kill
-   **WHEN** the user clicks a pixel
-   **THEN** that pixel's health is set to ZERO
-   **VISUAL** The pixel turns black and the void potentially spreads based on simulation rules
