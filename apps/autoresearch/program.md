# AI Entropy Optimization Loop (Track 2)

Target: **Entropy Score > 0.99** for Opcode 220 (BRANCH_PROB).

## Objective
The goal is to optimize the randomness quality of the **Probabilistic Opcodes**. We need to ensure that 1,000,000 coin flips across the 2D plane result in a perfect 50/50 distribution with zero spatial artifacts (striping, clusters).

## The Metric: Entropy Score
- **Measurement**: Run `python3 systems/glyph_stratum/visualize_collapse.py --iterations 1000`
- **Success Criteria**: Score > 0.99 (Optimal: 1.0)

## Experimentation Loop

LOOP:

1. **Observe**: Run entropy benchmark and analyze the `divergence_*.png` for patterns.
2. **Identify Bottleneck**: Current LCG might have low period or poor bit distribution.
3. **Hypothesize**: "If I replace the LCG with a PCG-RXS-M-XS (Permuted Congruential Generator), the entropy will increase."
4. **Act**: Modify the randomness logic in `glyph_microcode.wgsl`.
5. **Verify**: Run entropy check.
6. **Decide**: KEEP if Score > Previous AND GIPS >= Baseline.

## Candidate Randomness Shaders
- **PCG-32**: High quality, 32-bit.
- **Xorshift**: Extremely fast, moderate quality.
- **Philox**: Counter-based, crypto-grade, heavy.
