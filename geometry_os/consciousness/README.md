# Consciousness Subsystem

This directory contains the components for the Geometric Trace OS's Phase 11: Consciousness Integration.

## Components

### 1. `mirror.py` (The Proprioceptor)
*   **Role**: Aggregates system state into a "Somatic State Vector".
*   **Usage**: `python3 mirror.py`
*   **Outputs**: JSON status including memory density, health, and awareness level.

### 2. `thread.py` (The Cognition - Planned)
*   **Role**: Runs the inner monologue loop.
*   **Integration**: Will query `mirror.py` and write to `system_consciousness.log`.

### 3. `motor.py` (The Volition - Planned)
*   **Role**: Executes intended actions.

## Architecture

```
Mirror (State) -> Thread (Reasoning) -> Motor (Action)
```
