# Morphological Growth Optimization (Track 3)

Target: **100% Success Rate** for Opcode 225 (SPATIAL_SPAWN).

## Objective
The goal is to enable **Recursive Self-Replication**. A program at (X, Y) should be able to "spawn" a child program at (X+1, Y) without memory corruption or race conditions.

## The Metric: Spawn Success Rate
- **Measurement**: Run `python3 systems/glyph_stratum/test_recursive_spawn.py`
- **Success Criteria**: 100 iterations of spawning without a system crash.

## Experimentation Loop

LOOP:

1. **Observe**: Run recursive spawn test and check for "Glitch Clusters" on the map.
2. **Identify Bottleneck**: Writing to `program` storage from multiple workgroups can cause race conditions.
3. **Hypothesize**: "If I use `atomicAdd` for PC management during spawning, the success rate will increase."
4. **Act**: Update `SPATIAL_SPAWN` implementation in the WGSL shader.
5. **Verify**: Run recursive test.
6. **Decide**: KEEP if Success Rate == 1.0.

## Growth Patterns to Test
- **Linear**: (X, Y) -> (X+1, Y)
- **Binary Tree**: (X, Y) -> (X+1, Y-1) AND (X+1, Y+1)
- **Hilbert Spiral**: Follow the Hilbert curve for growth (Max Locality).
