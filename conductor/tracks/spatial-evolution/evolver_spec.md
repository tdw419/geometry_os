# Phase V: The Autonomous Watchmaker (`evolver.asm`)

## Concept
We migrate the evolutionary loop from Rust (`tests/phase_u_evolution.rs`) into a grid-resident Geometry OS assembly program (`evolver.asm`). This program lives on the map, monitors an adjacent population region, and orchestrates evaluation, selection, and reproduction using Substrate MMIO commands.

## Architecture

### Memory Map (Registers)
- **r1:** Generation Counter
- **r2:** Current Evaluated Index (0-7 for a small 8-population proof)
- **r3-r10:** Fitness Scores for population indices 0-7
- **r11:** Best Index
- **r12:** Worst Index
- **r30:** PRNG State

### Flow

1.  **Init**
    - Seed PRNG (`r30 = 0x12345678`)
    - `r1 = 0` (Gen = 0)
    
2.  **Evaluate Loop** (For each individual `i` in `0..7`)
    - Clear grid (`SUBSTRATE_PATCH` to zero out signals)
    - **Test Case 1: (0, 1)**
      - Inject A=0 at `(ox+1, oy+1)`
      - Inject B=200 at `(ox+1, oy+3)`
      - `SUBSTRATE_TICK` 24 times
      - Read output at `(ox+14, oy+13)`
      - If output > 100, add 1 to `r(3+i)`
    - **Test Case 2: (1, 0)**
      - Inject A=200, B=0
      - Tick, read, add to `r(3+i)`
    - **Test Case 3: (1, 1)**
      - Inject A=200, B=200
      - Tick, read. If output < 100, add 1 to `r(3+i)` (Inhibition check)
    - Loop until all 8 evaluated.

3.  **Selection (Tournament)**
    - Compare `r3` through `r10` to find Best (`r11`) and Worst (`r12`) index.
    
4.  **Reproduction**
    - `SUBSTRATE_COPY` from Best Index origin to Worst Index origin.
    
5.  **Mutation**
    - Generate random `X` and `Y` within the Worst Index's new region.
    - Generate random taxonomy/type (`TAX_WIRE` or `TAX_LOGIC`).
    - `SUBSTRATE_PATCH` the random pixel.
    
6.  **Next Generation**
    - Increment `r1` (Gen++).
    - If `r1` < `MAX_GEN`, jump to **Evaluate Loop**.
    - Halt.

## Substrate MMIO Requirements
- `0xE000/0xE001`: Set X/Y coords
- `0xE002/0xE003`: Inject / Readback
- `0xE004`: Command Execution
  - `0x01` (Tick)
  - `0x08` (Copy: args in `0xE005`, `0xE006`)
  - `0x09` (Patch: arg in `0xE005`)

## Feasibility
This is completely feasible with the existing opcodes. The primary challenge is register pressure (storing 8 fitness scores takes 8 registers, leaving ~20 for math and MMIO) and building an in-assembly LCG PRNG (which just requires `MULI`, `ADDI`, and `MODI`).

We can start with a 4-individual population to minimize register usage and keep the assembly tight for the proof-of-concept.
