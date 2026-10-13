//! OpenSpec Bridge - Parse OpenSpec specifications for spatial circuits
//!
//! OpenSpec is a markdown-based specification format for defining circuit requirements.
//!
//! Format:
//! ```markdown
//! # OpenSpec: Circuit Specification
//!
//! ## Description
//! A 3x3 convolution filter for image processing.
//!
//! ## Requirements
//! - Input: 3x3 pixel region
//! - Output: 1 pixel
//! - Weights: 9 floating-point values
//! - Latency: < 100 ticks
//! ```
//!
//! This module parses such specifications into structured `SpecRequest` objects.

use serde::{Deserialize, Serialize};
use std::path::Path;

/// OpenSpec circuit specification
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SpecRequest {
    /// Circuit name/description
    pub name: String,

    /// Human-readable description
    pub description: String,

    /// Functional requirements
    pub requirements: Vec<Requirement>,

    /// Performance constraints
    pub constraints: Vec<Constraint>,

    /// Optional: Example input/output pairs
    pub examples: Vec<Example>,
}

/// Functional requirement (e.g., "Input: 3x3 pixel region")
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Requirement {
    /// Requirement name (e.g., "input_format")
    pub name: String,
    /// Requirement value (e.g., "3x3 pixel region")
    pub value: String,
}

/// Performance constraint (e.g., "Latency: < 100 ticks")
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Constraint {
    /// Constraint name (e.g., "latency")
    pub name: String,
    /// Comparison operator
    pub operator: ConstraintOperator,
    /// Target value (as string for flexibility)
    pub value: String,
}

/// Comparison operators for constraints
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum ConstraintOperator {
    /// Less than (<)
    LessThan,
    /// Less than or equal (<=)
    LessThanOrEqual,
    /// Greater than (>)
    GreaterThan,
    /// Greater than or equal (>=)
    GreaterThanOrEqual,
    /// Equal (==)
    Equal,
    /// Not equal (!=)
    NotEqual,
}

/// Example input/output pair
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Example {
    /// Example input (as string)
    pub input: String,
    /// Expected output (as string)
    pub output: String,
}

/// Parse OpenSpec markdown file
pub fn parse_openspec_file<P: AsRef<Path>>(path: P) -> Result<SpecRequest, ParseError> {
    let content = std::fs::read_to_string(path)
        .map_err(|e| ParseError::IoError(e.to_string()))?;

    parse_openspec(&content)
}

/// Parse OpenSpec markdown content
pub fn parse_openspec(content: &str) -> Result<SpecRequest, ParseError> {
    let mut name = String::new();
    let mut description = String::new();
    let mut requirements = Vec::new();
    let mut constraints = Vec::new();
    let mut examples = Vec::new();

    let mut current_section: Option<String> = None;
    let mut current_example_input = String::new();

    for line in content.lines() {
        let trimmed = line.trim();

        // Header parsing: # Name
        if trimmed.starts_with("# ") && trimmed.len() > 2 {
            name = trimmed[2..].trim().to_string();
            continue;
        }

        // Section headers: ## Section
        if trimmed.starts_with("## ") && trimmed.len() > 3 {
            current_section = Some(trimmed[3..].trim().to_lowercase());
            continue;
        }

        // Skip empty lines and comments
        if trimmed.is_empty() || trimmed.starts_with("<!--") {
            continue;
        }

        // Parse content based on section
        match current_section.as_deref() {
            Some("description") => {
                description.push_str(trimmed);
                description.push(' ');
            }
            Some("requirements") => {
                // Format: "- Name: Value"
                if let Some((req_name, req_value)) = trimmed
                    .strip_prefix("- ")
                    .and_then(|s| s.split_once(": "))
                {
                    requirements.push(Requirement {
                        name: req_name.trim().to_string(),
                        value: req_value.trim().to_string(),
                    });
                }
            }
            Some("constraints") => {
                // Format: "- Name operator value"
                if let Some(constraint) = parse_constraint_line(trimmed) {
                    constraints.push(constraint);
                }
            }
            Some("examples") => {
                // Format: "Input: ..." / "Output: ..."
                if let Some(input_value) = trimmed.strip_prefix("Input:") {
                    current_example_input = input_value.trim().to_string();
                } else if let Some(output_value) = trimmed.strip_prefix("Output:") {
                    if !current_example_input.is_empty() {
                        examples.push(Example {
                            input: current_example_input.clone(),
                            output: output_value.trim().to_string(),
                        });
                        current_example_input.clear();
                    }
                }
            }
            _ => {}
        }
    }

    if name.is_empty() {
        return Err(ParseError::MissingField("name".to_string()));
    }

    Ok(SpecRequest {
        name,
        description: description.trim().to_string(),
        requirements,
        constraints,
        examples,
    })
}

/// Parse constraint line: "- Latency < 100 ticks"
fn parse_constraint_line(line: &str) -> Option<Constraint> {
    if !line.starts_with("- ") {
        return None;
    }

    let content = &line[2..];
    let (name, rest) = content.split_once(|c: char| c == '<' || c == '>' || c == '=' || c == '!')?;

    let (op_str, value) = rest.split_once(|c: char| c == '<' || c == '>' || c == '=' || c == '!')?;

    let operator = if rest.starts_with("<") {
        if op_str.contains("<=") {
            ConstraintOperator::LessThanOrEqual
        } else {
            ConstraintOperator::LessThan
        }
    } else if rest.starts_with(">") {
        if op_str.contains(">=") {
            ConstraintOperator::GreaterThanOrEqual
        } else {
            ConstraintOperator::GreaterThan
        }
    } else if rest.starts_with("==") {
        ConstraintOperator::Equal
    } else if rest.starts_with("!=") {
        ConstraintOperator::NotEqual
    } else {
        return None;
    };

    Some(Constraint {
        name: name.trim().to_string(),
        operator,
        value: value.trim().to_string(),
    })
}

/// Convert spec to LLM prompt
pub fn spec_to_llm_prompt(spec: &SpecRequest) -> String {
    let mut prompt = format!(
        "# GeoASM Circuit Generation Request\n\n\
         ## Circuit Specification\n\
         **Name**: {}\n\
         **Description**: {}\n\n\
         ## Requirements\n",
        spec.name, spec.description
    );

    for req in &spec.requirements {
        prompt.push_str(&format!("- {}: {}\n", req.name, req.value));
    }

    prompt.push_str("\n## Constraints\n");
    for constraint in &spec.constraints {
        let op_str = match constraint.operator {
            ConstraintOperator::LessThan => "<",
            ConstraintOperator::LessThanOrEqual => "<=",
            ConstraintOperator::GreaterThan => ">",
            ConstraintOperator::GreaterThanOrEqual => ">=",
            ConstraintOperator::Equal => "==",
            ConstraintOperator::NotEqual => "!=",
        };
        prompt.push_str(&format!("- {} {} {}\n", constraint.name, op_str, constraint.value));
    }

    if !spec.examples.is_empty() {
        prompt.push_str("\n## Examples\n");
        for (i, example) in spec.examples.iter().enumerate() {
            prompt.push_str(&format!(
                "**Example {}**:\n  Input: {}\n  Output: {}\n\n",
                i + 1,
                example.input,
                example.output
            ));
        }
    }

    prompt.push_str(
        "## Instructions\n\
         Generate an initial, unoptimized GeoASM circuit that satisfies this specification.\n\
         \n\
         **CRITICAL: Format each line EXACTLY as shown below (coordinates, opcode, numeric value only):**\n\
         ```geoasm\n\
         (0,0): TYPE_NOP value=0\n\
         (0,1): TYPE_LDI value=0\n\
         (0,2): TYPE_ADD_RR value=0\n\
         (0,3): TYPE_HALT value=0\n\
         ```\n\
         \n\
         **Rules:**\n\
         - NO register names (r0, r1, etc.) - use ONLY numeric values\n\
         - NO assembly syntax (commas, etc.) - use ONLY the format: (x,y): TYPE_OPCODE value=N\n\
         - Each line must have: coordinate, space, opcode name, space, value=, number\n\
         - End each instruction line with HALT\n\
         - Use standard GeoASM opcodes: TYPE_NOP, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_LDI, TYPE_JZ, TYPE_JMP, TYPE_HALT, TYPE_WALL, TYPE_MEMBRANE, TYPE_COPY\n\
         - Circuit must fit in 32x32 cell region (x=[0,31], y=[0,31])\n\
         - Place initialization sequence in first row\n\
         \n\
         **Example complete circuit (simple adder):**\n\
         ```geoasm\n\
         (0,0): TYPE_LDI value=0    # Load first operand\n\
         (0,1): TYPE_LDI value=1    # Load second operand  \n\
         (0,2): TYPE_ADD_RR value=0 # Add registers\n\
         (0,3): TYPE_HALT value=0   # Stop\n\
         ```\n\
         \n\
         Generate your circuit below:\n",
    );
    prompt
}

/// Parse errors
#[derive(Debug, thiserror::Error)]
pub enum ParseError {
    #[error("IO error: {0}")]
    IoError(String),

    #[error("Missing required field: {0}")]
    MissingField(String),

    #[error("Invalid constraint format: {0}")]
    InvalidConstraint(String),

    #[error("Parse error: {0}")]
    ParseError(String),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_simple_spec() {
        let content = r#"
# Test Circuit

## Description
A simple test circuit.

## Requirements
- Input: Single integer
- Output: Squared value

## Constraints
- Latency < 100 ticks
"#;

        let spec = parse_openspec(content).unwrap();
        assert_eq!(spec.name, "Test Circuit");
        assert_eq!(spec.requirements.len(), 2);
        assert_eq!(spec.constraints.len(), 1);
    }

    #[test]
    fn test_constraint_parsing() {
        let content = r#"
# Test

## Constraints
- Latency < 100 ticks
- Throughput >= 50 cells/tick
- Accuracy == 1.0
"#;

        let spec = parse_openspec(content).unwrap();
        assert_eq!(spec.constraints.len(), 3);
        assert!(matches!(spec.constraints[0].operator, ConstraintOperator::LessThan));
        assert!(matches!(
            spec.constraints[1].operator,
            ConstraintOperator::GreaterThanOrEqual
        ));
        assert!(matches!(spec.constraints[2].operator, ConstraintOperator::Equal));
    }

    #[test]
    fn test_spec_to_llm_prompt() {
        let spec = SpecRequest {
            name: "Test Circuit".to_string(),
            description: "A test".to_string(),
            requirements: vec![Requirement {
                name: "Input".to_string(),
                value: "Integer".to_string(),
            }],
            constraints: vec![],
            examples: vec![],
        };

        let prompt = spec_to_llm_prompt(&spec);
        assert!(prompt.contains("Test Circuit"));
        assert!(prompt.contains("Input: Integer"));
        assert!(prompt.contains("TYPE_ADD_RR"));
    }
}