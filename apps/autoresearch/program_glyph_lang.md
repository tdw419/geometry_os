# Glyph-Atomic Programming Research Loop (Phase 45)

Target: **120 FPS** Native Glyph Execution.

## Objective
Convert Geometry OS Fonts from "visual labels" into "executable microcode". The font itself *is* the instruction set. An AI agent should iterate on the shader-based expansion of these glyphs to achieve zero-overhead spatial execution.

## The Metric: FPS + GIPS
- **FPS Target**: 120 (8.33ms per frame)
- **GIPS Target**: 1,000,000 glyph instructions per second
- **Measurement**: Run `python3 systems/glyph_stratum/benchmark_glyph_fps.py`

## Experimentation Loop

LOOP FOREVER:

1. **Observe**: Run benchmark and extract current FPS/GIPS.
   ```bash
   python3 systems/glyph_stratum/benchmark_glyph_fps.py
   ```

2. **Identify Bottleneck**: Analyze the code to find optimization opportunities:
   - `systems/visual_shell/web/GlyphExecutionPipeline.js` - JS-side dispatch
   - `systems/visual_shell/web/shaders/glyph_microcode.wgsl` - GPU microcode

3. **Hypothesize**: "If I [optimization], the FPS will increase."
   Example hypotheses:
   - "Texture-based LUT will be faster than switch statement"
   - "Increasing workgroup size to 256 will improve occupancy"
   - "Batching multiple dispatches reduces overhead"

4. **Act**: Apply the change to the relevant file.

5. **Verify**:
   - Run the benchmark again
   - Confirm no errors or crashes
   - Check that output is correct (factorial of 5 = 120)

6. **Decide**:
   - **KEEP**: If FPS > Previous AND result is correct
   - **DISCARD**: If FPS decreased OR result is wrong

7. **Record**: Log to `apps/autoresearch/glyph_results.tsv`:
   ```
   timestamp_ms  glyphs  cycles  fps  gips  status  description
   ```

## Candidate Optimizations (Prioritized)

| Priority | Optimization | Expected Gain | Complexity |
|----------|--------------|---------------|------------|
| 1 | **Texture LUT** - Replace switch with 1D texture lookup | 2-4x | Medium |
| 2 | **Batch Dispatch** - Run multiple frames per submit | 1.5-2x | Low |
| 3 | **Workgroup Tuning** - Test 64/128/256/512 sizes | 1.2-1.5x | Low |
| 4 | **Hilbert Prefetch** - Spatial locality optimization | 1.1-1.3x | High |
| 5 | **MSDF Pre-pass** - Compute shader for glyph shapes | 1.1-1.2x | High |

## Opcode Reference

The shader executes glyphs from the U+2000 Unicode range:

| Opcode | Name | Stratum | Description |
|--------|------|---------|-------------|
| 200 | ADD | LOGIC | r[dst] = p1 + p2 |
| 201 | SUB | LOGIC | r[dst] = p1 - p2 |
| 202 | MUL | LOGIC | r[dst] = r[p1] * r[p2] |
| 203 | DIV | LOGIC | r[dst] = p1 / p2 |
| 204 | LOAD | MEMORY | r[dst] = mem[p1] |
| 205 | STORE | MEMORY | mem[p1] = p2 |
| 206 | LOADI | SUBSTRATE | r[dst] = p1 (immediate) |
| 207 | ZERO | SUBSTRATE | r[dst] = 0 |
| 208 | JMP | LOGIC | PC = p1 |
| 209 | BNZ | LOGIC | if r[dst] != 0: PC = p1 |
| 210 | CALL | LOGIC | stack[++SP] = PC; PC = p1 |
| 211 | RET | LOGIC | PC = stack[SP--] |
| 212 | HALT | SYSTEM | Stop execution |
| 213 | SYNC | SYSTEM | Barrier |
| 215 | DRAW | SYSTEM | Blit glyph to output |

## Constraints
- **Correctness**: factorial(5) must equal 120
- **No Crashes**: Pipeline must complete without GPU errors
- **Memory**: Must stay under 256MB VRAM

## Success Definition
> "The OS is no longer running code; it is executing the font."
