## ADDED Requirements

### Requirement: Recursive Context Processing
The Foundry Daemon SHALL provide a mechanism to process input contexts larger than the model's native window size using recursive decomposition.

#### Scenario: Large File Analysis
- **WHEN** the user provides a file larger than `chunk_size`.
- **THEN** the system splits the file into overlapping chunks.
- **AND** recursively analyzes each chunk.
- **AND** synthesizes a final answer from the sub-answers.
- **VISUAL** The process produces a "Thought Tree" visual artifact.

#### Scenario: Infinite Map Planning
- **WHEN** the intent target is a Map Region.
- **THEN** the system executes `SpatialRecursion` (QuadTree decomposition).
