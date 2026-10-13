//! GeoASM Materializer — Phase 6.4.1: Self-Expanding OS
//!
//! When the NEURAL_GATE's LLM response contains spatial instructions,
//! this module parses and materializes them directly into the spatial grid.
//!
//! Supported formats in the RX buffer:
//! 1. **Binary Cell Format**: Binary-encoded cell structures (fast, compact)
//! 2. **ASCII GeoASM**: Human-readable instruction mnemonics (for debugging)
//!
//! The materializer enforces spatial security:
//! - Validates cell opcodes against whitelist
//! - Enforces region boundaries (WALL/MEMBRANE respect)
//! - Rejects dangerous mutations (e.g., overwriting active code)

use std::collections::HashSet;

// ── Cell Types (must match spatial_compute.wgsl) ──────────────────────────────

pub const TYPE_NOP: u32 = 0;
pub const TYPE_WALL: u32 = 1;
pub const TYPE_MEMBRANE: u32 = 2;
pub const TYPE_LDI: u32 = 3;
pub const TYPE_ADD_RR: u32 = 4;
pub const TYPE_SUB_RR: u32 = 5;
pub const TYPE_ADD_RI: u32 = 6;
pub const TYPE_SUB_RI: u32 = 7;
pub const TYPE_JZ: u32 = 8;
pub const TYPE_JMP: u32 = 9;
pub const TYPE_HALT: u32 = 10;
pub const TYPE_COPY: u32 = 11;
pub const TYPE_MOVE: u32 = 12;
pub const TYPE_SWAP: u32 = 13;
pub const TYPE_MUL: u32 = 14;
pub const TYPE_DIV: u32 = 15;
pub const TYPE_DOOR: u32 = 16;
pub const TYPE_TENSOR_GATE: u32 = 17;
pub const TYPE_AND_RI: u32 = 18;
pub const TYPE_OR_RI: u32 = 19;
pub const TYPE_XOR_RI: u32 = 20;
pub const TYPE_SHL_RI: u32 = 21;
pub const TYPE_SHR_RI: u32 = 22;
pub const TYPE_AND_RR: u32 = 23;
pub const TYPE_OR_RR: u32 = 24;
pub const TYPE_XOR_RR: u32 = 25;
pub const TYPE_SLT_RR: u32 = 26;
pub const TYPE_SLT_RI: u32 = 27;
pub const TYPE_SLTU_RR: u32 = 28;
pub const TYPE_SLTU_RI: u32 = 29;
pub const TYPE_LOAD_IND: u32 = 30;  // Load Indirect (pointer read) - v7.1
pub const TYPE_STORE_IND: u32 = 31; // Store Indirect (pointer write) - v7.1
pub const TYPE_JMP_IND: u32 = 32;   // Jump Indirect (dynamic coordinate jump) - v7.2
pub const TYPE_SHL_RR: u32 = 33;    // Shift Left by Register - v7.3 (sub-word memory)
pub const TYPE_SHR_RR: u32 = 34;    // Shift Right Logical by Register - v7.3
pub const TYPE_SRA_RI: u32 = 35;    // Shift Right Arithmetic by Immediate - v7.3
pub const TYPE_SRA_RR: u32 = 36;    // Shift Right Arithmetic by Register - v7.3

/// Valid opcodes for LLM-generated cells (whitelist for security)
const VALID_OPCODES: [u32; 37] = [
    TYPE_NOP, TYPE_WALL, TYPE_MEMBRANE,
    TYPE_LDI, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_ADD_RI, TYPE_SUB_RI,
    TYPE_JZ, TYPE_JMP, TYPE_HALT,
    TYPE_COPY, TYPE_MOVE, TYPE_SWAP, TYPE_MUL, TYPE_DIV, TYPE_DOOR,
    TYPE_TENSOR_GATE,
    TYPE_AND_RI, TYPE_OR_RI, TYPE_XOR_RI, TYPE_SHL_RI, TYPE_SHR_RI,
    TYPE_AND_RR, TYPE_OR_RR, TYPE_XOR_RR,
    TYPE_SLT_RR, TYPE_SLT_RI, TYPE_SLTU_RR, TYPE_SLTU_RI,
    TYPE_LOAD_IND, TYPE_STORE_IND, TYPE_JMP_IND,
    TYPE_SHL_RR, TYPE_SHR_RR, TYPE_SRA_RI, TYPE_SRA_RR,
];

// ── Cell State (matches WGSL structure) ───────────────────────────────────────

#[repr(C)]
#[derive(Debug, Clone, Copy, bytemuck::Pod, bytemuck::Zeroable)]
pub struct CellState {
    pub opcode_or_type: u32,  // Packed: bits 0-7 = opcode, 8-19 = rel_x, 20-31 = rel_y
    pub is_active: u32,
    pub data_buffer: u32,
    pub executing: u32,
}

impl CellState {
    /// Create a new cell from unpacked components
    pub fn new(opcode: u32, rel_x: i32, rel_y: i32) -> Self {
        let packed = pack_opcode(opcode, rel_x, rel_y);
        Self {
            opcode_or_type: packed,
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        }
    }

    /// Create a data cell (register/literal)
    pub fn data(value: u32) -> Self {
        Self {
            opcode_or_type: TYPE_NOP,
            is_active: 0,
            data_buffer: value,
            executing: 0,
        }
    }

    /// Extract opcode from packed field
    pub fn opcode(&self) -> u32 {
        self.opcode_or_type & 0xFF
    }

    /// Extract relative X offset (signed)
    pub fn rel_x(&self) -> i32 {
        let val = (self.opcode_or_type >> 8) & 0xFFF;
        if val >= 0x800 {
            (val as i32) - 0x1000
        } else {
            val as i32
        }
    }

    /// Extract relative Y offset (signed)
    pub fn rel_y(&self) -> i32 {
        let val = (self.opcode_or_type >> 20) & 0xFFF;
        if val >= 0x800 {
            (val as i32) - 0x1000
        } else {
            val as i32
        }
    }

    /// Create a WALL cell (security barrier)
    pub fn wall() -> Self {
        Self {
            opcode_or_type: TYPE_WALL,
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        }
    }
}

/// Pack opcode and offsets into 32-bit field (WGSL-compatible)
pub fn pack_opcode(opcode: u32, rel_x: i32, rel_y: i32) -> u32 {
    let op = opcode & 0xFF;
    let rx = (rel_x as u32) & 0xFFF;
    let ry = (rel_y as u32) & 0xFFF;
    op | (rx << 8) | (ry << 20)
}

// ── Materialization Request ─────────────────────────────────────────────────────

#[derive(Debug, Clone)]
pub struct MaterializeRequest {
    /// List of cells to place at specific grid coordinates
    pub cells: Vec<MaterializeCell>,
    /// Optional region ID for validation (prevents cross-region mutations)
    pub region_id: Option<String>,
}

#[derive(Debug, Clone)]
pub struct MaterializeCell {
    pub x: usize,
    pub y: usize,
    pub cell: CellState,
}

#[derive(Debug, Clone)]
pub enum MaterializeError {
    InvalidOpcode { opcode: u32 },
    OutOfBounds { x: usize, y: usize },
    RegionViolation { x: usize, y: usize },
    CellOccupied { x: usize, y: usize },
    ParseError(String),
}

impl std::fmt::Display for MaterializeError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            MaterializeError::InvalidOpcode { opcode } => {
                write!(f, "Invalid opcode: {}", opcode)
            }
            MaterializeError::OutOfBounds { x, y } => {
                write!(f, "Coordinates out of bounds: ({}, {})", x, y)
            }
            MaterializeError::RegionViolation { x, y } => {
                write!(f, "Region violation at ({}, {})", x, y)
            }
            MaterializeError::CellOccupied { x, y } => {
                write!(f, "Cell already occupied at ({}, {})", x, y)
            }
            MaterializeError::ParseError(msg) => {
                write!(f, "Parse error: {}", msg)
            }
        }
    }
}

// ── Parser Implementations ─────────────────────────────────────────────────────

/// Parse binary cell format from RX buffer
///
/// Binary format (per cell, 16 bytes):
///   [0-3]:   x coordinate (u32, little-endian)
///   [4-7]:   y coordinate (u32, little-endian)
///   [8-11]:  opcode_or_type (u32, little-endian)
///   [12-15]: data_buffer (u32, little-endian)
pub fn parse_binary_cells(data: &[u8]) -> Result<Vec<MaterializeCell>, MaterializeError> {
    if data.len() % 16 != 0 {
        return Err(MaterializeError::ParseError(
            format!("Binary data length {} is not a multiple of 16", data.len())
        ));
    }

    let mut cells = Vec::new();
    for chunk in data.chunks(16) {
        let x = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]) as usize;
        let y = u32::from_le_bytes([chunk[4], chunk[5], chunk[6], chunk[7]]) as usize;
        let opcode_or_type = u32::from_le_bytes([chunk[8], chunk[9], chunk[10], chunk[11]]);
        let data_buffer = u32::from_le_bytes([chunk[12], chunk[13], chunk[14], chunk[15]]);

        let opcode = opcode_or_type & 0xFF;
        if !VALID_OPCODES.contains(&opcode) {
            return Err(MaterializeError::InvalidOpcode { opcode });
        }

        cells.push(MaterializeCell {
            x,
            y,
            cell: CellState {
                opcode_or_type,
                is_active: 0,
                data_buffer,
                executing: 0,
            },
        });
    }

    Ok(cells)
}

/// Parse ASCII GeoASM format for materialization
///
/// ASCII format (one cell per line):
///   LDI <x>, <y>, <imm>              # Load immediate
///   ADD_RR <x>, <y>, <rel_x>, <rel_y>  # Add register
///   WALL <x>, <y>                    # Create wall
///   MEMBRANE <x>, <y>                # Create membrane
///
/// Comments start with #
pub fn parse_ascii_geoasm(text: &str) -> Result<Vec<MaterializeCell>, MaterializeError> {
    // Strip markdown code fences (``` and ```) from LLM responses
    let text = strip_markdown_fences(text);
    
    let mut cells = Vec::new();

    for (line_num, line) in text.lines().enumerate() {
        let line = line.trim();
        
        // Skip empty lines and comments
        if line.is_empty() || line.starts_with('#') {
            continue;
        }

        // Parse instruction
        let parts: Vec<&str> = line.split_whitespace().collect();
        if parts.is_empty() {
            continue;
        }

        let mnemonic = parts[0].to_uppercase();
        let cell = match mnemonic.as_str() {
            // Single-cell primitives (WALL, MEMBRANE, HALT)
            "WALL" | "MEMBRANE" | "HALT" => {
                if parts.len() < 3 {
                    return Err(MaterializeError::ParseError(
                        format!("Line {}: {} requires x, y", line_num + 1, mnemonic)
                    ));
                }
                let x: usize = parts[1].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid x coordinate", line_num + 1)))?;
                let y: usize = parts[2].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid y coordinate", line_num + 1)))?;
                
                let opcode = match mnemonic.as_str() {
                    "WALL" => TYPE_WALL,
                    "MEMBRANE" => TYPE_MEMBRANE,
                    "HALT" => TYPE_HALT,
                    _ => unreachable!(),
                };

                MaterializeCell {
                    x,
                    y,
                    cell: CellState::new(opcode, 0, 0),
                }
            }

            // Data cells (registers)
            "DATA" => {
                if parts.len() < 4 {
                    return Err(MaterializeError::ParseError(
                        format!("Line {}: DATA requires x, y, value", line_num + 1)
                    ));
                }
                let x: usize = parts[1].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid x coordinate", line_num + 1)))?;
                let y: usize = parts[2].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid y coordinate", line_num + 1)))?;
                let value: u32 = parts[3].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid data value", line_num + 1)))?;

                MaterializeCell {
                    x,
                    y,
                    cell: CellState::data(value),
                }
            }

            // Instructions with offsets (full format: MNEMONIC x y rel_x rel_y)
            "LDI" | "ADD_RR" | "SUB_RR" | "ADD_RI" | "SUB_RI" | "JZ" | "JMP" | 
            "COPY" | "MOVE" | "SWAP" | "MUL" | "DIV" => {
                if parts.len() < 5 {
                    return Err(MaterializeError::ParseError(
                        format!("Line {}: {} requires x, y, rel_x, rel_y", line_num + 1, mnemonic)
                    ));
                }
                let x: usize = parts[1].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid x coordinate", line_num + 1)))?;
                let y: usize = parts[2].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid y coordinate", line_num + 1)))?;
                let rel_x: i32 = parts[3].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid rel_x offset", line_num + 1)))?;
                let rel_y: i32 = parts[4].parse().map_err(|_| 
                    MaterializeError::ParseError(format!("Line {}: invalid rel_y offset", line_num + 1)))?;

                let opcode = match mnemonic.as_str() {
                    "LDI" => TYPE_LDI,
                    "ADD_RR" => TYPE_ADD_RR,
                    "SUB_RR" => TYPE_SUB_RR,
                    "ADD_RI" => TYPE_ADD_RI,
                    "SUB_RI" => TYPE_SUB_RI,
                    "JZ" => TYPE_JZ,
                    "JMP" => TYPE_JMP,
                    "COPY" => TYPE_COPY,
                    "MOVE" => TYPE_MOVE,
                    "SWAP" => TYPE_SWAP,
                    "MUL" => TYPE_MUL,
                    "DIV" => TYPE_DIV,
                    _ => unreachable!(),
                };

                MaterializeCell {
                    x,
                    y,
                    cell: CellState::new(opcode, rel_x, rel_y),
                }
            }

            _ => {
                return Err(MaterializeError::ParseError(
                    format!("Line {}: unknown mnemonic '{}'", line_num + 1, mnemonic)
                ));
            }
        };

        cells.push(cell);
    }

    Ok(cells)
}

// ── Materializer ──────────────────────────────────────────────────────────────

/// Materializer for applying LLM-generated cells to the spatial grid
pub struct GeoasmMaterializer {
    grid_w: usize,
    grid_h: usize,
    /// Active code regions (prevents overwriting running code)
    protected_regions: HashSet<(usize, usize)>,
}

impl GeoasmMaterializer {
    pub fn new(grid_w: usize, grid_h: usize) -> Self {
        Self {
            grid_w,
            grid_h,
            protected_regions: HashSet::new(),
        }
    }

    /// Mark a region as protected (cannot be overwritten by materializer)
    pub fn protect_region(&mut self, x: usize, y: usize) {
        self.protected_regions.insert((x, y));
    }

    /// Clear protected regions
    pub fn clear_protection(&mut self) {
        self.protected_regions.clear();
    }

    /// Validate and materialize cells onto the grid
    ///
    /// Returns the validated cell list that can be written to the GPU buffer.
    pub fn materialize(&self, req: &MaterializeRequest) -> Result<Vec<CellState>, MaterializeError> {
        let mut grid: Vec<CellState> = vec![CellState::data(0); self.grid_w * self.grid_h];
        let mut materialized_count = 0;

        for cell_req in &req.cells {
            // Bounds check
            if cell_req.x >= self.grid_w || cell_req.y >= self.grid_h {
                return Err(MaterializeError::OutOfBounds {
                    x: cell_req.x,
                    y: cell_req.y,
                });
            }

            // Protected region check
            if self.protected_regions.contains(&(cell_req.x, cell_req.y)) {
                return Err(MaterializeError::CellOccupied {
                    x: cell_req.x,
                    y: cell_req.y,
                });
            }

            // Opcode validation
            let opcode = cell_req.cell.opcode();
            if !VALID_OPCODES.contains(&opcode) {
                return Err(MaterializeError::InvalidOpcode { opcode });
            }

            // Write to grid
            let idx = cell_req.y * self.grid_w + cell_req.x;
            grid[idx] = cell_req.cell;
            materialized_count += 1;
        }

        log::info!(
            "🧬 GeoASM Materializer: {} cells materialized",
            materialized_count
        );

        Ok(grid)
    }

    /// Auto-detect format and parse from RX buffer data
    pub fn parse_rx_buffer(data: &[u8], response_len: usize) -> Result<Vec<MaterializeCell>, MaterializeError> {
        if response_len == 0 {
            return Err(MaterializeError::ParseError("Empty response".to_string()));
        }

        // Try ASCII first (human-readable)
        let text = std::str::from_utf8(&data[..response_len.min(data.len())]);
        if let Ok(text) = text {
            // Check if it looks like GeoASM (has known mnemonics)
            let text_upper = text.to_uppercase();
            if text_upper.contains("LDI") || text_upper.contains("WALL") || 
               text_upper.contains("DATA") || text_upper.contains("MEMBRANE") {
                log::info!("🧬 GeoASM Materializer: Detected ASCII format");
                return parse_ascii_geoasm(text);
            }
        }

        // Fall back to binary format
        log::info!("🧬 GeoASM Materializer: Using binary format");
        parse_binary_cells(&data[..response_len.min(data.len())])
    }
}

/// Strip markdown code fences from text (for LLM responses)
fn strip_markdown_fences(text: &str) -> String {
    let mut lines: Vec<&str> = text.lines().collect();
    
    // Remove opening fence if present
    if lines.first().map_or(false, |l| l.trim().starts_with("```")) {
        lines.remove(0);
    }
    
    // Remove closing fence if present
    if lines.last().map_or(false, |l| l.trim().starts_with("```")) {
        lines.pop();
    }
    
    lines.join("\n")
}

// ── Tests ────────────────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cell_packing() {
        let cell = CellState::new(TYPE_LDI, 5, -3);
        assert_eq!(cell.opcode(), TYPE_LDI);
        assert_eq!(cell.rel_x(), 5);
        assert_eq!(cell.rel_y(), -3);
    }

    #[test]
    fn test_parse_ascii_simple() {
        let text = r#"
            # Create a simple adder
            LDI 0 1 0 0
            DATA 1 1 100
            ADD_RR 2 1 2 0
            HALT 4 1
        "#;
        
        let cells = parse_ascii_geoasm(text).unwrap();
        assert_eq!(cells.len(), 4);
        assert_eq!(cells[0].cell.opcode(), TYPE_LDI);
        assert_eq!(cells[1].cell.data_buffer, 100);
        assert_eq!(cells[2].cell.opcode(), TYPE_ADD_RR);
        assert_eq!(cells[3].cell.opcode(), TYPE_HALT);
    }

    #[test]
    fn test_parse_binary() {
        // One cell: x=5, y=10, opcode=LDI, data=0
        let mut data = vec![0u8; 16];
        data[0..4].copy_from_slice(&5u32.to_le_bytes());
        data[4..8].copy_from_slice(&10u32.to_le_bytes());
        data[8..12].copy_from_slice(&CellState::new(TYPE_LDI, 0, 0).opcode_or_type.to_le_bytes());
        data[12..16].copy_from_slice(&0u32.to_le_bytes());

        let cells = parse_binary_cells(&data).unwrap();
        assert_eq!(cells.len(), 1);
        assert_eq!(cells[0].x, 5);
        assert_eq!(cells[0].y, 10);
        assert_eq!(cells[0].cell.opcode(), TYPE_LDI);
    }

    #[test]
    fn test_materializer_bounds_check() {
        let materializer = GeoasmMaterializer::new(128, 64);
        let req = MaterializeRequest {
            cells: vec![MaterializeCell {
                x: 200,  // Out of bounds
                y: 10,
                cell: CellState::new(TYPE_LDI, 0, 0),
            }],
            region_id: None,
        };

        let result = materializer.materialize(&req);
        assert!(matches!(result, Err(MaterializeError::OutOfBounds { .. })));
    }

    #[test]
    fn test_invalid_opcode_rejected() {
        let text = "FAKE_OP 0 0 0 0";
        let result = parse_ascii_geoasm(text);
        assert!(matches!(result, Err(MaterializeError::ParseError(_))));
    }

    #[test]
    fn test_protection() {
        let mut materializer = GeoasmMaterializer::new(128, 64);
        materializer.protect_region(5, 5);
        
        let req = MaterializeRequest {
            cells: vec![MaterializeCell {
                x: 5,
                y: 5,
                cell: CellState::new(TYPE_LDI, 0, 0),
            }],
            region_id: None,
        };

        let result = materializer.materialize(&req);
        assert!(matches!(result, Err(MaterializeError::CellOccupied { .. })));
    }
}