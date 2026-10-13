//! TENSOR_GATE WGSL Primitive - Phase 6.7.3
//!
//! GPU-native tensor operations for spatial neural network inference.
//! TENSOR_GATE cells trigger highly parallel matrix multiplications directly
//! on adjacent blocks of weight cells.
//!
//! # Architecture
//!
//! - **TENSOR_GATE Cell**: TYPE_TENSOR_GATE opcode (value: 17)
//! - **Brain Region**: Dedicated area of spatial grid for weight storage
//! - **Batch Processing**: One TENSOR_GATE cell triggers full layer forward pass
//! - **Bypass Path Checks**: TENSOR_GATE reads weight cells without spatial routing validation
//!
//! # Example Usage
//!
//! ```rust
//! use geometry_os::spatial::tensor_gate::{TensorGate, TensorGateConfig};
//!
//! // Create a tensor gate for 4x4 matrix multiplication
//! let config = TensorGateConfig {
//!     weight_start: (0, 0),   // Start of weight matrix in Brain Region
//!     input_start: (16, 0),  // Start of input matrix
//!     output_start: (32, 0), // Start of output matrix
//!     matrix_size: 4,        // 4x4 matrices
//! };
//!
//! let cells = TensorGate::materialize(&config)?;
//! ```

use crate::geoasm_materializer::{CellState, TYPE_NOP};
use thiserror::Error;

/// Tensor gate configuration parameters
#[derive(Debug, Clone)]
pub struct TensorGateConfig {
    /// Starting coordinates of weight matrix in Brain Region (x, y)
    pub weight_start: (usize, usize),
    
    /// Starting coordinates of input matrix (x, y)
    pub input_start: (usize, usize),
    
    /// Starting coordinates of output matrix (x, y)
    pub output_start: (usize, usize),
    
    /// Matrix size (square matrices only, e.g., 4 for 4x4)
    pub matrix_size: usize,
}

impl TensorGateConfig {
    /// Validate configuration constraints
    pub fn validate(&self, grid_width: usize, grid_height: usize) -> Result<(), TensorGateError> {
        // Validate matrix size (power of 2, <= 64)
        if !self.matrix_size.is_power_of_two() || self.matrix_size > 64 {
            return Err(TensorGateError::InvalidMatrixSize {
                size: self.matrix_size,
                reason: "must be power of 2 and <= 64".into(),
            });
        }
        
        // Validate coordinates are within grid bounds
        let (wx, wy) = self.weight_start;
        let (ix, iy) = self.input_start;
        let (ox, oy) = self.output_start;
        
        if wx + self.matrix_size > grid_width || wy + self.matrix_size > grid_height {
            return Err(TensorGateError::OutOfBounds {
                region: "weight".into(),
                coord: (wx + self.matrix_size, wy + self.matrix_size),
                max: (grid_width, grid_height),
            });
        }
        
        if ix + self.matrix_size > grid_width || iy + self.matrix_size > grid_height {
            return Err(TensorGateError::OutOfBounds {
                region: "input".into(),
                coord: (ix + self.matrix_size, iy + self.matrix_size),
                max: (grid_width, grid_height),
            });
        }
        
        if ox + self.matrix_size > grid_width || oy + self.matrix_size > grid_height {
            return Err(TensorGateError::OutOfBounds {
                region: "output".into(),
                coord: (ox + self.matrix_size, oy + self.matrix_size),
                max: (grid_width, grid_height),
            });
        }
        
        Ok(())
    }
    
    /// Get total number of cells for matrix multiplication
    pub fn total_ops(&self) -> usize {
        // Matrix multiply: O(n^3) operations for n×n matrices
        self.matrix_size.pow(3)
    }
}

/// TENSOR_GATE materializer
pub struct TensorGate {
    grid_width: usize,
    grid_height: usize,
}

impl TensorGate {
    /// Create a new tensor gate materializer
    pub fn new(grid_width: usize, grid_height: usize) -> Self {
        Self {
            grid_width,
            grid_height,
        }
    }
    
    /// Materialize tensor gate cells into spatial grid
    ///
    /// Creates:
    /// - One TENSOR_GATE cell at specified location
    /// - Descriptor block of 3 adjacent cells storing full pointer values
    ///   (weight_ptr, input_ptr, output_ptr in that order, left-to-right)
    ///
    /// # Arguments
    ///
    /// * `gate_coord` - Where to place the TENSOR_GATE cell (x, y)
    /// * `config` - Tensor gate configuration
    ///
    /// # Returns
    ///
    /// Vector containing the TENSOR_GATE cell and descriptor block cells
    ///
    /// # Descriptor Block Layout
    ///
    /// ```
    /// [TENSOR_GATE] [DESC_W] [DESC_I] [DESC_O]
    ///     |            |        |        |
    ///   gate_idx  weight_ptr in_ptr out_ptr
    /// ```
    ///
    /// The descriptor block cells store pointer values in their data_buffer.
    /// The TENSOR_GATE cell stores: [matrix_size:8][reserved:24]
    pub fn materialize(
        &self,
        gate_coord: (usize, usize),
        config: &TensorGateConfig,
    ) -> Result<Vec<CellState>, TensorGateError> {
        // Validate configuration
        config.validate(self.grid_width, self.grid_height)?;
        
        // Validate gate coordinate
        let (gx, gy) = gate_coord;
        if gx >= self.grid_width || gy >= self.grid_height {
            return Err(TensorGateError::OutOfBounds {
                region: "gate".into(),
                coord: (gx, gy),
                max: (self.grid_width, self.grid_height),
            });
        }
        
        // Calculate descriptor block location (3 cells to the right of gate)
        let desc_x = gx + 1;
        if desc_x + 3 > self.grid_width {
            return Err(TensorGateError::OutOfBounds {
                region: "descriptor_block".into(),
                coord: (desc_x + 3, gy),
                max: (self.grid_width, self.grid_height),
            });
        }
        
        // Create tensor gate cell
        let gate_idx = gy * self.grid_width + gx;
        let desc_w_idx = gy * self.grid_width + desc_x;
        let desc_i_idx = gy * self.grid_width + (desc_x + 1);
        let desc_o_idx = gy * self.grid_width + (desc_x + 2);
        
        // Calculate full pointers (not truncated)
        let weight_ptr = (config.weight_start.1 * self.grid_width + config.weight_start.0) as u32;
        let input_ptr = (config.input_start.1 * self.grid_width + config.input_start.0) as u32;
        let output_ptr = (config.output_start.1 * self.grid_width + config.output_start.0) as u32;
        
        let mut cells = vec![CellState::data(0); self.grid_width * self.grid_height];
        
        // TENSOR_GATE cell stores only matrix size in lower 8 bits
        cells[gate_idx] = CellState {
            opcode_or_type: crate::geoasm_materializer::TYPE_TENSOR_GATE,
            is_active: 1, // Active token
            data_buffer: (config.matrix_size as u32) & 0xFF,
            executing: 0,
        };
        
        // Descriptor block cells store full pointer values
        cells[desc_w_idx] = CellState {
            opcode_or_type: crate::geoasm_materializer::TYPE_NOP, // Data cell
            is_active: 0,
            data_buffer: weight_ptr,
            executing: 0,
        };
        
        cells[desc_i_idx] = CellState {
            opcode_or_type: crate::geoasm_materializer::TYPE_NOP,
            is_active: 0,
            data_buffer: input_ptr,
            executing: 0,
        };
        
        cells[desc_o_idx] = CellState {
            opcode_or_type: crate::geoasm_materializer::TYPE_NOP,
            is_active: 0,
            data_buffer: output_ptr,
            executing: 0,
        };
        
        Ok(cells)
    }
    
    /// Extract configuration from a TENSOR_GATE cell and descriptor block
    ///
    /// # Arguments
    ///
    /// * `gate_cell` - The TENSOR_GATE cell (stores matrix_size)
    /// * `desc_w_cell` - Descriptor cell storing weight pointer
    /// * `desc_i_cell` - Descriptor cell storing input pointer
    /// * `desc_o_cell` - Descriptor cell storing output pointer
    ///
    /// # Returns
    ///
    /// Reconstructed TensorGateConfig with full pointer values
    pub fn extract_config(
        &self,
        gate_cell: &CellState,
        desc_w_cell: &CellState,
        desc_i_cell: &CellState,
        desc_o_cell: &CellState,
    ) -> Result<TensorGateConfig, TensorGateError> {
        if gate_cell.opcode() != crate::geoasm_materializer::TYPE_TENSOR_GATE {
            return Err(TensorGateError::NotATensorGate);
        }
        
        // Extract matrix size from gate cell (lower 8 bits)
        let matrix_size = (gate_cell.data_buffer & 0xFF) as usize;
        
        // Extract full pointers from descriptor cells
        let weight_ptr = desc_w_cell.data_buffer as usize;
        let input_ptr = desc_i_cell.data_buffer as usize;
        let output_ptr = desc_o_cell.data_buffer as usize;
        
        // Convert flat indices back to coordinates
        let weight_start = (weight_ptr % self.grid_width, weight_ptr / self.grid_width);
        let input_start = (input_ptr % self.grid_width, input_ptr / self.grid_width);
        let output_start = (output_ptr % self.grid_width, output_ptr / self.grid_width);
        
        Ok(TensorGateConfig {
            weight_start,
            input_start,
            output_start,
            matrix_size,
        })
    }
}

/// Tensor gate errors
#[derive(Debug, Error)]
pub enum TensorGateError {
    #[error("Invalid matrix size {size}: {reason}")]
    InvalidMatrixSize { size: usize, reason: String },
    
    #[error("Out of bounds in {region} region: {coord:?} > max {max:?}")]
    OutOfBounds { 
        region: String, 
        coord: (usize, usize), 
        max: (usize, usize),
    },
    
    #[error("Cell is not a TENSOR_GATE")]
    NotATensorGate,
    
    #[error("Matrix multiplication failed: {reason}")]
    MatMulFailed { reason: String },
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_tensor_gate_config_validation() {
        let config = TensorGateConfig {
            weight_start: (0, 0),
            input_start: (16, 0),
            output_start: (32, 0),
            matrix_size: 4,
        };
        
        // Valid configuration
        assert!(config.validate(128, 64).is_ok());
        
        // Invalid matrix size (not power of 2)
        let invalid_size = TensorGateConfig {
            matrix_size: 5,
            ..config.clone()
        };
        assert!(matches!(
            invalid_size.validate(128, 64),
            Err(TensorGateError::InvalidMatrixSize { .. })
        ));
        
        // Matrix size too large
        let too_large = TensorGateConfig {
            matrix_size: 128,
            ..config.clone()
        };
        assert!(matches!(
            too_large.validate(128, 64),
            Err(TensorGateError::InvalidMatrixSize { .. })
        ));
        
        // Out of bounds
        let oob = TensorGateConfig {
            // weight_start: (120, 0), // 120 + 4 = 124 > 128 (ok)
            // Actually 120 + 4 = 124 < 128, so this is valid
            // Let's try 125
            weight_start: (125, 0),
            matrix_size: 4,
            ..config.clone()
        };
        assert!(matches!(
            oob.validate(128, 64),
            Err(TensorGateError::OutOfBounds { .. })
        ));
    }
    
    #[test]
    fn test_tensor_gate_materialization() {
        let tensor_gate = TensorGate::new(128, 64);
        
        let config = TensorGateConfig {
            weight_start: (0, 0),
            input_start: (16, 0),
            output_start: (32, 0),
            matrix_size: 4,
        };
        
        let cells = tensor_gate.materialize((64, 32), &config);
        assert!(cells.is_ok());
        
        let cells = cells.unwrap();
        let gate_idx = 32 * 128 + 64;
        
        assert_eq!(cells[gate_idx].opcode(), crate::geoasm_materializer::TYPE_TENSOR_GATE);
        assert_eq!(cells[gate_idx].is_active, 1);
    }
    
    #[test]
    fn test_tensor_gate_config_roundtrip() {
        let tensor_gate = TensorGate::new(128, 64);
        
        let original_config = TensorGateConfig {
            weight_start: (10, 5),
            input_start: (20, 5),
            output_start: (30, 5),
            matrix_size: 8,
        };
        
        let cells = tensor_gate.materialize((50, 30), &original_config).unwrap();
        let gate_idx = 30 * 128 + 50;
        let desc_w_idx = 30 * 128 + 51;
        let desc_i_idx = 30 * 128 + 52;
        let desc_o_idx = 30 * 128 + 53;
        
        let gate_cell = &cells[gate_idx];
        let desc_w_cell = &cells[desc_w_idx];
        let desc_i_cell = &cells[desc_i_idx];
        let desc_o_cell = &cells[desc_o_idx];
        
        let extracted_config = tensor_gate.extract_config(
            gate_cell,
            desc_w_cell,
            desc_i_cell,
            desc_o_cell
        );
        assert!(extracted_config.is_ok());
        
        let extracted = extracted_config.unwrap();
        
        // Full pointer roundtrip should now be perfect
        assert_eq!(extracted.matrix_size, original_config.matrix_size);
        assert_eq!(extracted.weight_start, original_config.weight_start);
        assert_eq!(extracted.input_start, original_config.input_start);
        assert_eq!(extracted.output_start, original_config.output_start);
    }
    
    #[test]
    fn test_tensor_gate_total_ops() {
        let config_4x4 = TensorGateConfig {
            weight_start: (0, 0),
            input_start: (16, 0),
            output_start: (32, 0),
            matrix_size: 4,
        };
        
        // 4x4 matrix multiply: 4^3 = 64 operations
        assert_eq!(config_4x4.total_ops(), 64);
        
        let config_8x8 = TensorGateConfig {
            matrix_size: 8,
            ..config_4x4
        };
        
        // 8x8 matrix multiply: 8^3 = 512 operations
        assert_eq!(config_8x8.total_ops(), 512);
    }
    
    #[test]
    fn test_extract_config_from_non_tensor_gate() {
        let tensor_gate = TensorGate::new(128, 64);
        let gate_cell = CellState::new(crate::geoasm_materializer::TYPE_LDI, 0, 0);
        let desc_cell = CellState::data(0);
        
        let result = tensor_gate.extract_config(&gate_cell, &desc_cell, &desc_cell, &desc_cell);
        assert!(matches!(result, Err(TensorGateError::NotATensorGate)));
    }
    
    #[test]
    fn test_gate_coordinate_out_of_bounds() {
        let tensor_gate = TensorGate::new(128, 64);
        
        let config = TensorGateConfig {
            weight_start: (0, 0),
            input_start: (16, 0),
            output_start: (32, 0),
            matrix_size: 4,
        };
        
        // Gate coordinate out of bounds
        let result = tensor_gate.materialize((200, 100), &config);
        assert!(matches!(
            result,
            Err(TensorGateError::OutOfBounds { region, .. }) if region == "gate"
        ));
    }
}