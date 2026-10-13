//! Glyph Stratum → Spatial Routing Bridge
//!
//! Phase 5.1: Integration layer that converts Glyph programs into spatial grid layouts.
//!
//! Mapping:
//! - Glyph assembly → GeoASM binary
//! - Glyph virtual registers → spatial registers (data_buffer cells)
//! - Glyph compilation → 2D grid layout
//!
//! Input format (JSON): `{"program": [[opcode, ...], ...], "memory": [...]}`
//! Output: Vector of CellState ready for GridRunner

use crate::geoasm_materializer::{CellState, TYPE_LDI, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_ADD_RI, TYPE_SUB_RI, TYPE_JZ, TYPE_JMP, TYPE_HALT, TYPE_NOP};
use serde_json::Value;
use std::path::Path;

// ── Glyph → GeoASM Opcode Mapping ─────────────────────────────────────────────

/// Map Glyph opcodes to GeoASM cell types
/// Glyph opcode numbers: 128-142 (based on native_window_program.json)
/// GeoASM opcodes: 0-16 (TYPE_NOP, TYPE_LDI, etc.)
fn map_glyph_to_geoasm(glyph_opcode: i32) -> u32 {
    match glyph_opcode {
        128 => TYPE_LDI,      // Load immediate
        208 => TYPE_JMP,      // Jump
        142 => TYPE_ADD_RR,   // Add register-register (inferred from pattern)
        141 => TYPE_HALT,     // Halt
        _ => TYPE_NOP,        // Default: no-op for unknown opcodes
    }
}

// ── Glyph Program Structure ───────────────────────────────────────────────────

/// Parsed Glyph program from JSON format
#[derive(Debug, Clone)]
pub struct GlyphProgram {
    /// Instructions: each is [opcode, register, immediate, ...]
    pub instructions: Vec<Vec<f64>>,
    /// Memory bank: 16 floats representing registers/variables
    pub memory: Vec<f64>,
}

impl GlyphProgram {
    /// Parse Glyph program from JSON file
    pub fn from_json_file<P: AsRef<Path>>(path: P) -> Result<Self, Box<dyn std::error::Error>> {
        let contents = std::fs::read_to_string(path)?;
        Self::from_json(&contents)
    }

    /// Parse Glyph program from JSON string
    pub fn from_json(json: &str) -> Result<Self, Box<dyn std::error::Error>> {
        let value: Value = serde_json::from_str(json)?;

        let instructions: Vec<Vec<f64>> = value["program"]
            .as_array()
            .map(|arr| {
                arr.iter().map(|inner| {
                    inner.as_array()
                        .map(|nums| nums.iter().filter_map(|v| v.as_f64()).collect())
                        .unwrap_or_default()
                }).collect()
            })
            .unwrap_or_default();

        let memory: Vec<f64> = value["memory"]
            .as_array()
            .map(|arr| arr.iter().filter_map(|v| v.as_f64()).collect())
            .unwrap_or_default();

        Ok(GlyphProgram { instructions, memory })
    }
}

// ── 2D Grid Layout Compiler ─────────────────────────────────────────────────────

/// Spatial grid layout compiled from Glyph program
#[derive(Debug)]
pub struct GridLayout {
    pub cells: Vec<CellState>,
    pub grid_width: usize,
    pub grid_height: usize,
}

impl GridLayout {
    /// Compile Glyph program into spatial grid layout
    ///
    /// Layout strategy:
    /// - Place instructions left-to-right, top-to-bottom
    /// - Each instruction becomes a cell at (x, y)
    /// - Memory bank becomes data cells at the bottom
    /// - Registers placed after instructions
    pub fn from_glyph_program(program: &GlyphProgram) -> Self {
        // Calculate grid dimensions
        // Use 128x64 grid as baseline (same as PathCache defaults)
        let grid_width = 128;
        let grid_height = 64;
        let total_cells = grid_width * grid_height;

        let mut cells = vec![CellState::data(0); total_cells];

        // Place instructions starting at (0, 0)
        let mut cell_idx = 0;
        for (i, instr) in program.instructions.iter().enumerate() {
            if cell_idx >= total_cells {
                eprintln!("Warning: Grid overflow at instruction {}", i);
                break;
            }

            let x = cell_idx % grid_width;
            let y = cell_idx / grid_width;

            // Extract opcode from first element
            let glyph_opcode = instr.get(0).map(|&v| v as i32).unwrap_or(0);
            let geoasm_opcode = map_glyph_to_geoasm(glyph_opcode);

            // Create instruction cell
            // TODO: Extract register/immediate offsets from instruction array
            cells[cell_idx] = CellState::new(geoasm_opcode, 0, 0);

            cell_idx += 1;
        }

        // Place memory bank as data cells after instructions
        let mem_start = cell_idx;
        for (i, &val) in program.memory.iter().enumerate() {
            let data_idx = mem_start + i;
            if data_idx >= total_cells {
                eprintln!("Warning: Grid overflow at memory index {}", i);
                break;
            }
            cells[data_idx] = CellState::data(val as u32);
        }

        GridLayout {
            cells,
            grid_width,
            grid_height,
        }
    }

    /// Convert to 1D cell array for GridRunner
    pub fn to_cell_array(&self) -> Vec<CellState> {
        self.cells.clone()
    }
}

// ── Bridge API ───────────────────────────────────────────────────────────────

/// Main bridge function: Glyph JSON → Spatial Grid Layout
///
/// Example:
/// ```ignore
/// use infinite_map_rs::spatial::glyph_bridge;
///
/// let grid_layout = glyph_bridge::compile_glyph_to_grid("program.json")?;
/// let cells = grid_layout.to_cell_array();
/// // Load into GridRunner...
/// ```
pub fn compile_glyph_to_grid<P: AsRef<Path>>(json_path: P) -> Result<GridLayout, Box<dyn std::error::Error>> {
    let program = GlyphProgram::from_json_file(json_path)?;
    Ok(GridLayout::from_glyph_program(&program))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_glyph_program() {
        let json = r#"{
            "program": [[128, 0, 100.0, 0.0, 1], [141, 0, 0.0, 0.0, 0]],
            "memory": [0.0, 100.0, 0.0, 0.0]
        }"#;

        let program = GlyphProgram::from_json(json).unwrap();
        assert_eq!(program.instructions.len(), 2);
        assert_eq!(program.memory.len(), 4);
        assert_eq!(program.instructions[0][0], 128.0);
    }

    #[test]
    fn test_opcode_mapping() {
        assert_eq!(map_glyph_to_geoasm(128), TYPE_LDI);
        assert_eq!(map_glyph_to_geoasm(208), TYPE_JMP);
        assert_eq!(map_glyph_to_geoasm(141), TYPE_HALT);
        assert_eq!(map_glyph_to_geoasm(999), TYPE_NOP);
    }

    #[test]
    fn test_grid_layout_compilation() {
        let json = r#"{
            "program": [[128, 0, 100.0, 0.0, 1], [141, 0, 0.0, 0.0, 0]],
            "memory": [42.0, 0.0, 0.0, 0.0]
        }"#;

        let program = GlyphProgram::from_json(json).unwrap();
        let layout = GridLayout::from_glyph_program(&program);

        assert_eq!(layout.grid_width, 128);
        assert_eq!(layout.grid_height, 64);

        // First cell should be LDI instruction
        assert_eq!(layout.cells[0].opcode(), TYPE_LDI);

        // Second cell should be HALT
        assert_eq!(layout.cells[1].opcode(), TYPE_HALT);

        // Memory at position 2 should have value 42
        assert_eq!(layout.cells[2].data_buffer, 42);
    }
}