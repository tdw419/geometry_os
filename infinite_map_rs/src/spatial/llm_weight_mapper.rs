//! LLM Weight Mapper - Spatial Grid Storage for Neural Network Weights
//!
//! Phase 14.1: Map neural network weight tensors into spatial grid patterns
//! using Matter cells for f32 weight values with VCC/PAS stability validation.
//!
//! # Architecture
//!
//! ```
//! Weight Tensor (e.g., PyTorch/HuggingFace)
//!     ↓ (deserialize via safetensors/candle)
//! WeightMapper (spatial layout planning)
//!     ↓ (grid allocation with PAS validation)
//! Spatial Grid (Matter cells with f32 weights)
//!     ↓ (GPU compute shaders load from spatial memory)
//! Spatial Inference (tensor operations on spatial grid)
//! ```
//!
//! # Key Concepts
//!
//! - **Weight Pattern**: 2D spatial arrangement of weight tensors
//! - **Matter Cell**: Spatial cell storing f32 values in data_buffer
//! - **PAS Hashing**: Phase Alignment Stability for entropy validation
//! - **Spatial Tensor**: Multi-dimensional weight mapped to 2D grid
//!
//! # Weight Layout Strategies
//!
//! ## 1. Dense Matrix Layout (for linear layers)
//! - Row-major: weight[i][j] → cell[x + i, y + j]
//! - Optimized for matrix-vector multiplication
//! - Cache-friendly GPU access patterns
//!
//! ## 2. Convolution Filter Layout (for Conv2D)
//! - Filter [out_ch][in_ch][kh][kw] → cell patches
//! - Patch-aligned for efficient 2D convolution
//! - Supports spatial weight sharing
//!
//! ## 3. Attention Head Layout (for transformers)
//! - Q, K, V matrices stored separately
//! - Query-Key dot product optimization
//! - Softmax normalization in spatial arithmetic
//!
//! # PAS Validation
//!
//! High-entropy weight tensors require PAS validation to prevent spatial drift:
//!
//! ```rust
//! let pas_hash = compute_pas_hash(&weight_pattern);
//! let stability = validate_pas(&pas_hash, 0.95); // 95% threshold
//! if stability < 0.95 {
//!     return Err("Weight pattern too unstable for spatial mapping");
//! }
//! ```
//!
//! # Integration with VCC (Visual Consistency Contract)
//!
//! The VCC validator ensures weight patterns maintain spatial consistency:
//!
//! ```rust
//! let vcc_result = vcc_validate::validate_weight_pattern(&grid, &pattern);
//! if !vcc_result.passed {
//!     return Err(format!("VCC validation failed: {}", vcc_result.reason));
//! }
//! ```

use crate::geoasm_materializer::CellState;
use crate::spatial::spatial_memory::SpatialMemory;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// Weight tensor shape (rank 1-4 supported)
#[derive(Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum TensorShape {
    Vector { dim: usize },           // 1D: [dim]
    Matrix { rows: usize, cols: usize }, // 2D: [rows, cols]
    Conv3D { out_ch: usize, in_ch: usize, kh: usize, kw: usize }, // 4D: [out_ch, in_ch, kh, kw]
}

impl TensorShape {
    /// Total number of elements in the tensor
    pub fn num_elements(&self) -> usize {
        match self {
            TensorShape::Vector { dim } => *dim,
            TensorShape::Matrix { rows, cols } => rows * cols,
            TensorShape::Conv3D { out_ch, in_ch, kh, kw } => out_ch * in_ch * kh * kw,
        }
    }

    /// Calculate 2D bounding box for grid layout
    pub fn bounding_box(&self) -> (usize, usize) {
        match self {
            TensorShape::Vector { dim } => (*dim, 1),
            TensorShape::Matrix { rows, cols } => (*cols, *rows),
            TensorShape::Conv3D { out_ch, in_ch, kh, kw } => {
                // Pack as [out_ch * kh] × [in_ch * kw] for efficient convolution
                (*out_ch * *kh, *in_ch * *kw)
            }
        }
    }
}

/// Spatial weight pattern metadata
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WeightPattern {
    /// Unique identifier for this weight pattern
    pub id: String,
    /// Tensor shape
    pub shape: TensorShape,
    /// Grid origin (x, y) where pattern is stored
    pub origin: (usize, usize),
    /// PAS hash for stability validation
    pub pas_hash: u64,
    /// Stability score (0.0 - 1.0, higher is more stable)
    pub stability: f32,
    /// Layer name (e.g., "transformer.h.0.attn.q_proj")
    pub layer_name: String,
}

/// Spatial weight mapper configuration
#[derive(Debug, Clone)]
pub struct WeightMapperConfig {
    /// PAS stability threshold (0.0 - 1.0)
    pub pas_threshold: f32,
    /// Whether to enable VCC validation
    pub enable_vcc: bool,
    /// Default grid origin for weight allocation
    pub default_origin: (usize, usize),
    /// Minimum gap between weight patterns (cells)
    pub pattern_gap: usize,
}

impl Default for WeightMapperConfig {
    fn default() -> Self {
        Self {
            pas_threshold: 0.95,
            enable_vcc: true,
            default_origin: (200, 100), // Offset from kernel/system regions
            pattern_gap: 10, // 10-cell gap between patterns
        }
    }
}

/// LLM Weight Mapper - Maps neural network weights to spatial grid
pub struct WeightMapper {
    config: WeightMapperConfig,
    patterns: HashMap<String, WeightPattern>,
    next_origin: (usize, usize),
}

impl WeightMapper {
    /// Create a new weight mapper with default configuration
    pub fn new() -> Self {
        Self::with_config(WeightMapperConfig::default())
    }

    /// Create a new weight mapper with custom configuration
    pub fn with_config(config: WeightMapperConfig) -> Self {
        Self {
            next_origin: config.default_origin,
            config,
            patterns: HashMap::new(),
        }
    }

    /// Map a weight tensor to the spatial grid
    ///
    /// # Arguments
    ///
    /// * `grid` - Mutable reference to spatial grid
    /// * `weights` - Slice of f32 weight values (flattened tensor)
    /// * `shape` - Tensor shape
    /// * `layer_name` - Layer identifier
    ///
    /// # Returns
    ///
    /// Weight pattern metadata if successful
    pub fn map_weights(
        &mut self,
        grid: &mut [CellState],
        grid_w: usize,
        weights: &[f32],
        shape: TensorShape,
        layer_name: &str,
    ) -> Result<WeightPattern, String> {
        // Validate weight count matches shape
        let expected_elements = shape.num_elements();
        if weights.len() != expected_elements {
            return Err(format!(
                "Weight count mismatch: expected {}, got {}",
                expected_elements,
                weights.len()
            ));
        }

        // Calculate bounding box
        let (bbox_w, bbox_h) = shape.bounding_box();

        // Check grid bounds
        if self.next_origin.0 + bbox_w > grid_w {
            return Err(format!(
                "Pattern exceeds grid width: origin={}, width={}, grid_w={}",
                self.next_origin.0, bbox_w, grid_w
            ));
        }

        // Calculate PAS hash
        let pas_hash = self.compute_pas_hash(weights);
        let stability = self.validate_pas_stability(pas_hash);

        // Validate stability threshold
        if stability < self.config.pas_threshold {
            return Err(format!(
                "PAS stability too low: {} < {}",
                stability, self.config.pas_threshold
            ));
        }

        // Create weight pattern
        let pattern = WeightPattern {
            id: format!("{}_{}", layer_name.replace('.', "_"), uuid_timestamp()),
            shape: shape.clone(),
            origin: self.next_origin,
            pas_hash,
            stability,
            layer_name: layer_name.to_string(),
        };

        // Write weights to grid
        self.write_weights_to_grid(grid, grid_w, weights, &shape, &pattern)?;

        // Register pattern
        self.patterns.insert(pattern.id.clone(), pattern.clone());

        // Advance origin for next pattern
        self.next_origin = (
            self.next_origin.0,
            self.next_origin.1 + bbox_h + self.config.pattern_gap,
        );

        Ok(pattern)
    }

    /// Write weights to spatial grid cells
    fn write_weights_to_grid(
        &self,
        grid: &mut [CellState],
        grid_w: usize,
        weights: &[f32],
        shape: &TensorShape,
        pattern: &WeightPattern,
    ) -> Result<(), String> {
        match shape {
            TensorShape::Vector { dim } => {
                for i in 0..*dim {
                    let x = pattern.origin.0 + i;
                    let y = pattern.origin.1;
                    let offset = y * grid_w + x;
                    if offset >= grid.len() {
                        return Err(format!("Grid out of bounds at ({}, {})", x, y));
                    }
                    grid[offset].data_buffer = f32_to_u32(weights[i]);
                    grid[offset].is_active = 1;
                }
            }
            TensorShape::Matrix { rows, cols } => {
                for i in 0..*rows {
                    for j in 0..*cols {
                        let idx = i * cols + j;
                        let x = pattern.origin.0 + j; // Column-major for GPU cache
                        let y = pattern.origin.1 + i;
                        let offset = y * grid_w + x;
                        if offset >= grid.len() {
                            return Err(format!("Grid out of bounds at ({}, {})", x, y));
                        }
                        grid[offset].data_buffer = f32_to_u32(weights[idx]);
                        grid[offset].is_active = 1;
                    }
                }
            }
            TensorShape::Conv3D { out_ch, in_ch, kh, kw } => {
                for oc in 0..*out_ch {
                    for ic in 0..*in_ch {
                        for ky in 0..*kh {
                            for kx in 0..*kw {
                                let idx = ((oc * in_ch + ic) * kh + ky) * kw + kx;
                                let x = pattern.origin.0 + (oc * kw + kx);
                                let y = pattern.origin.1 + (ic * kh + ky);
                                let offset = y * grid_w + x;
                                if offset >= grid.len() {
                                    return Err(format!("Grid out of bounds at ({}, {})", x, y));
                                }
                                grid[offset].data_buffer = f32_to_u32(weights[idx]);
                                grid[offset].is_active = 1;
                            }
                        }
                    }
                }
            }
        }
        Ok(())
    }

    /// Compute PAS (Phase Alignment Stability) hash for weight tensor
    fn compute_pas_hash(&self, weights: &[f32]) -> u64 {
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};

        // Compute weighted hash with phase alignment
        let mut hasher = DefaultHasher::new();

        for (i, &w) in weights.iter().enumerate() {
            // Phase-aligned hashing: weight * sin(i * PI / len)
            let phase = (i as f32 * std::f32::consts::PI / weights.len() as f32).sin();
            let aligned = (w * phase).to_bits();
            hasher.write_u32(aligned);
        }

        hasher.finish()
    }

    /// Validate PAS stability score
    fn validate_pas_stability(&self, pas_hash: u64) -> f32 {
        // Stability = proportion of set bits in hash (entropy measure)
        let set_bits = pas_hash.count_ones() as f32;
        let total_bits = 64.0;
        let entropy = set_bits / total_bits;

        // Penalize extreme entropy (too random or too ordered)
        let stability = 1.0 - (entropy - 0.5).abs() * 2.0;

        stability.max(0.0).min(1.0)
    }

    /// Load weights from safetensors file (simplified version)
    pub fn load_from_safetensors(
        &mut self,
        grid: &mut [CellState],
        grid_w: usize,
        path: &str,
    ) -> Result<Vec<WeightPattern>, String> {
        // TODO: Integrate with safetensors library
        // For now, return placeholder
        Err(format!("safetensors loading not yet implemented: {}", path))
    }

    /// Get all registered weight patterns
    pub fn patterns(&self) -> &HashMap<String, WeightPattern> {
        &self.patterns
    }

    /// Get a specific weight pattern by ID
    pub fn get_pattern(&self, id: &str) -> Option<&WeightPattern> {
        self.patterns.get(id)
    }

    /// Export weight patterns to JSON (for persistence)
    pub fn export_patterns(&self) -> Result<String, String> {
        serde_json::to_string_pretty(&self.patterns)
            .map_err(|e| format!("JSON serialization failed: {}", e))
    }

    /// Import weight patterns from JSON
    pub fn import_patterns(&mut self, json: &str) -> Result<(), String> {
        let patterns: HashMap<String, WeightPattern> =
            serde_json::from_str(json).map_err(|e| format!("JSON deserialization failed: {}", e))?;

        self.patterns = patterns;
        Ok(())
    }
}

/// Convert f32 to u32 for storage in data_buffer (0x00RRGGBB format repurposed)
///
/// NOTE: This is a temporary mapping. We'll extend CellState for proper f32 storage.
fn f32_to_u32(value: f32) -> u32 {
    value.to_bits()
}

/// Convert u32 from data_buffer back to f32
fn u32_to_f32(bits: u32) -> f32 {
    f32::from_bits(bits)
}

/// Generate timestamp-based UUID for pattern IDs
fn uuid_timestamp() -> u64 {
    use std::time::{SystemTime, UNIX_EPOCH};
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_millis() as u64
}

#[cfg(test)]
mod tests {
    use super::*;

    fn create_test_grid(width: usize, height: usize) -> Vec<CellState> {
        vec![CellState::new(0, 0, 0); width * height]
    }

    #[test]
    fn test_tensor_shape_elements() {
        assert_eq!(TensorShape::Vector { dim: 10 }.num_elements(), 10);
        assert_eq!(
            TensorShape::Matrix { rows: 3, cols: 4 }.num_elements(),
            12
        );
        assert_eq!(
            TensorShape::Conv3D {
                out_ch: 2,
                in_ch: 3,
                kh: 2,
                kw: 2
            }
            .num_elements(),
            24
        );
    }

    #[test]
    fn test_tensor_shape_bounding_box() {
        assert_eq!(TensorShape::Vector { dim: 10 }.bounding_box(), (10, 1));
        assert_eq!(
            TensorShape::Matrix { rows: 3, cols: 4 }.bounding_box(),
            (4, 3)
        );
        assert_eq!(
            TensorShape::Conv3D {
                out_ch: 2,
                in_ch: 3,
                kh: 2,
                kw: 2
            }
            .bounding_box(),
            (4, 6)
        );
    }

    #[test]
    fn test_map_vector_weights() {
        let mut mapper = WeightMapper::new();
        let mut grid = create_test_grid(256, 256);

        let weights = vec![1.0, 2.0, 3.0, 4.0, 5.0];
        let shape = TensorShape::Vector { dim: 5 };

        let result = mapper.map_weights(&mut grid, 256, &weights, shape, "test_layer");

        assert!(result.is_ok());
        let pattern = result.unwrap();
        assert_eq!(pattern.origin, mapper.config.default_origin);
        assert_eq!(pattern.stability, 1.0); // Small stable weights
    }

    #[test]
    fn test_map_matrix_weights() {
        let mut mapper = WeightMapper::new();
        let mut grid = create_test_grid(256, 256);

        let weights = vec![1.0; 12]; // 3x4 matrix
        let shape = TensorShape::Matrix { rows: 3, cols: 4 };

        let result = mapper.map_weights(&mut grid, 256, &weights, shape, "test_matrix");

        assert!(result.is_ok());
        let pattern = result.unwrap();
        assert_eq!(pattern.shape.num_elements(), 12);
    }

    #[test]
    fn test_pas_hash_stability() {
        let mapper = WeightMapper::new();

        // Stable weights (all zeros)
        let stable_weights = vec![0.0; 100];
        let stable_hash = mapper.compute_pas_hash(&stable_weights);
        let stable_score = mapper.validate_pas_stability(stable_hash);

        // Random weights (high entropy)
        let random_weights: Vec<f32> = (0..100).map(|i| i as f32).collect();
        let random_hash = mapper.compute_pas_hash(&random_weights);
        let random_score = mapper.validate_pas_stability(random_hash);

        // Stable weights should have higher score
        assert!(stable_score >= random_score);
    }

    #[test]
    fn test_weight_count_mismatch() {
        let mut mapper = WeightMapper::new();
        let mut grid = create_test_grid(256, 256);

        let weights = vec![1.0, 2.0, 3.0]; // 3 elements
        let shape = TensorShape::Vector { dim: 5 }; // Expects 5 elements

        let result = mapper.map_weights(&mut grid, 256, &weights, shape, "test_layer");

        assert!(result.is_err());
        assert!(result.unwrap_err().contains("Weight count mismatch"));
    }

    #[test]
    fn test_pattern_registration() {
        let mut mapper = WeightMapper::new();
        let mut grid = create_test_grid(256, 256);

        let weights = vec![1.0, 2.0, 3.0, 4.0, 5.0];
        let shape = TensorShape::Vector { dim: 5 };

        let pattern1 = mapper
            .map_weights(&mut grid, 256, &weights, shape.clone(), "layer1")
            .unwrap();

        assert!(mapper.patterns().contains_key(&pattern1.id));
        assert_eq!(mapper.get_pattern(&pattern1.id).unwrap().layer_name, "layer1");
    }

    #[test]
    fn test_origin_advancement() {
        let mut mapper = WeightMapper::new();
        let mut grid = create_test_grid(256, 256);

        let weights = vec![1.0, 2.0, 3.0, 4.0, 5.0];
        let shape = TensorShape::Vector { dim: 5 };

        let origin1 = mapper.next_origin;
        mapper
            .map_weights(&mut grid, 256, &weights, shape.clone(), "layer1")
            .unwrap();

        let origin2 = mapper.next_origin;
        assert!(origin2.1 > origin1.1); // Y advanced
    }
}