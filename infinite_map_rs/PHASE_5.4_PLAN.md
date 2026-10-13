# Phase 5.4: GPU Processing Integration Plan

## Current Status (Phase 5.3 - Complete)
- CPU-side processing working (ADD, MUL, SUB, DIV)
- Hypercall 0x124 fully integrated
- Staging buffers operational
- All code compiles
- 15/15 spatial tests passing

## Phase 5.4 Goal
Replace `process_data_on_cpu()` with GridRunner GPU execution on the spatial grid.

## Minimal Viable Implementation

### Approach 1: Simple Opcode-to-GeoASM Mapping (Recommended)

1. **Create simple GeoASM generator module**
   - File: `src/spatial/spatial_processor.rs`
   - Generate minimal GeoASM programs for each opcode
   - For ADD: LDI r0, imm → LDI r1, value → ADD_RR r0, r0, r1 → DATA for result
   - Keep it simple: one instruction per data word

2. **Integrate GridRunner into SpatialHypervisorIntegration**
   - Add `grid_runner: Option<GridRunner>` field
   - In `handle_spatial_process()`:
     - Parse input data
     - Generate GeoASM based on opcode
     - Load into GridRunner
     - Execute N ticks (enough to process all data)
     - Read results back
     - Write to output buffer

3. **GeoASM Program Structure for Processing**
```
For processing [10, 20, 30] with ADD (+1):

(0,0) DATA 10          # Input data cell
(1,0) LDI r0, 0,0      # Load from (0,0) into r0
(2,0) ADD_RI r0, 1     # Add immediate 1
(3,0) DATA 0           # Output cell (will receive result)
(4,0) COPY r0, 3,0     # Copy r0 to (3,0)
(5,0) HALT
```

### Key Design Decisions

**Data Layout on Grid:**
- Use a simple linear layout: input cells → processing cells → output cells
- One instruction chain per input word
- This is inefficient but correct and verifiable

**Execution Model:**
- Load GeoASM program into GridRunner
- Run fixed number of ticks (e.g., 10 ticks)
- Read back grid state
- Extract results from output cells

**Error Handling:**
- If GridRunner fails, fall back to CPU processing
- Log the fallback for monitoring

## Implementation Steps

1. Create `spatial_processor.rs` with GeoASM generation
2. Modify `spatial_hypervisor_integration.rs`:
   - Add GridRunner field
   - Replace `process_data_on_cpu()` call with GPU execution
3. Add tests for GPU vs CPU equivalence
4. Benchmark GPU vs CPU throughput

## Alternative: Staged Rollout

If full GPU integration is complex:

1. **Stage 1**: Create GeoASM generator only (keep CPU execution)
2. **Stage 2**: Add GridRunner integration for single opcode (ADD only)
3. **Stage 3**: Extend to all opcodes
4. **Stage 4**: Optimize for batch processing

## Verification Criteria

- [ ] GeoASM programs compile and load correctly
- [ ] GridRunner executes without errors
- [ ] Output matches CPU results for all opcodes
- [ ] Performance measured (GPU vs CPU)
- [ ] Error handling works (fallback to CPU)

## Next Actions

1. Design minimal GeoASM layout for one operation
2. Create `spatial_processor.rs` skeleton
3. Write unit tests for GeoASM generation
4. Integrate with SpatialHypervisorIntegration
5. Test E2E with actual RISC-V guest