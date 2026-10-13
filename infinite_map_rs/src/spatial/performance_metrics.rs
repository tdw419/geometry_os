//! Performance Metrics Collector for Phase 14.3
//!
//! Extracts real-time performance metrics from GridRunner execution
//! for use in AI feedback loops.
//!
//! Metrics collected:
//! - FPS (frames per second)
//! - Token throughput (active instructions per second)
//! - Memory usage (GPU buffer sizes)
//! - Execution time per tick
//! - Grid utilization (active cells / total cells)

use std::time::{Duration, Instant};

/// Performance metrics snapshot from GridRunner execution
#[derive(Debug, Clone)]
pub struct PerformanceMetrics {
    /// Frames per second (Hz)
    pub fps: f32,

    /// Tokens processed per second (active instructions)
    pub tokens_per_second: f64,

    /// Average execution time per tick (microseconds)
    pub avg_tick_time_us: f64,

    /// Maximum tick time in the sample (microseconds)
    pub max_tick_time_us: f64,

    /// Grid utilization ratio (0.0 to 1.0)
    pub grid_utilization: f32,

    /// Total GPU memory allocated (bytes)
    pub gpu_memory_bytes: u64,

    /// Active cell count
    pub active_cells: usize,

    /// Total cell count
    pub total_cells: usize,

    /// Sample timestamp
    pub timestamp: Instant,
}

/// Metrics collector with rolling window statistics
pub struct MetricsCollector {
    /// Rolling window of tick times (microseconds)
    tick_times: Vec<f64>,

    /// Maximum samples in rolling window
    max_samples: usize,

    /// Start time of current measurement window
    window_start: Instant,

    /// Frames counted in current window
    frame_count: u64,

    /// Grid dimensions
    grid_w: usize,
    grid_h: usize,

    /// Total GPU memory allocated
    gpu_memory_bytes: u64,
}

impl MetricsCollector {
    /// Create a new metrics collector
    ///
    /// `max_samples`: Size of rolling window for tick time averaging
    pub fn new(grid_w: usize, grid_h: usize, max_samples: usize) -> Self {
        Self {
            tick_times: Vec::with_capacity(max_samples),
            max_samples,
            window_start: Instant::now(),
            frame_count: 0,
            grid_w,
            grid_h,
            gpu_memory_bytes: 0,
        }
    }

    /// Record a tick execution time
    pub fn record_tick(&mut self, tick_duration: Duration) {
        let tick_us = tick_duration.as_micros() as f64;

        // Add to rolling window
        self.tick_times.push(tick_us);
        if self.tick_times.len() > self.max_samples {
            self.tick_times.remove(0);
        }

        self.frame_count += 1;
    }

    /// Update GPU memory allocation info
    pub fn set_gpu_memory(&mut self, bytes: u64) {
        self.gpu_memory_bytes = bytes;
    }

    /// Calculate current metrics snapshot
    ///
    /// `active_cells`: Current number of active cells in the grid
    pub fn calculate_metrics(&self, active_cells: usize) -> PerformanceMetrics {
        let now = Instant::now();
        let window_duration = now.duration_since(self.window_start);

        // Calculate FPS
        let fps = if window_duration.as_secs_f32() > 0.0 {
            self.frame_count as f32 / window_duration.as_secs_f32()
        } else {
            0.0
        };

        // Calculate average and max tick times
        let (avg_tick_time_us, max_tick_time_us) = if self.tick_times.is_empty() {
            (0.0, 0.0)
        } else {
            let sum: f64 = self.tick_times.iter().sum();
            let max = *self.tick_times.iter().max_by(|a, b| a.partial_cmp(b).unwrap()).unwrap();
            (sum / self.tick_times.len() as f64, max)
        };

        // Calculate grid utilization
        let total_cells = self.grid_w * self.grid_h;
        let grid_utilization = if total_cells > 0 {
            active_cells as f32 / total_cells as f32
        } else {
            0.0
        };

        // Estimate token throughput (assuming active cells = active tokens)
        let tokens_per_second = if window_duration.as_secs_f64() > 0.0 {
            (active_cells as f64) / window_duration.as_secs_f64()
        } else {
            0.0
        };

        PerformanceMetrics {
            fps,
            tokens_per_second,
            avg_tick_time_us,
            max_tick_time_us,
            grid_utilization,
            gpu_memory_bytes: self.gpu_memory_bytes,
            active_cells,
            total_cells,
            timestamp: now,
        }
    }

    /// Reset measurement window
    pub fn reset_window(&mut self) {
        self.window_start = Instant::now();
        self.frame_count = 0;
        self.tick_times.clear();
    }

    /// Format metrics as human-readable text (for LLM prompts)
    pub fn format_for_llm(&self, metrics: &PerformanceMetrics) -> String {
        format!(
            "=== SPATIAL CIRCUIT PERFORMANCE METRICS ===\n\
             FPS: {:.2}\n\
             Token Throughput: {:.2} tokens/sec\n\
             Avg Tick Time: {:.2} µs\n\
             Max Tick Time: {:.2} µs\n\
             Grid Utilization: {:.1}% ({} active / {} total)\n\
             GPU Memory: {:.2} MB\n\
             ===",
            metrics.fps,
            metrics.tokens_per_second,
            metrics.avg_tick_time_us,
            metrics.max_tick_time_us,
            metrics.grid_utilization * 100.0,
            metrics.active_cells,
            metrics.total_cells,
            metrics.gpu_memory_bytes as f32 / 1024.0 / 1024.0
        )
    }

    /// Format metrics as JSON (for programmatic use)
    pub fn to_json(&self, metrics: &PerformanceMetrics) -> String {
        format!(
            r#"{{"fps": {:.2}, "tokens_per_second": {:.2}, "avg_tick_time_us": {:.2}, "max_tick_time_us": {:.2}, "grid_utilization": {:.4}, "gpu_memory_mb": {:.2}, "active_cells": {}, "total_cells": {}}}"#,
            metrics.fps,
            metrics.tokens_per_second,
            metrics.avg_tick_time_us,
            metrics.max_tick_time_us,
            metrics.grid_utilization,
            metrics.gpu_memory_bytes as f32 / 1024.0 / 1024.0,
            metrics.active_cells,
            metrics.total_cells
        )
    }

    /// Calculate performance improvement percentage
    ///
    /// Returns positive value for improvement, negative for regression
    pub fn calculate_improvement(&self, before: &PerformanceMetrics, after: &PerformanceMetrics) -> f32 {
        // Primary metric: tokens per second (throughput)
        let throughput_improvement = if before.tokens_per_second > 0.0 {
            ((after.tokens_per_second - before.tokens_per_second) / before.tokens_per_second) as f32 * 100.0
        } else {
            0.0
        };

        // Secondary metric: tick time (lower is better)
        let latency_improvement = if before.avg_tick_time_us > 0.0 {
            ((before.avg_tick_time_us - after.avg_tick_time_us) / before.avg_tick_time_us) as f32 * 100.0
        } else {
            0.0
        };

        // Weighted average (throughput 70%, latency 30%)
        throughput_improvement * 0.7 + latency_improvement * 0.3
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_metrics_collector_basic() {
        let mut collector = MetricsCollector::new(128, 64, 100);

        // Record some tick times
        for _ in 0..10 {
            collector.record_tick(Duration::from_micros(1000));
        }

        let metrics = collector.calculate_metrics(50);

        assert!(metrics.fps > 0.0);
        assert!(metrics.avg_tick_time_us > 0.0);
        assert_eq!(metrics.active_cells, 50);
        assert_eq!(metrics.total_cells, 128 * 64);
    }

    #[test]
    fn test_metrics_improvement() {
        let mut collector = MetricsCollector::new(128, 64, 100);

        let before = PerformanceMetrics {
            fps: 60.0,
            tokens_per_second: 1000.0,
            avg_tick_time_us: 1000.0,
            max_tick_time_us: 1200.0,
            grid_utilization: 0.5,
            gpu_memory_bytes: 1024 * 1024,
            active_cells: 4000,
            total_cells: 8192,
            timestamp: Instant::now(),
        };

        let after = PerformanceMetrics {
            fps: 120.0,  // 2x improvement
            tokens_per_second: 2000.0,  // 2x improvement
            avg_tick_time_us: 500.0,  // 2x improvement
            max_tick_time_us: 600.0,
            grid_utilization: 0.5,
            gpu_memory_bytes: 1024 * 1024,
            active_cells: 4000,
            total_cells: 8192,
            timestamp: Instant::now(),
        };

        let improvement = collector.calculate_improvement(&before, &after);
        assert!(improvement > 90.0); // Should be ~100% improvement
    }

    #[test]
    fn test_metrics_rolling_window() {
        let mut collector = MetricsCollector::new(128, 64, 5);

        // Add 10 samples, should only keep last 5
        for i in 0..10 {
            collector.record_tick(Duration::from_micros((i + 1) * 100));
        }

        assert_eq!(collector.tick_times.len(), 5);
        // Should have samples 6, 7, 8, 9, 10 (in µs: 600, 700, 800, 900, 1000)
        assert_eq!(collector.tick_times[0], 600.0);
        assert_eq!(collector.tick_times[4], 1000.0);
    }

    #[test]
    fn test_format_for_llm() {
        let mut collector = MetricsCollector::new(128, 64, 100);

        for _ in 0..60 {
            collector.record_tick(Duration::from_micros(1000));
        }

        let metrics = collector.calculate_metrics(4000);
        let formatted = collector.format_for_llm(&metrics);

        assert!(formatted.contains("FPS:"));
        assert!(formatted.contains("Token Throughput:"));
        assert!(formatted.contains("Grid Utilization:"));
    }

    #[test]
    fn test_to_json() {
        let mut collector = MetricsCollector::new(128, 64, 100);

        for _ in 0..10 {
            collector.record_tick(Duration::from_micros(1000));
        }

        let metrics = collector.calculate_metrics(4000);
        let json = collector.to_json(&metrics);

        assert!(json.contains("\"fps\":"));
        assert!(json.contains("\"tokens_per_second\":"));
        assert!(json.contains("\"grid_utilization\":"));
    }
}