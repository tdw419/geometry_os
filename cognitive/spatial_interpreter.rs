// spatial_interpreter.rs - Phase 30: Bytecode to Geometry
// 
// Translates bytecode streams into spatial pixel-maps for GPU execution.
// Instead of "running" code linearly, the GPU simulates the physics of instructions
// as geometric structures on the 576:1 grid.
//
// Architecture:
// ┌──────────────────────────────────────────────────────────────┐
// │  BYTECODE STREAM                                             │
// │  0x01 0x48 0x65 0x6C 0x6C 0x6F 0x02 0x03 ...                │
// │  (LOAD "Hello" PRINT)                                        │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  SPATIAL TRANSPILER                                          │
// │  ┌─────────────────────────────────────────────────────┐    │
// │  │ transpile_to_grid(bytecode) → PixelMap              │    │
// │  │                                                      │    │
// │  │  0x01 → NAND Gate (3x3)                             │    │
// │  │  0x02 → Data Pillar (3x3 solid)                     │    │
// │  │  0x03 → Output Bridge (hollow frame)                │    │
// │  │  0x04 → GQR Block (sealed memory)                   │    │
// │  └─────────────────────────────────────────────────────┘    │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  FRAMEBUFFER (576x576)                                       │
// │                                                              │
// │  Layer 0: Data Pillars (blue)                                │
// │  Layer 1: Logic Gates (cyan)                                 │
// │  Layer 2: Output Bridges (green)                             │
// │  Layer 3: GQR Blocks (violet, sealed)                        │
// │                                                              │
// │  ┌─────┐                    ┌─────┐                         │
// │  │DATA │ ════════════════► │ GATE │ ═══► ┌─────┐            │
// │  │"Hi" │   Logic Path       │ NAND │      │ OUT │            │
// │  └─────┘                    └─────┘      └─────┘            │
// │                                                              │
// └──────────────────────────────────────────────────────────────┘

use std::collections::HashMap;

/// Grid dimensions (576:1 aspect ratio)
pub const GRID_SIZE: usize = 576;
pub const GRID_AREA: usize = GRID_SIZE * GRID_SIZE;

/// Bytecode opcodes mapped to spatial structures
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Opcode {
    // Data operations
    LoadConst    = 0x01,  // Push constant to stack
    LoadVar      = 0x02,  // Load from variable
    StoreVar     = 0x03,  // Store to variable
    
    // Arithmetic
    Add          = 0x10,  // Addition
    Sub          = 0x11,  // Subtraction
    Mul          = 0x12,  // Multiplication
    Div          = 0x13,  // Division
    Mod          = 0x14,  // Modulo
    
    // Logic gates
    And          = 0x20,  // Logical AND
    Or           = 0x21,  // Logical OR
    Not          = 0x22,  // Logical NOT
    Xor          = 0x23,  // Logical XOR
    Nand         = 0x24,  // NAND gate
    Nor          = 0x25,  // NOR gate
    
    // Control flow
    Jump         = 0x30,  // Unconditional jump
    JumpIfZero   = 0x31,  // Jump if zero
    JumpIfNonZero= 0x32,  // Jump if non-zero
    Call         = 0x33,  // Function call
    Return       = 0x34,  // Function return
    Halt         = 0x3F,  // Stop execution
    
    // I/O
    Print        = 0x40,  // Output to console
    Read         = 0x41,  // Input from console
    
    // Memory
    Alloc        = 0x50,  // Allocate memory
    Free         = 0x51,  // Free memory
    LoadMem      = 0x52,  // Load from memory
    StoreMem     = 0x53,  // Store to memory
    
    // GQR/Sealed
    SealGqr      = 0x60,  // Seal as GQR block
    CallGqr      = 0x61,  // Call sealed GQR
    
    // Special
    NoOp         = 0x00,  // No operation
    Unknown      = 0xFF,  // Unknown opcode
}

impl Opcode {
    pub fn from_u8(value: u8) -> Self {
        match value {
            0x01 => Opcode::LoadConst,
            0x02 => Opcode::LoadVar,
            0x03 => Opcode::StoreVar,
            0x10 => Opcode::Add,
            0x11 => Opcode::Sub,
            0x12 => Opcode::Mul,
            0x13 => Opcode::Div,
            0x14 => Opcode::Mod,
            0x20 => Opcode::And,
            0x21 => Opcode::Or,
            0x22 => Opcode::Not,
            0x23 => Opcode::Xor,
            0x24 => Opcode::Nand,
            0x25 => Opcode::Nor,
            0x30 => Opcode::Jump,
            0x31 => Opcode::JumpIfZero,
            0x32 => Opcode::JumpIfNonZero,
            0x33 => Opcode::Call,
            0x34 => Opcode::Return,
            0x3F => Opcode::Halt,
            0x40 => Opcode::Print,
            0x41 => Opcode::Read,
            0x50 => Opcode::Alloc,
            0x51 => Opcode::Free,
            0x52 => Opcode::LoadMem,
            0x53 => Opcode::StoreMem,
            0x60 => Opcode::SealGqr,
            0x61 => Opcode::CallGqr,
            0x00 => Opcode::NoOp,
            _ => Opcode::Unknown,
        }
    }
    
    /// Get spatial structure type for this opcode
    pub fn spatial_type(&self) -> SpatialType {
        match self {
            Opcode::LoadConst | Opcode::LoadVar | Opcode::StoreVar => {
                SpatialType::DataPillar
            }
            Opcode::Add | Opcode::Sub | Opcode::Mul | Opcode::Div | Opcode::Mod => {
                SpatialType::LogicGate(GateType::Arithmetic)
            }
            Opcode::And | Opcode::Or | Opcode::Not | Opcode::Xor | 
            Opcode::Nand | Opcode::Nor => {
                SpatialType::LogicGate(GateType::Logic)
            }
            Opcode::Jump | Opcode::JumpIfZero | Opcode::JumpIfNonZero |
            Opcode::Call | Opcode::Return => {
                SpatialType::ControlPath
            }
            Opcode::Print | Opcode::Read => {
                SpatialType::OutputBridge
            }
            Opcode::Alloc | Opcode::Free | Opcode::LoadMem | Opcode::StoreMem => {
                SpatialType::MemoryBank
            }
            Opcode::SealGqr | Opcode::CallGqr => {
                SpatialType::GqrBlock
            }
            Opcode::Halt => {
                SpatialType::Terminator
            }
            Opcode::NoOp => {
                SpatialType::Noise
            }
            Opcode::Unknown => {
                SpatialType::Noise
            }
        }
    }
}

/// Spatial structure types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SpatialType {
    /// 3x3 solid block (data storage)
    DataPillar,
    
    /// 3x3 logic gate (processing)
    LogicGate(GateType),
    
    /// Hollow 3x3 frame (output)
    OutputBridge,
    
    /// Sealed memory block (GQR)
    GqrBlock,
    
    /// Control flow path
    ControlPath,
    
    /// Memory allocation block
    MemoryBank,
    
    /// End of program marker
    Terminator,
    
    /// Background noise (unmapped)
    Noise,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum GateType {
    Arithmetic,
    Logic,
}

/// A spatial coordinate on the grid
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct SpatialCoord {
    pub x: u32,
    pub y: u32,
    pub layer: u8, // 0-3 for multi-layer support
}

impl SpatialCoord {
    pub fn new(x: u32, y: u32, layer: u8) -> Self {
        Self { x, y, layer: layer.min(3) }
    }
    
    /// Convert to linear index
    pub fn to_index(&self) -> usize {
        (self.y as usize * GRID_SIZE + self.x as usize) + (self.layer as usize * GRID_AREA)
    }
}

/// A spatial structure placed on the grid
#[derive(Debug, Clone)]
pub struct SpatialStructure {
    pub coord: SpatialCoord,
    pub structure_type: SpatialType,
    pub size: u32, // Width/height (3, 5, 7, etc)
    pub data: Vec<u8>,
    pub connections: Vec<SpatialCoord>, // Connected structures
}

/// The spatial pixel map
#[derive(Debug, Clone)]
pub struct PixelMap {
    pub grid: Vec<u8>,
    pub structures: Vec<SpatialStructure>,
    pub structure_index: HashMap<(u32, u32, u8), usize>, // (x, y, layer) -> index
}

impl PixelMap {
    pub fn new() -> Self {
        Self {
            grid: vec![0; GRID_AREA * 4], // 4 layers
            structures: Vec::new(),
            structure_index: HashMap::new(),
        }
    }
    
    /// Calculate spatial coordinate from bytecode position
    pub fn calculate_spatial_coord(&self, index: usize) -> SpatialCoord {
        // Hilbert curve for better locality (simplified: row-major for now)
        let row = (index / 24) as u32; // 24 structures per row
        let col = (index % 24) as u32;
        let x = col * 24; // 24px spacing
        let y = row * 24;
        
        // Determine layer based on opcode type
        let layer = 0; // Default to layer 0
        
        SpatialCoord::new(x, y, layer)
    }
    
    /// Inject a data pillar (3x3 solid block)
    pub fn inject_data_pillar(&mut self, coord: SpatialCoord, data: &[u8]) {
        self.inject_block(coord, 3, 0x02, data); // 0x02 = blue channel
    }
    
    /// Inject a logic gate
    pub fn inject_logic_gate(&mut self, coord: SpatialCoord, gate_type: GateType) {
        let color = match gate_type {
            GateType::Arithmetic => 0x04, // Cyan
            GateType::Logic => 0x06,      // Magenta
        };
        self.inject_block(coord, 3, color, &[]);
    }
    
    /// Inject an output bridge (hollow frame)
    pub fn inject_output_bridge(&mut self, coord: SpatialCoord) {
        self.inject_frame(coord, 3, 0x05, &[]); // 0x05 = green
    }
    
    /// Inject a GQR block (sealed memory)
    pub fn inject_gqr_block(&mut self, coord: SpatialCoord, payload: &[u8]) {
        self.inject_block(coord, 3, 0x07, payload); // 0x07 = violet
    }
    
    /// Inject a solid block
    fn inject_block(&mut self, coord: SpatialCoord, size: u32, color: u8, data: &[u8]) {
        for dy in 0..size {
            for dx in 0..size {
                let x = coord.x + dx;
                let y = coord.y + dy;
                if x < GRID_SIZE as u32 && y < GRID_SIZE as u32 {
                    let idx = (y as usize * GRID_SIZE + x as usize) + (coord.layer as usize * GRID_AREA);
                    if idx < self.grid.len() {
                        self.grid[idx] = color;
                    }
                }
            }
        }
        
        // Track structure
        let structure = SpatialStructure {
            coord,
            structure_type: SpatialType::DataPillar,
            size,
            data: data.to_vec(),
            connections: Vec::new(),
        };
        
        let idx = self.structures.len();
        self.structures.push(structure);
        self.structure_index.insert((coord.x, coord.y, coord.layer), idx);
    }
    
    /// Inject a hollow frame
    fn inject_frame(&mut self, coord: SpatialCoord, size: u32, color: u8, data: &[u8]) {
        // Top and bottom edges
        for dx in 0..size {
            for &dy in &[0, size - 1] {
                let x = coord.x + dx;
                let y = coord.y + dy;
                if x < GRID_SIZE as u32 && y < GRID_SIZE as u32 {
                    let idx = (y as usize * GRID_SIZE + x as usize) + (coord.layer as usize * GRID_AREA);
                    if idx < self.grid.len() {
                        self.grid[idx] = color;
                    }
                }
            }
        }
        
        // Left and right edges
        for &dx in &[0, size - 1] {
            for dy in 0..size {
                let x = coord.x + dx;
                let y = coord.y + dy;
                if x < GRID_SIZE as u32 && y < GRID_SIZE as u32 {
                    let idx = (y as usize * GRID_SIZE + x as usize) + (coord.layer as usize * GRID_AREA);
                    if idx < self.grid.len() {
                        self.grid[idx] = color;
                    }
                }
            }
        }
        
        let structure = SpatialStructure {
            coord,
            structure_type: SpatialType::OutputBridge,
            size,
            data: data.to_vec(),
            connections: Vec::new(),
        };
        
        let idx = self.structures.len();
        self.structures.push(structure);
        self.structure_index.insert((coord.x, coord.y, coord.layer), idx);
    }
    
    /// Connect two structures with a logic path
    pub fn connect_structures(&mut self, from: SpatialCoord, to: SpatialCoord) {
        // Draw a path between structures
        let dx = (to.x as i32 - from.x as i32).signum();
        let dy = (to.y as i32 - from.y as i32).signum();
        
        let mut x = from.x as i32;
        let mut y = from.y as i32;
        
        while x != to.x as i32 || y != to.y as i32 {
            // Set path pixel
            let idx = (y as usize * GRID_SIZE + x as usize);
            if idx < self.grid.len() {
                self.grid[idx] = 0x03; // Path color
            }
            
            if x != to.x as i32 {
                x += dx;
            }
            if y != to.y as i32 {
                y += dy;
            }
        }
        
        // Update structure connections
        if let Some(&from_idx) = self.structure_index.get(&(from.x, from.y, from.layer)) {
            self.structures[from_idx].connections.push(to);
        }
    }
}

/// The spatial transpiler
pub struct SpatialTranspiler {
    pixel_map: PixelMap,
    current_layer: u8,
}

impl SpatialTranspiler {
    pub fn new() -> Self {
        Self {
            pixel_map: PixelMap::new(),
            current_layer: 0,
        }
    }
    
    /// Transpile bytecode to spatial grid
    pub fn transpile_to_grid(&mut self, bytecode: &[u8]) -> &PixelMap {
        println!("[TRANSPILER] Transpiling {} bytes to spatial geometry", bytecode.len());
        
        for (i, &op) in bytecode.iter().enumerate() {
            let opcode = Opcode::from_u8(op);
            let coord = self.pixel_map.calculate_spatial_coord(i);
            
            match opcode.spatial_type() {
                SpatialType::DataPillar => {
                    // Next byte is data
                    let data = bytecode.get(i + 1..i + 5).unwrap_or(&[0]);
                    self.pixel_map.inject_data_pillar(coord, data);
                    println!("[TRANSPILER] {:03}: {:?} -> DataPillar at ({}, {})", 
                        i, opcode, coord.x, coord.y);
                }
                SpatialType::LogicGate(gate_type) => {
                    self.pixel_map.inject_logic_gate(coord, gate_type);
                    println!("[TRANSPILER] {:03}: {:?} -> LogicGate({:?}) at ({}, {})", 
                        i, opcode, gate_type, coord.x, coord.y);
                }
                SpatialType::OutputBridge => {
                    self.pixel_map.inject_output_bridge(coord);
                    println!("[TRANSPILER] {:03}: {:?} -> OutputBridge at ({}, {})", 
                        i, opcode, coord.x, coord.y);
                }
                SpatialType::GqrBlock => {
                    let payload = bytecode.get(i + 1..i + 9).unwrap_or(&[0]);
                    self.pixel_map.inject_gqr_block(coord, payload);
                    println!("[TRANSPILER] {:03}: {:?} -> GqrBlock at ({}, {})", 
                        i, opcode, coord.x, coord.y);
                }
                SpatialType::Terminator => {
                    // Red block for halt
                    self.pixel_map.inject_block(coord, 5, 0x01, &[]);
                    println!("[TRANSPILER] {:03}: HALT -> Terminator at ({}, {})", 
                        i, coord.x, coord.y);
                }
                SpatialType::Noise => {
                    // Dim blue for noise
                    self.pixel_map.inject_block(coord, 1, 0x08, &[]);
                }
                _ => {
                    // Default handling
                    self.pixel_map.inject_block(coord, 1, 0x09, &[]);
                }
            }
        }
        
        // Connect adjacent structures
        self.connect_adjacent_structures();
        
        println!("[TRANSPILER] Map complete: {} structures, {} connections", 
            self.pixel_map.structures.len(),
            self.pixel_map.structures.iter().map(|s| s.connections.len()).sum::<usize>()
        );
        
        &self.pixel_map
    }
    
    /// Connect adjacent structures with logic paths
    fn connect_adjacent_structures(&mut self) {
        let structures = self.pixel_map.structures.clone();
        
        for i in 0..structures.len() {
            for j in (i + 1)..structures.len() {
                let s1 = &structures[i];
                let s2 = &structures[j];
                
                // Calculate distance
                let dx = (s1.coord.x as i32 - s2.coord.x as i32).abs();
                let dy = (s1.coord.y as i32 - s2.coord.y as i32).abs();
                
                // Connect if within 48px (2 structure widths)
                if dx <= 48 && dy <= 48 {
                    self.pixel_map.connect_structures(s1.coord, s2.coord);
                }
            }
        }
    }
    
    /// Get the pixel map
    pub fn get_map(&self) -> &PixelMap {
        &self.pixel_map
    }
    
    /// Export to PNG
    pub fn export_png(&self, path: &str) -> Result<(), String> {
        // Would use image crate to export
        // For now, just return success
        println!("[TRANSPILER] Would export to {}", path);
        Ok(())
    }
}

/// "Hello World" bytecode example
pub fn hello_world_bytecode() -> Vec<u8> {
    vec![
        Opcode::LoadConst as u8,      // 0x01
        b'H', b'e', b'l', b'l', b'o', // "Hello"
        Opcode::LoadConst as u8,      // 0x01
        b' ', b'W', b'o', b'r', b'l', // " Worl"
        Opcode::LoadConst as u8,      // 0x01
        b'd', 0x00, 0x00, 0x00, 0x00, // "d"
        Opcode::Print as u8,          // 0x40
        Opcode::Halt as u8,           // 0x3F
    ]
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_pixel_map_creation() {
        let map = PixelMap::new();
        assert_eq!(map.grid.len(), GRID_AREA * 4);
        assert_eq!(map.structures.len(), 0);
    }
    
    #[test]
    fn test_spatial_coord() {
        let coord = SpatialCoord::new(100, 200, 1);
        assert_eq!(coord.x, 100);
        assert_eq!(coord.y, 200);
        assert_eq!(coord.layer, 1);
    }
    
    #[test]
    fn test_opcode_conversion() {
        assert_eq!(Opcode::from_u8(0x01), Opcode::LoadConst);
        assert_eq!(Opcode::from_u8(0x40), Opcode::Print);
        assert_eq!(Opcode::from_u8(0x3F), Opcode::Halt);
        assert_eq!(Opcode::from_u8(0xFF), Opcode::Unknown);
    }
    
    #[test]
    fn test_spatial_type_mapping() {
        let op = Opcode::LoadConst;
        assert_eq!(op.spatial_type(), SpatialType::DataPillar);
        
        let op = Opcode::Add;
        assert!(matches!(op.spatial_type(), SpatialType::LogicGate(_)));
        
        let op = Opcode::Print;
        assert_eq!(op.spatial_type(), SpatialType::OutputBridge);
    }
    
    #[test]
    fn test_transpiler_hello_world() {
        let mut transpiler = SpatialTranspiler::new();
        let bytecode = hello_world_bytecode();
        let map = transpiler.transpile_to_grid(&bytecode);
        
        assert!(map.structures.len() > 0);
    }
    
    #[test]
    fn test_inject_data_pillar() {
        let mut map = PixelMap::new();
        let coord = SpatialCoord::new(10, 10, 0);
        map.inject_data_pillar(coord, &[1, 2, 3, 4]);
        
        assert_eq!(map.structures.len(), 1);
        
        // Check center pixel
        let center_idx = (11 * GRID_SIZE + 11);
        assert_eq!(map.grid[center_idx], 0x02);
    }
    
    #[test]
    fn test_inject_output_bridge() {
        let mut map = PixelMap::new();
        let coord = SpatialCoord::new(20, 20, 0);
        map.inject_output_bridge(coord);
        
        assert_eq!(map.structures.len(), 1);
        
        // Check corner pixels (should be set)
        let top_left = (20 * GRID_SIZE + 20);
        assert_eq!(map.grid[top_left], 0x05);
        
        // Check center pixel (should be 0 - hollow)
        let center = (21 * GRID_SIZE + 21);
        assert_eq!(map.grid[center], 0);
    }
}

// Phase 30 Completion Checklist:
// [x] Opcode enum with spatial mapping
// [x] SpatialType enum (DataPillar, LogicGate, etc)
// [x] PixelMap with 4-layer support
// [x] SpatialTranspiler for bytecode → grid
// [x] Structure injection (block, frame, path)
// [x] Structure connection logic
// [x] Hello World bytecode example
// [x] Unit tests
// [ ] WGSL shader for visual rendering
// [ ] Neural Gateway integration (voice output)
// [ ] GQR sealing for compiled programs
// [ ] Python bridge for external bytecode
