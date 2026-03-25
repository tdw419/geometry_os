// code_to_map_ingestor.rs - Phase 33: Code → Spatial Geometry
// 
// Transpiles existing code (Python, C++, Rust) to spatial geometry on the 576:1 grid.
// Instead of outputting binary, we output layouts - physical blueprints
// that the RTX 5090 executes as signal propagation simulations.
//
// Usage:
//   cargo run --release --bin code-to-map-ingestor -- script.py
//
// Pipeline:
//   Code → Parser → Spatial Directives → Geometry → Physics → Output

use std::collections::HashMap;
use std::env;
use std::fs;

const GRID_WIDTH: usize = 576;
const GRID_HEIGHT: usize = 576;

/// Code element types
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum CodeElement {
    Function,
    Variable,
    Assignment,
    IfStatement,
    ElseStatement,
    WhileLoop,
    ForLoop,
    Return,
    FunctionCall,
    BinaryOp,
    Comparison,
    Identifier,
    Number,
    String,
    Comment,
    Import,
    Unknown,
}

/// Spatial structure types
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SpatialNode {
    /// 3x3 data pillar (variable storage)
    DataPillar,
    /// 3x3 logic gate (operation)
    LogicGate,
    /// 3x3 signal bridge (function call)
    SignalBridge,
    /// Hollow 3x3 frame (output)
    OutputBridge,
    /// 5x5 terminator (return/end)
    Terminator,
    /// Circular path (loop)
    LoopPath,
    /// Fork in path (conditional)
    ConditionalFork,
    /// District boundary
    DistrictBoundary,
}

/// Parsed code element
#[derive(Debug, Clone)]
pub struct ParsedElement {
    pub element_type: CodeElement,
    pub content: String,
    pub line_number: usize,
    pub children: Vec<ParsedElement>,
    pub spatial_node: Option<SpatialNode>,
}

/// Code parser
pub struct CodeParser {
    keywords: HashMap<String, CodeElement>,
}

impl CodeParser {
    pub fn new() -> Self {
        let mut keywords = HashMap::new();
        
        // Python/Rust keywords
        keywords.insert("def".to_string(), CodeElement::Function);
        keywords.insert("fn".to_string(), CodeElement::Function);
        keywords.insert("function".to_string(), CodeElement::Function);
        keywords.insert("let".to_string(), CodeElement::Variable);
        keywords.insert("var".to_string(), CodeElement::Variable);
        keywords.insert("const".to_string(), CodeElement::Variable);
        keywords.insert("if".to_string(), CodeElement::IfStatement);
        keywords.insert("else".to_string(), CodeElement::ElseStatement);
        keywords.insert("elif".to_string(), CodeElement::ElseStatement);
        keywords.insert("while".to_string(), CodeElement::WhileLoop);
        keywords.insert("for".to_string(), CodeElement::ForLoop);
        keywords.insert("return".to_string(), CodeElement::Return);
        keywords.insert("print".to_string(), CodeElement::FunctionCall);
        keywords.insert("import".to_string(), CodeElement::Import);
        keywords.insert("from".to_string(), CodeElement::Import);
        
        // Operators
        keywords.insert("=".to_string(), CodeElement::Assignment);
        keywords.insert("+".to_string(), CodeElement::BinaryOp);
        keywords.insert("-".to_string(), CodeElement::BinaryOp);
        keywords.insert("*".to_string(), CodeElement::BinaryOp);
        keywords.insert("/".to_string(), CodeElement::BinaryOp);
        keywords.insert(">".to_string(), CodeElement::Comparison);
        keywords.insert("<".to_string(), CodeElement::Comparison);
        keywords.insert("==".to_string(), CodeElement::Comparison);
        keywords.insert(">=".to_string(), CodeElement::Comparison);
        keywords.insert("<=".to_string(), CodeElement::Comparison);
        
        Self { keywords }
    }
    
    /// Parse code into elements
    pub fn parse(&self, code: &str) -> Vec<ParsedElement> {
        let lines: Vec<&str> = code.lines().collect();
        let mut elements = Vec::new();
        
        for (line_num, &line) in lines.iter().enumerate() {
            let trimmed = line.trim();
            
            // Skip empty lines and comments
            if trimmed.is_empty() || trimmed.starts_with('#') || trimmed.starts_with("//") {
                continue;
            }
            
            // Parse line
            if let Some(element) = self.parse_line(trimmed, line_num) {
                elements.push(element);
            }
        }
        
        elements
    }
    
    fn parse_line(&self, line: &str, line_num: usize) -> Option<ParsedElement> {
        let tokens: Vec<&str> = line.split_whitespace().collect();
        
        if tokens.is_empty() {
            return None;
        }
        
        let first_token = tokens[0];
        
        // Check for keywords
        if let Some(&element_type) = self.keywords.get(first_token) {
            return Some(ParsedElement {
                element_type,
                content: line.to_string(),
                line_number: line_num,
                children: Vec::new(),
                spatial_node: self.element_to_spatial(element_type),
            });
        }
        
        // Check for assignment (identifier = value)
        if tokens.len() >= 3 && tokens[1] == "=" {
            return Some(ParsedElement {
                element_type: CodeElement::Assignment,
                content: line.to_string(),
                line_number: line_num,
                children: vec![
                    ParsedElement {
                        element_type: CodeElement::Identifier,
                        content: tokens[0].to_string(),
                        line_number: line_num,
                        children: Vec::new(),
                        spatial_node: Some(SpatialNode::DataPillar),
                    },
                ],
                spatial_node: Some(SpatialNode::LogicGate),
            });
        }
        
        // Check for function call
        if tokens[0].ends_with("()") || (tokens.len() > 1 && tokens[1] == "(") {
            return Some(ParsedElement {
                element_type: CodeElement::FunctionCall,
                content: line.to_string(),
                line_number: line_num,
                children: Vec::new(),
                spatial_node: Some(SpatialNode::SignalBridge),
            });
        }
        
        // Default: identifier or expression
        Some(ParsedElement {
            element_type: CodeElement::Unknown,
            content: line.to_string(),
            line_number: line_num,
            children: Vec::new(),
            spatial_node: None,
        })
    }
    
    fn element_to_spatial(&self, element: CodeElement) -> Option<SpatialNode> {
        match element {
            CodeElement::Variable => Some(SpatialNode::DataPillar),
            CodeElement::Assignment => Some(SpatialNode::LogicGate),
            CodeElement::IfStatement => Some(SpatialNode::ConditionalFork),
            CodeElement::ElseStatement => Some(SpatialNode::ConditionalFork),
            CodeElement::WhileLoop => Some(SpatialNode::LoopPath),
            CodeElement::ForLoop => Some(SpatialNode::LoopPath),
            CodeElement::Return => Some(SpatialNode::Terminator),
            CodeElement::FunctionCall => Some(SpatialNode::SignalBridge),
            CodeElement::Function => Some(SpatialNode::DistrictBoundary),
            CodeElement::BinaryOp => Some(SpatialNode::LogicGate),
            CodeElement::Comparison => Some(SpatialNode::LogicGate),
            _ => None,
        }
    }
}

/// Spatial geometry generator from code
pub struct CodeGeometryGenerator {
    grid: Vec<u8>,
    structures: Vec<CodeStructure>,
    current_x: usize,
    current_y: usize,
    district_width: usize,
}

#[derive(Debug, Clone)]
pub struct CodeStructure {
    pub node_type: SpatialNode,
    pub x: usize,
    pub y: usize,
    pub size: usize,
    pub label: String,
    pub source_line: usize,
    pub gqr_pending: bool,
}

impl CodeGeometryGenerator {
    pub fn new() -> Self {
        Self {
            grid: vec![0u8; GRID_WIDTH * GRID_HEIGHT],
            structures: Vec::new(),
            current_x: 48,
            current_y: 48,
            district_width: 100,
        }
    }
    
    /// Generate geometry from parsed code
    pub fn generate(&mut self, elements: &[ParsedElement]) -> &[CodeStructure] {
        for element in elements {
            self.place_element(element);
        }
        
        // Connect structures with paths
        self.connect_structures();
        
        &self.structures
    }
    
    fn place_element(&mut self, element: &ParsedElement) {
        if let Some(node_type) = element.spatial_node {
            match node_type {
                SpatialNode::DataPillar => {
                    self.place_data_pillar(&element.content, element.line_number);
                }
                SpatialNode::LogicGate => {
                    self.place_logic_gate(&element.content, element.line_number);
                }
                SpatialNode::SignalBridge => {
                    self.place_signal_bridge(&element.content, element.line_number);
                }
                SpatialNode::Terminator => {
                    self.place_terminator(&element.content, element.line_number);
                }
                SpatialNode::LoopPath => {
                    self.place_loop(&element.content, element.line_number);
                }
                SpatialNode::ConditionalFork => {
                    self.place_conditional(&element.content, element.line_number);
                }
                SpatialNode::OutputBridge => {
                    self.place_output_bridge(&element.content, element.line_number);
                }
                SpatialNode::DistrictBoundary => {
                    // Start new district (function)
                    self.current_x = 48;
                    self.current_y += self.district_width + 50;
                    
                    // Draw district boundary
                    self.draw_district_boundary();
                }
            }
        }
        
        // Advance position
        self.current_x += 60;
        
        // Wrap to next row if needed
        if self.current_x >= GRID_WIDTH - 100 {
            self.current_x = 48;
            self.current_y += 60;
        }
    }
    
    fn place_data_pillar(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Place 5x5 blue data pillar
        for dy in 0..5 {
            for dx in 0..5 {
                let px = x + dx;
                let py = y + dy;
                if px < GRID_WIDTH && py < GRID_HEIGHT {
                    self.grid[py * GRID_WIDTH + px] = 0x02; // Blue
                }
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::DataPillar,
            x, y,
            size: 5,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed DataPillar at ({}, {}): {}", x, y, label);
    }
    
    fn place_logic_gate(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Place 3x3 magenta logic gate
        for dy in 0..3 {
            for dx in 0..3 {
                let px = x + dx;
                let py = y + dy;
                if px < GRID_WIDTH && py < GRID_HEIGHT {
                    self.grid[py * GRID_WIDTH + px] = 0x06; // Magenta
                }
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::LogicGate,
            x, y,
            size: 3,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed LogicGate at ({}, {}): {}", x, y, label);
    }
    
    fn place_signal_bridge(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Place 5x5 cyan signal bridge
        for dy in 0..5 {
            for dx in 0..5 {
                let px = x + dx;
                let py = y + dy;
                if px < GRID_WIDTH && py < GRID_HEIGHT {
                    self.grid[py * GRID_WIDTH + px] = 0x04; // Cyan
                }
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::SignalBridge,
            x, y,
            size: 5,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed SignalBridge at ({}, {}): {}", x, y, label);
    }
    
    fn place_terminator(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Place 7x7 red terminator
        for dy in 0..7 {
            for dx in 0..7 {
                let px = x + dx;
                let py = y + dy;
                if px < GRID_WIDTH && py < GRID_HEIGHT {
                    self.grid[py * GRID_WIDTH + px] = 0x01; // Red
                }
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::Terminator,
            x, y,
            size: 7,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed Terminator at ({}, {}): {}", x, y, label);
    }
    
    fn place_loop(&mut self, label: &str, line: usize) {
        let cx = self.current_x + 20;
        let cy = self.current_y + 20;
        let radius = 15;
        
        // Draw circular path
        for i in 0..16 {
            let angle = (i as f32 / 16.0) * std::f32::consts::TAU;
            let x = cx + (radius as f32 * angle.cos()) as usize;
            let y = cy + (radius as f32 * angle.sin()) as usize;
            
            if x < GRID_WIDTH && y < GRID_HEIGHT {
                self.grid[y * GRID_WIDTH + x] = 0x03; // Yellow path
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::LoopPath,
            x: cx, y: cy,
            size: radius * 2,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed LoopPath at ({}, {}): {}", cx, cy, label);
    }
    
    fn place_conditional(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Draw fork pattern (two paths diverging)
        for i in 0..10 {
            // Upper branch
            let px1 = x + i;
            let py1 = y - i / 2;
            if px1 < GRID_WIDTH && py1 < GRID_HEIGHT {
                self.grid[py1 * GRID_WIDTH + px1] = 0x03;
            }
            
            // Lower branch
            let px2 = x + i;
            let py2 = y + i / 2;
            if px2 < GRID_WIDTH && py2 < GRID_HEIGHT {
                self.grid[py2 * GRID_WIDTH + px2] = 0x03;
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::ConditionalFork,
            x, y,
            size: 10,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed ConditionalFork at ({}, {}): {}", x, y, label);
    }
    
    fn place_output_bridge(&mut self, label: &str, line: usize) {
        let x = self.current_x;
        let y = self.current_y;
        
        // Place 3x3 hollow green output bridge
        for dy in 0..3 {
            for dx in 0..3 {
                let is_edge = dy == 0 || dy == 2 || dx == 0 || dx == 2;
                if is_edge {
                    let px = x + dx;
                    let py = y + dy;
                    if px < GRID_WIDTH && py < GRID_HEIGHT {
                        self.grid[py * GRID_WIDTH + px] = 0x05; // Green
                    }
                }
            }
        }
        
        self.structures.push(CodeStructure {
            node_type: SpatialNode::OutputBridge,
            x, y,
            size: 3,
            label: label.to_string(),
            source_line: line,
            gqr_pending: true,
        });
        
        println!("[INGESTOR] Placed OutputBridge at ({}, {}): {}", x, y, label);
    }
    
    fn draw_district_boundary(&mut self) {
        // Draw boundary around district
        let x1 = self.current_x - 10;
        let y1 = self.current_y - 10;
        let x2 = x1 + self.district_width;
        let y2 = y1 + self.district_width;
        
        // Top and bottom
        for x in x1..x2.min(GRID_WIDTH) {
            if y1 < GRID_HEIGHT {
                self.grid[y1 * GRID_WIDTH + x] = 0x08; // Dim blue
            }
            if y2 < GRID_HEIGHT {
                self.grid[y2 * GRID_WIDTH + x] = 0x08;
            }
        }
        
        // Left and right
        for y in y1..y2.min(GRID_HEIGHT) {
            if x1 < GRID_WIDTH {
                self.grid[y * GRID_WIDTH + x1] = 0x08;
            }
            if x2 < GRID_WIDTH {
                self.grid[y * GRID_WIDTH + x2] = 0x08;
            }
        }
    }
    
    fn connect_structures(&mut self) {
        // Connect adjacent structures with yellow paths
        for i in 0..self.structures.len().saturating_sub(1) {
            let s1 = &self.structures[i];
            let s2 = &self.structures[i + 1];
            
            // Only connect if in same district
            if (s1.y as i32 - s2.y as i32).abs() < 100 {
                self.draw_path(
                    s1.x + s1.size / 2,
                    s1.y + s1.size / 2,
                    s2.x + s2.size / 2,
                    s2.y + s2.size / 2,
                );
            }
        }
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
                    self.grid[cy * GRID_WIDTH + cx] = 0x03; // Yellow
                }
            }
        }
    }
    
    pub fn get_grid(&self) -> &[u8] {
        &self.grid
    }
    
    pub fn get_structures(&self) -> &[CodeStructure] {
        &self.structures
    }
    
    pub fn get_pending_gqrs(&self) -> Vec<&CodeStructure> {
        self.structures.iter().filter(|s| s.gqr_pending).collect()
    }
}

/// Run code ingestion demo
pub fn run_ingestor_demo(code: &str) {
    println!("═══════════════════════════════════════════════════════════");
    println!("  GEOMETRY OS - CODE TO MAP INGESTOR");
    println!("  Phase 33: Existing Code → Spatial Geometry");
    println!("═══════════════════════════════════════════════════════════");
    println!();
    
    // Parse code
    println!("═══ STEP 1: CODE PARSING ═══");
    println!();
    println!("Input Code:");
    println!("{}", code);
    println!();
    
    let parser = CodeParser::new();
    let elements = parser.parse(code);
    
    println!("Parsed Elements: {}", elements.len());
    for (i, e) in elements.iter().enumerate() {
        println!("  {}: {:?} -> {:?}", i, e.element_type, e.spatial_node);
    }
    println!();
    
    // Generate geometry
    println!("═══ STEP 2: GEOMETRY GENERATION ═══");
    println!();
    
    let mut generator = CodeGeometryGenerator::new();
    let structures = generator.generate(&elements);
    
    println!("Structures Placed: {}", structures.len());
    println!();
    
    // Count by type
    let mut type_counts = HashMap::new();
    for s in structures {
        *type_counts.entry(s.node_type).or_insert(0) += 1;
    }
    
    println!("Structure Types:");
    for (node_type, count) in type_counts {
        println!("  {:?}: {}", node_type, count);
    }
    println!();
    
    // Grid stats
    let active_pixels = generator.get_grid().iter().filter(|&&p| p != 0).count();
    println!("Active Pixels: {} / {}", active_pixels, GRID_WIDTH * GRID_HEIGHT);
    println!();
    
    // Pending GQRs
    let pending = generator.get_pending_gqrs();
    println!("═══ STEP 3: GQR PROPOSALS ═══");
    println!();
    println!("Pending GQRs: {} (Violet shimmer)", pending.len());
    println!();
    
    println!("═══════════════════════════════════════════════════════════");
    println!("  CODE TRANSPILATION COMPLETE");
    println!("  Blueprint ready for physics simulation.");
    println!("═══════════════════════════════════════════════════════════");
}

fn main() {
    let args: Vec<String> = env::args().collect();
    
    // Demo code or load from file
    let code = if args.len() > 1 {
        // Load from file
        fs::read_to_string(&args[1]).unwrap_or_else(|_| {
            format!("# Could not load file: {}", args[1])
        })
    } else {
        // Demo code
        r#"def greet(name):
    message = "Hello " + name
    print(message)
    return message

x = 5
if x > 3:
    result = x * 2
else:
    result = 0

for i in range(10):
    print(i)
"#.to_string()
    };
    
    run_ingestor_demo(&code);
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_parser_function() {
        let parser = CodeParser::new();
        let elements = parser.parse("def test():\n    pass");
        
        assert!(!elements.is_empty());
        assert_eq!(elements[0].element_type, CodeElement::Function);
    }
    
    #[test]
    fn test_parser_assignment() {
        let parser = CodeParser::new();
        let elements = parser.parse("x = 5");
        
        assert!(!elements.is_empty());
        assert_eq!(elements[0].element_type, CodeElement::Assignment);
    }
    
    #[test]
    fn test_parser_loop() {
        let parser = CodeParser::new();
        let elements = parser.parse("for i in range(10):");
        
        assert!(!elements.is_empty());
        assert_eq!(elements[0].element_type, CodeElement::ForLoop);
    }
    
    #[test]
    fn test_generator_placement() {
        let parser = CodeParser::new();
        let mut generator = CodeGeometryGenerator::new();
        
        let elements = parser.parse("x = 5\ny = 10");
        let structures = generator.generate(&elements);
        
        assert!(!structures.is_empty());
        assert!(generator.get_grid().iter().any(|&p| p != 0));
    }
}
