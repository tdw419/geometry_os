//! Vision Studio Bridge - Connect local multimodal VLM for spatial routing critique
//!
//! Provides integration with local Vision Language Models (LLaVA, Qwen2-VL) running
//! on Ollama for analyzing .rts.png spatial circuit images and extracting routing
//! inefficiencies as structured feedback.

use base64::{engine::general_purpose::STANDARD, Engine};
use reqwest::Client;
use serde::{Deserialize, Serialize};
use std::time::Duration;
use thiserror::Error;

use super::layoutgan_saccade::LayoutInefficiency;

/// VLM client configuration
#[derive(Debug, Clone)]
pub struct VisionStudioConfig {
    /// Ollama API endpoint (default: http://localhost:11434/api/generate)
    pub endpoint: String,

    /// Multimodal model name (e.g., "llava:latest", "qwen2-vl:7b")
    pub model: String,

    /// Temperature (0.0-2.0, default: 0.3 for consistent critiques)
    pub temperature: f32,

    /// Max tokens (default: 512 for concise critiques)
    pub max_tokens: usize,

    /// Request timeout (default: 60s for image processing)
    pub timeout: Duration,
}

impl Default for VisionStudioConfig {
    fn default() -> Self {
        Self {
            endpoint: "http://localhost:11434/api/generate".to_string(),
            model: "llava:latest".to_string(),
            temperature: 0.3,
            max_tokens: 512,
            timeout: Duration::from_secs(60),
        }
    }
}

/// VLM generation request with image support
#[derive(Debug, Serialize)]
struct VisionRequest {
    model: String,
    prompt: String,
    images: Vec<String>,
    stream: bool,
    options: VisionOptions,
}

/// VLM inference options
#[derive(Debug, Serialize)]
struct VisionOptions {
    temperature: f32,
    num_predict: usize,
}

/// VLM response (Ollama format)
#[derive(Debug, Deserialize)]
struct VisionResponse {
    model: String,
    response: String,
    done: bool,
    #[serde(default)]
    eval_count: u32,
    #[serde(default)]
    eval_duration: u64,
}

/// Parsed routing critique from VLM
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RoutingCritique {
    /// Overall inefficiency score (0.0 to 1.0)
    pub score: f32,

    /// Type of inefficiency detected
    pub inefficiency_type: String,

    /// Detailed explanation from VLM
    pub explanation: String,

    /// Suggested improvements (if any)
    pub suggestions: Vec<String>,
}

/// Vision Studio client
pub struct VisionStudioClient {
    config: VisionStudioConfig,
    client: Client,
}

impl VisionStudioClient {
    pub fn new(config: VisionStudioConfig) -> Result<Self, VisionError> {
        let client = Client::builder()
            .timeout(config.timeout)
            .build()
            .map_err(|e| VisionError::InitError(e.to_string()))?;

        Ok(Self { config, client })
    }

    /// Analyze a .rts.png spatial circuit image with the VLM
    pub async fn analyze_circuit_image(
        &self,
        image_path: &std::path::Path,
        context: &str,
    ) -> Result<RoutingCritique, VisionError> {
        // Read and encode image as base64
        let image_bytes = std::fs::read(image_path)
            .map_err(|e| VisionError::ImageError {
                path: image_path.to_path_buf(),
                message: e.to_string(),
            })?;

        let base64_image = STANDARD.encode(&image_bytes);

        // Build the spatial circuit analysis prompt
        let prompt = build_circuit_analysis_prompt(context);

        let request = VisionRequest {
            model: self.config.model.clone(),
            prompt,
            images: vec![base64_image],
            stream: false,
            options: VisionOptions {
                temperature: self.config.temperature,
                num_predict: self.config.max_tokens,
            },
        };

        let response = self
            .client
            .post(&self.config.endpoint)
            .json(&request)
            .send()
            .await
            .map_err(|e| VisionError::RequestError(e.to_string()))?;

        if !response.status().is_success() {
            let status = response.status();
            let body = response
                .text()
                .await
                .unwrap_or_else(|_| "Unable to read response body".to_string());
            return Err(VisionError::ApiError {
                status: status.as_u16(),
                message: body,
            });
        }

        let vision_response: VisionResponse = response
            .json()
            .await
            .map_err(|e| VisionError::ParseError(e.to_string()))?;

        // Parse the VLM response into structured critique
        parse_routing_critique(&vision_response.response)
    }

    /// Convert VLM critique to LayoutInefficiency for the Evolution Daemon
    pub fn critique_to_inefficiency(
        &self,
        critique: &RoutingCritique,
        region_x: usize,
        region_y: usize,
        region_width: usize,
        region_height: usize,
    ) -> LayoutInefficiency {
        use super::layoutgan_saccade::SaccadeRegion;

        LayoutInefficiency {
            region: SaccadeRegion {
                x: region_x,
                y: region_y,
                width: region_width,
                height: region_height,
            },
            inefficiency_type: critique.inefficiency_type.clone(),
            score: critique.score.clamp(0.0, 1.0),
        }
    }

    /// Health check - verify VLM is accessible
    pub async fn health_check(&self) -> Result<bool, VisionError> {
        let response = self
            .client
            .post(&self.config.endpoint)
            .json(&VisionRequest {
                model: self.config.model.clone(),
                prompt: "Respond with 'OK'.".to_string(),
                images: vec![],
                stream: false,
                options: VisionOptions {
                    temperature: 0.0,
                    num_predict: 10,
                },
            })
            .send()
            .await
            .map_err(|e| VisionError::RequestError(e.to_string()))?;

        Ok(response.status().is_success())
    }
}

/// Build the spatial circuit analysis prompt for the VLM
fn build_circuit_analysis_prompt(context: &str) -> String {
    format!(
        "You are analyzing a spatial circuit layout for routing inefficiencies.\n\n\
         This is an .rts.png image encoding a Geometry OS spatial circuit:\n\
         - Red channel (R): opcode type\n\
         - Green channel (G): cell active state (0=inactive, 255=active)\n\
         - Blue channel (B): high 16 bits of data buffer\n\
         - Alpha channel (A): low 16 bits of data buffer\n\n\
         {}\n\n\
         Analyze the circuit and identify routing inefficiencies:\n\
         1. Sparse regions (many empty cells)\n\
         2. Data flow bottlenecks (active cells far apart)\n\
         3. Structural patterns that cause long routing paths\n\
         4. Suboptimal opcode placement relative to data dependencies\n\n\
         Respond in JSON format:\n\
         {{\n\
           \"score\": <0.0 to 1.0, higher=more inefficient>,\n\
           \"inefficiency_type\": \"<ShortCategory: e.g., SparseDensity, LongRoutes, DataBottleneck>\",\n\
           \"explanation\": \"<brief explanation>\",\n\
           \"suggestions\": [\"<suggestion1>\", \"<suggestion2>\"]\n\
         }}",
        context
    )
}

/// Parse VLM response into structured RoutingCritique
fn parse_routing_critique(response: &str) -> Result<RoutingCritique, VisionError> {
    // Extract JSON from response (handles markdown code blocks)
    let json_str = response
        .split("```json")
        .nth(1)
        .and_then(|s| s.split("```").next())
        .unwrap_or_else(|| {
            // Fallback: find first '{' and last '}' to extract full object
            let start = response.find('{').unwrap_or(0);
            let end = response.rfind('}').unwrap_or(response.len());
            &response[start..=end]
        });

    // Trim whitespace
    let json_str = json_str.trim();

    let critique: RoutingCritique = serde_json::from_str(json_str).map_err(|e| {
        VisionError::ParseError(format!(
            "Failed to parse VLM response as JSON: {}\nResponse was: {}\nParsed JSON was: {}",
            e, response, json_str
        ))
    })?;

    // Validate score range
    if critique.score < 0.0 || critique.score > 1.0 {
        return Err(VisionError::ParseError(format!(
            "Invalid score {} (must be 0.0-1.0)",
            critique.score
        )));
    }

    Ok(critique)
}

/// Vision Studio errors
#[derive(Debug, Error)]
pub enum VisionError {
    #[error("Initialization error: {0}")]
    InitError(String),

    #[error("Image error for {path}: {message}")]
    ImageError { path: std::path::PathBuf, message: String },

    #[error("Request error: {0}")]
    RequestError(String),

    #[error("API error {status}: {message}")]
    ApiError { status: u16, message: String },

    #[error("Parse error: {0}")]
    ParseError(String),

    #[error("Health check failed: {0}")]
    HealthCheckError(String),
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_vision_config_default() {
        let config = VisionStudioConfig::default();
        assert_eq!(config.endpoint, "http://localhost:11434/api/generate");
        assert_eq!(config.model, "llava:latest");
        assert_eq!(config.temperature, 0.3);
        assert_eq!(config.max_tokens, 512);
    }

    #[test]
    fn test_parse_routing_critique_valid() {
        let json = r#"
        {
          "score": 0.85,
          "inefficiency_type": "SparseDensity",
          "explanation": "Circuit has many empty cells with scattered active logic",
          "suggestions": ["Compact circuit", "Remove dead code"]
        }
        "#;

        let critique = parse_routing_critique(json).unwrap();
        assert_eq!(critique.score, 0.85);
        assert_eq!(critique.inefficiency_type, "SparseDensity");
        assert_eq!(critique.suggestions.len(), 2);
    }

    #[test]
    fn test_parse_routing_critique_from_markdown() {
        let response = r#"
        Here's my analysis:
        ```json
        {
          "score": 0.72,
          "inefficiency_type": "LongRoutes",
          "explanation": "Active cells are clustered at edges causing long paths",
          "suggestions": ["Move cells to center", "Optimize routing"]
        }
        ```
        "#;

        let critique = parse_routing_critique(response).unwrap();
        assert_eq!(critique.score, 0.72);
        assert_eq!(critique.inefficiency_type, "LongRoutes");
    }

    #[test]
    fn test_parse_routing_critique_invalid_score() {
        let json = r#"
        {
          "score": 1.5,
          "inefficiency_type": "SparseDensity",
          "explanation": "Test"
        }
        "#;

        assert!(parse_routing_critique(json).is_err());
    }

    #[test]
    fn test_critique_to_inefficiency_conversion() {
        let client = VisionStudioClient::new(VisionStudioConfig::default()).unwrap();

        let critique = RoutingCritique {
            score: 0.75,
            inefficiency_type: "DataBottleneck".to_string(),
            explanation: "Data flow blocked by wall cells".to_string(),
            suggestions: vec!["Reconfigure walls".to_string()],
        };

        let inefficiency = client.critique_to_inefficiency(&critique, 10, 20, 64, 64);

        assert_eq!(inefficiency.region.x, 10);
        assert_eq!(inefficiency.region.y, 20);
        assert_eq!(inefficiency.inefficiency_type, "DataBottleneck");
        assert_eq!(inefficiency.score, 0.75);
    }

    #[test]
    fn test_build_circuit_analysis_prompt() {
        let context = "Region at (0,0) size 64x64";
        let prompt = build_circuit_analysis_prompt(context);

        assert!(prompt.contains(".rts.png"));
        assert!(prompt.contains("Red channel (R): opcode type"));
        assert!(prompt.contains("Green channel (G): cell active state"));
        assert!(prompt.contains(context));
        assert!(prompt.contains("Sparse regions"));
        assert!(prompt.contains("Data flow bottlenecks"));
    }
}