# Legible Brain Autonomous Optimization Loop

This is an autonomous research loop designed to optimize the cognitive self-healing parameters of the Legible Brain (Phase 41).

## Goal
Maximize the **Efficiency Score** of the Ouroboros Repair Engine.
Efficiency Score = (Entropy Reduction % * 1000) / Latency (ms).

## The Metric: Efficiency Score
The primary goal is to improve the score returned by `systems/pixel_brain/tests/benchmark_brain_health.py`.
- **Measurement**: The `efficiency_score` value in JSON output.

## Experimentation Loop

LOOP FOREVER:

1. **Observe**: Run `python3 systems/pixel_brain/tests/benchmark_brain_health.py --json` and extract the current efficiency score.
2. **Identify Bottleneck**: Analyze the code in `systems/pixel_brain/synaptic_bridge.py` (specifically `OuroborosRepairEngine`).
3. **Hypothesize**: 
   - "If I change the `sample_step` in `scan_for_fractures`, the latency will drop without losing too much reduction."
   - "If I use a different falloff function in `apply_mutation`, the entropy will drop faster."
   - "If I adjust the `target_entropy` formula, the healing will be more effective."
4. **Act**: Modify `systems/pixel_brain/synaptic_bridge.py`.
5. **Verify**:
   - Run `benchmark_brain_health.py` to measure the new efficiency score.
   - Ensure `systems/pixel_brain/tests/test_ouroboros_loop.py` still passes (functional sanity).
6. **Decide**:
   - **KEEP**: If Efficiency Score increased by >1% and sanity tests pass.
   - **DISCARD**: Otherwise.
7. **Record**: Log changes and results to `results_brain_opt.tsv`.

## Constraints
- **Substrate Integrity**: Mutations must not introduce global noise (R/G/B values must stay in [0, 1]).
- **Functional Reality**: The `SYNAPTIC_PROBE` command must still return valid DAGs.
