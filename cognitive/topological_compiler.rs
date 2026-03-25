// topological_compiler.rs -> Shape → Command Parser
// 
// Translates visual patterns into Executive Layer (L3) directives
// "Paint logic, don't write code"

use std::collections::HashMap;

/// Visual shapes the AI recognizes as commands
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum PixelShape {
    /// 3x3 solid square - DATA constant (preserve)
    SolidSquare,
    /// 3x3 hollow frame - PROCESSOR node (compute)
    HollowFrame,
    /// Horizontal line - BUS pathway (data corridor)
    HorizontalLine,
    /// Vertical line - BUS pathway (vertical)
    VerticalLine,
    /// Diagonal slash - VETO pattern (inhibit)
    DiagonalSlash,
    /// Circle - EXECUTIVE zone (priority)
    Circle,
    /// Arrow - FLOW direction (routing)
    Arrow,
    /// Cross - CHECKPOINT (validation)
    Cross,
    /// Unknown shape
    Unknown,
}

/// Executive directive parsed from visual input
#[derive(Debug, Clone)]
pub enum ExecutiveDirective {
    /// Create new processor zone
    NewProcessor {
        x: u32,
        y: u32,
        size: u32,
    },
    /// Lock sector as immutable data
    LockData {
        x: u32,
        y: u32,
        size: u32,
    },
    /// Create high-speed data corridor
    CreateBus {
        x1: u32,
        y1: u32,
        x2: u32,
        y2: u32,
    },
    /// Inhibit/veto a zone
    VetoZone {
        x: u32,
        y: u32,
        size: u32,
    },
    /// Boost priority in zone
    BoostPriority {
        x: u32,
        y: u32,
        strength: u32,
    },
    /// Route flow in direction
    RouteFlow {
        x: u32,
        y: u32,
        direction: (i32, i32),
    },
    /// Create validation checkpoint
    Checkpoint {
        x: u32,
        y: u32,
    },
    /// No directive (noise)
    None,
}

/// Visual Parser - Recognizes shapes in framebuffer
pub struct VisualParser {
    /// Detected shapes
    shapes: Vec<(PixelShape, u32, u32, u32)>, // (shape, x, y, size)
    /// Shape detection thresholds
    thresholds: HashMap<PixelShape, f32>,
}

impl VisualParser {
    /// Create new visual parser
    pub fn new() -> Self {
        let mut thresholds = HashMap::new();
        thresholds.insert(PixelShape::SolidSquare, 0.85);
        thresholds.insert(PixelShape::HollowFrame, 0.80);
        thresholds.insert(PixelShape::HorizontalLine, 0.75);
        thresholds.insert(PixelShape::VerticalLine, 0.75);
        thresholds.insert(PixelShape::DiagonalSlash, 0.70);
        thresholds.insert(PixelShape::Circle, 0.80);
        thresholds.insert(PixelShape::Arrow, 0.70);
        thresholds.insert(PixelShape::Cross, 0.75);
        
        Self {
            shapes: Vec::new(),
            thresholds,
        }
    }
    
    /// Scan framebuffer for visual patterns
    pub fn scan_framebuffer(&mut self, fb: &[u8], width: u32, height: u32) {
        self.shapes.clear();
        
        // Scan for 3x3 clusters
        for y in 0..(height - 2) {
            for x in 0..(width - 2) {
                if let Some(shape) = self.detect_shape(fb, x, y, width) {
                    self.shapes.push((shape, x, y, 3));
                }
            }
        }
        
        // Scan for larger patterns (5x5, 7x7)
        for size in [5u32, 7].iter() {
            let s = *size;
            for y in 0..(height - s + 1) {
                for x in 0..(width - s + 1) {
                    if let Some(shape) = self.detect_shape_large(fb, x, y, width, s) {
                        self.shapes.push((shape, x, y, s));
                    }
                }
            }
        }
    }
    
    /// Detect shape in 3x3 region
    fn detect_shape(&self, fb: &[u8], x: u32, y: u32, width: u32) -> Option<PixelShape> {
        let x = x as usize;
        let y = y as usize;
        let w = width as usize;
        
        // Read 3x3 region as binary (bright = 1, dark = 0)
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
        
        // Count filled cells
        let filled: usize = grid.iter().map(|row| row.iter().filter(|&&b| b).count()).sum();
        
        // Solid square: all 9 filled
        if filled == 9 {
            return Some(PixelShape::SolidSquare);
        }
        
        // Hollow frame: 8 filled, center empty
        if filled == 8 && !grid[1][1] {
            return Some(PixelShape::HollowFrame);
        }
        
        // Horizontal line: middle row filled
        if grid[1][0] && grid[1][1] && grid[1][2] && filled == 3 {
            return Some(PixelShape::HorizontalLine);
        }
        
        // Vertical line: middle column filled
        if grid[0][1] && grid[1][1] && grid[2][1] && filled == 3 {
            return Some(PixelShape::VerticalLine);
        }
        
        // Diagonal slash: main diagonal filled
        if grid[0][0] && grid[1][1] && grid[2][2] && filled <= 4 {
            return Some(PixelShape::DiagonalSlash);
        }
        
        // Cross: center + all 4 directions
        if grid[0][1] && grid[1][0] && grid[1][1] && grid[1][2] && grid[2][1] && filled == 5 {
            return Some(PixelShape::Cross);
        }
        
        None
    }
    
    /// Detect shape in larger region (5x5, 7x7)
    fn detect_shape_large(&self, fb: &[u8], x: u32, y: u32, width: u32, size: u32) -> Option<PixelShape> {
        let x = x as usize;
        let y = y as usize;
        let s = size as usize;
        let w = width as usize;
        
        // Read region
        let mut filled_count = 0;
        let total = s * s;
        
        for dy in 0..s {
            for dx in 0..s {
                let idx = ((y + dy) * w + (x + dx)) * 4;
                if idx + 2 < fb.len() {
                    let brightness = (fb[idx] as u32 + fb[idx+1] as u32 + fb[idx+2] as u32) / 3;
                    if brightness > 128 {
                        filled_count += 1;
                    }
                }
            }
        }
        
        // Circle detection: perimeter filled, center relatively filled
        // (Approximation - check if fill ratio is ~70-80%)
        let fill_ratio = filled_count as f32 / total as f32;
        if fill_ratio > 0.6 && fill_ratio < 0.9 {
            // Could be circle - more sophisticated check needed
            return Some(PixelShape::Circle);
        }
        
        // Arrow detection: triangular shape
        // (Simplified - would need better pattern matching)
        if fill_ratio > 0.4 && fill_ratio < 0.6 {
            return Some(PixelShape::Arrow);
        }
        
        None
    }
    
    /// Parse detected shapes into executive directives
    pub fn parse_input(&self, _l3_buffer: &[u8]) -> Vec<ExecutiveDirective> {
        let mut directives = Vec::new();
        
        for (shape, x, y, size) in &self.shapes {
            let directive = match shape {
                PixelShape::HollowFrame => ExecutiveDirective::NewProcessor {
                    x: *x,
                    y: *y,
                    size: *size,
                },
                PixelShape::SolidSquare => ExecutiveDirective::LockData {
                    x: *x,
                    y: *y,
                    size: *size,
                },
                PixelShape::HorizontalLine => ExecutiveDirective::CreateBus {
                    x1: *x,
                    y1: *y + size / 2,
                    x2: *x + size,
                    y2: *y + size / 2,
                },
                PixelShape::VerticalLine => ExecutiveDirective::CreateBus {
                    x1: *x + size / 2,
                    y1: *y,
                    x2: *x + size / 2,
                    y2: *y + size,
                },
                PixelShape::DiagonalSlash => ExecutiveDirective::VetoZone {
                    x: *x,
                    y: *y,
                    size: *size,
                },
                PixelShape::Circle => ExecutiveDirective::BoostPriority {
                    x: *x,
                    y: *y,
                    strength: *size,
                },
                PixelShape::Arrow => ExecutiveDirective::RouteFlow {
                    x: *x,
                    y: *y,
                    direction: (1, 0), // Default right
                },
                PixelShape::Cross => ExecutiveDirective::Checkpoint {
                    x: *x,
                    y: *y,
                },
                PixelShape::Unknown => ExecutiveDirective::None,
            };
            
            if !matches!(directive, ExecutiveDirective::None) {
                directives.push(directive);
            }
        }
        
        directives
    }
    
    /// Get detected shapes
    pub fn get_shapes(&self) -> &Vec<(PixelShape, u32, u32, u32)> {
        &self.shapes
    }
    
    /// Count shapes by type
    pub fn count_shapes(&self) -> HashMap<PixelShape, usize> {
        let mut counts = HashMap::new();
        for (shape, _, _, _) in &self.shapes {
            *counts.entry(*shape).or_insert(0) += 1;
        }
        counts
    }
}

/// Topological Compiler - Converts directives to executable commands
pub struct TopologicalCompiler {
    /// Visual parser
    parser: VisualParser,
    /// Compiled commands
    commands: Vec<String>,
}

impl TopologicalCompiler {
    /// Create new topological compiler
    pub fn new() -> Self {
        Self {
            parser: VisualParser::new(),
            commands: Vec::new(),
        }
    }
    
    /// Compile framebuffer into commands
    pub fn compile(&mut self, fb: &[u8], width: u32, height: u32) -> Vec<String> {
        // Scan for shapes
        self.parser.scan_framebuffer(fb, width, height);
        
        // Parse into directives
        let directives = self.parser.parse_input(fb);
        
        // Convert to commands
        self.commands.clear();
        for directive in directives {
            let cmd = self.directive_to_command(&directive);
            self.commands.push(cmd);
        }
        
        self.commands.clone()
    }
    
    /// Convert directive to executable command string
    fn directive_to_command(&self, directive: &ExecutiveDirective) -> String {
        match directive {
            ExecutiveDirective::NewProcessor { x, y, size } => {
                format!("SPAWN_PROCESSOR {} {} {}", x, y, size)
            }
            ExecutiveDirective::LockData { x, y, size } => {
                format!("LOCK_SECTOR {} {} {}", x, y, size)
            }
            ExecutiveDirective::CreateBus { x1, y1, x2, y2 } => {
                format!("CREATE_BUS {} {} {} {}", x1, y1, x2, y2)
            }
            ExecutiveDirective::VetoZone { x, y, size } => {
                format!("VETO {} {} {}", x, y, size)
            }
            ExecutiveDirective::BoostPriority { x, y, strength } => {
                format!("BOOST {} {} {}", x, y, strength)
            }
            ExecutiveDirective::RouteFlow { x, y, direction } => {
                format!("ROUTE {} {} {} {}", x, y, direction.0, direction.1)
            }
            ExecutiveDirective::Checkpoint { x, y } => {
                format!("CHECKPOINT {} {}", x, y)
            }
            ExecutiveDirective::None => String::new(),
        }
    }
    
    /// Get shape statistics
    pub fn get_stats(&self) -> HashMap<PixelShape, usize> {
        self.parser.count_shapes()
    }
    
    /// Get compiled commands
    pub fn get_commands(&self) -> &Vec<String> {
        &self.commands
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    fn create_test_fb() -> Vec<u8> {
        let size = 9;
        let mut fb = vec![0u8; size * size * 4];
        
        // Draw solid square at (0, 0)
        for y in 0..3 {
            for x in 0..3 {
                let idx = (y * size + x) * 4;
                fb[idx] = 255;
                fb[idx+1] = 255;
                fb[idx+2] = 255;
                fb[idx+3] = 255;
            }
        }
        
        // Draw hollow frame at (3, 0)
        for y in 0..3 {
            for x in 0..3 {
                let idx = (y * size + (3 + x)) * 4;
                if x == 1 && y == 1 {
                    // Center empty
                    continue;
                }
                fb[idx] = 255;
                fb[idx+1] = 255;
                fb[idx+2] = 255;
                fb[idx+3] = 255;
            }
        }
        
        fb
    }
    
    #[test]
    fn test_shape_detection() {
        let fb = create_test_fb();
        let mut parser = VisualParser::new();
        parser.scan_framebuffer(&fb, 9, 9);
        
        let shapes = parser.get_shapes();
        assert!(!shapes.is_empty());
        
        // Should detect solid square and hollow frame
        let counts = parser.count_shapes();
        assert!(counts.contains_key(&PixelShape::SolidSquare));
        assert!(counts.contains_key(&PixelShape::HollowFrame));
    }
    
    #[test]
    fn test_directive_parsing() {
        let fb = create_test_fb();
        let mut parser = VisualParser::new();
        parser.scan_framebuffer(&fb, 9, 9);
        
        let directives = parser.parse_input(&fb);
        assert!(!directives.is_empty());
        
        // Should have NewProcessor and LockData directives
        let has_processor = directives.iter().any(|d| {
            matches!(d, ExecutiveDirective::NewProcessor { .. })
        });
        let has_lock = directives.iter().any(|d| {
            matches!(d, ExecutiveDirective::LockData { .. })
        });
        
        assert!(has_processor);
        assert!(has_lock);
    }
    
    #[test]
    fn test_topological_compiler() {
        let fb = create_test_fb();
        let mut compiler = TopologicalCompiler::new();
        
        let commands = compiler.compile(&fb, 9, 9);
        
        assert!(!commands.is_empty());
        
        // Should have SPAWN_PROCESSOR and LOCK_SECTOR commands
        let has_spawn = commands.iter().any(|c| c.starts_with("SPAWN_PROCESSOR"));
        let has_lock = commands.iter().any(|c| c.starts_with("LOCK_SECTOR"));
        
        assert!(has_spawn);
        assert!(has_lock);
    }
}

// Demo: Visual programming with topological compiler
fn main() {
    println!("🎨 Topological Compiler - Visual Programming");
    println!("=============================================\n");
    
    // Create test framebuffer with visual patterns
    let size = 15;
    let mut fb = vec![0u8; size * size * 4];
    
    // Draw various shapes
    let w = size;
    
    // Solid square at (0, 0) - DATA constant
    println!("Drawing shapes:");
    println!("  [0,0] Solid square (DATA)");
    for y in 0..3 {
        for x in 0..3 {
            let idx = (y * w + x) * 4;
            fb[idx] = 255;
            fb[idx+1] = 255;
            fb[idx+2] = 255;
            fb[idx+3] = 255;
        }
    }
    
    // Hollow frame at (4, 0) - PROCESSOR node
    println!("  [4,0] Hollow frame (PROCESSOR)");
    for y in 0..3 {
        for x in 0..3 {
            if x == 1 && y == 1 {
                continue;
            }
            let idx = (y * w + (4 + x)) * 4;
            fb[idx] = 255;
            fb[idx+1] = 255;
            fb[idx+2] = 255;
            fb[idx+3] = 255;
        }
    }
    
    // Horizontal line at (0, 4) - BUS pathway
    println!("  [0,4] Horizontal line (BUS)");
    for x in 0..3 {
        let idx = (4 * w + x) * 4;
        fb[idx] = 255;
        fb[idx+1] = 255;
        fb[idx+2] = 255;
        fb[idx+3] = 255;
    }
    
    // Diagonal slash at (4, 4) - VETO
    println!("  [4,4] Diagonal slash (VETO)");
    for i in 0..3 {
        let idx = ((4 + i) * w + (4 + i)) * 4;
        fb[idx] = 255;
        fb[idx+1] = 255;
        fb[idx+2] = 255;
        fb[idx+3] = 255;
    }
    
    // Cross at (8, 0) - CHECKPOINT
    println!("  [8,0] Cross (CHECKPOINT)");
    fb[(0 * w + 9) * 4] = 255;
    fb[(0 * w + 9) * 4 + 1] = 255;
    fb[(0 * w + 9) * 4 + 2] = 255;
    fb[(1 * w + 8) * 4] = 255;
    fb[(1 * w + 8) * 4 + 1] = 255;
    fb[(1 * w + 8) * 4 + 2] = 255;
    fb[(1 * w + 9) * 4] = 255;
    fb[(1 * w + 9) * 4 + 1] = 255;
    fb[(1 * w + 9) * 4 + 2] = 255;
    fb[(1 * w + 10) * 4] = 255;
    fb[(1 * w + 10) * 4 + 1] = 255;
    fb[(1 * w + 10) * 4 + 2] = 255;
    fb[(2 * w + 9) * 4] = 255;
    fb[(2 * w + 9) * 4 + 1] = 255;
    fb[(2 * w + 9) * 4 + 2] = 255;
    
    println!("\nCompiling visual input...\n");
    
    // Compile
    let mut compiler = TopologicalCompiler::new();
    let commands = compiler.compile(&fb, size, size);
    
    println!("Generated commands:");
    for (i, cmd) in commands.iter().enumerate() {
        if !cmd.is_empty() {
            println!("  [{}] {}", i, cmd);
        }
    }
    
    println!("\nShape statistics:");
    let stats = compiler.get_stats();
    for (shape, count) in &stats {
        println!("  {:?}: {}", shape, count);
    }
    
    println!("\n✅ Topological Compiler operational");
    println!("🎨 Visual programming: Paint logic, don't write code!");
}
