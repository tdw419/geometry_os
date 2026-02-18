# Tasks

- [x] Confirm entry points and bindings in `systems/vectorland/kernels/neural_perception_feedback.wgsl`.
- [x] Load WGSL from file and build a shared shader module in `systems/vectorland/gpu_evolution_loop.py`.
- [x] Replace inline perception pipeline with `extract_perception` + `finalize_perception` entry points.
- [x] Replace inline feedback pipeline with `generate_feedback` + `finalize_feedback` entry points.
- [x] Add and initialize required GPU resources:
  - [x] Previous frame texture
  - [x] Frame size uniform buffer
  - [x] Frame count uniform buffer
  - [x] Mutation rate uniform buffer
  - [x] Evolution pressure uniform buffer
- [x] Update bind group layouts to match WGSL group/binding indices.
- [x] Update dispatch order in the evolution loop to include finalize stages.
- [x] Update statistics/state outputs to capture advanced kernel usage.
- [x] Validate with `test_llm_hybrid_brain.py` (or add a focused test if needed).
