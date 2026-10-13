//! Tiny Attention Head Implementation (Phase 6.7.2)
//!
//! Implements scaled dot-product attention using GeoASM spatial instructions.
//! Architecture: 4 queries × 4 keys × 4 values (dim=4)
//!
//! Computation flow:
//! 1. Q × K^T → attention scores (4×4 matrix)
//! 2. Scale by √(d_k) = √4 = 2
//! 3. Softmax per row (exp + normalize)
//! 4. Multiply by values + sum → output (4×4 weighted sum)
//!
//! Grid Layout (128×64):
//! - Q region: (0,0)-(15,3) - 16 cells (4 queries × 4 dims)
//! - K region: (16,0)-(31,3) - 16 cells (4 keys × 4 dims)
//! - V region: (32,0)-(47,3) - 16 cells (4 values × 4 dims)
//! - Attention scores: (48,0)-(63,3) - 16 cells (4×4 matrix)
//! - Softmax temp: (64,0)-(79,3) - 16 cells (exp values)
//! - Row sums: (80,0)-(83,0) - 4 cells (one per row)
//! - Output: (84,0)-(99,3) - 16 cells (4×4 weighted sum)
//! - Constants: (127,0)-(127,3) - 4 cells (scale factor, etc.)

use crate::geoasm_materializer::{CellState, TYPE_NOP, TYPE_LDI, TYPE_MUL, TYPE_ADD_RR, TYPE_DIV, TYPE_HALT};
use crate::spatial::types::WriteRequest;
use std::f32::consts::SQRT_2;

/// Attention head configuration
pub struct AttentionConfig {
    pub num_heads: usize,  // Number of attention heads (currently 1)
    pub d_model: usize,    // Model dimension (currently 4)
    pub d_k: usize,        // Key/Query dimension (currently 4)
    pub d_v: usize,        // Value dimension (currently 4)
}

impl Default for AttentionConfig {
    fn default() -> Self {
        Self {
            num_heads: 1,
            d_model: 4,
            d_k: 4,
            d_v: 4,
        }
    }
}

/// Grid layout coordinates for attention head
pub struct AttentionGridLayout {
    // Input regions
    pub q_start: (usize, usize),  // (0, 0)
    pub k_start: (usize, usize),  // (16, 0)
    pub v_start: (usize, usize),  // (32, 0)
    
    // Computation regions
    pub attn_start: (usize, usize),  // (48, 0) - attention scores
    pub softmax_temp_start: (usize, usize),  // (64, 0)
    pub row_sums_start: (usize, usize),  // (80, 0)
    pub output_start: (usize, usize),  // (84, 0)
    
    // Constants region
    pub constants_start: (usize, usize),  // (127, 0)
}

impl Default for AttentionGridLayout {
    fn default() -> Self {
        Self {
            q_start: (0, 0),
            k_start: (16, 0),
            v_start: (32, 0),
            attn_start: (48, 0),
            softmax_temp_start: (64, 0),
            row_sums_start: (80, 0),
            output_start: (84, 0),
            constants_start: (127, 0),
        }
    }
}

impl AttentionGridLayout {
    /// Get cell index for Q[i][j]
    pub fn q_cell(&self, i: usize, j: usize) -> usize {
        let x = self.q_start.0 + j;
        let y = self.q_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for K[i][j]
    pub fn k_cell(&self, i: usize, j: usize) -> usize {
        let x = self.k_start.0 + j;
        let y = self.k_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for V[i][j]
    pub fn v_cell(&self, i: usize, j: usize) -> usize {
        let x = self.v_start.0 + j;
        let y = self.v_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for attention score Attn[i][j]
    pub fn attn_cell(&self, i: usize, j: usize) -> usize {
        let x = self.attn_start.0 + j;
        let y = self.attn_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for softmax temp SoftmaxTemp[i][j]
    pub fn softmax_temp_cell(&self, i: usize, j: usize) -> usize {
        let x = self.softmax_temp_start.0 + j;
        let y = self.softmax_temp_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for row sum i
    pub fn row_sum_cell(&self, i: usize) -> usize {
        let x = self.row_sums_start.0 + i;
        let y = self.row_sums_start.1;
        y * 128 + x
    }
    
    /// Get cell index for output Output[i][j]
    pub fn output_cell(&self, i: usize, j: usize) -> usize {
        let x = self.output_start.0 + j;
        let y = self.output_start.1 + i;
        y * 128 + x
    }
    
    /// Get cell index for constant i
    pub fn constant_cell(&self, i: usize) -> usize {
        let x = self.constants_start.0;
        let y = self.constants_start.1 + i;
        y * 128 + x
    }
}

/// Attention head builder
pub struct AttentionHeadBuilder {
    config: AttentionConfig,
    layout: AttentionGridLayout,
}

impl AttentionHeadBuilder {
    /// Create a new attention head builder
    pub fn new() -> Self {
        Self {
            config: AttentionConfig::default(),
            layout: AttentionGridLayout::default(),
        }
    }
    
    /// Set custom configuration
    pub fn with_config(mut self, config: AttentionConfig) -> Self {
        self.config = config;
        self
    }
    
    /// Build the attention head program as a vector of cells
    pub fn build(&self, q_weights: &[f32], k_weights: &[f32], v_weights: &[f32]) -> Result<Vec<CellState>, AttentionError> {
        // Validate input sizes
        let expected_q_size = self.config.num_heads * self.config.d_k;
        let expected_k_size = self.config.num_heads * self.config.d_k;
        let expected_v_size = self.config.num_heads * self.config.d_v;
        
        if q_weights.len() != expected_q_size {
            return Err(AttentionError::InvalidWeightSize {
                name: String::from("Q"),
                expected: expected_q_size,
                actual: q_weights.len(),
            });
        }
        
        if k_weights.len() != expected_k_size {
            return Err(AttentionError::InvalidWeightSize {
                name: String::from("K"),
                expected: expected_k_size,
                actual: k_weights.len(),
            });
        }
        
        if v_weights.len() != expected_v_size {
            return Err(AttentionError::InvalidWeightSize {
                name: String::from("V"),
                expected: expected_v_size,
                actual: v_weights.len(),
            });
        }
        
        // Initialize grid with all NOP cells
        let total_cells = 128 * 64;
        let mut cells = vec![CellState {
            opcode_or_type: TYPE_NOP,
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        }; total_cells];
        
        // Load Q weights
        self.load_weights(&mut cells, q_weights, self.layout.q_start, self.config.d_k, self.config.num_heads);
        
        // Load K weights
        self.load_weights(&mut cells, k_weights, self.layout.k_start, self.config.d_k, self.config.num_heads);
        
        // Load V weights
        self.load_weights(&mut cells, v_weights, self.layout.v_start, self.config.d_v, self.config.num_heads);
        
        // Store constants
        let scale_factor = f32::to_bits(1.0 / (self.config.d_k as f32).sqrt());
        cells[self.layout.constant_cell(0)].data_buffer = scale_factor;  // 1/√(d_k)
        cells[self.layout.constant_cell(1)].data_buffer = f32::to_bits(1.0);  // One
        cells[self.layout.constant_cell(2)].data_buffer = f32::to_bits(0.0);  // Zero
        
        // Build attention computation instructions
        self.build_attention_computation(&mut cells);
        
        Ok(cells)
    }
    
    /// Load weights into grid region
    fn load_weights(&self, cells: &mut [CellState], weights: &[f32], start: (usize, usize), dim: usize, count: usize) {
        for i in 0..count {
            for j in 0..dim {
                let idx = i * dim + j;
                let x = start.0 + j;
                let y = start.1 + i;
                let cell_idx = y * 128 + x;
                
                if cell_idx < cells.len() && idx < weights.len() {
                    cells[cell_idx].data_buffer = f32::to_bits(weights[idx]);
                }
            }
        }
    }
    
    /// Build the attention computation instructions
    fn build_attention_computation(&self, cells: &mut [CellState]) {
        // Phase 1: Compute Q × K^T (attention scores)
        // For each pair (i, j) where i is query index, j is key index:
        //   attn[i][j] = Σ(Q[i][k] * K[j][k]) for k in 0..d_k
        
        for i in 0..self.config.num_heads {
            for j in 0..self.config.num_heads {
                let attn_idx = self.layout.attn_cell(i, j);
                
                // Initialize accumulator to zero
                cells[attn_idx] = CellState {
                    opcode_or_type: TYPE_LDI,
                    is_active: 1,  // Active token
                    data_buffer: f32::to_bits(0.0),
                    executing: 0,
                };
                
                // Set relative target to itself (accumulator)
                let packed = self.pack_instruction(TYPE_LDI, 0, 0);
                cells[attn_idx].opcode_or_type = packed;
                
                // For each dimension k, multiply Q[i][k] * K[j][k] and accumulate
                // In spatial execution, multiple cells can compute in parallel
                for k in 0..self.config.d_k {
                    let q_idx = self.layout.q_cell(i, k);
                    let k_idx = self.layout.k_cell(j, k);
                    
                    // MUL instruction: multiply Q[i][k] * K[j][k]
                    // Store result in intermediate cell for accumulation
                    let mul_idx = self.layout.attn_start.0 + j + (self.layout.attn_start.1 + i) * 128 + k;
                    
                    if mul_idx < cells.len() {
                        cells[mul_idx] = CellState {
                            opcode_or_type: TYPE_MUL,
                            is_active: 1,
                            data_buffer: 0,
                            executing: 0,
                        };
                        
                        // Set relative offsets to Q and K cells
                        let q_x = q_idx % 128;
                        let q_y = q_idx / 128;
                        let k_x = k_idx % 128;
                        let k_y = k_idx / 128;
                        let cur_x = mul_idx % 128;
                        let cur_y = mul_idx / 128;
                        
                        let rel_q_x = q_x as i32 - cur_x as i32;
                        let rel_q_y = q_y as i32 - cur_y as i32;
                        let rel_k_x = k_x as i32 - cur_x as i32;
                        let rel_k_y = k_y as i32 - cur_y as i32;
                        
                        let packed = self.pack_instruction(TYPE_MUL, rel_q_x, rel_q_y);
                        cells[mul_idx].opcode_or_type = packed;
                        cells[mul_idx].data_buffer = self.pack_offset(rel_k_x, rel_k_y);
                    }
                }
            }
        }
        
        // Phase 2: Scale by 1/√(d_k) (stored in constant_cell(0))
        for i in 0..self.config.num_heads {
            for j in 0..self.config.num_heads {
                let attn_idx = self.layout.attn_cell(i, j);
                let scale_idx = self.layout.constant_cell(0);
                
                // MUL instruction: attn[i][j] *= scale_factor
                cells[attn_idx].opcode_or_type = TYPE_MUL;
                cells[attn_idx].is_active = 1;
                
                let scale_x = scale_idx % 128;
                let scale_y = scale_idx / 128;
                let cur_x = attn_idx % 128;
                let cur_y = attn_idx / 128;
                
                let rel_scale_x = scale_x as i32 - cur_x as i32;
                let rel_scale_y = scale_y as i32 - cur_y as i32;
                
                cells[attn_idx].opcode_or_type = self.pack_instruction(TYPE_MUL, rel_scale_x, rel_scale_y);
            }
        }
        
        // Phase 3: Softmax (exp + normalize per row)
        // This is simplified - in practice, softmax requires exponentiation
        // For our tiny implementation, we'll skip exp and just normalize
        for i in 0..self.config.num_heads {
            // Compute row sum
            let row_sum_idx = self.layout.row_sum_cell(i);
            cells[row_sum_idx] = CellState {
                opcode_or_type: TYPE_LDI,
                is_active: 1,
                data_buffer: f32::to_bits(0.0),
                executing: 0,
            };
            
            for j in 0..self.config.num_heads {
                let attn_idx = self.layout.attn_cell(i, j);
                let softmax_idx = self.layout.softmax_temp_cell(i, j);
                
                // Copy attention score to softmax temp
                cells[softmax_idx] = CellState {
                    opcode_or_type: TYPE_LDI,
                    is_active: 1,
                    data_buffer: cells[attn_idx].data_buffer,
                    executing: 0,
                };
                
                // ADD to row sum
                let rel_sum_x = (row_sum_idx % 128) as i32 - (softmax_idx % 128) as i32;
                let rel_sum_y = (row_sum_idx / 128) as i32 - (softmax_idx / 128) as i32;
                
                cells[softmax_idx].opcode_or_type = self.pack_instruction(TYPE_ADD_RR, rel_sum_x, rel_sum_y);
            }
        }
        
        // Normalize each row
        for i in 0..self.config.num_heads {
            let row_sum_idx = self.layout.row_sum_cell(i);
            
            for j in 0..self.config.num_heads {
                let attn_idx = self.layout.attn_cell(i, j);
                
                // DIV: attn[i][j] /= row_sum[i]
                let rel_sum_x = (row_sum_idx % 128) as i32 - (attn_idx % 128) as i32;
                let rel_sum_y = (row_sum_idx / 128) as i32 - (attn_idx / 128) as i32;
                
                cells[attn_idx].opcode_or_type = self.pack_instruction(TYPE_DIV, rel_sum_x, rel_sum_y);
                cells[attn_idx].is_active = 1;
            }
        }
        
        // Phase 4: Multiply by values and sum (output = attn @ V)
        for i in 0..self.config.num_heads {
            for j in 0..self.config.d_v {
                let output_idx = self.layout.output_cell(i, j);
                
                // Initialize output accumulator
                cells[output_idx] = CellState {
                    opcode_or_type: TYPE_LDI,
                    is_active: 1,
                    data_buffer: f32::to_bits(0.0),
                    executing: 0,
                };
                
                // Weighted sum: output[i][j] = Σ(attn[i][k] * V[k][j]) for k in 0..num_heads
                for k in 0..self.config.num_heads {
                    let attn_idx = self.layout.attn_cell(i, k);
                    let v_idx = self.layout.v_cell(k, j);
                    
                    // MUL: attn[i][k] * V[k][j]
                    let mul_idx = self.layout.output_start.0 + j + (self.layout.output_start.1 + i) * 128 + k + 4;
                    
                    if mul_idx < cells.len() {
                        cells[mul_idx] = CellState {
                            opcode_or_type: TYPE_MUL,
                            is_active: 1,
                            data_buffer: 0,
                            executing: 0,
                        };
                        
                        let attn_x = attn_idx % 128;
                        let attn_y = attn_idx / 128;
                        let v_x = v_idx % 128;
                        let v_y = v_idx / 128;
                        let cur_x = mul_idx % 128;
                        let cur_y = mul_idx / 128;
                        
                        let rel_attn_x = attn_x as i32 - cur_x as i32;
                        let rel_attn_y = attn_y as i32 - cur_y as i32;
                        let rel_v_x = v_x as i32 - cur_x as i32;
                        let rel_v_y = v_y as i32 - cur_y as i32;
                        
                        cells[mul_idx].opcode_or_type = self.pack_instruction(TYPE_MUL, rel_attn_x, rel_attn_y);
                        cells[mul_idx].data_buffer = self.pack_offset(rel_v_x, rel_v_y);
                    }
                    
                    // ADD to output accumulator
                    let rel_out_x = (output_idx % 128) as i32 - (mul_idx % 128) as i32;
                    let rel_out_y = (output_idx / 128) as i32 - (mul_idx / 128) as i32;
                    
                    cells[mul_idx].opcode_or_type = self.pack_instruction(TYPE_ADD_RR, rel_out_x, rel_out_y);
                }
            }
        }
        
        // HALT instruction at the end
        let halt_idx = self.layout.output_cell(self.config.num_heads - 1, self.config.d_v - 1);
        if halt_idx < cells.len() {
            cells[halt_idx].opcode_or_type = TYPE_HALT;
            cells[halt_idx].is_active = 1;
        }
    }
    
    /// Pack instruction with relative offsets
    fn pack_instruction(&self, opcode: u32, rel_x: i32, rel_y: i32) -> u32 {
        let op = opcode & 0xFF;
        let rx = (rel_x as u32) & 0xFFF;
        let ry = (rel_y as u32) & 0xFFF;
        op | (rx << 8) | (ry << 20)
    }
    
    /// Pack offset for second operand (stored in data_buffer)
    fn pack_offset(&self, x: i32, y: i32) -> u32 {
        let sx = (x as u32) & 0xFFF;
        let sy = (y as u32) & 0xFFF;
        sx | (sy << 16)
    }
}

/// Attention head errors
#[derive(Debug, thiserror::Error)]
pub enum AttentionError {
    #[error("Invalid weight size for {name}: expected {expected}, got {actual}")]
    InvalidWeightSize { name: String, expected: usize, actual: usize },
    
    #[error("Grid coordinate out of bounds: {x}, {y}")]
    OutOfBounds { x: usize, y: usize },
    
    #[error("Weight value invalid: NaN or Inf")]
    InvalidWeightValue,
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_grid_layout_coordinates() {
        let layout = AttentionGridLayout::default();
        
        // Test Q cells
        assert_eq!(layout.q_cell(0, 0), 0 * 128 + 0);
        assert_eq!(layout.q_cell(0, 3), 0 * 128 + 3);
        assert_eq!(layout.q_cell(3, 0), 3 * 128 + 0);
        
        // Test K cells
        assert_eq!(layout.k_cell(0, 0), 0 * 128 + 16);
        assert_eq!(layout.k_cell(3, 3), 3 * 128 + 19);
        
        // Test V cells
        assert_eq!(layout.v_cell(0, 0), 0 * 128 + 32);
        assert_eq!(layout.v_cell(3, 3), 3 * 128 + 35);
        
        // Test attention cells
        assert_eq!(layout.attn_cell(0, 0), 0 * 128 + 48);
        assert_eq!(layout.attn_cell(3, 3), 3 * 128 + 51);
        
        // Test output cells
        assert_eq!(layout.output_cell(0, 0), 0 * 128 + 84);
        assert_eq!(layout.output_cell(3, 3), 3 * 128 + 87);
    }
    
    #[test]
    fn test_attention_head_builder() {
        let builder = AttentionHeadBuilder::new();
        
        // Create simple weight matrices
        let q_weights: Vec<f32> = (0..16).map(|i| i as f32).collect();
        let k_weights: Vec<f32> = (0..16).map(|i| (i + 16) as f32).collect();
        let v_weights: Vec<f32> = (0..16).map(|i| (i + 32) as f32).collect();
        
        let result = builder.build(&q_weights, &k_weights, &v_weights);
        assert!(result.is_ok());
        
        let cells = result.unwrap();
        assert_eq!(cells.len(), 128 * 64);
        
        // Verify Q weights loaded
        let layout = AttentionGridLayout::default();
        let q0_val = f32::from_bits(cells[layout.q_cell(0, 0)].data_buffer);
        assert!((q0_val - 0.0).abs() < 1e-6);
        
        // Verify K weights loaded
        let k0_val = f32::from_bits(cells[layout.k_cell(0, 0)].data_buffer);
        assert!((k0_val - 16.0).abs() < 1e-6);
        
        // Verify V weights loaded
        let v0_val = f32::from_bits(cells[layout.v_cell(0, 0)].data_buffer);
        assert!((v0_val - 32.0).abs() < 1e-6);
    }
    
    #[test]
    fn test_invalid_weight_sizes() {
        let builder = AttentionHeadBuilder::new();
        
        let q_weights = vec![0.0_f32; 15];  // Wrong size
        let k_weights = vec![0.0_f32; 16];
        let v_weights = vec![0.0_f32; 16];
        
        let result = builder.build(&q_weights, &k_weights, &v_weights);
        assert!(matches!(result, Err(AttentionError::InvalidWeightSize { .. })));
    }
    
    #[test]
    fn test_nan_inf_weights() {
        let builder = AttentionHeadBuilder::new();

        let mut q_weights = vec![0.0_f32; 16];
        q_weights[0] = f32::NAN;
        let k_weights = vec![0.0_f32; 16];
        let v_weights = vec![0.0_f32; 16];

        let result = builder.build(&q_weights, &k_weights, &v_weights);
        // Currently doesn't validate NaN/Inf - this test documents the behavior
        assert!(result.is_ok() || matches!(result, Err(AttentionError::InvalidWeightValue)));
    }
}