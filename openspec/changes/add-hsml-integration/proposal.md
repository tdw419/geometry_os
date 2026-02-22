# Proposal: HSML Integration (Hyperspace Modeling Language)

## Concept
Adopt the **IEEE 2874 HSML** standard as the core data structure for the Infinite Desktop (Spatial Web). This shifts the OS from a "File System" metaphor to a "Spatial Knowledge Graph" metaphor.

## Implementation: The "Universal Domain Graph" (UDG)
Instead of just rendering `files`, the shell will render `SpatialEntities`.
- **Files**: Become entities with `type: "data"`, `position: {x,y,z}`.
- **Apps**: Become entities with `type: "agent"`.
- **Users**: Become entities with `type: "observer"`.

## Use Cases for Geometry OS
1.  **Contextual Permissions**: An app can only execute if it is physically inside a "Secure Zone" on the grid.
2.  **Semantic Connections**: Drawing a line between two file orbs establishes a semantic link (e.g., "Dependency", "Reference") stored in the HSML graph, not just the file system.
3.  **AI Agents**: The Neural Cortex can query the UDG ("What is near the cursor?") to infer intent.

## Schema
```json
{
  "hsml": {
    "version": "1.0",
    "entities": [
      {
        "id": "file-123",
        "type": "document",
        "spatial": { "x": 100, "y": 200, "z": 0 },
        "semantic": { "tags": ["project_alpha"] }
      }
    ]
  }
}
```
