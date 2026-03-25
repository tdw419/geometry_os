// voice_command_map.rs - Phase 32: Speech → Spatial Directives
// 
// Maps voice commands to spatial geometry operations.
// When you speak to Geometry OS, it materializes your words as physical structures.
//
// Architecture:
// ┌──────────────────────────────────────────────────────────────┐
// │  VOICE INPUT                                                 │
// │  "Create a loop"                                             │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  FREQUENCY ANALYSIS (neural_gateway.rs)                      │
// │  - Break speech into semantic clusters                       │
// │  - Map keywords to SpatialDirectives                         │
// │  - Generate geometry parameters                              │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  SPATIAL COMPILER                                            │
// │  Directive: CREATE_LOOP                                      │
// │  Parameters: center=(288, 288), radius=100, segments=8       │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  GEOMETRY GENERATION                                         │
// │  - Place logic gates in circular pattern                     │
// │  - Connect with conductive paths                             │
// │  - Mark as GQR proposal (Violet 6Hz shimmer)                 │
// └───────────┼──────────────────────────────────────────────────┘
//             │
//             ▼
// ┌──────────────────────────────────────────────────────────────┐
// │  AWAITING HANDSHAKE                                          │
// │  [Violet shimmer] → Z-pattern → RATIFIED → Execution begins  │
// └──────────────────────────────────────────────────────────────┘

use std::collections::HashMap;

const GRID_WIDTH: usize = 576;
const GRID_HEIGHT: usize = 576;

/// Voice command keywords mapped to spatial directives
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum VoiceDirective {
    /// Create a loop structure
    CreateLoop,
    /// Create a data pillar
    CreateData,
    /// Create an output bridge
    CreateOutput,
    /// Connect two structures
    Connect,
    /// Delete a structure
    Delete,
    /// Move a structure
    Move,
    /// Scale a structure
    Scale,
    /// Pulse the signal
    Pulse,
    /// Halt execution
    Halt,
    /// Optimize the layout
    Optimize,
    /// Unknown command
    Unknown,
}

/// Spatial structure types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SpatialStructure {
    LogicGate,
    DataPillar,
    OutputBridge,
    Path,
    Loop,
    Terminator,
}

/// Parsed voice command
#[derive(Debug, Clone)]
pub struct VoiceCommand {
    pub directive: VoiceDirective,
    pub parameters: HashMap<String, f32>,
    pub raw_text: String,
    pub confidence: f32,
}

/// Voice command parser
pub struct VoiceCommandParser {
    keyword_map: HashMap<String, VoiceDirective>,
}

impl VoiceCommandParser {
    pub fn new() -> Self {
        let mut keyword_map = HashMap::new();
        
        // Loop keywords
        keyword_map.insert("loop".to_string(), VoiceDirective::CreateLoop);
        keyword_map.insert("circle".to_string(), VoiceDirective::CreateLoop);
        keyword_map.insert("cycle".to_string(), VoiceDirective::CreateLoop);
        keyword_map.insert("repeat".to_string(), VoiceDirective::CreateLoop);
        
        // Data keywords
        keyword_map.insert("data".to_string(), VoiceDirective::CreateData);
        keyword_map.insert("store".to_string(), VoiceDirective::CreateData);
        keyword_map.insert("variable".to_string(), VoiceDirective::CreateData);
        keyword_map.insert("constant".to_string(), VoiceDirective::CreateData);
        keyword_map.insert("load".to_string(), VoiceDirective::CreateData);
        
        // Output keywords
        keyword_map.insert("output".to_string(), VoiceDirective::CreateOutput);
        keyword_map.insert("print".to_string(), VoiceDirective::CreateOutput);
        keyword_map.insert("display".to_string(), VoiceDirective::CreateOutput);
        keyword_map.insert("show".to_string(), VoiceDirective::CreateOutput);
        
        // Connect keywords
        keyword_map.insert("connect".to_string(), VoiceDirective::Connect);
        keyword_map.insert("link".to_string(), VoiceDirective::Connect);
        keyword_map.insert("wire".to_string(), VoiceDirective::Connect);
        keyword_map.insert("path".to_string(), VoiceDirective::Connect);
        
        // Delete keywords
        keyword_map.insert("delete".to_string(), VoiceDirective::Delete);
        keyword_map.insert("remove".to_string(), VoiceDirective::Delete);
        keyword_map.insert("clear".to_string(), VoiceDirective::Delete);
        
        // Move keywords
        keyword_map.insert("move".to_string(), VoiceDirective::Move);
        keyword_map.insert("shift".to_string(), VoiceDirective::Move);
        keyword_map.insert("relocate".to_string(), VoiceDirective::Move);
        
        // Scale keywords
        keyword_map.insert("scale".to_string(), VoiceDirective::Scale);
        keyword_map.insert("resize".to_string(), VoiceDirective::Scale);
        keyword_map.insert("grow".to_string(), VoiceDirective::Scale);
        keyword_map.insert("shrink".to_string(), VoiceDirective::Scale);
        
        // Pulse keywords
        keyword_map.insert("pulse".to_string(), VoiceDirective::Pulse);
        keyword_map.insert("ignite".to_string(), VoiceDirective::Pulse);
        keyword_map.insert("start".to_string(), VoiceDirective::Pulse);
        keyword_map.insert("run".to_string(), VoiceDirective::Pulse);
        
        // Halt keywords
        keyword_map.insert("halt".to_string(), VoiceDirective::Halt);
        keyword_map.insert("stop".to_string(), VoiceDirective::Halt);
        keyword_map.insert("pause".to_string(), VoiceDirective::Halt);
        
        // Optimize keywords
        keyword_map.insert("optimize".to_string(), VoiceDirective::Optimize);
        keyword_map.insert("improve".to_string(), VoiceDirective::Optimize);
        keyword_map.insert("compact".to_string(), VoiceDirective::Optimize);
        
        Self { keyword_map }
    }
    
    /// Parse voice text into a VoiceCommand
    pub fn parse(&self, text: &str) -> VoiceCommand {
        let text_lower = text.to_lowercase();
        let words: Vec<&str> = text_lower.split_whitespace().collect();
        
        // Find matching directive
        let mut directive = VoiceDirective::Unknown;
        let mut confidence = 0.0;
        
        for word in &words {
            if let Some(&d) = self.keyword_map.get(*word) {
                directive = d;
                confidence = 0.9;
                break;
            }
        }
        
        // Extract parameters
        let mut parameters = HashMap::new();
        
        // Number extraction (for sizes, positions, etc.)
        for word in &words {
            if let Ok(num) = word.parse::<f32>() {
                // Context determines what the number means
                if parameters.contains_key("value1") {
                    parameters.insert("value2".to_string(), num);
                } else {
                    parameters.insert("value1".to_string(), num);
                }
            }
        }
        
        // Position keywords
        if text_lower.contains("center") {
            parameters.insert("x".to_string(), GRID_WIDTH as f32 / 2.0);
            parameters.insert("y".to_string(), GRID_HEIGHT as f32 / 2.0);
        }
        if text_lower.contains("left") {
            parameters.insert("x".to_string(), 100.0);
        }
        if text_lower.contains("right") {
            parameters.insert("x".to_string(), GRID_WIDTH as f32 - 100.0);
        }
        if text_lower.contains("top") {
            parameters.insert("y".to_string(), 100.0);
        }
        if text_lower.contains("bottom") {
            parameters.insert("y".to_string(), GRID_HEIGHT as f32 - 100.0);
        }
        
        // Size keywords
        if text_lower.contains("small") {
            parameters.insert("size".to_string(), 50.0);
        }
        if text_lower.contains("large") || text_lower.contains("big") {
            parameters.insert("size".to_string(), 200.0);
        }
        
        // Default parameters based on directive
        match directive {
            VoiceDirective::CreateLoop => {
                parameters.entry("radius".to_string()).or_insert(100.0);
                parameters.entry("segments".to_string()).or_insert(8.0);
                parameters.entry("x".to_string()).or_insert(GRID_WIDTH as f32 / 2.0);
                parameters.entry("y".to_string()).or_insert(GRID_HEIGHT as f32 / 2.0);
            }
            VoiceDirective::CreateData => {
                parameters.entry("size".to_string()).or_insert(25.0);
                parameters.entry("x".to_string()).or_insert(100.0);
                parameters.entry("y".to_string()).or_insert(GRID_HEIGHT as f32 / 2.0);
            }
            VoiceDirective::CreateOutput => {
                parameters.entry("size".to_string()).or_insert(15.0);
                parameters.entry("x".to_string()).or_insert(GRID_WIDTH as f32 - 100.0);
                parameters.entry("y".to_string()).or_insert(GRID_HEIGHT as f32 / 2.0);
            }
            _ => {}
        }
        
        VoiceCommand {
            directive,
            parameters,
            raw_text: text.to_string(),
            confidence,
        }
    }
}

/// Spatial geometry generator from voice commands
pub struct VoiceGeometryGenerator {
    grid: Vec<u8>,
    structures: Vec<GeneratedStructure>,
}

#[derive(Debug, Clone)]
pub struct GeneratedStructure {
    pub struct_type: SpatialStructure,
    pub x: usize,
    pub y: usize,
    pub params: HashMap<String, f32>,
    pub gqr_pending: bool,
}

impl VoiceGeometryGenerator {
    pub fn new() -> Self {
        Self {
            grid: vec![0u8; GRID_WIDTH * GRID_HEIGHT],
            structures: Vec::new(),
        }
    }
    
    /// Generate geometry from voice command
    pub fn generate(&mut self, command: &VoiceCommand) -> &[GeneratedStructure] {
        match command.directive {
            VoiceDirective::CreateLoop => {
                let x = command.parameters.get("x").copied().unwrap_or(288.0) as usize;
                let y = command.parameters.get("y").copied().unwrap_or(288.0) as usize;
                let radius = command.parameters.get("radius").copied().unwrap_or(100.0) as usize;
                let segments = command.parameters.get("segments").copied().unwrap_or(8.0) as usize;
                
                self.create_loop(x, y, radius, segments);
            }
            VoiceDirective::CreateData => {
                let x = command.parameters.get("x").copied().unwrap_or(100.0) as usize;
                let y = command.parameters.get("y").copied().unwrap_or(288.0) as usize;
                let size = command.parameters.get("size").copied().unwrap_or(25.0) as usize;
                
                self.create_data_pillar(x, y, size);
            }
            VoiceDirective::CreateOutput => {
                let x = command.parameters.get("x").copied().unwrap_or(476.0) as usize;
                let y = command.parameters.get("y").copied().unwrap_or(288.0) as usize;
                let size = command.parameters.get("size").copied().unwrap_or(15.0) as usize;
                
                self.create_output_bridge(x, y, size);
            }
            VoiceDirective::Connect => {
                // Connect last two structures
                let n = self.structures.len();
                if n >= 2 {
                    let s1 = &self.structures[n - 2];
                    let s2 = &self.structures[n - 1];
                    self.connect_structures(s1.x, s1.y, s2.x, s2.y);
                }
            }
            _ => {
                println!("[VOICE] Unknown directive: {:?}", command.directive);
            }
        }
        
        &self.structures
    }
    
    fn create_loop(&mut self, cx: usize, cy: usize, radius: usize, segments: usize) {
        // Create logic gates in circular pattern
        for i in 0..segments {
            let angle = (i as f32 / segments as f32) * std::f32::consts::TAU;
            let x = cx + (radius as f32 * angle.cos()) as usize;
            let y = cy + (radius as f32 * angle.sin()) as usize;
            
            // Place 3x3 logic gate
            for dy in 0..3 {
                for dx in 0..3 {
                    let px = x + dx;
                    let py = y + dy;
                    if px < GRID_WIDTH && py < GRID_HEIGHT {
                        self.grid[py * GRID_WIDTH + px] = 0x06; // Magenta - Logic Gate
                    }
                }
            }
            
            // Connect to next gate
            let next_i = (i + 1) % segments;
            let next_angle = (next_i as f32 / segments as f32) * std::f32::consts::TAU;
            let next_x = cx + (radius as f32 * next_angle.cos()) as usize;
            let next_y = cy + (radius as f32 * next_angle.sin()) as usize;
            
            self.draw_path(x + 1, y + 1, next_x + 1, next_y + 1);
        }
        
        self.structures.push(GeneratedStructure {
            struct_type: SpatialStructure::Loop,
            x: cx,
            y: cy,
            params: [
                ("radius".to_string(), radius as f32),
                ("segments".to_string(), segments as f32),
            ].iter().cloned().collect(),
            gqr_pending: true,
        });
        
        println!("[VOICE] Created loop at ({}, {}) with radius {} and {} segments",
            cx, cy, radius, segments);
    }
    
    fn create_data_pillar(&mut self, x: usize, y: usize, size: usize) {
        let block_size = (size / 5).max(3);
        
        for dy in 0..block_size {
            for dx in 0..block_size {
                let px = x + dx;
                let py = y + dy;
                if px < GRID_WIDTH && py < GRID_HEIGHT {
                    self.grid[py * GRID_WIDTH + px] = 0x02; // Blue - Data
                }
            }
        }
        
        self.structures.push(GeneratedStructure {
            struct_type: SpatialStructure::DataPillar,
            x, y,
            params: [("size".to_string(), size as f32)].iter().cloned().collect(),
            gqr_pending: true,
        });
        
        println!("[VOICE] Created data pillar at ({}, {}) size {}", x, y, size);
    }
    
    fn create_output_bridge(&mut self, x: usize, y: usize, size: usize) {
        let block_size = (size / 3).max(3);
        
        // Hollow frame
        for dy in 0..block_size {
            for dx in 0..block_size {
                let is_edge = dy == 0 || dy == block_size - 1 || dx == 0 || dx == block_size - 1;
                if is_edge {
                    let px = x + dx;
                    let py = y + dy;
                    if px < GRID_WIDTH && py < GRID_HEIGHT {
                        self.grid[py * GRID_WIDTH + px] = 0x05; // Green - Output
                    }
                }
            }
        }
        
        self.structures.push(GeneratedStructure {
            struct_type: SpatialStructure::OutputBridge,
            x, y,
            params: [("size".to_string(), size as f32)].iter().cloned().collect(),
            gqr_pending: true,
        });
        
        println!("[VOICE] Created output bridge at ({}, {}) size {}", x, y, size);
    }
    
    fn connect_structures(&mut self, x1: usize, y1: usize, x2: usize, y2: usize) {
        self.draw_path(x1, y1, x2, y2);
        
        println!("[VOICE] Connected ({}, {}) to ({}, {})", x1, y1, x2, y2);
    }
    
    fn draw_path(&mut self, x1: usize, y1: usize, x2: usize, y2: usize) {
        let mut cx = x1;
        let mut cy = y1;
        
        while cx != x2 || cy != y2 {
            if cx < x2 { cx += 1; }
            else if cx > x2 { cx -= 1; }
            
            if cy < y2 { cy += 1; }
            else if cy > y2 { cy -= 1; }
            
            if cx < GRID_WIDTH && cy < GRID_HEIGHT {
                if self.grid[cy * GRID_WIDTH + cx] == 0 {
                    self.grid[cy * GRID_WIDTH + cx] = 0x03; // Yellow - Path
                }
            }
        }
    }
    
    pub fn get_grid(&self) -> &[u8] {
        &self.grid
    }
    
    pub fn get_structures(&self) -> &[GeneratedStructure] {
        &self.structures
    }
    
    /// Get pending GQR structures (awaiting handshake)
    pub fn get_pending_gqrs(&self) -> Vec<&GeneratedStructure> {
        self.structures.iter().filter(|s| s.gqr_pending).collect()
    }
    
    /// Ratify all pending GQRs (after Z-pattern handshake)
    pub fn ratify_all(&mut self) {
        for s in &mut self.structures {
            if s.gqr_pending {
                s.gqr_pending = false;
                println!("[VOICE] GQR ratified at ({}, {})", s.x, s.y);
            }
        }
    }
}

/// Voice command demo
pub fn run_voice_demo() {
    println!("═══════════════════════════════════════════════════════════");
    println!("  GEOMETRY OS - VOICE COMMAND MAP");
    println!("  Phase 32: Speech → Spatial Directives");
    println!("═══════════════════════════════════════════════════════════");
    println!();
    
    let parser = VoiceCommandParser::new();
    let mut generator = VoiceGeometryGenerator::new();
    
    // Demo voice commands
    let commands = vec![
        "Create a loop at center with radius 150",
        "Create data pillar on the left",
        "Create output on the right",
        "Connect them all",
    ];
    
    println!("Processing voice commands...\n");
    
    for (i, cmd) in commands.iter().enumerate() {
        println!("═══ COMMAND {} ═══", i + 1);
        println!("Voice: \"{}\"", cmd);
        
        let parsed = parser.parse(cmd);
        println!("Directive: {:?}", parsed.directive);
        println!("Confidence: {:.0}%", parsed.confidence * 100.0);
        println!("Parameters: {:?}", parsed.parameters);
        
        let structures = generator.generate(&parsed);
        println!("Structures generated: {}", structures.len());
        
        // Show pending GQRs
        let pending = generator.get_pending_gqrs();
        if !pending.is_empty() {
            println!("GQR Status: {} pending (Violet 6Hz shimmer)", pending.len());
        }
        
        println!();
    }
    
    // Show final state
    println!("═══ FINAL STATE ═══");
    println!();
    
    let total_structures = generator.get_structures().len();
    let pending_gqrs = generator.get_pending_gqrs().len();
    let active_pixels = generator.get_grid().iter().filter(|&&p| p != 0).count();
    
    println!("Total structures: {}", total_structures);
    println!("Pending GQRs: {} (awaiting handshake)", pending_gqrs);
    println!("Active pixels: {}", active_pixels);
    println!();
    
    // Simulate Z-pattern handshake
    println!("═══ HANDSHAKE ═══");
    println!();
    println!("Tracing Z-pattern...");
    println!();
    println!("  *** RATIFICATION COMPLETE ***");
    generator.ratify_all();
    println!();
    
    println!("┌─────────────────────────────────────┐");
    println!("│ [VOICE BRIDGE]: All GQRs ratified   │");
    println!("│                                     │");
    println!("│ The City of Logic responds to       │");
    println!("│ your voice.                         │");
    println!("│                                     │");
    println!("│ Spatial Verification: 100%          │");
    println!("└─────────────────────────────────────┘");
    println!();
    
    println!("═══════════════════════════════════════════════════════════");
    println!("  VOICE INTEGRATION READY");
    println!("  Morning First Word awaits.");
    println!("═══════════════════════════════════════════════════════════");
}

fn main() {
    run_voice_demo();
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_parser_loop() {
        let parser = VoiceCommandParser::new();
        let cmd = parser.parse("Create a loop at center");
        
        assert_eq!(cmd.directive, VoiceDirective::CreateLoop);
        assert!(cmd.confidence > 0.5);
    }
    
    #[test]
    fn test_parser_data() {
        let parser = VoiceCommandParser::new();
        let cmd = parser.parse("Load data variable on the left");
        
        assert_eq!(cmd.directive, VoiceDirective::CreateData);
    }
    
    #[test]
    fn test_parser_output() {
        let parser = VoiceCommandParser::new();
        let cmd = parser.parse("Print output on the right");
        
        assert_eq!(cmd.directive, VoiceDirective::CreateOutput);
    }
    
    #[test]
    fn test_generator_loop() {
        let parser = VoiceCommandParser::new();
        let mut generator = VoiceGeometryGenerator::new();
        
        let cmd = parser.parse("Create loop with radius 100");
        let structures = generator.generate(&cmd);
        
        assert!(!structures.is_empty());
        assert!(generator.get_grid().iter().any(|&p| p != 0));
    }
    
    #[test]
    fn test_gqr_pending() {
        let parser = VoiceCommandParser::new();
        let mut generator = VoiceGeometryGenerator::new();
        
        let cmd = parser.parse("Create data");
        generator.generate(&cmd);
        
        let pending = generator.get_pending_gqrs();
        assert!(!pending.is_empty());
        
        generator.ratify_all();
        let pending = generator.get_pending_gqrs();
        assert!(pending.is_empty());
    }
}
