# Design Notes

## Shader Module Loading
- Build a single shader module from `systems/vectorland/kernels/neural_perception_feedback.wgsl`.
- Create separate compute pipelines for the following entry points:
  - `extract_perception`
  - `finalize_perception`
  - `generate_feedback`
  - `finalize_feedback`
- Keep module creation centralized to avoid recompilation per pipeline.

## Resource Bindings
The WGSL file defines multiple bind groups:
- Group 0: Perception inputs/outputs and finalize bindings.
- Group 1: Feedback inputs/outputs and mutation parameters.

Python-side bind group layouts must match binding indices and storage types declared in WGSL. Where the WGSL uses `texture_storage_2d`, ensure the correct usage flags and formats are set when creating textures.

## Dispatch Order
- Perception pass: `extract_perception` then `finalize_perception`.
- Feedback pass: `generate_feedback` then `finalize_feedback`.

The evolution loop should continue to feed perception to the VisualOS agent and apply LLM intents as today, but with the advanced perception/feedback buffers as inputs.
