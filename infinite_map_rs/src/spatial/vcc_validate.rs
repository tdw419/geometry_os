// Visual Consistency Contract (VCC) - Phase Alignment Stability Verifier
//
// Ensures that spatial memory regions maintain structural integrity across ticks.
// Calculates hashes (SHA256/BLAKE3) of the GPU memory cells and compares them
// against expected PAS (Phase Alignment Stability) values.

use sha2::{Sha256, Digest};
use std::collections::HashMap;

use crate::geoasm_materializer::CellState;
use crate::spatial::ProcessRegion;

/// Represents a VCC Violation (Phase Drift)
#[derive(Debug, Clone)]
pub struct VccViolation {
    pub region_id: u32,
    pub expected_hash: String,
    pub actual_hash: String,
    pub timestamp: std::time::SystemTime,
}

/// The VCC Validator manages contracts and enforces stability
pub struct VccValidator {
    /// Active contracts mapping region_id to expected hash
    contracts: HashMap<u32, String>,
    /// History of recorded violations (Phase Drift)
    pub violations: Vec<VccViolation>,
}

impl Default for VccValidator {
    fn default() -> Self {
        Self::new()
    }
}

impl VccValidator {
    pub fn new() -> Self {
        Self {
            contracts: HashMap::new(),
            violations: Vec::new(),
        }
    }

    /// Register a VCC Contract for a specific region
    pub fn register_contract(&mut self, region_id: u32, expected_hash: String) {
        log::info!("VCC Contract registered for region {}: {}", region_id, expected_hash);
        self.contracts.insert(region_id, expected_hash);
    }

    /// Remove a VCC Contract
    pub fn revoke_contract(&mut self, region_id: u32) {
        if self.contracts.remove(&region_id).is_some() {
            log::info!("VCC Contract revoked for region {}", region_id);
        }
    }

    /// Compute the SHA256 hash for a specific grid region
    pub fn compute_region_hash(
        grid: &[CellState],
        grid_w: usize,
        region: &ProcessRegion,
    ) -> String {
        let mut hasher = Sha256::new();
        
        for y in region.start_y..(region.start_y + region.height) {
            for x in region.start_x..(region.start_x + region.width) {
                let offset = (y as usize * grid_w + x as usize);
                if offset < grid.len() {
                    let cell = &grid[offset];
                    // Serialize cell state into bytes for deterministic hashing
                    hasher.update(cell.opcode_or_type.to_le_bytes());
                    hasher.update(cell.is_active.to_le_bytes());
                    hasher.update(cell.data_buffer.to_le_bytes());
                    hasher.update(cell.executing.to_le_bytes());
                } else {
                    // Out of bounds counts as zeros to maintain determinism
                    hasher.update([0u8; 16]);
                }
            }
        }
        
        let result = hasher.finalize();
        format!("{:x}", result)
    }

    /// Validate all registered contracts against the current grid state
    pub fn validate_all(&mut self, grid: &[CellState], grid_w: usize, regions: &HashMap<u32, ProcessRegion>) -> bool {
        let mut all_valid = true;
        
        // Clone keys to avoid borrow checker issues when iterating and mutating violations
        let active_regions: Vec<u32> = self.contracts.keys().cloned().collect();
        
        for region_id in active_regions {
            if let Some(region) = regions.get(&region_id) {
                if let Some(expected_hash) = self.contracts.get(&region_id) {
                    let actual_hash = Self::compute_region_hash(grid, grid_w, region);
                    
                    if actual_hash != *expected_hash {
                        let violation = VccViolation {
                            region_id,
                            expected_hash: expected_hash.clone(),
                            actual_hash: actual_hash.clone(),
                            timestamp: std::time::SystemTime::now(),
                        };
                        log::error!(
                            "❌ VCC VIOLATION (Phase Drift): Region {} expected {}, got {}",
                            region_id, expected_hash, actual_hash
                        );
                        self.violations.push(violation);
                        all_valid = false;
                    }
                }
            }
        }
        
        all_valid
    }

    /// Explicitly validate a single region and expected hash without a registered contract
    pub fn vcc_validate_region(grid: &[CellState], grid_w: usize, region: &ProcessRegion, expected_hash: &str) -> Result<bool, String> {
        let actual_hash = Self::compute_region_hash(grid, grid_w, region);
        if actual_hash == expected_hash {
            Ok(true)
        } else {
            Err(format!("Phase drift detected! Expected {}, got {}", expected_hash, actual_hash))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vcc_validation() {
        let grid_w = 128;
        let grid_h = 64;
        let mut grid = vec![CellState {
            opcode_or_type: 0,
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        }; grid_w * grid_h];

        let region = ProcessRegion::new(10, 10, 20, 20);
        
        // Populate the region with some deterministic data
        for y in 10..30 {
            for x in 10..30 {
                let offset = y * grid_w + x;
                grid[offset].data_buffer = (x + y) as u32;
            }
        }

        // Compute baseline hash
        let baseline_hash = VccValidator::compute_region_hash(&grid, grid_w, &region);
        
        let mut vcc = VccValidator::new();
        vcc.register_contract(1, baseline_hash.clone());
        
        let mut regions = HashMap::new();
        regions.insert(1, region.clone());

        // Validate should pass
        assert!(vcc.validate_all(&grid, grid_w, &regions));

        // Induce Phase Drift
        let drift_offset = 15 * grid_w + 15;
        grid[drift_offset].data_buffer = 9999;

        // Validate should fail
        assert!(!vcc.validate_all(&grid, grid_w, &regions));
        assert_eq!(vcc.violations.len(), 1);
        
        // Verify explicit check
        let explicit_result = VccValidator::vcc_validate_region(&grid, grid_w, &region, &baseline_hash);
        assert!(explicit_result.is_err());
    }
}
