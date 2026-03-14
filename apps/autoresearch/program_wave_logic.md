# Wave-Logic Unit Evolution Research

Target: **Stable AND gate via wave interference** with continuous gradient descent.

## Objective

Evolve the Wave-Logic Unit (WLU) to implement reliable logic gates using wave interference patterns instead of discrete transistors. This proves the "analog computing" paradigm for Geometry OS.

## The Metric: Gate Stability Score

- **Measurement**: Run the WLU benchmark, measure how consistently the sensor reads HIGH when both oscillators are active (AND behavior)
- **Formula**: `stability = min(sensor_high_ratio, 1 - sensor_low_ratio)`
- **Target**: 0.95 (95% stable gate behavior)

## Experimentation Loop

LOOP:

1. **Benchmark**: Run the wave logic unit tests
   ```bash
   cargo test --package infinite_map_rs wave_logic_unit -- --nocapture
   ```

2. **Analyze**: Check current oscillator configuration:
   - Positions (oscillator_a_pos, oscillator_b_pos)
   - Frequencies (oscillator_a_frequency, oscillator_b_frequency)
   - Phases (oscillator_a_phase, oscillator_b_phase)
   - Wave parameters (wave_speed, damping, grid_size)

3. **Hypothesize**: "If I [adjust phase/increase damping/move oscillator], stability will increase"

4. **Act**: Modify `systems/infinite_map_rs/src/wave_logic_unit.rs`:
   - Adjust `WLUConfig::default()` parameters
   - Try different oscillator positions (closer/further from sensor)
   - Try phase alignment (0.0 vs π vs π/2)
   - Try frequency matching (same vs different)

5. **Verify**:
   - Run tests: `cargo test --package infinite_map_rs wave_logic_unit`
   - Run benchmark: measure stability over 1000 frames
   - Ensure no panics or NaN values

6. **Decide**:
   - **KEEP**: If stability increased and tests pass
   - **DISCARD**: If stability decreased or any failure

7. **Record**: Log to `apps/autoresearch/wave_logic_results.tsv`

## Candidate Experiments

### Phase 1: Position Search
- Move oscillators closer together (stronger interference)
- Move sensor to equidistant point (maximum interference)
- Try different grid positions

### Phase 2: Frequency Tuning
- Same frequency, different phases (constructive/destructive)
- Different frequencies (beat patterns)
- Harmonic ratios (1:2, 1:3, 2:3)

### Phase 3: Medium Properties
- Increase damping (faster settling)
- Adjust wave speed (propagation time)
- Increase grid resolution (256 → 512)

### Phase 4: Logic Gate Variants
- AND: Both oscillators ON → sensor HIGH
- OR: Either oscillator ON → sensor HIGH
- XOR: Exactly one ON → sensor HIGH
- NAND: AND with inverted output

## Success Definition

> "The wave tank computes AND reliably enough that evolution can hill-climb to it."

## Files to Modify

- `systems/infinite_map_rs/src/wave_logic_unit.rs` - CPU simulation
- `systems/infinite_map_rs/src/shaders/wave_logic_unit.wgsl` - GPU shader (when ready)
- `apps/autoresearch/wave_logic_results.tsv` - Results log

## Related Programs

- `program_ai_native_glyphs.md` - Probabilistic opcodes (similar gradient optimization)
- `program_infinite_map.md` - Spatial rendering optimization
- `program.md` - GIPS optimization baseline
