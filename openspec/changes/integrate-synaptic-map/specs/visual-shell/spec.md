## ADDED Requirements

### Requirement: Intent-to-Geometry Mapping
The system SHALL provide a bridge between natural language human intent and the geometric parameters of the Infinite Map.

#### Scenario: Overlay Activation
- **WHEN** the user triggers the activation keybinding (`Space + /`)
- **THEN** a focused `Intent Overlay` brick is spawned in the visual shell.
- **VISUAL** The background map dims (increased transparency) and the overlay pulsates with cyan energy.

#### Scenario: Semantic Navigation
- **WHEN** the user provides a spatial query (e.g., "Find the heap leak")
- **THEN** the system translates the query into a target coordinate (x, y, z)
- **AND** the camera performs a "Spatial Fold" transition to the destination.
- **VISUAL** Objects in the peripheral view stretch and blur during the fold.

#### Scenario: Aesthetic Re-alignment
- **WHEN** the user requests a visual change (e.g., "Make it more stable")
- **THEN** the LLM modifies the PAS `Aesthetic` parameters and shader uniforms.
- **VISUAL** The map's entropy values decrease, and the color palette shifts towards "Crystalline Green".
