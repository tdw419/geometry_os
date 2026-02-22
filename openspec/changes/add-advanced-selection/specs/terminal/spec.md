# Terminal Capability Specification

## Purpose
Defines the interactive behavior of the Geometry OS Hypervisor Terminal.

## ADDED Requirements

### Requirement: Semantic Selection
The terminal SHALL support semantic selection expansion based on user input intent.

#### Scenario: Word Selection
- **WHEN** the user double-clicks (2 clicks < 500ms) on a character
- **THEN** the selection expands to the nearest delimiters (space, brackets, quotes)
- **VISUAL** Instant expansion to the "Word" unit

#### Scenario: Line Selection
- **WHEN** the user triple-clicks (3 clicks < 500ms) on a character
- **THEN** the selection expands to the entire logical line
- **VISUAL** Full width highlight of the row

### Requirement: Geometric Block Selection
The terminal SHALL support rectangular text selection for viewing data as a grid.

#### Scenario: Rectangular Select
- **WHEN** the user drags the mouse while holding the `Alt` key
- **THEN** the selection forms a rectangle defined by `(start_col, start_row)` and `(end_col, end_row)`
- **VISUAL** A strict rectangular highlight, ignoring line wrapping flow
