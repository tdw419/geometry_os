//! Spatial Generator - Orchestrates spec-to-circuit pipeline
//!
//! Complete pipeline:
//! 1. Parse OpenSpec
//! 2. Hallucinate initial circuit via LLM
//! 3. Instantiate in idle region
//! 4. Handoff to Evolution Daemon

use super::openspec_bridge::{parse_openspec_file, SpecRequest};
use super::lm_studio_bridge::{LmStudioClient, GeneratedCircuit, CellDefinition, LmStudioConfig};
use super::evolution_daemon::{EvolutionDaemon, EvolutionConfig};
use super::circuit_optimizer::OptimizationConfig;

// Import CellState and type constants from geoasm_materializer
use crate::geoasm_materializer::{
    CellState,
    TYPE_MEMBRANE, TYPE_WALL, TYPE_JZ, TYPE_JMP, TYPE_JMP_IND
};

use log::{info, warn, error};
use std::collections::HashMap;
use std::path::Path;

/// Spatial generator configuration
#[derive(Debug, Clone)]
pub struct SpatialGeneratorConfig {
    /// LLM endpoint configuration
    pub llm_config: LmStudioConfig,

    /// Evolution daemon configuration
    pub evolution_config: EvolutionConfig,

    /// Grid dimensions
    pub grid_w: usize,
    pub grid_h: usize,

    /// Region size for new circuits (default: 32x32)
    pub region_size: usize,
}

impl Default for SpatialGeneratorConfig {
    fn default() -> Self {
        Self {
            llm_config: LmStudioConfig::default(),
            evolution_config: EvolutionConfig::default(),
            grid_w: 512,
            grid_h: 512,
            region_size: 32,
        }
    }
}

/// Spatial generator result
#[derive(Debug, Clone)]
pub struct GenerationResult {
    /// Generated circuit ID
    pub circuit_id: String,

    /// Region allocated (origin_x, origin_y)
    pub region: (usize, usize),

    /// Generated cells
    pub cells: Vec<CellState>,

    /// Evolution daemon experiment ID
    pub experiment_id: Option<String>,

    /// Success status
    pub success: bool,
}

/// Spatial generator - orchestrates spec-to-circuit pipeline
pub struct SpatialGenerator {
    config: SpatialGeneratorConfig,
    pub llm_client: LmStudioClient,
    evolution_daemon: Option<EvolutionDaemon>,
    circuits: HashMap<String, GenerationResult>,
}

impl SpatialGenerator {
    /// Create new spatial generator
    pub fn new(config: SpatialGeneratorConfig) -> Result<Self, GeneratorError> {
        let llm_client = LmStudioClient::with_config(config.llm_config.clone())
            .map_err(|e| GeneratorError::LlmError(e.to_string()))?;

        let evolution_daemon = EvolutionDaemon::new(
            config.grid_w,
            config.grid_h,
            config.evolution_config.clone(),
        );

        Ok(Self {
            config,
            llm_client,
            evolution_daemon: Some(evolution_daemon),
            circuits: HashMap::new(),
        })
    }

    /// Generate circuit from OpenSpec file
    pub fn generate_from_file<P: AsRef<Path>>(
        &mut self,
        spec_path: P,
        grid: &[CellState],
    ) -> Result<GenerationResult, GeneratorError> {
        let spec = parse_openspec_file(spec_path)
            .map_err(|e| GeneratorError::SpecError(e.to_string()))?;

        self.generate_from_spec(&spec, grid)
    }

    /// Generate circuit from OpenSpec request
    pub fn generate_from_spec(
        &mut self,
        spec: &SpecRequest,
        grid: &[CellState],
    ) -> Result<GenerationResult, GeneratorError> {
        info!("🧪 Generating circuit from spec: {}", spec.name);

        // Step 2: Hallucinate initial circuit via LLM
        let generated = self
            .llm_client
            .generate_circuit(spec)
            .map_err(|e| GeneratorError::LlmError(e.to_string()))?;

        info!("✅ LLM generated {} cells", generated.cells.len());

        // Step 3: Instantiate in idle region
        let (region, cells) = self.instantiate_circuit(&generated, grid)?;

        info!("🎯 Instantiated at region {:?}", region);

        // Step 4: Handoff to Evolution Daemon
        let experiment_id = if let Some(daemon) = &mut self.evolution_daemon {
            let exp_id = daemon.spawn_experiment(cells.clone());
            if !exp_id.is_empty() {
                info!("🧬 Handed off to evolution daemon: {}", exp_id);
                Some(exp_id)
            } else {
                warn!("⚠️  Evolution daemon failed to spawn experiment");
                None
            }
        } else {
            warn!("⚠️  Evolution daemon not available, skipping handoff");
            None
        };

        let circuit_id = format!("{}_{}", slugify(&spec.name), chrono::Utc::now().timestamp());

        let result = GenerationResult {
            circuit_id: circuit_id.clone(),
            region,
            cells,
            experiment_id,
            success: true,
        };

        self.circuits.insert(circuit_id.clone(), result.clone());

        Ok(result)
    }

    /// Find idle region and instantiate circuit
    fn instantiate_circuit(
        &self,
        generated: &GeneratedCircuit,
        grid: &[CellState],
    ) -> Result<((usize, usize), Vec<CellState>), GeneratorError> {
        // Find idle region
        let region = self.find_idle_region(grid).ok_or_else(|| {
            GeneratorError::NoIdleRegion("No 32x32 idle region available".to_string())
        })?;

        let (origin_x, origin_y) = region;

        // Convert cell definitions to CellState
        let mut cells = Vec::new();

        for cell_def in &generated.cells {
            let x = origin_x + cell_def.x as usize;
            let y = origin_y + cell_def.y as usize;

            if x >= self.config.grid_w || y >= self.config.grid_h {
                warn!("⚠️  Cell ({}, {}) exceeds grid bounds, skipping", x, y);
                continue;
            }

            let cell_state = self.cell_def_to_state(cell_def)?;
            cells.push(cell_state);
        }

        // Add membrane/wall boundaries for isolation
        cells.extend(self.create_region_boundaries(origin_x, origin_y));

        Ok((region, cells))
    }

    /// Convert CellDefinition to CellState
    fn cell_def_to_state(&self, def: &CellDefinition) -> Result<CellState, GeneratorError> {
        // Parse opcode string to actual TYPE_* constant
        let opcode_type = match def.opcode.as_str() {
            "TYPE_NOP" => 0,
            "TYPE_WALL" => 1,
            "TYPE_MEMBRANE" => 2,
            "TYPE_LDI" => 3,
            "TYPE_ADD_RR" => 4,
            "TYPE_SUB_RR" => 5,
            "TYPE_ADD_RI" => 6,
            "TYPE_SUB_RI" => 7,
            "TYPE_JZ" => 8,
            "TYPE_JMP" => 9,
            "TYPE_HALT" => 10,
            "TYPE_COPY" => 11,
            "TYPE_MOVE" => 12,
            "TYPE_SWAP" => 13,
            "TYPE_MUL" => 14,
            "TYPE_DIV" => 15,
            "TYPE_DOOR" => 16,
            "TYPE_TENSOR_GATE" => 17,
            "TYPE_AND_RI" => 18,
            "TYPE_OR_RI" => 19,
            "TYPE_XOR_RI" => 20,
            "TYPE_SHL_RI" => 21,
            "TYPE_SHR_RI" => 22,
            "TYPE_AND_RR" => 23,
            "TYPE_OR_RR" => 24,
            "TYPE_XOR_RR" => 25,
            "TYPE_SLT_RR" => 26,
            "TYPE_SLT_RI" => 27,
            "TYPE_SLTU_RR" => 28,
            "TYPE_SLTU_RI" => 29,
            "TYPE_LOAD_IND" => 30,
            "TYPE_STORE_IND" => 31,
            "TYPE_JMP_IND" => 32,
            "TYPE_SHL_RR" => 33,
            "TYPE_SHR_RR" => 34,
            "TYPE_SRA_RI" => 35,
            "TYPE_SRA_RR" => 36,
            _ => {
                return Err(GeneratorError::InvalidOpcode(format!(
                    "Unknown opcode: {}",
                    def.opcode
                )))
            }
        };

        // Determine cell type based on opcode and parameters
        // Jump instructions (TYPE_JZ, TYPE_JMP, TYPE_JMP_IND) use coordinate offsets
        // Data instructions (TYPE_LDI) use data values
        // All other instructions are just opcode cells
        match opcode_type {
            TYPE_JZ | TYPE_JMP | TYPE_JMP_IND => {
                // Jump instructions: use rel_x/rel_y, default to (0, 0) if not specified
                let rel_x = def.rel_x.unwrap_or(0);
                let rel_y = def.rel_y.unwrap_or(0);
                Ok(CellState::new(opcode_type, rel_x, rel_y))
            }
            TYPE_LDI => {
                // Data cells: use data() constructor with value
                let value = def.value.unwrap_or(0);
                Ok(CellState::data(value))
            }
            _ => {
                // Instruction cells: just opcode, no offsets or value
                Ok(CellState::new(opcode_type, 0, 0))
            }
        }
    }

    /// Create membrane/wall boundaries around region
    fn create_region_boundaries(&self, origin_x: usize, origin_y: usize) -> Vec<CellState> {
        let size = self.config.region_size;
        let mut cells = Vec::new();

        // Top and bottom rows
        for x in origin_x..(origin_x + size) {
            cells.push(CellState::new(TYPE_MEMBRANE, 0, 0));
            cells.push(CellState::new(TYPE_MEMBRANE, 0, 0));
        }

        // Left and right columns
        for y in (origin_y + 1)..(origin_y + size - 1) {
            cells.push(CellState::new(TYPE_WALL, 0, 0));
            cells.push(CellState::new(TYPE_WALL, 0, 0));
        }

        cells
    }

    /// Find idle 32x32 region
    fn find_idle_region(&self, grid: &[CellState]) -> Option<(usize, usize)> {
        let size = self.config.region_size;

        for y in 0..=(self.config.grid_h - size) {
            'outer: for x in 0..=(self.config.grid_w - size) {
                // Check if region is idle
                for dy in 0..size {
                    for dx in 0..size {
                        let offset = (y + dy) * self.config.grid_w + (x + dx);
                        if offset >= grid.len() {
                            continue 'outer;
                        }
                        let cell = &grid[offset];
                        // Consider idle if opcode_or_type is NOP (0) or WALL (1)
                        if cell.opcode_or_type != 0 && cell.opcode_or_type != TYPE_WALL {
                            continue 'outer;
                        }
                    }
                }
                return Some((x, y));
            }
        }

        None
    }

    /// Get circuit by ID
    pub fn get_circuit(&self, circuit_id: &str) -> Option<&GenerationResult> {
        self.circuits.get(circuit_id)
    }

    /// List all generated circuits
    pub fn list_circuits(&self) -> Vec<&GenerationResult> {
        self.circuits.values().collect()
    }
}

/// Simple slugify for circuit IDs
fn slugify(s: &str) -> String {
    s.chars()
        .map(|c| {
            if c.is_alphanumeric() {
                c.to_ascii_lowercase()
            } else {
                '_'
            }
        })
        .collect()
}

/// Generator errors
#[derive(Debug, thiserror::Error)]
pub enum GeneratorError {
    #[error("Spec error: {0}")]
    SpecError(String),

    #[error("LLM error: {0}")]
    LlmError(String),

    #[error("No idle region: {0}")]
    NoIdleRegion(String),

    #[error("Invalid opcode: {0}")]
    InvalidOpcode(String),

    #[error("Instantiation error: {0}")]
    InstantiationError(String),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_spatial_generator_config_default() {
        let config = SpatialGeneratorConfig::default();
        assert_eq!(config.grid_w, 512);
        assert_eq!(config.region_size, 32);
    }

    #[test]
    fn test_slugify() {
        assert_eq!(slugify("Test Circuit 123"), "test_circuit_123");
        assert_eq!(slugify("Hello, World!"), "hello__world_");
    }

    #[test]
    fn test_cell_def_to_state() {
        let config = SpatialGeneratorConfig::default();
        let generator = SpatialGenerator::new(config).unwrap();

        // Test data cell (TYPE_LDI with value)
        let cell_def = CellDefinition {
            x: 0,
            y: 0,
            opcode: "TYPE_LDI".to_string(),
            value: Some(42),
            rel_x: None,
            rel_y: None,
        };

        let state = generator.cell_def_to_state(&cell_def).unwrap();
        assert_eq!(state.opcode_or_type, 0); // TYPE_NOP for data cells
        assert_eq!(state.data_buffer, 42);

        // Test jump instruction (TYPE_JMP with coordinate offsets)
        let jump_def = CellDefinition {
            x: 1,
            y: 0,
            opcode: "TYPE_JMP".to_string(),
            value: None,
            rel_x: Some(5),
            rel_y: Some(-3),
        };

        let jump_state = generator.cell_def_to_state(&jump_def).unwrap();
        // Opcode packed with rel_x and rel_y in opcode_or_type
        assert_ne!(jump_state.opcode_or_type, 0);
    }

    #[test]
    fn test_find_idle_region() {
        let config = SpatialGeneratorConfig::default();
        let generator = SpatialGenerator::new(config).unwrap();

        // Create grid with some active cells
        let mut grid = vec![CellState::new(0, 0, 0); 512 * 512];

        // Mark the first 32x32 region (0,0) as active
        // In a 512-width grid, rows 0-31 have active cells in cols 0-31
        for y in 0..32 {
            for x in 0..32 {
                let offset = y * 512 + x;
                grid[offset].opcode_or_type = 3; // TYPE_LDI
            }
        }

        let region = generator.find_idle_region(&grid);
        // Should find a region not starting at (0,0)
        assert!(region.is_some());

        // The first 32x32 region (0,0) should be blocked by TYPE_LDI cells
        // So we should find a region starting at x >= 32 or y >= 32
        let (x, y) = region.unwrap();
        assert!(x >= 32 || y >= 32, "Found region ({},{}) should be blocked by active cells at (0,0)-(31,31)", x, y);
    }
}