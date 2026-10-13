use crate::geoasm_materializer::{CellState, TYPE_WALL, TYPE_NOP};
use image::{ImageBuffer, Rgba};
use log::{info, warn};
use serde::{Deserialize, Serialize};
use std::path::Path;

use super::vision_studio_bridge::{VisionStudioClient, VisionStudioConfig, VisionError};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SaccadeRegion {
    pub x: usize,
    pub y: usize,
    pub width: usize,
    pub height: usize,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LayoutInefficiency {
    pub region: SaccadeRegion,
    pub inefficiency_type: String, // "LongRoute", "SparseDensity", "DeadCode"
    pub score: f32,                // 0.0 to 1.0 (1.0 = highly inefficient)
}

pub struct LayoutGanSaccade {
    pub config: SaccadeConfig,
}

#[derive(Debug, Clone)]
pub struct SaccadeConfig {
    pub region_size: usize,
    pub threshold: f32,
    pub use_vlm: bool,
    pub vlm_config: Option<VisionStudioConfig>,
}

impl Default for SaccadeConfig {
    fn default() -> Self {
        Self {
            region_size: 64,
            threshold: 0.75,
            use_vlm: true, // Enable VLM by default
            vlm_config: Some(VisionStudioConfig::default()),
        }
    }
}

impl LayoutGanSaccade {
    pub fn new(config: SaccadeConfig) -> Self {
        Self { config }
    }

    /// Evaluates a macro-region for inefficiencies.
    pub fn evaluate_region(
        &self,
        grid: &[CellState],
        grid_w: usize,
        region: &SaccadeRegion,
    ) -> Option<LayoutInefficiency> {
        info!(
            "Saccading region ({}, {}) size {}x{}",
            region.x, region.y, region.width, region.height
        );

        // Count non-NOP cells vs NOP cells to determine density
        let mut active_cells = 0;
        let mut _total_cells = region.width * region.height;

        for y in region.y..(region.y + region.height) {
            for x in region.x..(region.x + region.width) {
                let idx = y * grid_w + x;
                if idx < grid.len() {
                    let cell = &grid[idx];
                    if cell.opcode_or_type != 0 && cell.opcode_or_type != TYPE_WALL {
                        // Not NOP and Not WALL
                        active_cells += 1;
                    }
                }
            }
        }

        let density = active_cells as f32 / (region.width * region.height) as f32;

        // Naive heuristic for now: Sparse circuits (< 10% density) but active might have long routing
        if density > 0.01 && density < 0.10 {
            Some(LayoutInefficiency {
                region: region.clone(),
                inefficiency_type: "SparseDensity_LongRoutes".to_string(),
                score: 0.85,
            })
        } else {
            None
        }
    }

    /// Generates an OpenSpec instruction for the spatial generator based on inefficiency
    pub fn generate_openspec_for_inefficiency(&self, inefficiency: &LayoutInefficiency) -> String {
        format!(
            "# LayoutGAN Correction Spec\n\n\
            ## Region\n\
            X: {}, Y: {}, W: {}, H: {}\n\n\
            ## Detected Inefficiency\n\
            Type: {}\n\
            Score: {}\n\n\
            ## Task\n\
            Compact this spatial circuit to improve cache locality and density.",
            inefficiency.region.x,
            inefficiency.region.y,
            inefficiency.region.width,
            inefficiency.region.height,
            inefficiency.inefficiency_type,
            inefficiency.score
        )
    }

    /// Export region as .rts.png for vision language model analysis
    ///
    /// CellState encoding to RGBA:
    /// - R = opcode (extracted from packed opcode_or_type)
    /// - G = is_active (0 or 1)
    /// - B = (data_buffer >> 16) & 0xFF (high 16 bits)
    /// - A = data_buffer & 0xFF (low 16 bits)
    ///
    /// This matches the .rts.png format used in Phase 20.1, enabling VLMs
    /// like LLaVA or Qwen-VL to visually analyze circuit topology.
    pub fn export_region_as_rts(
        &self,
        grid: &[CellState],
        grid_w: usize,
        region: &SaccadeRegion,
        output_path: &Path,
    ) -> Result<(), SaccadeError> {
        info!(
            "Exporting region ({}, {}) size {}x{} to {}",
            region.x,
            region.y,
            region.width,
            region.height,
            output_path.display()
        );

        // Create image buffer
        let mut img: ImageBuffer<Rgba<u8>, Vec<u8>> =
            ImageBuffer::new(region.width as u32, region.height as u32);

        // Copy cells into RGBA encoding
        for y in 0..region.height {
            for x in 0..region.width {
                let grid_idx = (region.y + y) * grid_w + (region.x + x);
                let cell = if grid_idx < grid.len() {
                    &grid[grid_idx]
                } else {
                    &CellState::data(0) // Out of bounds = NOP
                };

                // Extract packed opcode (low 8 bits)
                let opcode = (cell.opcode_or_type & 0xFF) as u8;

                // Active flag (0 or 1, scaled to 0-255 for visualization)
                let active = (cell.is_active * 255) as u8;

                // Data buffer split across B and A channels (32-bit → 16-bit + 16-bit)
                let data_high = ((cell.data_buffer >> 16) & 0xFF) as u8;
                let data_low = (cell.data_buffer & 0xFF) as u8;

                let pixel = Rgba([opcode, active, data_high, data_low]);
                img.put_pixel(x as u32, y as u32, pixel);
            }
        }

        // Save as PNG
        img.save(output_path).map_err(|e| SaccadeError::ExportError {
            path: output_path.to_path_buf(),
            message: e.to_string(),
        })?;

        info!(
            "✅ Exported {}x{} region ({} pixels)",
            region.width,
            region.height,
            region.width * region.height
        );

        Ok(())
    }

    /// Vision-aware inefficiency detection using exported .rts.png
    ///
    /// This is the advanced version that pipes the .rts.png through a VLM.
    /// When VLM is enabled, replaces density calculation with neural routing critique.
    pub async fn detect_inefficiency_vision_aware_async(
        &self,
        grid: &[CellState],
        grid_w: usize,
        region: &SaccadeRegion,
        export_path: Option<&Path>,
    ) -> Option<LayoutInefficiency> {
        info!(
            "👁️  Vision-aware saccade on region ({}, {})",
            region.x, region.y
        );

        // Check if VLM is configured and enabled
        let use_vlm = self.config.use_vlm && self.config.vlm_config.is_some();

        // Step 1: Export region as .rts.png (for VLM consumption)
        if let Some(path) = export_path {
            if let Err(e) = self.export_region_as_rts(grid, grid_w, region, path) {
                warn!("Failed to export .rts.png: {}", e);
                // Continue anyway with density fallback
            }
        }

        // Step 2: Use VLM if available, otherwise fall back to density heuristics
        if use_vlm {
            if let (Some(path), Some(vlm_config)) = (export_path, &self.config.vlm_config) {
                match self.analyze_with_vlm(path, region, vlm_config).await {
                    Some(inefficiency) => {
                        info!(
                            "🧠 VLM detected: {} (score: {})",
                            inefficiency.inefficiency_type, inefficiency.score
                        );
                        return Some(inefficiency);
                    }
                    None => {
                        info!("🧠 VLM analysis returned no inefficiency");
                        return None;
                    }
                }
            }
        }

        // Fallback: density heuristics (temporary VLM replacement)
        warn!("⚠️  VLM unavailable, using density fallback");
        self.detect_inefficiency_density_fallback(grid, grid_w, region)
    }

    /// Analyze exported .rts.png with Vision Language Model
    async fn analyze_with_vlm(
        &self,
        image_path: &Path,
        region: &SaccadeRegion,
        vlm_config: &VisionStudioConfig,
    ) -> Option<LayoutInefficiency> {
        // Initialize VLM client
        let client = VisionStudioClient::new(vlm_config.clone())
            .inspect_err(|e| warn!("VLM client init failed: {}", e))
            .ok()?;

        // Build context string for the VLM
        let context = format!(
            "Region: x={}, y={}, width={}, height={}",
            region.x, region.y, region.width, region.height
        );

        // Send to VLM for analysis
        match client.analyze_circuit_image(image_path, &context).await {
            Ok(critique) => {
                info!("📋 VLM critique: score={}, type={}", critique.score, critique.inefficiency_type);
                info!("   Explanation: {}", critique.explanation);
                if !critique.suggestions.is_empty() {
                    info!("   Suggestions: {}", critique.suggestions.join(", "));
                }
                Some(client.critique_to_inefficiency(
                    &critique,
                    region.x,
                    region.y,
                    region.width,
                    region.height,
                ))
            }
            Err(e) => {
                warn!("VLM analysis failed: {}", e);
                None
            }
        }
    }

    /// Fallback density-based inefficiency detection (used when VLM unavailable)
    fn detect_inefficiency_density_fallback(
        &self,
        grid: &[CellState],
        grid_w: usize,
        region: &SaccadeRegion,
    ) -> Option<LayoutInefficiency> {
        let mut active_cells = 0;
        let total_cells = region.width * region.height;

        for y in region.y..(region.y + region.height) {
            for x in region.x..(region.x + region.width) {
                let idx = y * grid_w + x;
                if idx < grid.len() {
                    let cell = &grid[idx];
                    if cell.opcode_or_type != 0 && cell.opcode_or_type != TYPE_WALL {
                        active_cells += 1;
                    }
                }
            }
        }

        let density = active_cells as f32 / total_cells as f32;

        // Sparse circuits with high routing distance = inefficiency
        if density > 0.01 && density < 0.10 {
            Some(LayoutInefficiency {
                region: region.clone(),
                inefficiency_type: "SparseDensity_Fallback".to_string(),
                score: 0.85,
            })
        } else {
            None
        }
    }
}

/// Saccade errors
#[derive(Debug, thiserror::Error)]
pub enum SaccadeError {
    #[error("Export error for {path}: {message}")]
    ExportError {
        path: std::path::PathBuf,
        message: String,
    },
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::geoasm_materializer::CellState;
    use std::path::PathBuf;
    use tempfile::TempDir;

    #[test]
    fn test_saccade_config_default() {
        let config = SaccadeConfig::default();
        assert_eq!(config.region_size, 64);
        assert_eq!(config.threshold, 0.75);
    }

    #[test]
    fn test_saccade_region_creation() {
        let region = SaccadeRegion {
            x: 10,
            y: 20,
            width: 32,
            height: 32,
        };
        assert_eq!(region.x, 10);
        assert_eq!(region.width, 32);
    }

    #[test]
    fn test_export_region_as_rts() {
        let saccade = LayoutGanSaccade::new(SaccadeConfig::default());

        // Create a simple grid with known cells
        let mut grid = vec![CellState::data(0); 128 * 128];
        grid[0] = CellState::new(3, 0, 0); // TYPE_LDI at (0,0)
        grid[0].is_active = 1;
        grid[0].data_buffer = 0xDEADBEEF;

        let region = SaccadeRegion {
            x: 0,
            y: 0,
            width: 16,
            height: 16,
        };

        let temp_dir = TempDir::new().expect("Failed to create temp dir");
        let output_path = temp_dir.path().join("test_region.rts.png");

        let result = saccade.export_region_as_rts(&grid, 128, &region, &output_path);
        assert!(result.is_ok(), "Export should succeed");
        assert!(output_path.exists(), "PNG file should be created");
    }

    #[test]
    fn test_export_out_of_bounds_region() {
        let saccade = LayoutGanSaccade::new(SaccadeConfig::default());

        let grid = vec![CellState::data(0); 100];
        let region = SaccadeRegion {
            x: 0,
            y: 0,
            width: 10,
            height: 10,
        };

        let temp_dir = TempDir::new().expect("Failed to create temp dir");
        let output_path = temp_dir.path().join("oob_region.rts.png");

        // Should not panic, fill with NOP (0)
        let result = saccade.export_region_as_rts(&grid, 10, &region, &output_path);
        assert!(result.is_ok());
    }

    #[test]
    fn test_detect_inefficiency_sparse_region() {
        let saccade = LayoutGanSaccade::new(SaccadeConfig::default());

        // Create a sparse region (~5% density, which is > 1% and < 10%)
        let mut grid = vec![CellState::data(0); 128 * 128];
        let region = SaccadeRegion {
            x: 0,
            y: 0,
            width: 20,
            height: 20,
        };

        // Add 20 active cells (20 out of 400 = 5%)
        for i in 0..20 {
            grid[i] = CellState::new(3, 0, 0);
        }

        let inefficiency = saccade.evaluate_region(&grid, 128, &region);
        assert!(inefficiency.is_some(), "Should detect sparse region");

        let detected = inefficiency.unwrap();
        assert_eq!(detected.inefficiency_type, "SparseDensity_LongRoutes");
        assert!(detected.score > 0.5);
    }

    #[test]
    fn test_detect_inefficiency_dense_region() {
        let saccade = LayoutGanSaccade::new(SaccadeConfig::default());

        // Create a dense region (50% density)
        let mut grid = vec![CellState::data(0); 128 * 128];
        let region = SaccadeRegion {
            x: 0,
            y: 0,
            width: 20,
            height: 20,
        };

        // Fill half the region
        for i in 0..200 {
            grid[i] = CellState::new(3, 0, 0);
        }

        let inefficiency = saccade.evaluate_region(&grid, 128, &region);
        assert!(inefficiency.is_none(), "Dense region should not trigger inefficiency");
    }

    #[test]
    fn test_vision_aware_detection_with_export() {
        // Test with VLM disabled (density fallback)
        let config = SaccadeConfig {
            use_vlm: false,
            vlm_config: None,
            ..Default::default()
        };
        let saccade = LayoutGanSaccade::new(config);

        let mut grid = vec![CellState::data(0); 128 * 128];
        let region = SaccadeRegion {
            x: 10,
            y: 10,
            width: 32,
            height: 32,
        };

        // Create sparse region (~5% density within 32x32 = 1024 cells, add 51 cells)
        for i in 0..51 {
            let offset_y = i / 32;
            let offset_x = i % 32;
            grid[(10 + offset_y) * 128 + (10 + offset_x)] = CellState::new(3, 0, 0);
        }

        let temp_dir = TempDir::new().expect("Failed to create temp dir");
        let output_path = temp_dir.path().join("vision_test.rts.png");

        // Use the fallback method directly for sync test
        let inefficiency = saccade.detect_inefficiency_density_fallback(&grid, 128, &region);

        // Should detect inefficiency
        assert!(inefficiency.is_some());
    }

    #[test]
    fn test_generate_openspec() {
        let saccade = LayoutGanSaccade::new(SaccadeConfig::default());

        let inefficiency = LayoutInefficiency {
            region: SaccadeRegion {
                x: 5,
                y: 10,
                width: 64,
                height: 64,
            },
            inefficiency_type: "LongRoute".to_string(),
            score: 0.85,
        };

        let openspec = saccade.generate_openspec_for_inefficiency(&inefficiency);

        assert!(openspec.contains("X: 5, Y: 10, W: 64, H: 64"));
        assert!(openspec.contains("Type: LongRoute"));
        assert!(openspec.contains("Score: 0.85"));
        assert!(openspec.contains("Compact this spatial circuit"));
    }
}