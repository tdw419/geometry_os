# Spec Delta: Visual Shell (The Glass Drill)

## ADDED Requirements

### Capability: Memory Introspection
The system SHALL provide a mechanism to inspect visual memory structures by mapping spatial coordinates back to linear addresses.

#### Scenario: User Hovers Memory Map
- **WHEN** the user hovers the cursor over a visible memory cluster in the Tectonic Map
- **THEN** the system calculates the physical address corresponding to that pixel
- **AND** displays the address (Hex) and current value (u8/u32) in an overlay
- **VISUAL** A "Reticle" highlights the specific byte/procedural-grain being inspected.

## MODIFIED Requirements

### Component: Tectonic Window
The Tectonic Window is no longer passive. It MUST accept input events (Mouse Move) and return introspection data.
