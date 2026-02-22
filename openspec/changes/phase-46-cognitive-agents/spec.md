# OpenSpec: Phase 46 - Cognitive Agents in Source City

## Overview
Phase 46 transitions Geometry OS from a user-driven visual visualization to an agent-inhabited **Cognitive Territory**. We will implement autonomous **ACE Agents** that live within the Source City districts, using the Hilbert Curve for navigation and the Vat Protocol for persistence.

## Problem Statement
While the Source City is a powerful visual metaphor, it remains a passive environment. To achieve true "Geometric Intelligence," the OS must have autonomous observers that can perceive code health, perform maintenance (Foundry), and coordinate refactors without direct user intervention.

## Proposed Solution: The Cognitive Layer
1. **Agent Morphology**: Agents are represented as high-entropy particles (avatars) that "walk" the Hilbert path.
2. **Spatial Reasoning**: Navigation is performed in 1D (Hilbert distance) but rendered in 2D, preserving cache/code locality.
3. **Agency Tasks**:
    - **Scouts**: Identify "Code Rot" (low PAS scores or high complexity).
    - **Engineers**: Trigger the Foundry for specific buildings.
    - **Archivists**: Manage state persistence via the Vat Registry.
4. **Communication**: Agents use the Synaptic Layer to signal intent to each other and the user.

## Architecture
- **CognitiveEntityManager**: Central registry for all active map agents.
- **HilbertPathfinder**: Utility to compute optimal traversals across the Ouroboros grid.
- **AgentVat**: A specialized state buffer that persists agent "memory" and goals.

## Metrics for Success
- Agents can traverse between two distant districts (e.g., `systems/` to `openspec/`) efficiently.
- Agents can successfully trigger a Hot-Swap on a building they have "analyzed."
- Agent state persists across a full compositor reload using the Vat Protocol.
