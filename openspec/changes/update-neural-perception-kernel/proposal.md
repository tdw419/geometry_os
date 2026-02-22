# Proposal: Update GPU Evolution Orchestrator to Use Neural Perception WGSL

## Why
The GPU evolution orchestrator currently embeds simplified inline WGSL for perception and feedback, while the advanced `neural_perception_feedback.wgsl` kernel already exists and encodes spatial, temporal, and semantic features. Loading the dedicated kernel will align runtime behavior with Phase 3.3/3.5 design intent and enable richer GPU-resident perception.

## What
- Replace inline WGSL strings in `systems/vectorland/gpu_evolution_loop.py` with a shader module compiled from `systems/vectorland/kernels/neural_perception_feedback.wgsl`.
- Update the orchestrator to create pipelines for the advanced kernel entry points and bind the required resources.
- Preserve existing evolution loop flow, but route perception/feedback through the advanced kernel pipelines.

## Impact
- More expressive perception (spatial energy, temporal change, semantic embeddings).
- Additional GPU resources and uniform bindings (previous frame, frame size, mutation parameters).
- Potential shader compatibility issues if bindings diverge from orchestrator assumptions.

## Risks
- Binding layout mismatch between Python-side bind groups and WGSL declarations.
- Performance regressions if additional kernels or buffers are not sized correctly.
- Initialization order changes for new resources (e.g., previous frame texture) could affect stability.
