# TENSOR_GATE Integration Test

## Test: 4x4 Matrix Multiplication

### Setup
- Weight matrix: 4×4 at (0, 0)
- Input matrix: 4×4 at (16, 0)
- Output matrix: 4×4 at (32, 0)
- Tensor gate cell at (64, 32)

### Expected Behavior
1. Tensor gate cell materializes with packed configuration
2. Configuration extracts correctly from cell
3. Matrix multiply: C[i][j] = Σ(W[i][k] × I[k][j]) for k in 0..3
4. Output region receives computation results

## Test: Configuration Validation

### Invalid Matrix Size
- size = 5 (not power of 2) → Should fail
- size = 128 (too large) → Should fail

### Out of Bounds
- weight_start = (125, 0) with size=4 → 125+4=129 > 128 → Should fail
- gate_coord = (200, 100) → Out of grid bounds → Should fail

## Test: Integration with WeightLoader

### Workflow
1. Load weights via WeightLoader into Brain Region
2. Create tensor gate configuration
3. Materialize tensor gate cell
4. Load cells into GridRunner
5. Execute spatial program
6. Read output region

### Expected Results
- Weights loaded correctly in TYPE_NOP cells
- Tensor gate cell encodes correct pointers
- Output region contains matrix multiply results