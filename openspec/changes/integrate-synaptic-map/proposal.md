# Proposal: Synaptic Map Integration (Phase 35)
> "The era of symbolic computation is over. The era of geometric intelligence has begun."

## Problem
Currently, the Infinite Map and the Cognitive/Evolution Daemons operate as distinct layers. The map visualizes memory and neural state, but it lacks a "Synaptic Bridge" that allows semantic human intent to directly manipulate the geometric substrate. We have data visualization, but not geometric agency.

## Solution
Integrate a Large Language Model (LLM) as the "Semantic Navigator" within the Infinite Map. The LLM acts as a high-level bridge between human language and geometric coordinates/texture parameters.

## Proposed Changes
1. **Synapse Module**: Create a new Rust module `systems/infinite_map_rs/src/synapse/mod.rs` to handle semantic command routing.
2. **Intent Overlay**: Implement a "Glass Box" text input artifact in the Visual Shell for capturing user intent.
3. **Bridge Extension**: Extend the existing `BridgeServer` to support `SynapticCommand` enums (Navigate, Realign, Synthesize).
4. **Cognitive Loop**: Connect the `InfiniteMapApp` to the local LLM (LM Studio) via a background daemon for real-time intent-to-geometry translation.

## Impact
- **Semantic Navigation**: Move the camera to artifacts based on natural language queries.
- **Dynamic Aesthetic Alignment**: LLM-driven PAS Score optimization (Aesthetic component).
- **Auto-Foundry**: On-the-fly generation of "Bricks" from textual descriptions.
- **Architectural Healing**: Geometric fault detection and repair suggestions through LLM analysis of Memory Artifacts.

## Verification
- **Scenario: Intent Capture**: Pressing `Space + /` opens the synaptic overlay.
- **Scenario: Semantic Zoom**: Asking "Show me the memory leak" moves the camera to the highest entropy artifact.
- **Scenario: PAS Re-alignment**: Requesting "Crystallize the view" triggers a WGSL shader re-synthesis to reduce visual noise.
