# Specification Change: RTS Ecosystem

## ADDED Requirements

### Requirement: Executable Asset Container (.rts.png)
The system SHALL support the embedding and extraction of executable logic within standard PNG image files.

#### Scenario: Metadata Injection
- **WHEN** the `rts_injector` tool is invoked with a source image and a script file
- **THEN** it SHALL produce a valid PNG file
- **AND** the PNG file SHALL contain the script content within a `zTXt` or `iTXt` chunk
- **AND** the chunk SHALL be labeled with the keyword `RTS_Logic` (or configured key).

#### Scenario: Visual Labeling
- **WHEN** the `rts_injector` is configured with visual metadata (e.g., Name, Version)
- **THEN** it SHALL render this text onto the pixel buffer of the output PNG
- **AND** the text SHALL be legible (high contrast/shadowed) against the background.

#### Scenario: Asset Reliability
- **WHEN** the asset is loaded by the engine
- **THEN** the system SHALL verify the integrity of the chunks (CRC)
- **VISUAL** No visual corruption should appear; the image displays normally in standard viewers.
