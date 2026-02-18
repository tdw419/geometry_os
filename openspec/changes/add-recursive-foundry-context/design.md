# Design: Recursive Foundry Context

## Visual/Geometric Impact
- **Fractal Execution**: The execution flow is fractal. This should be visualized in the `Recursive Builder` view as a tree of light/nodes expanding and collapsing.
- **PAS Score**: High stability. The recursion is purely logical/informational and does not destabilize the visual substrate unless it spawns too many visual bricks at once.

## Architecture
- **Class**: `RecursiveCognitionEngine`
- **Location**: `systems/foundry/recursive_context.py`
- **Integration**: `Foundry Daemon` calls this engine when `context_size > LIMIT`.

## Data Flow
1.  **Input**: Massive Context (e.g. Map Region or 100MB Log).
2.  **Scout**: Engine reads metadata/headers.
3.  **Plan**: Engine decides split strategy (Physical for Maps, Logical/Line-based for Logs).
4.  **Execute**: Parallel/Sequential recursive calls.
5.  **Synthesize**: Results aggregated upwards.

## Confidence & Simulation
- **Simulation**: verified in `recursive_context.py` via text splitting.
- **Confidence**: 0.95 (Algorithm is standard Divide & Conquer).
