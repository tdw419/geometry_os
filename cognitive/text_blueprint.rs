// text_blueprint.rs - Phase 32: Documents → Executable Maps
// 
// This module treats text files (like markdown, code comments) as architectural blueprints
// that the Geometry OS can execute them as physical simulations.
//
// Usage:
//   cargo run --release --bin text-blueprint -- input.txt
//
// Pipeline:
//   Document → Semantic Parser → Topological Map → Physics → Output

use std::collections::HashMap;
use std::fs;

const GRID_WIDTH: usize = 576;
const GRID_HEIGHT: usize = 576;

/// Semantic element types
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SemanticElement {
    Heading,
    Paragraph,
    CodeBlock,
    List,
    Table,
}

/// Text structure types
#[derive(Debug, Clone)]
pub enum TextStructure {
    Section,
    Function,
    Loop,
    Conditional,
    Variable,
}

/// Parsed text element
#[derive(Debug, Clone)]
pub struct TextElement {
    pub element_type: SemanticElement,
    pub structure_type: TextStructure,
    pub content: String,
    pub line_number: usize,
    pub spatial_map: Option<SpatialDirective>,
}

/// Text blueprint parser
pub struct TextBlueprintParser {
    keyword_map: HashMap<String, SemanticElement>,
}

impl TextBlueprintParser {
    pub fn new() -> Self {
        let mut keyword_map = HashMap::new();
        
        // Code block indicators
        keyword_map.insert("fn".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("function".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("def".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("loop".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("for".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("while".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("if".to_string(), SemanticElement::CodeBlock);
        keyword_map.insert("return".to_string(), SemanticElement::CodeBlock);
        
        // Variable indicators
        keyword_map.insert("let".to_string(), SemanticElement::Variable);
        keyword_map.insert("var".to_string(), SemanticElement::Variable);
        keyword_map.insert("const".to_string(), SemanticElement::Variable);
        
        // List indicators
        keyword_map.insert("-".to_string(), SemanticElement::List);
        keyword_map.insert("*".to_string(), SemanticElement::List);
        
        // Heading indicators
        for i in 1..=6 {
            keyword_map.insert(format!("# {}", SemanticElement::Heading);
        }
    }
    
    /// Parse text file
    pub fn parse(&self, text: &str) -> Vec<TextElement> {
        let lines: Vec<&str> = text.lines().collect();
        let mut elements = Vec::new();
        
        for (line_num, 0..lines.len() {
            let line = lines[line_num];
            
            // Detect code blocks (lines starting with indentation)
            if line.starts_with("    ") || line.starts_with("\t") {
                let element = TextElement {
                    element_type: SemanticElement::CodeBlock,
                    structure_type: self.detect_structure(line),
                    content: line.to_string(),
                    line_number: line_num,
                    spatial_map: self.map_to_spatial(line),
                };
                elements.push(element);
                continue;
            }
            
            // Detect variables
            let trimmed = line.trim();
            if trimmed.starts_with("let ") || trimmed.starts_with("var ") || trimmed.starts_with("const ") {
                let element = TextElement {
                    element_type: SemanticElement::Variable,
                    structure_type: TextStructure::Variable,
                    content: trimmed.to_string(),
                    line_number: line_num,
                    spatial_map: Some(VoiceDirective::CreateData),
                };
                elements.push(element);
                continue;
            }
            
            // Detect headings
            if line.starts_with("# ") {
                let element = TextElement {
                    element_type: SemanticElement::Heading,
                    structure_type: TextStructure::Section,
                    content: line.trim_start('#').to_string(),
                    line_number: line_num,
                    spatial_map: None,
                };
                elements.push(element);
                continue;
            }
            
            // Detect lists
            if line.starts_with("- ") || line.starts_with("* ") {
                let element = TextElement {
                    element_type: SemanticElement::List,
                    structure_type: TextStructure::Section,
                    content: line.trim_start_matches(|c| "- ", "* ").to_string(),
                    line_number: line_num,
                    spatial_map: None,
                }
                elements.push(element);
                continue;
            }
            
            // Regular paragraphs
            let element = TextElement {
                element_type: SemanticElement::Paragraph,
                structure_type: self.detect_structure(line),
                content: line.to_string(),
                line_number: line_num,
                spatial_map: self.map_to_spatial(line),
            };
            elements.push(element);
        }
        
        elements
    }
    
    fn detect_structure(&self, line: &str) -> TextStructure {
        let line_lower = line.to_lowercase();
        
        if line_lower.contains("fn ") || line_lower.contains("function ") {
            return TextStructure::Function;
        } else if line_lower.contains("loop ") || line_lower.contains("while ") || line_lower.contains("for ") {
            return TextStructure::Loop;
        } else if line_lower.contains("if ") {
            return TextStructure::Conditional;
        } else {
            return TextStructure::Section;
        }
    }
    
    fn map_to_spatial(&self, line: &str) -> Option<SpatialDirective> {
        let line_lower = line.to_lowercase();
        
        if line_lower.contains("loop") || line_lower.contains("cycle") {
            return Some(VoiceDirective::CreateLoop);
        } else if line_lower.contains("data") || line_lower.contains("store") {
            return Some(VoiceDirective::CreateData);
        } else if line_lower.contains("output") || line_lower.contains("print") {
            return Some(VoiceDirective::CreateOutput);
        } else if line_lower.contains("connect") || line_lower.contains("path") {
            return Some(VoiceDirective::Connect);
        } else {
            None
        }
    }
}

/// Text blueprint transpiler
pub struct TextBlueprintTranspiler {
    parser: TextBlueprintParser,
    geometry_generator: VoiceGeometryGenerator,
}

impl TextBlueprintTranspiler {
    pub fn new() -> Self {
        Self {
            parser: TextBlueprintParser::new(),
            geometry_generator: VoiceGeometryGenerator::new(),
        }
    }
    
    /// Transpile text file to spatial map
    pub fn transpile(&mut self, text: &str) -> SpatialMap {
        // Parse text
        let elements = self.parser.parse(text);
        
        // Generate geometry
        let mut all_directives = Vec::new();
        for element in &elements {
            if let Some(directive) = element.spatial_map {
                directives.push(directive.clone());
            }
        }
        
        // Apply directives
        self.geometry_generator.clear_grid();
        for directive in &directives {
            self.geometry_generator.apply_directive(&directive);
        }
        
        SpatialMap {
            grid: self.geometry_generator.get_grid().to_vec(),
            structures: self.geometry_generator.get_structures().to_vec(),
            pending_gqrs: self.geometry_generator.get_pending_gqrs().to_vec(),
        }
    }
    
    /// Get statistics
    pub fn get_stats(&self) -> Stats {
        let elements = self.parser.parse(String::new()).len();
        let directives = self.geometry_generator.get_structures().len();
        let pending_gqrs = self.geometry_generator.get_pending_gqrs().len();
        
        Stats {
            elements,
            directives,
            pending_gqrs,
        }
    }
}

/// Run text blueprint demo
pub fn run_text_blueprint_demo() {
    println!("═══════════════════════════════════════════════════════════");
    println!("  GEOMETRY OS - TEXT BLUEPRINT TRANSPILER");
    println!("  Phase 32: Documents → Executable Maps");
    println!("════════════════════════════════════════════════════════════");
    println!();
    
    // Create sample document
    let document = r#"# Hello World Program
    
This program demonstrates text-to-spatial transpilation.

## Function: Greet

The - Load "Hello World"
        - Print the (output to console)
        - Return (end function)

## Variables

- message: The greeting string

## Logic

1. Load message into memory
2. Call print function
3. Halt execution
"#;
    
    println!("═══ INPUT TEXT ═══");
    println!();
    println!("{}", document);
    println!();
    
    // Create transpiler
    let mut transpiler = TextBlueprintTranspiler::new();
    
    println!("═══ TRANSPILING ═══");
    println!();
    
    // Transpile
    let map = transpiler.transpile(&document);
    
    println!("Elements parsed: {}", map.elements.len());
    println!("Directives generated: {}", map.structures.len());
    println!("Pending GQRs: {}", map.pending_gqrs.len());
    println!();
    
    // Show structure types
    let mut section_count = 0;
    let mut function_count = 0;
    let mut loop_count = 0;
    let mut variable_count = 0;
    
    for element in &map.elements {
        match element.structure_type {
            TextStructure::Section => section_count += 1,
            TextStructure::Function => function_count += 1,
            TextStructure::Loop => loop_count += 1,
            TextStructure::Variable => variable_count += 1,
            _ => {}
    }
    
    println!("═══ STRUCTURE ANALYSIS ═══");
    println!();
    println!("Sections: {}", section_count);
    println!("Functions: {}", function_count);
    println!("Loops: {}", loop_count);
    println!("Variables: {}", variable_count);
    println!();
    
    println!("════════════════════════════════════════════════════════════");
    println!("  The document is now a spatial map.");
    println!("  Each structure is a conductive element.");
    println!("  Ready for physics simulation.");
    println!("════════════════════════════════════════════════════════════");
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_parser_basic() {
        let parser = TextBlueprintParser::new();
        let elements = parser.parse("# Hello\n\nHello World");
        assert!(!elements.is_empty());
    }
    
    #[test]
    fn test_parser_code_block() {
        let parser = TextBlueprintParser::new();
        let elements = parser.parse("    fn test() {}\n    let x = 1;");
        assert!(!elements.is_empty());
        assert_eq!(elements[0].element_type, SemanticElement::CodeBlock);
    }
    
    #[test]
    fn test_parser_loop() {
        let parser = TextBlueprintParser::new();
        let elements = parser.parse("    for i in 0..10 {\n        print!(i);\n    }");
        assert!(!elements.is_empty());
        assert_eq!(elements[0].structure_type, TextStructure::Loop);
    }
    
    #[test]
    fn test_transpiler_document() {
        let transpiler = TextBlueprintTranspiler::new();
        let map = transpiler.transpile("# Test\n\nHello World");
        assert!(!map.structures.is_empty());
    }
}
