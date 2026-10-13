//! Weight Loading Pipeline for Spatial Neural Networks
//!
//! Loads neural network weights from binary formats into spatial grid cells.
//! Weights are stored as f32 values in the data_buffer field of TYPE_NOP cells.
//!
//! # Architecture
//!
//! - **Weight Cells**: TYPE_NOP cells where data_buffer holds f32 weight values (reinterpreted as u32)
//! - **Weight Grid**: Contiguous block of cells representing a weight matrix (row-major order)
//! - **Brain Region**: Dedicated area of the spatial grid for weight storage
//!
//! # Example: Loading a Linear Layer
//!
//! ```rust
//! use geometry_os::spatial::weight_loader::{WeightLoader, WeightLayout};
//!
//! // Define weight layout: 64 input neurons → 128 output neurons
//! let layout = WeightLayout::dense(64, 128, 0, 0); // Place at (0, 0) on grid
//!
//! // Create weight matrix (64 × 128 = 8192 weights)
//! let weights: Vec<f32> = (0..8192).map(|i| i as f32).collect();
//!
//! // Load weights into spatial cells
//! let cells = WeightLoader::load_dense_layer(&weights, &layout)?;
//! ```
//!
//! # Security Considerations
//!
//! - Weights cannot execute instructions (TYPE_NOP is inert)
//! - Weight regions can be protected with WALL/MEMBRANE cells
//! - Materialization system validates bounds and permissions

use crate::geoasm_materializer::{CellState, TYPE_NOP};
use std::mem;

/// Maximum weight cells per layer (conservative: 128×128 matrix)
const MAX_WEIGHTS_PER_LAYER: usize = 16384;

/// Weight layout specification for a neural network layer
#[derive(Debug, Clone)]
pub enum WeightLayout {
    /// Dense layer: weight matrix of size (input_size × output_size)
    Dense {
        input_size: usize,
        output_size: usize,
        x: usize,
        y: usize,
    },
    /// Sparse layer: sparse weight matrix with indices
    Sparse {
        num_weights: usize,
        indices: Vec<(usize, usize)>, // (row, col) pairs
        x: usize,
        y: usize,
    },
}

impl WeightLayout {
    /// Create a dense layer layout at specified grid position
    pub fn dense(input_size: usize, output_size: usize, x: usize, y: usize) -> Self {
        Self::Dense {
            input_size,
            output_size,
            x,
            y,
        }
    }

    /// Get total number of weight cells needed
    pub fn num_weights(&self) -> usize {
        match self {
            Self::Dense {
                input_size,
                output_size,
                ..
            } => input_size * output_size,
            Self::Sparse {
                num_weights, ..
            } => *num_weights,
        }
    }

    /// Get grid coordinates for a weight at index `i`
    pub fn coord_for_index(&self, i: usize) -> Option<(usize, usize)> {
        match self {
            Self::Dense {
                input_size,
                x,
                y,
                ..
            } => {
                if i >= input_size * self.num_weights() / *input_size {
                    return None;
                }
                // Row-major: (i / output_size, i % output_size)
                let row = i / *input_size;
                let col = i % *input_size;
                Some((x + col, y + row))
            }
            Self::Sparse { indices, x, y, .. } => {
                if i >= indices.len() {
                    return None;
                }
                let (row, col) = indices[i];
                Some((x + col, y + row))
            }
        }
    }

    /// Validate layout constraints
    pub fn validate(&self, grid_width: usize, grid_height: usize) -> Result<(), WeightError> {
        match self {
            Self::Dense {
                input_size,
                output_size,
                x,
                y,
            } => {
                let num_weights = input_size * output_size;
                if num_weights > MAX_WEIGHTS_PER_LAYER {
                    return Err(WeightError::LayerTooLarge {
                        actual: num_weights,
                        max: MAX_WEIGHTS_PER_LAYER,
                    });
                }
                if x + input_size > grid_width {
                    return Err(WeightError::OutOfBounds {
                        coord: format!("x + input_size = {}", x + input_size),
                        max: grid_width,
                    });
                }
                if y + output_size > grid_height {
                    return Err(WeightError::OutOfBounds {
                        coord: format!("y + output_size = {}", y + output_size),
                        max: grid_height,
                    });
                }
            }
            Self::Sparse {
                num_weights,
                indices,
                x,
                y,
            } => {
                if *num_weights > MAX_WEIGHTS_PER_LAYER {
                    return Err(WeightError::LayerTooLarge {
                        actual: *num_weights,
                        max: MAX_WEIGHTS_PER_LAYER,
                    });
                }
                // Check all sparse indices are within bounds
                for (row, col) in indices {
                    if x + col >= grid_width || y + row >= grid_height {
                        return Err(WeightError::SparseIndexOutOfBounds {
                            idx: (*row, *col),
                            bounds: (grid_width, grid_height),
                        });
                    }
                }
            }
        }
        Ok(())
    }
}

/// Error types for weight loading operations
#[derive(Debug, thiserror::Error)]
pub enum WeightError {
    #[error("Weight count mismatch: expected {expected}, got {actual}")]
    CountMismatch { expected: usize, actual: usize },

    #[error("Layer too large: {actual} weights > max {max}")]
    LayerTooLarge { actual: usize, max: usize },

    #[error("Out of bounds: {coord} > max {max}")]
    OutOfBounds { coord: String, max: usize },

    #[error("Sparse index {idx:?} out of bounds {bounds:?}")]
    SparseIndexOutOfBounds {
        idx: (usize, usize),
        bounds: (usize, usize),
    },

    #[error("Invalid weight value: NaN or Inf")]
    InvalidWeightValue,
}

/// Loader for converting weight tensors into spatial grid cells
pub struct WeightLoader {
    grid_width: usize,
    grid_height: usize,
}

impl WeightLoader {
    /// Create a new weight loader for a given grid size
    pub fn new(grid_width: usize, grid_height: usize) -> Self {
        Self {
            grid_width,
            grid_height,
        }
    }

    /// Load a dense layer's weights into spatial cells
    ///
    /// # Arguments
    ///
    /// * `weights` - Flattened weight matrix (row-major order, input_size × output_size)
    /// * `layout` - Weight layout specification
    ///
    /// # Returns
    ///
    /// Vector of CellState with weights packed into data_buffer
    pub fn load_dense_layer(
        &self,
        weights: &[f32],
        layout: &WeightLayout,
    ) -> Result<Vec<CellState>, WeightError> {
        // Validate layout
        layout.validate(self.grid_width, self.grid_height)?;

        // Check weight count
        let expected = layout.num_weights();
        if weights.len() != expected {
            return Err(WeightError::CountMismatch {
                expected,
                actual: weights.len(),
            });
        }

        // Validate weight values (no NaN/Inf)
        if weights.iter().any(|w| !w.is_finite()) {
            return Err(WeightError::InvalidWeightValue);
        }

        // Convert weights to cells
        let mut cells = Vec::with_capacity(expected);
        for (i, &weight) in weights.iter().enumerate() {
            if let Some((x, y)) = layout.coord_for_index(i) {
                let weight_u32 = f32::to_bits(weight);
                cells.push(CellState {
                    opcode_or_type: TYPE_NOP, // TYPE_NOP = inert weight cell
                    is_active: 0,
                    data_buffer: weight_u32,
                    executing: 0,
                });
            }
        }

        Ok(cells)
    }

    /// Extract weight values from spatial cells (for debugging/inspection)
    pub fn extract_weights(&self, cells: &[CellState], layout: &WeightLayout) -> Vec<f32> {
        let mut weights = Vec::with_capacity(layout.num_weights());
        for i in 0..layout.num_weights() {
            if let Some((x, y)) = layout.coord_for_index(i) {
                let idx = y * self.grid_width + x;
                if idx < cells.len() {
                    let weight_u32 = cells[idx].data_buffer;
                    weights.push(f32::from_bits(weight_u32));
                }
            }
        }
        weights
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dense_layout_validation() {
        let layout = WeightLayout::dense(64, 128, 0, 0);
        assert!(layout.validate(128, 64).is_ok());

        // Out of bounds
        assert!(layout.validate(60, 64).is_err());
    }

    #[test]
    fn test_weight_loading_3x3_matrix() {
        let loader = WeightLoader::new(128, 64);
        let weights = vec![1.0_f32; 9]; // 3x3 matrix

        let layout = WeightLayout::dense(3, 3, 10, 10);
        let cells = loader.load_dense_layer(&weights, &layout).unwrap();

        assert_eq!(cells.len(), 9);

        // Verify weights packed correctly
        let extracted = loader.extract_weights(&cells, &layout);
        assert_eq!(extracted.len(), 9);
        assert!(extracted.iter().all(|&w| (w - 1.0).abs() < 1e-6));
    }

    #[test]
    fn test_invalid_weight_count() {
        let loader = WeightLoader::new(128, 64);
        let weights = vec![1.0_f32; 5]; // Wrong count for 3x3 matrix

        let layout = WeightLayout::dense(3, 3, 10, 10);
        let result = loader.load_dense_layer(&weights, &layout);

        assert!(matches!(result, Err(WeightError::CountMismatch { .. })));
    }

    #[test]
    fn test_invalid_weight_values() {
        let loader = WeightLoader::new(128, 64);
        let weights = vec![1.0, f32::NAN, 2.0]; // Contains NaN

        let layout = WeightLayout::dense(3, 1, 10, 10);
        let result = loader.load_dense_layer(&weights, &layout);

        assert!(matches!(result, Err(WeightError::InvalidWeightValue)));
    }

    #[test]
    fn test_layer_too_large() {
        let layout = WeightLayout::dense(200, 200, 0, 0); // 40K weights > 16K max

        assert!(matches!(
            layout.validate(128, 64),
            Err(WeightError::LayerTooLarge { .. })
        ));
    }

    #[test]
    fn test_mnist_style_weights() {
        // MNIST-style weight matrix: 7x28x28 = 548 weights
        let loader = WeightLoader::new(128, 64);
        let weights: Vec<f32> = (0..548).map(|i| i as f32 / 100.0).collect();

        let layout = WeightLayout::dense(28, 28, 0, 0);
        let cells = loader.load_dense_layer(&weights, &layout).unwrap();

        assert_eq!(cells.len(), 784); // 28x28 = 784

        let extracted = loader.extract_weights(&cells, &layout);
        assert_eq!(extracted.len(), 784);
        assert!((extracted[0] - 0.0).abs() < 1e-6);
        assert!((extracted[783] - 5.47).abs() < 0.01);
    }
}