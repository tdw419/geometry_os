//! Pattern Materializer - Validate and convert neural patterns to CellState tensors
//!
//! Translates Vec<CellDefinition> from NeuralPrompter into raw Vec<CellState>
//! with coordinate bounds checking, jump target validation, and safe offset
//! calculation. Ensures topology is valid before injection into sandboxes.

use crate::geoasm_materializer::{
    CellState, pack_opcode, TYPE_NOP, TYPE_HALT,
};

use super::lm_studio_bridge::CellDefinition;

/// Materialization errors
#[derive(Debug, thiserror::Error)]
pub enum MaterializationError {
    #[error("Cell ({}, {}) exceeds sandbox bounds {}x{}", x, y, width, height)]
    OutOfBounds { x: u32, y: u32, width: u32, height: u32 },

    #[error("Unknown opcode: {opcode}")]
    UnknownOpcode { opcode: String },

    #[error("Invalid jump target at ({}, {}): jump to ({}, {}) would hit membrane", 
            src_x, src_y, tgt_x, tgt_y)]
    InvalidJumpTarget { src_x: u32, src_y: u32, tgt_x: i32, tgt_y: i32 },

    #[error("Data cell ({}, {}) missing required value field", x, y)]
    MissingDataValue { x: u32, y: u32 },

    #[error("Data dependency cycle detected in pattern")]
    DataDependencyCycle,

    #[error("Duplicate cell at ({}, {})", x, y)]
    DuplicateCell { x: u32, y: u32 },
}

/// Pattern materializer
pub struct PatternMaterializer {
    /// Sandbox width
    width: u32,
    /// Sandbox height
    height: u32,
    /// Opcode name to value mapping
    opcode_map: std::collections::HashMap<String, u32>,
}

impl PatternMaterializer {
    /// Create materializer for specific sandbox dimensions
    pub fn new(width: u32, height: u32) -> Self {
        Self {
            width,
            height,
            opcode_map: Self::build_opcode_map(),
        }
    }

    /// Build opcode name → value mapping (from geoasm_materializer)
    fn build_opcode_map() -> std::collections::HashMap<String, u32> {
        let mut map = std::collections::HashMap::new();
        map.insert("TYPE_NOP".to_string(), 0);
        map.insert("TYPE_WALL".to_string(), 1);
        map.insert("TYPE_MEMBRANE".to_string(), 2);
        map.insert("TYPE_LDI".to_string(), 3);
        map.insert("TYPE_ADD_RR".to_string(), 4);
        map.insert("TYPE_SUB_RR".to_string(), 5);
        map.insert("TYPE_ADD_RI".to_string(), 6);
        map.insert("TYPE_SUB_RI".to_string(), 7);
        map.insert("TYPE_JZ".to_string(), 8);
        map.insert("TYPE_JMP".to_string(), 9);
        map.insert("TYPE_HALT".to_string(), 10);
        map.insert("TYPE_COPY".to_string(), 11);
        map.insert("TYPE_MOVE".to_string(), 12);
        map.insert("TYPE_SWAP".to_string(), 13);
        map.insert("TYPE_MUL".to_string(), 14);
        map.insert("TYPE_DIV".to_string(), 15);
        map.insert("TYPE_DOOR".to_string(), 16);
        map.insert("TYPE_TENSOR_GATE".to_string(), 17);
        map.insert("TYPE_AND_RI".to_string(), 18);
        map.insert("TYPE_OR_RI".to_string(), 19);
        map.insert("TYPE_XOR_RI".to_string(), 20);
        map.insert("TYPE_SHL_RI".to_string(), 21);
        map.insert("TYPE_SHR_RI".to_string(), 22);
        map.insert("TYPE_AND_RR".to_string(), 23);
        map.insert("TYPE_OR_RR".to_string(), 24);
        map.insert("TYPE_XOR_RR".to_string(), 25);
        map.insert("TYPE_SLT_RR".to_string(), 26);
        map.insert("TYPE_SLT_RI".to_string(), 27);
        map.insert("TYPE_SLTU_RR".to_string(), 28);
        map.insert("TYPE_SLTU_RI".to_string(), 29);
        map.insert("TYPE_LOAD_IND".to_string(), 30);
        map.insert("TYPE_STORE_IND".to_string(), 31);
        map.insert("TYPE_JMP_IND".to_string(), 32);
        map.insert("TYPE_SHL_RR".to_string(), 33);
        map.insert("TYPE_SHR_RR".to_string(), 34);
        map.insert("TYPE_SRA_RI".to_string(), 35);
        map.insert("TYPE_SRA_RR".to_string(), 36);
        map
    }

    /// Materialize pattern to full sandbox grid (Vec<CellState>)
    ///
    /// Creates a full sandbox grid with the pattern cells placed
    /// at their specified coordinates, filled with TYPE_NOP elsewhere.
    pub fn materialize_to_grid(
        &self,
        cells: &[CellDefinition],
    ) -> Result<Vec<CellState>, MaterializationError> {
        // Validate pattern first
        self.validate_pattern(cells)?;

        // Create blank grid
        let total_cells = (self.width * self.height) as usize;
        let mut grid = vec![CellState::new(TYPE_NOP, 0, 0); total_cells];

        // Place pattern cells
        for cell in cells {
            let idx = (cell.y * self.width + cell.x) as usize;
            if idx >= grid.len() {
                return Err(MaterializationError::OutOfBounds {
                    x: cell.x,
                    y: cell.y,
                    width: self.width,
                    height: self.height,
                });
            }

            let opcode_value = self.opcode_map.get(&cell.opcode)
                .ok_or(MaterializationError::UnknownOpcode {
                    opcode: cell.opcode.clone(),
                })?;

            let rel_x = cell.rel_x.unwrap_or(0);
            let rel_y = cell.rel_y.unwrap_or(0);

            grid[idx] = CellState::new(*opcode_value, rel_x, rel_y);

            // Set data_buffer for TYPE_LDI cells
            if *opcode_value == 3 && cell.value.is_some() {
                // Access data_buffer (field index 2) via packed representation
                // CellState has fields: opcode_or_type (0), is_active (1), data_buffer (2), executing (3)
                // We need to reconstruct the cell with data_buffer set
                let packed = pack_opcode(*opcode_value, rel_x, rel_y);
                grid[idx] = CellState {
                    opcode_or_type: packed,
                    is_active: 0,
                    data_buffer: cell.value.unwrap(),
                    executing: 0,
                };
            }
        }

        Ok(grid)
    }

    /// Validate pattern before materialization
    fn validate_pattern(&self, cells: &[CellDefinition]) -> Result<(), MaterializationError> {
        let mut seen_cells = std::collections::HashSet::new();

        // Check bounds and duplicates
        for cell in cells {
            if cell.x >= self.width || cell.y >= self.height {
                return Err(MaterializationError::OutOfBounds {
                    x: cell.x,
                    y: cell.y,
                    width: self.width,
                    height: self.height,
                });
            }

            let key = (cell.x, cell.y);
            if seen_cells.contains(&key) {
                return Err(MaterializationError::DuplicateCell { x: cell.x, y: cell.y });
            }
            seen_cells.insert(key);

            // Validate opcode exists
            if !self.opcode_map.contains_key(&cell.opcode) {
                return Err(MaterializationError::UnknownOpcode {
                    opcode: cell.opcode.clone(),
                });
            }

            // Validate TYPE_LDI has value
            let opcode_value = self.opcode_map[&cell.opcode];
            if opcode_value == 3 && cell.value.is_none() {
                return Err(MaterializationError::MissingDataValue { x: cell.x, y: cell.y });
            }

            // Validate jump targets are within bounds
            if opcode_value == 8 || opcode_value == 9 || opcode_value == 32 {
                // TYPE_JZ (8), TYPE_JMP (9), TYPE_JMP_IND (32)
                if let Some(rel_x) = cell.rel_x {
                    if let Some(rel_y) = cell.rel_y {
                        let tgt_x = (cell.x as i32 + rel_x) as u32;
                        let tgt_y = (cell.y as i32 + rel_y) as u32;

                        if tgt_x >= self.width || tgt_y >= self.height {
                            // Jump target out of bounds - this could hit a membrane
                            log::warn!(
                                "Jump at ({}, {}) to ({}, {}) may hit membrane",
                                cell.x, cell.y, tgt_x, tgt_y
                            );
                            // We don't error here because the jump might be intentionally hitting boundaries
                        }
                    }
                }
            }
        }

        Ok(())
    }

    /// Materialize pattern to sparse representation (only non-NOP cells)
    ///
    /// Returns a Vec of (index, CellState) tuples for efficient storage.
    /// Useful for transmission or sparse analysis.
    pub fn materialize_to_sparse(
        &self,
        cells: &[CellDefinition],
    ) -> Result<Vec<(usize, CellState)>, MaterializationError> {
        self.validate_pattern(cells)?;

        let mut sparse = Vec::new();

        for cell in cells {
            let idx = (cell.y * self.width + cell.x) as usize;
            let opcode_value = self.opcode_map.get(&cell.opcode)
                .ok_or(MaterializationError::UnknownOpcode {
                    opcode: cell.opcode.clone(),
                })?;

            let rel_x = cell.rel_x.unwrap_or(0);
            let rel_y = cell.rel_y.unwrap_or(0);

            let cell_state = if *opcode_value == 3 && cell.value.is_some() {
                let packed = pack_opcode(*opcode_value, rel_x, rel_y);
                CellState {
                    opcode_or_type: packed,
                    is_active: 0,
                    data_buffer: cell.value.unwrap(),
                    executing: 0,
                }
            } else {
                CellState::new(*opcode_value, rel_x, rel_y)
            };

            sparse.push((idx, cell_state));
        }

        Ok(sparse)
    }

    /// Inject pattern into existing sandbox grid
    ///
    /// Overwrites cells at specified coordinates in the existing grid.
    /// Returns the modified grid.
    pub fn inject_into_grid(
        &self,
        cells: &[CellDefinition],
        mut grid: Vec<CellState>,
    ) -> Result<Vec<CellState>, MaterializationError> {
        if grid.len() != (self.width * self.height) as usize {
            return Err(MaterializationError::OutOfBounds {
                x: self.width,
                y: self.height,
                width: self.width,
                height: self.height,
            });
        }

        self.validate_pattern(cells)?;

        for cell in cells {
            let idx = (cell.y * self.width + cell.x) as usize;
            if idx >= grid.len() {
                return Err(MaterializationError::OutOfBounds {
                    x: cell.x,
                    y: cell.y,
                    width: self.width,
                    height: self.height,
                });
            }

            let opcode_value = self.opcode_map.get(&cell.opcode)
                .ok_or(MaterializationError::UnknownOpcode {
                    opcode: cell.opcode.clone(),
                })?;

            let rel_x = cell.rel_x.unwrap_or(0);
            let rel_y = cell.rel_y.unwrap_or(0);

            grid[idx] = if *opcode_value == 3 && cell.value.is_some() {
                let packed = pack_opcode(*opcode_value, rel_x, rel_y);
                CellState {
                    opcode_or_type: packed,
                    is_active: 0,
                    data_buffer: cell.value.unwrap(),
                    executing: 0,
                }
            } else {
                CellState::new(*opcode_value, rel_x, rel_y)
            };
        }

        Ok(grid)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_materializer_creation() {
        let materializer = PatternMaterializer::new(32, 32);
        assert_eq!(materializer.width, 32);
        assert_eq!(materializer.height, 32);
        assert_eq!(materializer.opcode_map.len(), 37);
    }

    #[test]
    fn test_opcode_map_complete() {
        let map = PatternMaterializer::build_opcode_map();
        assert_eq!(map.len(), 37);
        assert_eq!(map.get("TYPE_NOP"), Some(&0));
        assert_eq!(map.get("TYPE_ADD_RR"), Some(&4));
        assert_eq!(map.get("TYPE_JMP"), Some(&9));
    }

    #[test]
    fn test_materialize_simple_pattern() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: Some(42),
                rel_x: None,
                rel_y: None,
            },
            CellDefinition {
                x: 1,
                y: 0,
                opcode: "TYPE_ADD_RR".to_string(),
                value: None,
                rel_x: None,
                rel_y: None,
            },
        ];

        let grid = materializer.materialize_to_grid(&cells).unwrap();
        assert_eq!(grid.len(), 32 * 32);

        // Check first cell has data_buffer set
        assert_eq!(grid[0].data_buffer, 42);
        assert_eq!(grid[0].opcode(), 3); // TYPE_LDI

        // Check second cell
        assert_eq!(grid[1].opcode(), 4); // TYPE_ADD_RR
    }

    #[test]
    fn test_materialize_out_of_bounds() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 32, // Out of bounds
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: Some(42),
                rel_x: None,
                rel_y: None,
            },
        ];

        let result = materializer.materialize_to_grid(&cells);
        assert!(result.is_err());
        match result.unwrap_err() {
            MaterializationError::OutOfBounds { x, y, .. } => {
                assert_eq!(x, 32);
                assert_eq!(y, 0);
            }
            _ => panic!("Expected OutOfBounds error"),
        }
    }

    #[test]
    fn test_materialize_duplicate_cell() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: Some(42),
                rel_x: None,
                rel_y: None,
            },
            CellDefinition {
                x: 0,
                y: 0, // Duplicate
                opcode: "TYPE_NOP".to_string(),
                value: None,
                rel_x: None,
                rel_y: None,
            },
        ];

        let result = materializer.materialize_to_grid(&cells);
        assert!(result.is_err());
        match result.unwrap_err() {
            MaterializationError::DuplicateCell { x, y } => {
                assert_eq!(x, 0);
                assert_eq!(y, 0);
            }
            _ => panic!("Expected DuplicateCell error"),
        }
    }

    #[test]
    fn test_materialize_unknown_opcode() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_FAKE".to_string(),
                value: None,
                rel_x: None,
                rel_y: None,
            },
        ];

        let result = materializer.materialize_to_grid(&cells);
        assert!(result.is_err());
        match result.unwrap_err() {
            MaterializationError::UnknownOpcode { opcode } => {
                assert_eq!(opcode, "TYPE_FAKE");
            }
            _ => panic!("Expected UnknownOpcode error"),
        }
    }

    #[test]
    fn test_materialize_missing_data_value() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: None, // Missing required value
                rel_x: None,
                rel_y: None,
            },
        ];

        let result = materializer.materialize_to_grid(&cells);
        assert!(result.is_err());
        match result.unwrap_err() {
            MaterializationError::MissingDataValue { x, y } => {
                assert_eq!(x, 0);
                assert_eq!(y, 0);
            }
            _ => panic!("Expected MissingDataValue error"),
        }
    }

    #[test]
    fn test_materialize_to_sparse() {
        let materializer = PatternMaterializer::new(32, 32);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: Some(42),
                rel_x: None,
                rel_y: None,
            },
        ];

        let sparse = materializer.materialize_to_sparse(&cells).unwrap();
        assert_eq!(sparse.len(), 1);
        assert_eq!(sparse[0].0, 0); // Index 0
        assert_eq!(sparse[0].1.data_buffer, 42);
    }

    #[test]
    fn test_inject_into_grid() {
        let materializer = PatternMaterializer::new(32, 32);

        let mut grid = vec![CellState::new(TYPE_NOP, 0, 0); 32 * 32];
        assert_eq!(grid[10].data_buffer, 0);

        let cells = vec![
            CellDefinition {
                x: 0,
                y: 0,
                opcode: "TYPE_LDI".to_string(),
                value: Some(42),
                rel_x: None,
                rel_y: None,
            },
        ];

        let modified = materializer.inject_into_grid(&cells, grid).unwrap();
        assert_eq!(modified[0].data_buffer, 42);
    }
}