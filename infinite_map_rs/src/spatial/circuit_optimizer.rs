//! Self-Improving Spatial Circuits via AI Feedback (Phase 14.3)
//!
//! This module implements the feedback loop where circuits can optimize
//! themselves by querying a local LLM (Ollama) for improvements.
//!
//! Pipeline:
//! 1. Collect performance metrics from running circuit
//! 2. Send metrics + circuit description to LLM
//! 3. LLM suggests GeoASM modifications
//! 4. Materialize suggested changes via geoasm_materializer
//! 5. Validate performance improvement
//! 6. Rollback if regression

use std::time::{Duration, Instant};
use std::process::Command;
use std::io::{self, Read};

use super::performance_metrics::{PerformanceMetrics, MetricsCollector};
use super::spatial_attention::SpatialAttention;
use crate::geoasm_materializer::{CellState, MaterializeRequest, MaterializeCell, GeoasmMaterializer};

/// Configuration for circuit optimization
#[derive(Debug, Clone)]
pub struct OptimizationConfig {
    /// LLM model to use (default: qwen2.5-coder:14b)
    pub model: String,

    /// Ollama API endpoint (default: http://localhost:11434)
    pub ollama_url: String,

    /// Minimum improvement threshold (%) to accept changes (default: 5%)
    pub min_improvement_pct: f32,

    /// Maximum optimization iterations (default: 10)
    pub max_iterations: usize,

    /// Safety: enable rollback on regression (default: true)
    pub enable_rollback: bool,
}

impl Default for OptimizationConfig {
    fn default() -> Self {
        Self {
            model: "qwen2.5-coder:14b".to_string(),
            ollama_url: "http://localhost:11434".to_string(),
            min_improvement_pct: 5.0,
            max_iterations: 10,
            enable_rollback: true,
        }
    }
}

/// Result of an optimization attempt
#[derive(Debug, Clone)]
pub struct OptimizationResult {
    /// Whether the optimization improved performance
    pub improved: bool,

    /// Performance improvement percentage (positive = improvement)
    pub improvement_pct: f32,

    /// Metrics before optimization
    pub before_metrics: PerformanceMetrics,

    /// Metrics after optimization
    pub after_metrics: PerformanceMetrics,

    /// LLM suggestion (if any)
    pub suggestion: String,

    /// Materialized cells (if any)
    pub cells_materialized: usize,

    /// Whether rollback was performed
    pub rolled_back: bool,

    /// Optimization iteration number
    pub iteration: usize,
}

/// Spatial circuit optimizer with AI feedback
pub struct CircuitOptimizer {
    /// Grid dimensions
    grid_w: usize,
    grid_h: usize,

    /// Metrics collector
    metrics_collector: MetricsCollector,

    /// Materializer for applying changes
    materializer: GeoasmMaterializer,

    /// Configuration
    config: OptimizationConfig,

    /// Snapshot of grid state before last optimization (for rollback)
    last_snapshot: Option<Vec<CellState>>,

    /// Current iteration count
    iteration: usize,
}

impl CircuitOptimizer {
    /// Create a new circuit optimizer
    pub fn new(grid_w: usize, grid_h: usize, config: OptimizationConfig) -> Self {
        Self {
            grid_w,
            grid_h,
            metrics_collector: MetricsCollector::new(grid_w, grid_h, 100),
            materializer: GeoasmMaterializer::new(grid_w, grid_h),
            config,
            last_snapshot: None,
            iteration: 0,
        }
    }

    /// Create with default configuration
    pub fn with_defaults(grid_w: usize, grid_h: usize) -> Self {
        Self::new(grid_w, grid_h, OptimizationConfig::default())
    }

    /// Record a tick execution time
    pub fn record_tick(&mut self, tick_duration: Duration) {
        self.metrics_collector.record_tick(tick_duration);
    }

    /// Query LLM for circuit optimization suggestions
    ///
    /// Sends current metrics and circuit description to Ollama,
    /// returns suggested GeoASM modifications.
    fn query_llm(&self, metrics: &PerformanceMetrics, circuit_desc: &str) -> Result<String, String> {
        // Build LLM prompt
        let prompt = format!(
            r#"You are a spatial circuit optimization expert for Geometry OS.
            The current circuit has the following performance metrics:

            {}

            Circuit description:
            {}

            Based on these metrics, suggest specific GeoASM modifications to improve performance.
            Focus on:
            1. Reducing tick time (latency optimization)
            2. Increasing token throughput
            3. Optimizing memory access patterns

            Respond ONLY with valid GeoASM instructions (ASCII format).
            Format: one instruction per line, e.g.:
            LDI 10 5 0 0
            DATA 11 5 100
            ADD_RR 12 5 2 0
            WALL 15 10

            Do NOT include explanations or text outside the GeoASM instructions."#,
            self.metrics_collector.format_for_llm(metrics),
            circuit_desc
        );

        // Call Ollama API
        let mut curl = Command::new("curl")
            .arg("-s")
            .arg("-X")
            .arg("POST")
            .arg(&format!("{}/api/generate", self.config.ollama_url))
            .arg("-H")
            .arg("Content-Type: application/json")
            .arg("-d")
            .arg(format!(
                r#"{{"model": "{}", "prompt": "{}", "stream": false}}"#,
                self.config.model,
                prompt.replace('"', r#"\""#).replace('\n', r"\n")
            ))
            .output()
            .map_err(|e| format!("Failed to call Ollama: {}", e))?;

        if !curl.status.success() {
            return Err(format!("Ollama returned error: {}", curl.status));
        }

        // Parse JSON response
        let response = String::from_utf8_lossy(&curl.stdout);
        let json: serde_json::Value = serde_json::from_str(&response)
            .map_err(|e| format!("Failed to parse Ollama response: {}", e))?;

        let suggestion = json["response"]
            .as_str()
            .ok_or_else(|| "No response field in Ollama output".to_string())?
            .to_string();

        Ok(suggestion)
    }

    /// Take a snapshot of the current grid state
    pub fn snapshot_grid(&mut self, grid: &[CellState]) {
        self.last_snapshot = Some(grid.to_vec());
    }

    /// Rollback to last snapshot
    pub fn rollback(&mut self, grid: &mut [CellState]) -> Result<(), String> {
        if let Some(ref snapshot) = self.last_snapshot {
            if snapshot.len() != grid.len() {
                return Err("Snapshot size mismatch".to_string());
            }
            grid.copy_from_slice(snapshot);
            log::warn!("🔄 CircuitOptimizer: Rolled back to previous state");
            Ok(())
        } else {
            Err("No snapshot available for rollback".to_string())
        }
    }

    /// Apply optimization suggestions from LLM
    ///
    /// Returns number of cells materialized
    fn apply_suggestions(&self, grid: &mut [CellState], suggestions: &str) -> Result<usize, String> {
        // Parse GeoASM suggestions
        let cells = crate::geoasm_materializer::parse_ascii_geoasm(suggestions)
            .map_err(|e| format!("Failed to parse suggestions: {}", e))?;

        let cell_count = cells.len();

        // Create materialization request
        let req = MaterializeRequest {
            cells: cells.clone(),
            region_id: None,
        };

        // Materialize onto grid
        let _materialized_grid = self
            .materializer
            .materialize(&req)
            .map_err(|e| format!("Failed to materialize: {}", e))?;

        // Apply changes to grid
        for cell_req in cells {
            if cell_req.x < self.grid_w && cell_req.y < self.grid_h {
                let idx = cell_req.y * self.grid_w + cell_req.x;
                if idx < grid.len() {
                    grid[idx] = cell_req.cell;
                }
            }
        }

        Ok(cell_count)
    }

    /// Run one optimization iteration
    ///
    /// Returns optimization result with metrics comparison
    pub fn optimize_iteration(
        &mut self,
        grid: &mut [CellState],
        circuit_desc: &str,
        active_cells: usize,
    ) -> Result<OptimizationResult, String> {
        // Snapshot current state before optimization
        self.snapshot_grid(grid);

        // Calculate current metrics
        let before_metrics = self.metrics_collector.calculate_metrics(active_cells);

        // Query LLM for suggestions
        let suggestion = self.query_llm(&before_metrics, circuit_desc)?;

        // Apply suggestions
        let cells_materialized = self.apply_suggestions(grid, &suggestion)?;

        // Reset metrics window for fresh measurement
        self.metrics_collector.reset_window();

        // Run measurement window (caller should call record_tick during this period)
        // For now, we'll simulate by calculating metrics immediately
        // In practice, the caller will run the circuit for N ticks and collect metrics

        let after_metrics = self.metrics_collector.calculate_metrics(active_cells);

        // Calculate improvement
        let improvement_pct = self.metrics_collector.calculate_improvement(&before_metrics, &after_metrics);
        let improved = improvement_pct >= self.config.min_improvement_pct;

        // Rollback if regression detected and rollback enabled
        let rolled_back = if !improved && self.config.enable_rollback {
            self.rollback(grid)?;
            log::info!(
                "🔄 CircuitOptimizer: Regression detected ({:.1}%), rolled back",
                improvement_pct
            );
            true
        } else {
            false
        };

        self.iteration += 1;

        Ok(OptimizationResult {
            improved,
            improvement_pct,
            before_metrics,
            after_metrics,
            suggestion,
            cells_materialized,
            rolled_back,
            iteration: self.iteration,
        })
    }

    /// Run full optimization loop with automatic stopping
    ///
    /// Returns final optimization result
    pub fn optimize_full(
        &mut self,
        grid: &mut [CellState],
        circuit_desc: &str,
        active_cells: usize,
        run_tick_fn: &mut dyn FnMut(&[CellState], &mut MetricsCollector),
    ) -> Result<OptimizationResult, String> {
        let mut best_result: Option<OptimizationResult> = None;

        for _ in 0..self.config.max_iterations {
            // Run measurement window
            run_tick_fn(grid, &mut self.metrics_collector);

            // Calculate current metrics
            let current_metrics = self.metrics_collector.calculate_metrics(active_cells);

            // If we have a previous result, check if we've improved enough
            if let Some(ref best) = best_result {
                let improvement = self.metrics_collector.calculate_improvement(&best.after_metrics, &current_metrics);
                if improvement < self.config.min_improvement_pct {
                    log::info!("✓ CircuitOptimizer: Converged (improvement {:.1}% < threshold {:.1}%)",
                               improvement, self.config.min_improvement_pct);
                    break;
                }
            }

            // Run optimization iteration
            let result = self.optimize_iteration(grid, circuit_desc, active_cells)?;

            // Update best result
            match &mut best_result {
                Some(best) if result.improvement_pct > best.improvement_pct => {
                    log::info!("✓ CircuitOptimizer: Found better configuration ({:.1}% vs {:.1}%)",
                               result.improvement_pct, best.improvement_pct);
                    *best = result;
                }
                None => best_result = Some(result),
                _ => {}
            }
        }

        best_result.ok_or_else(|| "No optimization iterations completed".to_string())
    }

    /// Get current metrics without optimization
    pub fn get_metrics(&self, active_cells: usize) -> PerformanceMetrics {
        self.metrics_collector.calculate_metrics(active_cells)
    }

    /// Reset metrics collector
    pub fn reset_metrics(&mut self) {
        self.metrics_collector.reset_window();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_optimizer_creation() {
        let optimizer = CircuitOptimizer::with_defaults(128, 64);
        assert_eq!(optimizer.iteration, 0);
    }

    #[test]
    fn test_apply_suggestions() {
        let optimizer = CircuitOptimizer::with_defaults(128, 64);
        let mut grid = vec![CellState::new(0, 0, 0); 128 * 64];

        let suggestions = r#"
            LDI 10 5 0 0
            DATA 11 5 100
            ADD_RR 12 5 2 0
        "#;

        let result = optimizer.apply_suggestions(&mut grid, suggestions);
        assert!(result.is_ok());
        assert_eq!(result.unwrap(), 3);
    }

    #[test]
    fn test_snapshot_and_rollback() {
        let mut optimizer = CircuitOptimizer::with_defaults(128, 64);
        let mut grid = vec![CellState::new(0, 0, 0); 128 * 64];

        // Set initial state
        grid[100] = CellState::data(123);
        optimizer.snapshot_grid(&grid);

        // Modify grid
        grid[100] = CellState::data(456);

        // Rollback
        let result = optimizer.rollback(&mut grid);
        assert!(result.is_ok());
        assert_eq!(grid[100].data_buffer, 123);
    }

    #[test]
    fn test_metrics_recording() {
        let mut optimizer = CircuitOptimizer::with_defaults(128, 64);

        for _ in 0..10 {
            optimizer.record_tick(Duration::from_micros(1000));
        }

        let metrics = optimizer.get_metrics(50);
        assert_eq!(metrics.active_cells, 50);
        assert!(metrics.fps > 0.0);
    }

    #[test]
    fn test_optimization_config_default() {
        let config = OptimizationConfig::default();
        assert_eq!(config.model, "qwen2.5-coder:14b");
        assert_eq!(config.min_improvement_pct, 5.0);
        assert!(config.enable_rollback);
    }
}