//! Neural Pattern Prompter - Generate spatial circuits via local LLM
//!
//! Wraps LmStudioClient to force structured JSON schema output for
//! spatial circuit generation. Prompts Ollama with specific heuristic
//! requests (e.g., "high-throughput fan-out gate", "low-latency pipeline")
//! and receives validated Vec<CellDefinition> arrays.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;

use super::lm_studio_bridge::{CellDefinition, LmStudioClient, LmStudioConfig};

/// Neural pattern generation request
#[derive(Debug, Clone, Serialize)]
pub struct NeuralPrompt {
    /// Goal description (e.g., "high-throughput fan-out gate")
    pub goal: String,
    /// Target sandbox dimensions
    pub width: u32,
    pub height: u32,
    /// Performance constraints (optional)
    pub constraints: Option<NeuralConstraints>,
}

/// Performance constraints for neural generation
#[derive(Debug, Clone, Serialize)]
pub struct NeuralConstraints {
    /// Minimize latency
    pub low_latency: bool,
    /// Maximize throughput
    pub high_throughput: bool,
    /// Maximize spatial density
    pub high_density: bool,
}

/// Neural pattern generation result
#[derive(Debug, Clone)]
pub struct NeuralPattern {
    /// Generated cell definitions
    pub cells: Vec<CellDefinition>,
    /// Model used
    pub model: String,
    /// Tokens consumed
    pub tokens_used: Option<u32>,
    /// Rationale (LLM's explanation)
    pub rationale: String,
}

/// LLM response schema (enforces valid JSON output)
#[derive(Debug, Deserialize)]
struct LlmPatternResponse {
    /// Array of cell definitions
    cells: Vec<CellDefinition>,
    /// LLM's reasoning for the pattern
    rationale: String,
    /// Any warnings or notes
    warnings: Option<Vec<String>>,
}

/// Neural prompter errors
#[derive(Debug, thiserror::Error)]
pub enum NeuralError {
    #[error("Client error: {0}")]
    ClientError(String),

    #[error("JSON parse error: {0}")]
    ParseError(String),

    #[error("Validation error: {0}")]
    ValidationError(String),

    #[error("Empty pattern received")]
    EmptyPattern,
}

/// Neural pattern prompter
pub struct NeuralPrompter {
    client: LmStudioClient,
    /// Opcode name to value mapping
    opcode_map: HashMap<String, u32>,
}

impl NeuralPrompter {
    /// Create new prompter with default Ollama config
    pub fn new() -> Result<Self, NeuralError> {
        let config = LmStudioConfig {
            endpoint: "http://localhost:11434/v1/chat/completions".to_string(),
            model: "qwen2.5-coder:14b".to_string(),
            temperature: 0.7,
            max_tokens: 2048,
            // Measured qwen2.5-coder:14b latency: 11-45s per pattern (RTX 5090
            // laptop, 100% GPU); 30s timed out mid-batch in live runs.
            timeout: std::time::Duration::from_secs(120),
        };

        Self::with_config(config)
    }

    /// Create new prompter with custom config
    pub fn with_config(config: LmStudioConfig) -> Result<Self, NeuralError> {
        let client = LmStudioClient::with_config(config)
            .map_err(|e| NeuralError::ClientError(e.to_string()))?;

        Ok(Self {
            client,
            opcode_map: Self::build_opcode_map(),
        })
    }

    /// Build opcode name → value mapping
    fn build_opcode_map() -> HashMap<String, u32> {
        let mut map = HashMap::new();
        map.insert("TYPE_NOP".to_string(), 0);
        map.insert("TYPE_WALL".to_string(), 1);
        map.insert("TYPE_MEMBRANE".to_string(), 2);
        map.insert("TYPE_LDI".to_string(), 3);
        map.insert("TYPE_ADD_RR".to_string(), 4);
        map.insert("TYPE_SUB_RR".to_string(), 5);
        map.insert("TYPE_ADD_RI".to_string(), 6);
        map.insert("TYPE_SUB_RI".to_string(), 7);
        map.insert("TYPE_JZ".to_string(), 8);
        map.insert("TYPE_JMP".to_string(), 9);
        map.insert("TYPE_HALT".to_string(), 10);
        map.insert("TYPE_COPY".to_string(), 11);
        map.insert("TYPE_MOVE".to_string(), 12);
        map.insert("TYPE_SWAP".to_string(), 13);
        map.insert("TYPE_MUL".to_string(), 14);
        map.insert("TYPE_DIV".to_string(), 15);
        map.insert("TYPE_DOOR".to_string(), 16);
        map.insert("TYPE_TENSOR_GATE".to_string(), 17);
        map.insert("TYPE_AND_RI".to_string(), 18);
        map.insert("TYPE_OR_RI".to_string(), 19);
        map.insert("TYPE_XOR_RI".to_string(), 20);
        map.insert("TYPE_SHL_RI".to_string(), 21);
        map.insert("TYPE_SHR_RI".to_string(), 22);
        map.insert("TYPE_AND_RR".to_string(), 23);
        map.insert("TYPE_OR_RR".to_string(), 24);
        map.insert("TYPE_XOR_RR".to_string(), 25);
        map.insert("TYPE_SLT_RR".to_string(), 26);
        map.insert("TYPE_SLT_RI".to_string(), 27);
        map.insert("TYPE_SLTU_RR".to_string(), 28);
        map.insert("TYPE_SLTU_RI".to_string(), 29);
        map.insert("TYPE_LOAD_IND".to_string(), 30);
        map.insert("TYPE_STORE_IND".to_string(), 31);
        map.insert("TYPE_JMP_IND".to_string(), 32);
        map.insert("TYPE_SHL_RR".to_string(), 33);
        map.insert("TYPE_SHR_RR".to_string(), 34);
        map.insert("TYPE_SRA_RI".to_string(), 35);
        map.insert("TYPE_SRA_RR".to_string(), 36);
        map
    }

    /// Generate neural pattern from prompt
    pub fn generate_pattern(
        &self,
        prompt: &NeuralPrompt,
    ) -> Result<NeuralPattern, NeuralError> {
        let system_prompt = self.build_system_prompt(&prompt);
        let user_prompt = self.build_user_prompt(&prompt);

        let full_prompt = format!("{}\n\n{}", system_prompt, user_prompt);

        // Send to LLM
        let generated = self.client.generate_circuit_from_prompt(&full_prompt)
            .map_err(|e| NeuralError::ClientError(e.to_string()))?;

        if generated.cells.is_empty() {
            return Err(NeuralError::EmptyPattern);
        }

        // Validate cell coordinates are within bounds
        for cell in &generated.cells {
            if cell.x >= prompt.width || cell.y >= prompt.height {
                return Err(NeuralError::ValidationError(format!(
                    "Cell ({}, {}) exceeds sandbox bounds {}x{}",
                    cell.x, cell.y, prompt.width, prompt.height
                )));
            }
        }

        Ok(NeuralPattern {
            cells: generated.cells,
            model: generated.metadata.model,
            tokens_used: generated.metadata.tokens_used,
            rationale: generated.metadata.rationale,
        })
    }

    /// Generate multiple patterns from single prompt
    ///
    /// Individual failures are logged and skipped; the result may contain
    /// fewer than `count` patterns. Errors only if every attempt fails.
    pub fn generate_patterns(
        &self,
        prompt: &NeuralPrompt,
        count: usize,
    ) -> Result<Vec<NeuralPattern>, NeuralError> {
        let mut patterns = Vec::new();
        let mut last_error = None;

        for i in 0..count {
            match self.generate_pattern(prompt) {
                Ok(pattern) => patterns.push(pattern),
                Err(e) => {
                    log::warn!("Neural pattern {}/{} failed: {}", i + 1, count, e);
                    last_error = Some(e);
                }
            }
        }

        if patterns.is_empty() {
            return Err(last_error.unwrap_or(NeuralError::EmptyPattern));
        }

        Ok(patterns)
    }

    /// Build system prompt enforcing JSON schema
    fn build_system_prompt(&self, prompt: &NeuralPrompt) -> String {
        let opcodes_list: Vec<String> = self.opcode_map.keys().cloned().collect();

        format!(
            r#"You are a spatial circuit architect for Geometry OS. Your task is to design spatial computation patterns that optimize for specific performance goals.

# SANDBOX SPECIFICATIONS
- Dimensions: {}x{} cells
- Each cell can be: {}
- Data cells (TYPE_LDI) can hold immediate values
- Jump cells (TYPE_JZ, TYPE_JMP) can use rel_x/rel_y offsets

# OPCODE REFERENCE
{}

# OUTPUT SCHEMA (STRICT JSON)
You MUST respond with ONLY valid JSON in this exact format:

{{
  "cells": [
    {{"x": 0, "y": 0, "opcode": "TYPE_LDI", "value": 42}},
    {{"x": 1, "y": 0, "opcode": "TYPE_ADD_RR", "rel_x": -1, "rel_y": 0}},
    {{"x": 2, "y": 0, "opcode": "TYPE_JZ", "rel_x": 0, "rel_y": 1}}
  ],
  "rationale": "Explanation of your design choices",
  "warnings": ["Any warnings about the pattern"]
}}

# RULES
1. ALL cells must have x < {} and y < {}
2. Use ONLY opcodes from the reference list
3. Include value field for TYPE_LDI cells
4. Include rel_x/rel_y for jump cells
5. Rationale must explain your design strategy
6. DO NOT include markdown code blocks or extra text
7. Return ONLY the JSON object, nothing else"#,
            prompt.width,
            prompt.height,
            opcodes_list.join(", "),
            opcodes_list.join("\n"),
            prompt.width,
            prompt.height
        )
    }

    /// Build user prompt with specific goals
    fn build_user_prompt(&self, prompt: &NeuralPrompt) -> String {
        let mut constraint_desc = String::new();
        
        if let Some(constraints) = &prompt.constraints {
            if constraints.low_latency {
                constraint_desc.push_str("- Minimize execution latency (fast control flow)\n");
            }
            if constraints.high_throughput {
                constraint_desc.push_str("- Maximize throughput (parallel operations)\n");
            }
            if constraints.high_density {
                constraint_desc.push_str("- Maximize spatial utilization (compact layout)\n");
            }
        }

        format!(
            r#"# PATTERN GENERATION REQUEST

Generate a spatial circuit for: "{}"

# CONSTRAINTS
{}

# DESIGN GOAL
Create an efficient spatial pattern that achieves this goal within the {}x{} sandbox.
Focus on valid opcode usage and avoid creating deadlocks or infinite loops.

# OUTPUT
Respond with ONLY the JSON schema as specified in the system prompt."#,
            prompt.goal,
            constraint_desc,
            prompt.width,
            prompt.height
        )
    }
}

impl LmStudioClient {
    /// Generate circuit from free-form prompt (JSON schema mode)
    pub fn generate_circuit_from_prompt(
        &self,
        prompt: &str,
    ) -> Result<super::lm_studio_bridge::GeneratedCircuit, super::lm_studio_bridge::ClientError> {
        use super::lm_studio_bridge::{ChatMessage, ChatRequest, ChatResponse, ClientError};

        let request = ChatRequest {
            model: self.config.model.clone(),
            messages: vec![
                ChatMessage {
                    role: "user".to_string(),
                    content: prompt.to_string(),
                }
            ],
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
            let body = response.text().unwrap_or_else(|_| "Unable to read response".to_string());
            return Err(ClientError::ApiError {
                status: status.as_u16(),
                message: body,
            });
        }

        // The endpoint returns an OpenAI-style chat completion envelope;
        // the model's JSON payload lives in choices[0].message.content.
        let chat_response: ChatResponse = response
            .json()
            .map_err(|e| ClientError::ParseError(e.to_string()))?;

        let choice = chat_response.choices.first().ok_or_else(|| {
            ClientError::EmptyResponse("No choices in response".to_string())
        })?;

        let content = choice.message.content.clone();
        let payload = extract_json_payload(&content);

        let llm_response: LlmPatternResponse = serde_json::from_str(payload)
            .map_err(|e| ClientError::ParseError(format!(
                "Pattern JSON invalid: {} (content: {:.200})",
                e, content
            )))?;

        if let Some(warnings) = &llm_response.warnings {
            for warning in warnings {
                log::warn!("Neural pattern warning: {}", warning);
            }
        }

        if llm_response.cells.is_empty() {
            return Err(ClientError::EmptyResponse(
                "No cells in JSON response".to_string(),
            ));
        }

        Ok(super::lm_studio_bridge::GeneratedCircuit {
            raw_geoasm: content.clone(),
            cells: llm_response.cells,
            metadata: super::lm_studio_bridge::GenerationMetadata {
                model: self.config.model.clone(),
                tokens_used: chat_response.usage.as_ref().map(|u| u.total_tokens),
                finish_reason: choice.finish_reason.clone(),
                rationale: llm_response.rationale,
            },
        })
    }
}

/// Extract the JSON object from LLM output that may be wrapped in markdown
/// code fences or surrounded by commentary despite schema instructions.
fn extract_json_payload(content: &str) -> &str {
    let trimmed = content.trim();

    // Fast path: already bare JSON
    if trimmed.starts_with('{') && trimmed.ends_with('}') {
        return trimmed;
    }

    // Strip ```json ... ``` (or bare ```) fences
    if let Some(fence_start) = trimmed.find("```") {
        let after_fence = &trimmed[fence_start + 3..];
        let body_start = after_fence.find('\n').map(|i| i + 1).unwrap_or(0);
        let body = &after_fence[body_start..];
        if let Some(fence_end) = body.find("```") {
            let inner = body[..fence_end].trim();
            if inner.starts_with('{') {
                return inner;
            }
        }
    }

    // Last resort: widest brace-delimited slice
    if let (Some(start), Some(end)) = (trimmed.find('{'), trimmed.rfind('}')) {
        if start < end {
            return &trimmed[start..=end];
        }
    }

    trimmed
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_opcode_map_complete() {
        let map = NeuralPrompter::build_opcode_map();
        assert_eq!(map.len(), 37); // 0-36 opcodes
        assert_eq!(map.get("TYPE_NOP"), Some(&0));
        assert_eq!(map.get("TYPE_ADD_RR"), Some(&4));
        assert_eq!(map.get("TYPE_JMP"), Some(&9));
    }

    #[test]
    fn test_neural_prompt_constraints() {
        let prompt = NeuralPrompt {
            goal: "high-throughput fan-out".to_string(),
            width: 32,
            height: 32,
            constraints: Some(NeuralConstraints {
                low_latency: true,
                high_throughput: true,
                high_density: false,
            }),
        };

        assert_eq!(prompt.width, 32);
        assert!(prompt.constraints.unwrap().high_throughput);
    }

    #[test]
    fn test_system_prompt_contains_schema() {
        let prompter = NeuralPrompter::new().unwrap();
        let prompt = NeuralPrompt {
            goal: "test".to_string(),
            width: 32,
            height: 32,
            constraints: None,
        };

        let system_prompt = prompter.build_system_prompt(&prompt);
        assert!(system_prompt.contains("cells"));
        assert!(system_prompt.contains("rationale"));
        assert!(system_prompt.contains("JSON"));
    }

    #[test]
    fn test_extract_json_payload_bare() {
        let content = r#"{"cells": [], "rationale": "x"}"#;
        assert_eq!(extract_json_payload(content), content);
    }

    #[test]
    fn test_extract_json_payload_fenced() {
        let content = "```json\n{\"cells\": []}\n```";
        assert_eq!(extract_json_payload(content), "{\"cells\": []}");
    }

    #[test]
    fn test_extract_json_payload_fenced_no_language() {
        let content = "```\n{\"cells\": []}\n```";
        assert_eq!(extract_json_payload(content), "{\"cells\": []}");
    }

    #[test]
    fn test_extract_json_payload_with_commentary() {
        let content = "Here is the pattern:\n{\"cells\": []}\nHope that helps!";
        assert_eq!(extract_json_payload(content), "{\"cells\": []}");
    }

    // ── Mock-server tests for the HTTP client path ──────────────────────

    use std::io::{Read as IoRead, Write as IoWrite};
    use std::net::TcpListener;

    /// Serve one canned HTTP response on an ephemeral port.
    fn spawn_mock_server(body: String) -> String {
        let listener = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = listener.local_addr().unwrap();
        std::thread::spawn(move || {
            if let Ok((mut stream, _)) = listener.accept() {
                // Drain the request headers before responding
                let mut buf = [0u8; 16384];
                let mut total = Vec::new();
                loop {
                    match stream.read(&mut buf) {
                        Ok(0) => break,
                        Ok(n) => {
                            total.extend_from_slice(&buf[..n]);
                            if total.windows(4).any(|w| w == b"\r\n\r\n") {
                                break;
                            }
                        }
                        Err(_) => break,
                    }
                }
                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{}",
                    body.len(),
                    body
                );
                let _ = stream.write_all(response.as_bytes());
            }
        });
        format!("http://{}/v1/chat/completions", addr)
    }

    fn prompter_for(endpoint: String) -> NeuralPrompter {
        NeuralPrompter::with_config(LmStudioConfig {
            endpoint,
            model: "test-model".to_string(),
            temperature: 0.0,
            max_tokens: 256,
            timeout: std::time::Duration::from_secs(5),
        })
        .unwrap()
    }

    fn test_prompt() -> NeuralPrompt {
        NeuralPrompt {
            goal: "test".to_string(),
            width: 32,
            height: 32,
            constraints: None,
        }
    }

    #[test]
    fn test_e2e_parses_envelope_with_markdown_fences() {
        let pattern_json = serde_json::json!({
            "cells": [{"x": 0, "y": 0, "opcode": "TYPE_LDI", "value": 5}],
            "rationale": "single data cell",
            "warnings": []
        });
        let envelope = serde_json::json!({
            "choices": [{
                "message": {
                    "role": "assistant",
                    "content": format!("```json\n{}\n```", pattern_json)
                },
                "finish_reason": "stop"
            }],
            "usage": {"prompt_tokens": 10, "completion_tokens": 32, "total_tokens": 42}
        });

        let endpoint = spawn_mock_server(envelope.to_string());
        let prompter = prompter_for(endpoint);

        let pattern = prompter.generate_pattern(&test_prompt()).unwrap();
        assert_eq!(pattern.cells.len(), 1);
        assert_eq!(pattern.cells[0].opcode, "TYPE_LDI");
        assert_eq!(pattern.rationale, "single data cell");
        assert_eq!(pattern.tokens_used, Some(42));
    }

    #[test]
    fn test_e2e_rejects_non_json_content() {
        let envelope = serde_json::json!({
            "choices": [{
                "message": {"role": "assistant", "content": "I suggest using TYPE_ADD cells."},
                "finish_reason": "stop"
            }]
        });

        let endpoint = spawn_mock_server(envelope.to_string());
        let prompter = prompter_for(endpoint);

        let err = prompter.generate_pattern(&test_prompt()).unwrap_err();
        assert!(matches!(err, NeuralError::ClientError(_)), "got: {:?}", err);
    }

    #[test]
    fn test_e2e_rejects_json_missing_cells_field() {
        let envelope = serde_json::json!({
            "choices": [{
                "message": {
                    "role": "assistant",
                    "content": "{\"rationale\": \"no cells key\"}"
                },
                "finish_reason": "stop"
            }]
        });

        let endpoint = spawn_mock_server(envelope.to_string());
        let prompter = prompter_for(endpoint);

        assert!(prompter.generate_pattern(&test_prompt()).is_err());
    }

    #[test]
    fn test_e2e_rejects_out_of_bounds_cells() {
        let pattern_json = serde_json::json!({
            "cells": [{"x": 99, "y": 0, "opcode": "TYPE_NOP"}],
            "rationale": "oob"
        });
        let envelope = serde_json::json!({
            "choices": [{
                "message": {"role": "assistant", "content": pattern_json.to_string()},
                "finish_reason": "stop"
            }]
        });

        let endpoint = spawn_mock_server(envelope.to_string());
        let prompter = prompter_for(endpoint);

        let err = prompter.generate_pattern(&test_prompt()).unwrap_err();
        assert!(matches!(err, NeuralError::ValidationError(_)), "got: {:?}", err);
    }

    #[test]
    fn test_generate_patterns_tolerates_partial_failure() {
        // Mock server answers exactly one request; the second attempt gets
        // connection-refused. Batch should still return the one good pattern.
        let pattern_json = serde_json::json!({
            "cells": [{"x": 1, "y": 1, "opcode": "TYPE_NOP"}],
            "rationale": "ok"
        });
        let envelope = serde_json::json!({
            "choices": [{
                "message": {"role": "assistant", "content": pattern_json.to_string()},
                "finish_reason": "stop"
            }]
        });

        let endpoint = spawn_mock_server(envelope.to_string());
        let prompter = prompter_for(endpoint);

        let patterns = prompter.generate_patterns(&test_prompt(), 2).unwrap();
        assert_eq!(patterns.len(), 1);
    }

    #[test]
    fn test_connection_refused_is_graceful_error() {
        // Bind then drop to get a port that is definitely closed
        let port = {
            let listener = TcpListener::bind("127.0.0.1:0").unwrap();
            listener.local_addr().unwrap().port()
        };
        let prompter = prompter_for(format!("http://127.0.0.1:{}/v1/chat/completions", port));

        let err = prompter.generate_pattern(&test_prompt()).unwrap_err();
        assert!(matches!(err, NeuralError::ClientError(_)), "got: {:?}", err);
    }
}