//! LM Studio Bridge - Connect to local LLM for circuit hallucination
//!
//! Provides integration with local LLM endpoints (LM Studio, Ollama) for
//! generating initial GeoASM circuits from OpenSpec specifications.

use serde::{Deserialize, Serialize};
use std::time::Duration;

use super::openspec_bridge::SpecRequest;

/// LM Studio client configuration
#[derive(Debug, Clone)]
pub struct LmStudioConfig {
    /// API endpoint (e.g., "http://localhost:1234/v1/chat/completions")
    pub endpoint: String,

    /// Model name (e.g., "qwen2.5-coder:14b")
    pub model: String,

    /// Temperature (0.0-2.0, default: 0.7)
    pub temperature: f32,

    /// Max tokens (default: 2048)
    pub max_tokens: usize,

    /// Request timeout (default: 30s)
    pub timeout: Duration,
}

impl Default for LmStudioConfig {
    fn default() -> Self {
        Self {
            endpoint: "http://localhost:1234/v1/chat/completions".to_string(),
            model: "qwen2.5-coder:14b".to_string(),
            temperature: 0.7,
            max_tokens: 2048,
            timeout: Duration::from_secs(30),
        }
    }
}

/// LM Studio chat completion request
#[derive(Debug, Serialize)]
pub struct ChatRequest {
    pub model: String,
    pub messages: Vec<ChatMessage>,
    pub temperature: f32,
    pub max_tokens: usize,
    pub stream: bool,
}

/// Chat message
#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct ChatMessage {
    pub role: String,
    pub content: String,
}

/// LM Studio chat completion response
#[derive(Debug, Deserialize)]
pub(crate) struct ChatResponse {
    pub(crate) choices: Vec<Choice>,
    pub(crate) usage: Option<Usage>,
}

/// Single choice in response
#[derive(Debug, Deserialize)]
pub(crate) struct Choice {
    pub(crate) message: ChatMessage,
    pub(crate) finish_reason: Option<String>,
}

/// Token usage statistics
#[derive(Debug, Deserialize)]
pub(crate) struct Usage {
    #[allow(dead_code)]
    pub(crate) prompt_tokens: u32,
    #[allow(dead_code)]
    pub(crate) completion_tokens: u32,
    pub(crate) total_tokens: u32,
}

/// Generated circuit result
#[derive(Debug, Clone)]
pub struct GeneratedCircuit {
    /// Raw GeoASM code (unparsed)
    pub raw_geoasm: String,

    /// Extracted cell definitions (parsed)
    pub cells: Vec<CellDefinition>,

    /// Metadata from generation
    pub metadata: GenerationMetadata,
}

/// Parsed cell definition
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CellDefinition {
    /// X coordinate (0-31 for 32x32 region)
    pub x: u32,
    /// Y coordinate (0-31 for 32x32 region)
    pub y: u32,
    /// Cell opcode type (e.g., "TYPE_ADD_RR")
    pub opcode: String,
    /// Optional data value (for data cells like LDI)
    pub value: Option<u32>,
    /// Relative X offset (for jump instructions like JZ, JMP)
    pub rel_x: Option<i32>,
    /// Relative Y offset (for jump instructions like JZ, JMP)
    pub rel_y: Option<i32>,
}

/// Generation metadata
#[derive(Debug, Clone)]
pub struct GenerationMetadata {
    /// Model used
    pub model: String,
    /// Tokens used
    pub tokens_used: Option<u32>,
    /// Finish reason (e.g., "stop", "length")
    pub finish_reason: Option<String>,
    /// LLM's rationale/explanation for the generated circuit
    pub rationale: String,
}

/// LM Studio client
pub struct LmStudioClient {
    pub config: LmStudioConfig,
    pub client: reqwest::blocking::Client,
}

impl LmStudioClient {
    /// Create new client with default config
    pub fn new() -> Result<Self, ClientError> {
        Self::with_config(LmStudioConfig::default())
    }

    /// Create new client with custom config
    pub fn with_config(config: LmStudioConfig) -> Result<Self, ClientError> {
        let client = reqwest::blocking::Client::builder()
            .timeout(config.timeout)
            .build()
            .map_err(|e| ClientError::InitError(e.to_string()))?;

        Ok(Self { config, client })
    }

    /// Generate circuit from OpenSpec
    pub fn generate_circuit(
        &self,
        spec: &SpecRequest,
    ) -> Result<GeneratedCircuit, ClientError> {
        use super::openspec_bridge::spec_to_llm_prompt;

        let prompt = spec_to_llm_prompt(spec);

        let request = ChatRequest {
            model: self.config.model.clone(),
            messages: vec![ChatMessage {
                role: "user".to_string(),
                content: prompt,
            }],
            temperature: self.config.temperature,
            max_tokens: self.config.max_tokens,
            stream: false,
        };

        let response = self
            .client
            .post(&self.config.endpoint)
            .json(&request)
            .send()
            .map_err(|e| ClientError::RequestError(e.to_string()))?;

        if !response.status().is_success() {
            let status = response.status();
            let body = response
                .text()
                .unwrap_or_else(|_| "Unable to read response body".to_string());
            return Err(ClientError::ApiError {
                status: status.as_u16(),
                message: body,
            });
        }

        let chat_response: ChatResponse = response
            .json()
            .map_err(|e| ClientError::ParseError(e.to_string()))?;

        if chat_response.choices.is_empty() {
            return Err(ClientError::EmptyResponse(
                "No choices in response".to_string(),
            ));
        }

        let choice = &chat_response.choices[0];
        let raw_geoasm = choice.message.content.clone();

        let metadata = GenerationMetadata {
            model: self.config.model.clone(),
            tokens_used: chat_response.usage.as_ref().map(|u| u.total_tokens),
            finish_reason: choice.finish_reason.clone(),
            rationale: "".to_string(), // TODO: Extract rationale from LLM response
        };

        let cells = parse_geoasm_from_markdown(&raw_geoasm)?;

        Ok(GeneratedCircuit {
            raw_geoasm,
            cells,
            metadata,
        })
    }

    /// Health check - verify LLM is accessible
    pub fn health_check(&self) -> Result<bool, ClientError> {
        let response = self
            .client
            .get(&self.config.endpoint.replace("/chat/completions", "/models"))
            .send()
            .map_err(|e| ClientError::RequestError(e.to_string()))?;

        Ok(response.status().is_success())
    }
}

/// Parse GeoASM code from markdown response
fn parse_geoasm_from_markdown(content: &str) -> Result<Vec<CellDefinition>, ClientError> {
    let mut cells = Vec::new();

    // Extract content between ```geoasm and ```
    let geoasm_block = content
        .split("```geoasm")
        .nth(1)
        .ok_or_else(|| ClientError::ParseError("No ```geoasm block found".to_string()))?
        .split("```")
        .next()
        .ok_or_else(|| ClientError::ParseError("Unclosed ```geoasm block".to_string()))?;

    // Parse lines: "(0,0): TYPE_OPCODE value=0"
    for line in geoasm_block.lines() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with('#') {
            continue;
        }

        // Parse coordinate and opcode
        if let Some((coord_part, rest)) = trimmed.split_once("): ") {
            let (x_str, y_str) = coord_part
                .strip_prefix("(")
                .ok_or_else(|| {
                    ClientError::ParseError(format!("Invalid coordinate format: {}", coord_part))
                })?
                .split_once(',')
                .ok_or_else(|| {
                    ClientError::ParseError(format!("Invalid coordinate: {}", coord_part))
                })?;

            let x: u32 = x_str
                .parse()
                .map_err(|e| ClientError::ParseError(format!("Invalid X coordinate: {}", e)))?;
            let y: u32 = y_str
                .parse()
                .map_err(|e| ClientError::ParseError(format!("Invalid Y coordinate: {}", e)))?;
            // Strip comments and parse opcode + optional parameters
            let rest_without_comments = rest.split('#').next().unwrap_or(rest).trim();

            // Parse opcode and optional parameters
            // Supports:
            // - "TYPE_OPCODE" (just opcode)
            // - "TYPE_OPCODE value=42" (data value)
            // - "TYPE_OPCODE rel_x=5 rel_y=-3" (coordinate offset for jumps)
            let opcode = rest_without_comments
                .split_whitespace()
                .next()
                .unwrap_or("")
                .trim()
                .to_string();

            // Parse parameters
            let mut value = None;
            let mut rel_x = None;
            let mut rel_y = None;

            for param in rest_without_comments.split_whitespace().skip(1) {
                if let Some((key, val_str)) = param.split_once('=') {
                    match key.trim() {
                        "value" => {
                            value = Some(val_str.trim().parse().map_err(|e| {
                                ClientError::ParseError(format!("Invalid value: {}", e))
                            })?);
                        }
                        "rel_x" => {
                            rel_x = Some(val_str.trim().parse().map_err(|e| {
                                ClientError::ParseError(format!("Invalid rel_x: {}", e))
                            })?);
                        }
                        "rel_y" => {
                            rel_y = Some(val_str.trim().parse().map_err(|e| {
                                ClientError::ParseError(format!("Invalid rel_y: {}", e))
                            })?);
                        }
                        _ => {
                            // Unknown parameter, ignore
                        }
                    }
                }
            }

            cells.push(CellDefinition {
                x,
                y,
                opcode,
                value,
                rel_x,
                rel_y,
            });
        }
    }

    if cells.is_empty() {
        return Err(ClientError::ParseError("No valid cells parsed".to_string()));
    }

    Ok(cells)
}

/// Client errors
#[derive(Debug, thiserror::Error)]
pub enum ClientError {
    #[error("Initialization error: {0}")]
    InitError(String),

    #[error("Request error: {0}")]
    RequestError(String),

    #[error("API error {status}: {message}")]
    ApiError { status: u16, message: String },

    #[error("Parse error: {0}")]
    ParseError(String),

    #[error("Empty response: {0}")]
    EmptyResponse(String),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_parse_geoasm_simple() {
        let content = r#"
```geoasm
(0,0): TYPE_NOP
(0,1): TYPE_LDI value=42
(1,0): TYPE_HALT
```
"#;

        let cells = parse_geoasm_from_markdown(content).unwrap();
        assert_eq!(cells.len(), 3);
        assert_eq!(cells[0].x, 0);
        assert_eq!(cells[0].y, 0);
        assert_eq!(cells[0].opcode, "TYPE_NOP");
        assert_eq!(cells[1].value, Some(42));
    }

    #[test]
    fn test_parse_geoasm_with_comments() {
        let content = r#"
```geoasm
# Initialize circuit
(0,0): TYPE_MEMBRANE
# Load input
(1,0): TYPE_LDI value=10
(1,1): TYPE_ADD_RR
# Finish
(0,2): TYPE_HALT
```
"#;

        let cells = parse_geoasm_from_markdown(content).unwrap();
        assert_eq!(cells.len(), 4);
    }

    #[test]
    fn test_parse_geoasm_with_coord_offsets() {
        let content = r#"
```geoasm
(0,0): TYPE_LDI value=10
(0,1): TYPE_JMP rel_x=5 rel_y=-3
(1,0): TYPE_JZ rel_x=0 rel_y=2
```
"#;

        let cells = parse_geoasm_from_markdown(content).unwrap();
        assert_eq!(cells.len(), 3);

        // Check LDI data cell
        assert_eq!(cells[0].value, Some(10));
        assert_eq!(cells[0].rel_x, None);
        assert_eq!(cells[0].rel_y, None);

        // Check JMP with offsets
        assert_eq!(cells[1].opcode, "TYPE_JMP");
        assert_eq!(cells[1].value, None);
        assert_eq!(cells[1].rel_x, Some(5));
        assert_eq!(cells[1].rel_y, Some(-3));

        // Check JZ with offsets
        assert_eq!(cells[2].opcode, "TYPE_JZ");
        assert_eq!(cells[2].value, None);
        assert_eq!(cells[2].rel_x, Some(0));
        assert_eq!(cells[2].rel_y, Some(2));
    }

    #[test]
    fn test_parse_geoasm_errors() {
        let content = "No code block here";
        assert!(parse_geoasm_from_markdown(content).is_err());

        let content = "```geoasm\nInvalid format\n```";
        assert!(parse_geoasm_from_markdown(content).is_err());
    }

    #[test]
    fn test_lm_studio_config_default() {
        let config = LmStudioConfig::default();
        assert_eq!(config.endpoint, "http://localhost:1234/v1/chat/completions");
        assert_eq!(config.model, "qwen2.5-coder:14b");
        assert_eq!(config.temperature, 0.7);
    }
}