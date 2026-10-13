//! Spatial Attention Mechanisms (Phase 14.2)
//!
//! Implements Transformer Attention natively on the Spatial Grid.
//! Uses the weights mapped by `llm_weight_mapper` to perform Q, K, V
//! projections, Softmax, and final attention summation.

use crate::geoasm_materializer::CellState;
use crate::spatial::llm_weight_mapper::{TensorShape, WeightPattern};

/// Spatial Attention Processor for Transformer blocks
pub struct SpatialAttention {
    dim: usize,
    num_heads: usize,
    seq_len: usize,
}

impl SpatialAttention {
    /// Create a new spatial attention processor
    /// `dim`: Total hidden dimension (e.g., 64)
    /// `num_heads`: Number of attention heads (e.g., 1 for prototype)
    /// `seq_len`: Sequence length (e.g., 16 tokens)
    pub fn new(dim: usize, num_heads: usize, seq_len: usize) -> Self {
        Self {
            dim,
            num_heads,
            seq_len,
        }
    }

    /// Execute scaled dot-product attention on the spatial grid (CPU fallback benchmark)
    /// 
    /// Reads inputs from `token_region`, weights from `patterns`, and writes
    /// the attention output to `output_origin`.
    pub fn forward_cpu(
        &self,
        grid: &mut [CellState],
        grid_w: usize,
        token_origin: (usize, usize),
        q_proj: &WeightPattern,
        k_proj: &WeightPattern,
        v_proj: &WeightPattern,
        out_proj: &WeightPattern,
        output_origin: (usize, usize),
    ) -> Result<(), String> {
        let head_dim = self.dim / self.num_heads;
        let scale = 1.0 / (head_dim as f32).sqrt();

        // 1. Read input sequence tokens from spatial grid
        let tokens = self.read_matrix(grid, grid_w, token_origin, self.seq_len, self.dim)?;

        // 2. Project Q, K, V
        let q_weights = self.read_pattern_weights(grid, grid_w, q_proj)?;
        let k_weights = self.read_pattern_weights(grid, grid_w, k_proj)?;
        let v_weights = self.read_pattern_weights(grid, grid_w, v_proj)?;

        let q = self.matmul(&tokens, &q_weights, self.seq_len, self.dim, self.dim);
        let k = self.matmul(&tokens, &k_weights, self.seq_len, self.dim, self.dim);
        let v = self.matmul(&tokens, &v_weights, self.seq_len, self.dim, self.dim);

        // 3. Compute Attention Scores: Q * K^T * scale
        let mut scores = vec![0.0; self.seq_len * self.seq_len];
        for i in 0..self.seq_len {
            for j in 0..self.seq_len {
                let mut sum = 0.0;
                for d in 0..head_dim {
                    sum += q[i * self.dim + d] * k[j * self.dim + d];
                }
                scores[i * self.seq_len + j] = sum * scale;
            }
        }

        // 4. Softmax
        for i in 0..self.seq_len {
            let row_start = i * self.seq_len;
            let row_end = row_start + self.seq_len;
            let row = &mut scores[row_start..row_end];
            
            let max_val = row.iter().cloned().fold(f32::NEG_INFINITY, f32::max);
            let mut sum_exp = 0.0;
            for val in row.iter_mut() {
                *val = (*val - max_val).exp();
                sum_exp += *val;
            }
            for val in row.iter_mut() {
                *val /= sum_exp;
            }
        }

        // 5. Compute Context: Scores * V
        let context = self.matmul(&scores, &v, self.seq_len, self.seq_len, self.dim);

        // 6. Output Projection
        let out_weights = self.read_pattern_weights(grid, grid_w, out_proj)?;
        let final_out = self.matmul(&context, &out_weights, self.seq_len, self.dim, self.dim);

        // 7. Write results back to grid
        self.write_matrix(grid, grid_w, output_origin, &final_out, self.seq_len, self.dim)?;

        Ok(())
    }

    // Helper: Read a matrix from spatial grid
    fn read_matrix(
        &self,
        grid: &[CellState],
        grid_w: usize,
        origin: (usize, usize),
        rows: usize,
        cols: usize,
    ) -> Result<Vec<f32>, String> {
        let mut mat = vec![0.0; rows * cols];
        for i in 0..rows {
            for j in 0..cols {
                let x = origin.0 + j;
                let y = origin.1 + i;
                let offset = y * grid_w + x;
                if offset >= grid.len() {
                    return Err("Grid bounds exceeded".to_string());
                }
                mat[i * cols + j] = f32::from_bits(grid[offset].data_buffer);
            }
        }
        Ok(mat)
    }

    // Helper: Read weight pattern from spatial grid
    fn read_pattern_weights(
        &self,
        grid: &[CellState],
        grid_w: usize,
        pattern: &WeightPattern,
    ) -> Result<Vec<f32>, String> {
        match &pattern.shape {
            TensorShape::Matrix { rows, cols } => {
                self.read_matrix(grid, grid_w, pattern.origin, *rows, *cols)
            }
            _ => Err("Only Matrix shapes supported for linear projections".to_string()),
        }
    }

    // Helper: Write matrix back to grid
    fn write_matrix(
        &self,
        grid: &mut [CellState],
        grid_w: usize,
        origin: (usize, usize),
        mat: &[f32],
        rows: usize,
        cols: usize,
    ) -> Result<(), String> {
        for i in 0..rows {
            for j in 0..cols {
                let x = origin.0 + j;
                let y = origin.1 + i;
                let offset = y * grid_w + x;
                if offset >= grid.len() {
                    return Err("Grid bounds exceeded".to_string());
                }
                grid[offset].data_buffer = mat[i * cols + j].to_bits();
                grid[offset].is_active = 1;
            }
        }
        Ok(())
    }

    // Standard matrix multiplication: [M x K] * [K x N] = [M x N]
    fn matmul(&self, a: &[f32], b: &[f32], m: usize, k: usize, n: usize) -> Vec<f32> {
        let mut out = vec![0.0; m * n];
        for i in 0..m {
            for j in 0..n {
                let mut sum = 0.0;
                for l in 0..k {
                    sum += a[i * k + l] * b[l * n + j]; // Assuming b is row-major
                }
                out[i * n + j] = sum;
            }
        }
        out
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::spatial::llm_weight_mapper::{WeightMapper, WeightMapperConfig};

    #[test]
    fn test_spatial_attention_forward() {
        let mut grid = vec![CellState::new(0, 0, 0); 256 * 256];
        let grid_w = 256;
        let mut mapper = WeightMapper::with_config(WeightMapperConfig::default());
        
        let seq_len = 16;
        let dim = 64;

        // Create dummy weights
        let weights = vec![0.1; dim * dim];
        let shape = TensorShape::Matrix { rows: dim, cols: dim };

        let q_proj = mapper.map_weights(&mut grid, grid_w, &weights, shape.clone(), "q_proj").unwrap();
        let k_proj = mapper.map_weights(&mut grid, grid_w, &weights, shape.clone(), "k_proj").unwrap();
        let v_proj = mapper.map_weights(&mut grid, grid_w, &weights, shape.clone(), "v_proj").unwrap();
        let out_proj = mapper.map_weights(&mut grid, grid_w, &weights, shape, "out_proj").unwrap();

        // Write dummy tokens
        let token_origin = (0, 0);
        let mut attn = SpatialAttention::new(dim, 1, seq_len);
        
        // Write tokens to grid manually
        for i in 0..seq_len {
            for j in 0..dim {
                grid[(token_origin.1 + i) * grid_w + token_origin.0 + j].data_buffer = 1.0f32.to_bits();
            }
        }

        let output_origin = (100, 0);
        let result = attn.forward_cpu(
            &mut grid,
            grid_w,
            token_origin,
            &q_proj,
            &k_proj,
            &v_proj,
            &out_proj,
            output_origin
        );

        assert!(result.is_ok());

        // Verify output exists
        let val = f32::from_bits(grid[output_origin.1 * grid_w + output_origin.0].data_buffer);
        assert!(val != 0.0);
    }
}
