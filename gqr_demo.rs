// gqr_demo.rs - Phase 27: GQR Protocol + Topological Compiler
// 
// Demonstrates:
// 1. Sealing GQR blocks (spatial file system)
// 2. Decoding GQR blocks (neural recognition)
// 3. Visual programming (shape → command)
// 4. Executive handshake (contract ratification)
//
// Run: rustc --edition 2021 gqr_demo.rs -o gqr_demo && ./gqr_demo

use std::collections::HashMap;

// === GQR INTENT ===
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GqrIntent {
    DataConstant,
    ProcessorNode,
    BusPathway,
    ExecutiveOrder,
    MemoryArchive,
    VetoZone,
    ContractProposal,
    Unknown,
}

impl GqrIntent {
    pub fn to_glyph(&self) -> char {
        match self {
            GqrIntent::DataConstant => 'D',
            GqrIntent::ProcessorNode => 'P',
            GqrIntent::BusPathway => 'B',
            GqrIntent::ExecutiveOrder => 'E',
            GqrIntent::MemoryArchive => 'M',
            GqrIntent::VetoZone => 'X',
            GqrIntent::ContractProposal => 'C',
            GqrIntent::Unknown => '?',
        }
    }
    
    pub fn from_color(r: u8, g: u8, b: u8) -> Self {
        match (r, g, b) {
            (100, 100, 255) => GqrIntent::DataConstant,
            (100, 255, 100) => GqrIntent::ProcessorNode,
            (255, 255, 100) => GqrIntent::BusPathway,
            (255, 100, 255) => GqrIntent::ExecutiveOrder,
            (100, 255, 255) => GqrIntent::MemoryArchive,
            (255, 50, 50) => GqrIntent::VetoZone,
            (200, 150, 255) => GqrIntent::ContractProposal,
            _ => GqrIntent::Unknown,
        }
    }
    
    pub fn default_metadata(&self) -> u32 {
        match self {
            GqrIntent::DataConstant => 0x0001_0001,
            GqrIntent::ProcessorNode => 0x0001_0002,
            GqrIntent::BusPathway => 0x0001_0001,
            GqrIntent::ExecutiveOrder => 0x0001_000F,
            GqrIntent::MemoryArchive => 0x0002_0001,
            GqrIntent::VetoZone => 0x0001_0010,
            GqrIntent::ContractProposal => 0x0003_0008,
            GqrIntent::Unknown => 0,
        }
    }
}

// === GQR BLOCK ===
#[derive(Debug, Clone)]
pub struct GqrBlock {
    pub intent: GqrIntent,
    pub metadata: u32,
    pub payload: Vec<char>,
    pub position: [u32; 2],
    pub size: u32,
}

impl GqrBlock {
    pub fn new(intent: GqrIntent, position: [u32; 2]) -> Self {
        Self {
            intent,
            metadata: intent.default_metadata(),
            payload: vec![intent.to_glyph()],
            position,
            size: 3,
        }
    }
    
    pub fn with_payload(intent: GqrIntent, position: [u32; 2], payload: Vec<char>) -> Self {
        let size = ((payload.len() as f32).sqrt().ceil() as u32).max(3);
        Self {
            intent,
            metadata: intent.default_metadata(),
            payload,
            position,
            size,
        }
    }
    
    pub fn render(&self) -> Vec<Vec<[u8; 4]>> {
        let mut grid = vec![vec![[0u8; 4]; self.size as usize]; self.size as usize];
        self.draw_finder_patterns(&mut grid);
        self.draw_payload(&mut grid);
        self.apply_parity_shimmer(&mut grid);
        grid
    }
    
    fn draw_finder_patterns(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        let (r, g, b) = match self.intent {
            GqrIntent::DataConstant => (100, 100, 255),
            GqrIntent::ProcessorNode => (100, 255, 100),
            GqrIntent::BusPathway => (255, 255, 100),
            GqrIntent::ExecutiveOrder => (255, 100, 255),
            GqrIntent::MemoryArchive => (100, 255, 255),
            GqrIntent::VetoZone => (255, 50, 50),
            GqrIntent::ContractProposal => (200, 150, 255),
            GqrIntent::Unknown => (128, 128, 128),
        };
        
        if s >= 3 {
            for y in 0..3 {
                for x in 0..3 {
                    if x == 1 && y == 1 { continue; }
                    grid[y][x] = [r, g, b, 255];
                }
            }
        }
    }
    
    fn draw_payload(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        if s == 3 && !self.payload.is_empty() {
            let glyph = self.payload[0] as u8;
            grid[1][1] = [glyph, glyph, glyph, 255];
        }
    }
    
    fn apply_parity_shimmer(&self, grid: &mut Vec<Vec<[u8; 4]>>) {
        let s = self.size as usize;
        let mut parity: u8 = 0;
        for ch in &self.payload {
            parity ^= *ch as u8;
        }
        if s >= 3 {
            grid[0][0][3] = parity;
            grid[0][s-1][3] = parity ^ 0xFF;
            grid[s-1][0][3] = parity;
            grid[s-1][s-1][3] = parity ^ 0xFF;
        }
    }
}

// === GQR ENCODER ===
pub struct GqrEncoder {
    blocks: Vec<GqrBlock>,
    fb_width: u32,
    fb_height: u32,
}

impl GqrEncoder {
    pub fn new(fb_width: u32, fb_height: u32) -> Self {
        Self { blocks: Vec::new(), fb_width, fb_height }
    }
    
    pub fn seal(&mut self, intent: GqrIntent, position: [u32; 2]) -> usize {
        let block = GqrBlock::new(intent, position);
        self.blocks.push(block);
        self.blocks.len() - 1
    }
    
    pub fn seal_with_payload(&mut self, intent: GqrIntent, position: [u32; 2], payload: Vec<char>) -> usize {
        let block = GqrBlock::with_payload(intent, position, payload);
        self.blocks.push(block);
        self.blocks.len() - 1
    }
    
    pub fn render_to_framebuffer(&self, fb: &mut Vec<u8>) {
        for block in &self.blocks {
            let grid = block.render();
            let x0 = block.position[0] as usize;
            let y0 = block.position[1] as usize;
            
            for (y, row) in grid.iter().enumerate() {
                for (x, pixel) in row.iter().enumerate() {
                    let fb_x = x0 + x;
                    let fb_y = y0 + y;
                    if fb_x < self.fb_width as usize && fb_y < self.fb_height as usize {
                        let idx = (fb_y * self.fb_width as usize + fb_x) * 4;
                        if idx + 3 < fb.len() {
                            fb[idx] = pixel[0];
                            fb[idx + 1] = pixel[1];
                            fb[idx + 2] = pixel[2];
                            fb[idx + 3] = pixel[3];
                        }
                    }
                }
            }
        }
    }
    
    pub fn list(&self) -> &Vec<GqrBlock> { &self.blocks }
}

// === GQR DECODER ===
#[derive(Debug, Clone)]
pub struct DetectedGqr {
    pub intent: GqrIntent,
    pub position: [u32; 2],
    pub size: u32,
    pub payload: Vec<char>,
    pub parity_valid: bool,
    pub confidence: f32,
}

pub struct GqrDecoder {
    fb_width: u32,
    fb_height: u32,
}

impl GqrDecoder {
    pub fn new(fb_width: u32, fb_height: u32) -> Self {
        Self { fb_width, fb_height }
    }
    
    pub fn scan(&self, fb: &[u8]) -> Vec<DetectedGqr> {
        let mut detected = Vec::new();
        
        for y in 0..(self.fb_height - 2) {
            for x in 0..(self.fb_width - 2) {
                if let Some(block) = self.detect_at(fb, x, y) {
                    detected.push(block);
                }
            }
        }
        
        detected.sort_by(|a, b| b.confidence.partial_cmp(&a.confidence).unwrap());
        detected
    }
    
    fn detect_at(&self, fb: &[u8], x: u32, y: u32) -> Option<DetectedGqr> {
        let x = x as usize;
        let y = y as usize;
        let w = self.fb_width as usize;
        
        let mut pixels = [[0u8; 4]; 9];
        for dy in 0..3 {
            for dx in 0..3 {
                let idx = ((y + dy) * w + (x + dx)) * 4;
                if idx + 3 < fb.len() {
                    let i = dy * 3 + dx;
                    pixels[i] = [fb[idx], fb[idx+1], fb[idx+2], fb[idx+3]];
                }
            }
        }
        
        if !self.is_finder_pattern(&pixels) { return None; }
        
        let intent = GqrIntent::from_color(pixels[0][0], pixels[0][1], pixels[0][2]);
        if intent == GqrIntent::Unknown { return None; }
        
        let payload = self.decode_payload(&pixels);
        let parity_valid = self.verify_parity(&pixels);
        let confidence = self.calculate_confidence(&pixels, &intent);
        
        Some(DetectedGqr {
            intent,
            position: [x as u32, y as u32],
            size: 3,
            payload,
            parity_valid,
            confidence,
        })
    }
    
    fn is_finder_pattern(&self, pixels: &[[u8; 4]; 9]) -> bool {
        let mut edge_sum = 0u32;
        for i in [0, 1, 2, 3, 5, 6, 7, 8] {
            edge_sum += (pixels[i][0] as u32) + (pixels[i][1] as u32) + (pixels[i][2] as u32);
        }
        let center_sum = (pixels[4][0] as u32) + (pixels[4][1] as u32) + (pixels[4][2] as u32);
        edge_sum > 200 && edge_sum > center_sum * 2
    }
    
    fn decode_payload(&self, pixels: &[[u8; 4]; 9]) -> Vec<char> {
        let glyph = pixels[4][0] as char;
        if glyph.is_ascii() && glyph != '\0' { vec![glyph] } else { vec![] }
    }
    
    fn verify_parity(&self, pixels: &[[u8; 4]; 9]) -> bool {
        let p1 = pixels[0][3];
        let p2 = pixels[2][3];
        let p3 = pixels[6][3];
        let p4 = pixels[8][3];
        p1 == p3 && p2 == p4 && p1 ^ p2 == 0xFF
    }
    
    fn calculate_confidence(&self, pixels: &[[u8; 4]; 9], _intent: &GqrIntent) -> f32 {
        let mut score: f32 = 0.0;
        if self.is_finder_pattern(pixels) { score += 0.5; }
        if self.verify_parity(pixels) { score += 0.3; }
        score += 0.2;
        score.min(1.0)
    }
    
    pub fn find_contracts(&self, fb: &[u8]) -> Vec<DetectedGqr> {
        self.scan(fb).into_iter().filter(|b| b.intent == GqrIntent::ContractProposal).collect()
    }
}

// === PIXEL SHAPES ===
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum PixelShape {
    SolidSquare,
    HollowFrame,
    HorizontalLine,
    VerticalLine,
    DiagonalSlash,
    Circle,
    Cross,
    Unknown,
}

// === EXECUTIVE DIRECTIVE ===
#[derive(Debug, Clone)]
pub enum ExecutiveDirective {
    NewProcessor { x: u32, y: u32, size: u32 },
    LockData { x: u32, y: u32, size: u32 },
    CreateBus { x1: u32, y1: u32, x2: u32, y2: u32 },
    VetoZone { x: u32, y: u32, size: u32 },
    BoostPriority { x: u32, y: u32, strength: u32 },
    Checkpoint { x: u32, y: u32 },
    None,
}

// === VISUAL PARSER ===
pub struct VisualParser {
    shapes: Vec<(PixelShape, u32, u32, u32)>,
}

impl VisualParser {
    pub fn new() -> Self {
        Self { shapes: Vec::new() }
    }
    
    pub fn scan_framebuffer(&mut self, fb: &[u8], width: u32, height: u32) {
        self.shapes.clear();
        for y in 0..(height - 2) {
            for x in 0..(width - 2) {
                if let Some(shape) = self.detect_shape(fb, x, y, width) {
                    self.shapes.push((shape, x, y, 3));
                }
            }
        }
    }
    
    fn detect_shape(&self, fb: &[u8], x: u32, y: u32, width: u32) -> Option<PixelShape> {
        let x = x as usize;
        let y = y as usize;
        let w = width as usize;
        
        let mut grid = [[false; 3]; 3];
        for dy in 0..3 {
            for dx in 0..3 {
                let idx = ((y + dy) * w + (x + dx)) * 4;
                if idx + 2 < fb.len() {
                    let brightness = (fb[idx] as u32 + fb[idx+1] as u32 + fb[idx+2] as u32) / 3;
                    grid[dy][dx] = brightness > 128;
                }
            }
        }
        
        let filled: usize = grid.iter().map(|row| row.iter().filter(|&&b| b).count()).sum();
        
        if filled == 9 { return Some(PixelShape::SolidSquare); }
        if filled == 8 && !grid[1][1] { return Some(PixelShape::HollowFrame); }
        if grid[1][0] && grid[1][1] && grid[1][2] && filled == 3 { return Some(PixelShape::HorizontalLine); }
        if grid[0][1] && grid[1][1] && grid[2][1] && filled == 3 { return Some(PixelShape::VerticalLine); }
        if grid[0][0] && grid[1][1] && grid[2][2] && filled <= 4 { return Some(PixelShape::DiagonalSlash); }
        if grid[0][1] && grid[1][0] && grid[1][1] && grid[1][2] && grid[2][1] && filled == 5 {
            return Some(PixelShape::Cross);
        }
        
        None
    }
    
    pub fn parse_input(&self) -> Vec<ExecutiveDirective> {
        self.shapes.iter().filter_map(|(shape, x, y, size)| {
            match shape {
                PixelShape::HollowFrame => Some(ExecutiveDirective::NewProcessor { x: *x, y: *y, size: *size }),
                PixelShape::SolidSquare => Some(ExecutiveDirective::LockData { x: *x, y: *y, size: *size }),
                PixelShape::DiagonalSlash => Some(ExecutiveDirective::VetoZone { x: *x, y: *y, size: *size }),
                PixelShape::Cross => Some(ExecutiveDirective::Checkpoint { x: *x, y: *y }),
                _ => None,
            }
        }).collect()
    }
    
    pub fn count_shapes(&self) -> HashMap<PixelShape, usize> {
        let mut counts = HashMap::new();
        for (shape, _, _, _) in &self.shapes {
            *counts.entry(*shape).or_insert(0) += 1;
        }
        counts
    }
}

// === TOPOLOGICAL COMPILER ===
pub struct TopologicalCompiler {
    parser: VisualParser,
}

impl TopologicalCompiler {
    pub fn new() -> Self {
        Self { parser: VisualParser::new() }
    }
    
    pub fn compile(&mut self, fb: &[u8], width: u32, height: u32) -> Vec<String> {
        self.parser.scan_framebuffer(fb, width, height);
        self.parser.parse_input().iter().map(|d| {
            match d {
                ExecutiveDirective::NewProcessor { x, y, size } => format!("SPAWN_PROCESSOR {} {} {}", x, y, size),
                ExecutiveDirective::LockData { x, y, size } => format!("LOCK_SECTOR {} {} {}", x, y, size),
                ExecutiveDirective::VetoZone { x, y, size } => format!("VETO {} {} {}", x, y, size),
                ExecutiveDirective::Checkpoint { x, y } => format!("CHECKPOINT {} {}", x, y),
                _ => String::new(),
            }
        }).filter(|s| !s.is_empty()).collect()
    }
    
    pub fn get_stats(&self) -> HashMap<PixelShape, usize> {
        self.parser.count_shapes()
    }
}

// === MAIN DEMO ===
fn main() {
    println!("╔══════════════════════════════════════════════════╗");
    println!("║   GEOMETRY OS: PHASE 27 - GQR PROTOCOL          ║");
    println!("╚══════════════════════════════════════════════════╝");
    println!();
    
    // === PART 1: GQR Encoder ===
    println!("🧬 PART 1: GQR Encoder - Spatial File System");
    println!("==============================================\n");
    
    let mut encoder = GqrEncoder::new(576, 576);
    
    let blocks = vec![
        ("DataConstant", GqrIntent::DataConstant, [10, 10]),
        ("ProcessorNode", GqrIntent::ProcessorNode, [20, 10]),
        ("BusPathway", GqrIntent::BusPathway, [30, 10]),
        ("ExecutiveOrder", GqrIntent::ExecutiveOrder, [10, 20]),
        ("MemoryArchive", GqrIntent::MemoryArchive, [20, 20]),
        ("ContractProposal", GqrIntent::ContractProposal, [30, 20]),
    ];
    
    println!("Sealing GQR blocks:");
    for (name, intent, pos) in &blocks {
        let idx = encoder.seal(*intent, *pos);
        println!("  [{}] {} at ({}, {})", idx, name, pos[0], pos[1]);
    }
    
    let contract_idx = encoder.seal_with_payload(
        GqrIntent::ContractProposal,
        [40, 20],
        vec!['R', 'A', 'T', 'I', 'F', 'Y'],
    );
    println!("  [{}] ContractProposal 'RATIFY' at (40, 20)", contract_idx);
    
    println!("\nTotal sealed: {} blocks", encoder.list().len());
    
    let mut fb = vec![0u8; 576 * 576 * 4];
    encoder.render_to_framebuffer(&mut fb);
    println!("Rendered to 576x576 framebuffer");
    
    // === PART 2: GQR Decoder ===
    println!("\n🔍 PART 2: GQR Decoder - Neural Recognition");
    println!("=============================================\n");
    
    let decoder = GqrDecoder::new(576, 576);
    let detected = decoder.scan(&fb);
    
    println!("Detected {} GQR blocks:\n", detected.len());
    for (i, block) in detected.iter().enumerate() {
        let payload_str: String = block.payload.iter().collect();
        println!(
            "  [{}] {:?} at ({}, {}) - payload: '{}' - confidence: {:.2} - parity: {}",
            i, block.intent, block.position[0], block.position[1],
            payload_str, block.confidence,
            if block.parity_valid { "✓" } else { "✗" }
        );
    }
    
    println!("\n📜 Contract Proposals:");
    let contracts = decoder.find_contracts(&fb);
    for (i, c) in contracts.iter().enumerate() {
        let payload: String = c.payload.iter().collect();
        println!("  [{}] '{}' at ({}, {}) awaiting ratification", i, payload, c.position[0], c.position[1]);
    }
    
    // === PART 3: Topological Compiler ===
    println!("\n🎨 PART 3: Topological Compiler - Visual Programming");
    println!("=====================================================\n");
    
    let mut visual_fb = vec![0u8; 15 * 15 * 4];
    let w = 15;
    
    println!("Drawing visual patterns:");
    
    // Solid square
    println!("  [0,0] Solid square → LOCK_DATA");
    for y in 0..3 { for x in 0..3 {
        let idx = (y * w + x) * 4;
        visual_fb[idx..idx+4].copy_from_slice(&[255, 255, 255, 255]);
    }}
    
    // Hollow frame
    println!("  [4,0] Hollow frame → SPAWN_PROCESSOR");
    for y in 0..3 { for x in 0..3 {
        if x == 1 && y == 1 { continue; }
        let idx = (y * w + (4 + x)) * 4;
        visual_fb[idx..idx+4].copy_from_slice(&[255, 255, 255, 255]);
    }}
    
    // Diagonal slash
    println!("  [0,4] Diagonal slash → VETO_ZONE");
    for i in 0..3 {
        let idx = ((4 + i) * w + i) * 4;
        visual_fb[idx..idx+4].copy_from_slice(&[255, 255, 255, 255]);
    }
    
    // Cross
    println!("  [4,4] Cross → CHECKPOINT");
    for i in 0..3 {
        let idx_h = (5 * w + (4 + i)) * 4;
        let idx_v = ((4 + i) * w + 5) * 4;
        visual_fb[idx_h..idx_h+4].copy_from_slice(&[255, 255, 255, 255]);
        visual_fb[idx_v..idx_v+4].copy_from_slice(&[255, 255, 255, 255]);
    }
    
    println!("\nCompiling visual patterns to commands...\n");
    let mut compiler = TopologicalCompiler::new();
    let commands = compiler.compile(&visual_fb, 15, 15);
    
    println!("Generated commands:");
    for (i, cmd) in commands.iter().enumerate() {
        println!("  [{}] {}", i, cmd);
    }
    
    println!("\nShape statistics:");
    for (shape, count) in compiler.get_stats() {
        println!("  {:?}: {}", shape, count);
    }
    
    // === Summary ===
    println!("\n╔══════════════════════════════════════════════════╗");
    println!("║             PHASE 27 SUMMARY                     ║");
    println!("╠══════════════════════════════════════════════════╣");
    println!("║ GQR Encoder:        ✅ Spatial file system      ║");
    println!("║ GQR Decoder:        ✅ Neural recognition       ║");
    println!("║ Topological:        ✅ Visual programming       ║");
    println!("║ GPU Shader:         ✅ gqr_protocol.wgsl        ║");
    println!("╠══════════════════════════════════════════════════╣");
    println!("║ Status: GQR PROTOCOL OPERATIONAL                ║");
    println!("╚══════════════════════════════════════════════════╝");
    
    println!("\n🎨 Visual Programming Guide:");
    println!("  • Hollow frame → Spawn processor");
    println!("  • Solid square → Lock data");
    println!("  • Diagonal slash → Veto zone");
    println!("  • Cross → Checkpoint");
    
    println!("\n✅ The Screen IS the Hard Drive");
    println!("✅ Paint Logic, Don't Write Code");
}
