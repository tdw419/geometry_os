//! Weight Loader — Phase 6.7.1: Spatial Weight Cell Architecture
//!
//! Loads neural network weight tensors and places them in the dedicated
//! "Brain Region" of the spatial grid for use by spatial programs.
//!
//! Weight cells use TYPE_NOP (data-only cells) with weights stored in
//! data_buffer as f32 values (reinterpreted as u32).

use std::fs;
use std::path::Path;
use std::io::{self, Read};

use crate::geoasm_materializer::{CellState, TYPE_NOP, MaterializeCell};

/// Brain region configuration for weight storage
///
/// Layout: Rows 30-55, Cols 0-127 (26 rows × 128 cols = 3328 cells)
/// This region is isolated by WALL cells at row 29 and row 56
pub const BRAIN_REGION_START_X: usize = 0;
pub const BRAIN_REGION_START_Y: usize = 30;
pub const BRAIN_REGION_WIDTH: usize = 128;
pub const BRAIN_REGION_HEIGHT: usize = 26;
pub const BRAIN_REGION_CELLS: usize = BRAIN_REGION_WIDTH * BRAIN_REGION_HEIGHT; // 3328

/// Weight grid layout strategy
#[derive(Debug, Clone, Copy)]
pub enum WeightLayout {
    /// Dense row-major layout: weight[i] placed at (x = i % width, y = floor(i / width))
    DenseRowMajor,
    /// Dense column-major layout: weight[i] placed at (x = floor(i / height), y = i % height)
    DenseColumnMajor,
}

/// Weight tensor representation
#[derive(Debug, Clone)]
pub struct WeightTensor {
    /// Weight values (f32)
    pub weights: Vec<f32>,
    /// Tensor dimensions
    pub dims: Vec<usize>,
    /// Layout strategy
    pub layout: WeightLayout,
}

impl WeightTensor {
    /// Create a new weight tensor from f32 values
    pub fn new(weights: Vec<f32>, dims: Vec<usize>, layout: WeightLayout) -> Self {
        Self { weights, dims, layout }
    }

    /// Load weights from a binary file (little-endian f32 array)
    pub fn from_binary_file<P: AsRef<Path>>(path: P) -> io::Result<Self> {
        let mut file = fs::File::open(path)?;
        let metadata = file.metadata()?;
        let len = metadata.len();

        if len % 4 != 0 {
            return Err(io::Error::new(
                io::ErrorKind::InvalidData,
                format!("File size {} is not a multiple of 4 (f32 size)", len)
            ));
        }

        let num_weights = (len / 4) as usize;
        let mut bytes = vec![0u8; len as usize];
        file.read_exact(&mut bytes)?;

        // Convert bytes to f32 values
        let weights: Vec<f32> = bytes
            .chunks_exact(4)
            .map(|chunk| f32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]))
            .collect();

        Ok(Self::new(weights, vec![num_weights], WeightLayout::DenseRowMajor))
    }

    /// Create a minimal test weight tensor (e.g., for MNIST 7x28x28 layer)
    pub fn create_test_mnist() -> Self {
        // MNIST first layer: 10 classes × 28x28 pixels = 7840 weights
        // We'll create a smaller test: 7x28x28 = 548 weights
        let num_weights = 7 * 28 * 28;
        let weights: Vec<f32> = (0..num_weights)
            .map(|i| ((i as f32) / (num_weights as f32) * 2.0 - 1.0)) // -1.0 to 1.0
            .collect();

        Self::new(weights, vec![7, 28, 28], WeightLayout::DenseRowMajor)
    }

    /// Quantize weights from f32 to f16 (half precision)
    pub fn quantize_to_f16(&self) -> Vec<u16> {
        self.weights.iter().map(|&w| {
            // Simple f32 → f16 conversion
            // For production, use the half crate or similar
            let bits = w.to_bits();
            let sign = (bits >> 31) & 1;
            let exponent = ((bits >> 23) & 0xFF) as i32 - 127;
            let mantissa = bits & 0x007FFFFF;

            // Clamp exponent to f16 range (-14 to 15)
            let f16_exponent = (exponent + 14).clamp(0, 31) as u32;

            // Truncate mantissa to 10 bits
            let f16_mantissa = (mantissa >> 13) & 0x03FF;

            ((sign << 15) | (f16_exponent << 10) | f16_mantissa) as u16
        }).collect()
    }
}

/// Coordinate mapping for weight placement on grid
pub struct WeightMapper {
    pub layout: WeightLayout,
    pub start_x: usize,
    pub start_y: usize,
    pub width: usize,
    pub height: usize,
}

impl WeightMapper {
    /// Create a new weight mapper for the brain region
    pub fn new_brain_region(layout: WeightLayout) -> Self {
        Self {
            layout,
            start_x: BRAIN_REGION_START_X,
            start_y: BRAIN_REGION_START_Y,
            width: BRAIN_REGION_WIDTH,
            height: BRAIN_REGION_HEIGHT,
        }
    }

    /// Map a weight index to grid coordinates
    pub fn index_to_coords(&self, index: usize) -> Option<(usize, usize)> {
        match self.layout {
            WeightLayout::DenseRowMajor => {
                if index >= self.width * self.height {
                    return None;
                }
                let x = self.start_x + (index % self.width);
                let y = self.start_y + (index / self.width);
                Some((x, y))
            }
            WeightLayout::DenseColumnMajor => {
                if index >= self.width * self.height {
                    return None;
                }
                let x = self.start_x + (index / self.height);
                let y = self.start_y + (index % self.height);
                Some((x, y))
            }
        }
    }

    /// Check if coordinates are within the brain region
    pub fn is_in_brain_region(&self, x: usize, y: usize) -> bool {
        x >= self.start_x && x < self.start_x + self.width &&
        y >= self.start_y && y < self.start_y + self.height
    }
}

/// Weight loader: converts weight tensors to spatial cells
pub struct WeightLoader {
    mapper: WeightMapper,
}

impl WeightLoader {
    /// Create a new weight loader for the brain region
    pub fn new(layout: WeightLayout) -> Self {
        Self {
            mapper: WeightMapper::new_brain_region(layout),
        }
    }

    /// Convert a weight tensor to spatial cells
    pub fn tensor_to_cells(&self, tensor: &WeightTensor) -> Vec<MaterializeCell> {
        let mut cells = Vec::new();

        for (index, &weight) in tensor.weights.iter().enumerate() {
            let weight_bits = weight.to_bits();

            let cell = MaterializeCell {
                x: index % self.mapper.width + self.mapper.start_x,
                y: (index / self.mapper.width) + self.mapper.start_y,
                cell: CellState {
                    opcode_or_type: TYPE_NOP, // Data-only cell
                    is_active: 0,
                    data_buffer: weight_bits,
                    executing: 0,
                },
            };
            cells.push(cell);
        }

        log::info!(
            "🧠 WeightLoader: {} weights converted to {} spatial cells",
            tensor.weights.len(),
            cells.len()
        );

        cells
    }

    /// Validate that cells fit within brain region bounds
    pub fn validate_bounds(&self, cells: &[MaterializeCell]) -> Result<(), String> {
        for cell in cells {
            if !self.mapper.is_in_brain_region(cell.x, cell.y) {
                return Err(format!(
                    "Cell ({}, {}) is outside brain region bounds",
                    cell.x, cell.y
                ));
            }
        }
        Ok(())
    }
}

/// Wall builder: creates WALL cells to isolate the brain region
pub struct WallBuilder;

impl WallBuilder {
    /// Create WALL cells to isolate the brain region (top and bottom walls)
    pub fn create_brain_walls() -> Vec<MaterializeCell> {
        let mut walls = Vec::new();

        // Top wall (row 29)
        for x in BRAIN_REGION_START_X..(BRAIN_REGION_START_X + BRAIN_REGION_WIDTH) {
            walls.push(MaterializeCell {
                x,
                y: BRAIN_REGION_START_Y - 1,
                cell: CellState::wall(),
            });
        }

        // Bottom wall (row 56)
        for x in BRAIN_REGION_START_X..(BRAIN_REGION_START_X + BRAIN_REGION_WIDTH) {
            walls.push(MaterializeCell {
                x,
                y: BRAIN_REGION_START_Y + BRAIN_REGION_HEIGHT,
                cell: CellState::wall(),
            });
        }

        log::info!(
            "🧱 WallBuilder: Created {} WALL cells for brain region isolation",
            walls.len()
        );

        walls
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_weight_tensor_creation() {
        let tensor = WeightTensor::create_test_mnist();
        assert_eq!(tensor.weights.len(), 7 * 28 * 28); // 548 weights
        assert_eq!(tensor.dims, vec![7, 28, 28]);
        assert!((tensor.weights[0] - (-1.0)).abs() < 1e-6);
        // Verify last weight is close to 1.0
        assert!((tensor.weights[tensor.weights.len() - 1] - 0.996).abs() < 0.01);
    }

    #[test]
    fn test_coordinate_mapping_row_major() {
        let mapper = WeightMapper::new_brain_region(WeightLayout::DenseRowMajor);

        // Index 0 should map to start_x, start_y
        assert_eq!(mapper.index_to_coords(0), Some((BRAIN_REGION_START_X, BRAIN_REGION_START_Y)));

        // Index 1 should map to start_x + 1, start_y
        assert_eq!(mapper.index_to_coords(1), Some((BRAIN_REGION_START_X + 1, BRAIN_REGION_START_Y)));

        // Index 128 should wrap to next row
        assert_eq!(mapper.index_to_coords(128), Some((BRAIN_REGION_START_X, BRAIN_REGION_START_Y + 1)));
    }

    #[test]
    fn test_coordinate_mapping_column_major() {
        let mapper = WeightMapper::new_brain_region(WeightLayout::DenseColumnMajor);

        // Index 0 should map to start_x, start_y
        assert_eq!(mapper.index_to_coords(0), Some((BRAIN_REGION_START_X, BRAIN_REGION_START_Y)));

        // Index 1 should map to start_x, start_y + 1
        assert_eq!(mapper.index_to_coords(1), Some((BRAIN_REGION_START_X, BRAIN_REGION_START_Y + 1)));

        // Index 26 should move to next column
        assert_eq!(mapper.index_to_coords(26), Some((BRAIN_REGION_START_X + 1, BRAIN_REGION_START_Y)));
    }

    #[test]
    fn test_weight_loader_conversion() {
        let loader = WeightLoader::new(WeightLayout::DenseRowMajor);
        // Create a small tensor (10 weights) that fits in brain region
        let tensor = WeightTensor::new(
            vec![0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0],
            vec![10],
            WeightLayout::DenseRowMajor
        );

        let cells = loader.tensor_to_cells(&tensor);
        assert_eq!(cells.len(), tensor.weights.len());

        // Verify first cell
        assert_eq!(cells[0].x, BRAIN_REGION_START_X);
        assert_eq!(cells[0].y, BRAIN_REGION_START_Y);
        assert_eq!(cells[0].cell.opcode(), TYPE_NOP);
        assert!((f32::from_bits(cells[0].cell.data_buffer) - tensor.weights[0]).abs() < f32::EPSILON);

        // Verify bounds
        assert!(loader.validate_bounds(&cells).is_ok());
    }

    #[test]
    fn test_wall_builder() {
        let walls = WallBuilder::create_brain_walls();

        // Should have 2 rows of walls
        assert_eq!(walls.len(), BRAIN_REGION_WIDTH * 2); // 128 * 2 = 256 walls

        // Check top wall position
        assert_eq!(walls[0].y, BRAIN_REGION_START_Y - 1);
        assert_eq!(walls[0].cell.opcode(), 1); // TYPE_WALL
    }

    #[test]
    fn test_brain_region_bounds_validation() {
        let loader = WeightLoader::new(WeightLayout::DenseRowMajor);
        // Create a small tensor that fits in brain region (100 weights)
        let tensor = WeightTensor::new(
            vec![0.1; 100],
            vec![100],
            WeightLayout::DenseRowMajor
        );
        let cells = loader.tensor_to_cells(&tensor);

        // All cells should be within bounds
        assert!(loader.validate_bounds(&cells).is_ok());

        // Add a cell outside bounds
        let mut invalid_cells = cells.clone();
        invalid_cells.push(MaterializeCell {
            x: 200,
            y: 10,
            cell: CellState::data(0),
        });

        // Should fail validation
        assert!(loader.validate_bounds(&invalid_cells).is_err());
    }

    #[test]
    fn test_f16_quantization() {
        let tensor = WeightTensor::new(
            vec![1.0, 0.0, -1.0, 0.5, -0.5],
            vec![5],
            WeightLayout::DenseRowMajor
        );

        let f16_weights = tensor.quantize_to_f16();
        assert_eq!(f16_weights.len(), 5);

        // 1.0 should be positive
        assert!(f16_weights[0] & 0x8000 == 0);

        // -1.0 should be negative
        assert!(f16_weights[2] & 0x8000 != 0);
    }
}