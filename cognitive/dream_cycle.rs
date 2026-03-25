// dream_cycle.rs -> The REM Phase Engine
// Phase 17: Offline replay during idle cycles (OS "sleep")

use crate::memory_compressor::{CompressedAwareness, MemoryArchive, MemoryGlyph};
use crate::neural_mirror::GlyphType;

/// Dream cycle configuration
#[derive(Debug, Clone)]
pub struct DreamConfig {
    /// Number of training retries per dissonant memory
    pub intensity: u32,
    /// Maximum memories to process per dream cycle
    pub max_memories: usize,
    /// Minimum idle time before dream triggers (ms)
    pub idle_threshold_ms: u64,
}

impl Default for DreamConfig {
    fn default() -> Self {
        Self {
            intensity: 10,
            max_memories: 50,
            idle_threshold_ms: 300000, // 5 minutes
        }
    }
}

/// Status of a processed memory
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MemoryStatus {
    Dissonant = 0x01,
    Resolved = 0x02,
    Archived = 0x03,
}

/// Result of a dream cycle
#[derive(Debug, Clone)]
pub struct DreamResult {
    pub memories_processed: usize,
    pub memories_resolved: usize,
    pub training_iterations: u64,
    pub coherence_before: f32,
    pub coherence_after: f32,
}

/// The Dream Cycle engine - processes failures during idle
pub struct DreamCycle {
    config: DreamConfig,
    /// Total dreams performed
    dreams_completed: u64,
    /// Memories resolved across all dreams
    total_resolved: u64,
    /// Current dream state
    is_dreaming: bool,
}

impl DreamCycle {
    pub fn new() -> Self {
        Self {
            config: DreamConfig::default(),
            dreams_completed: 0,
            total_resolved: 0,
            is_dreaming: false,
        }
    }

    pub fn with_config(config: DreamConfig) -> Self {
        Self {
            config,
            ..Self::new()
        }
    }

    /// Enter dream mode
    pub fn begin_dream(&mut self) {
        self.is_dreaming = true;
        println!("🌙 DREAM CYCLE: Entering REM phase...");
    }

    /// Exit dream mode
    pub fn end_dream(&mut self) {
        self.is_dreaming = false;
        self.dreams_completed += 1;
        println!("🌅 DREAM CYCLE: Waking from REM");
    }

    /// Check if currently dreaming
    pub fn is_active(&self) -> bool {
        self.is_dreaming
    }

    /// Forces the OS to re-process failed memories during idle time
    pub fn process_failures(&mut self, archive: &mut MemoryArchive) -> DreamResult {
        self.begin_dream();

        let coherence_before = archive.coherence_ratio();

        // Get all DISSONANT ticks
        let failures = archive.query_by_status(false);
        let to_process: Vec<_> = failures.into_iter().take(self.config.max_memories).collect();

        let mut memories_processed = 0;
        let mut memories_resolved = 0;
        let mut training_iterations = 0u64;

        for tick in &to_process {
            if let Some(entry) = archive.retrieve(*tick) {
                println!("🌙 DREAMING: Re-processing failure at Tick {}...", tick);
                memories_processed += 1;

                // Simulate mental re-processing (training)
                for _ in 0..self.config.intensity {
                    // In production: kernel.train_on_block(raw_pixels)
                    training_iterations += self.config.intensity as u64;
                }

                // Mark as RESOLVED if we "understand" it now
                // In production, this would be based on actual kernel confidence
                if self.simulate_resolution() {
                    memories_resolved += 1;
                    self.total_resolved += 1;
                    println!("   ✓ Resolved Tick {} (now coherent)", tick);
                }
            }
        }

        let coherence_after = archive.coherence_ratio();

        self.end_dream();

        DreamResult {
            memories_processed,
            memories_resolved,
            training_iterations,
            coherence_before,
            coherence_after,
        }
    }

    /// Simulate whether a memory becomes resolved (placeholder for actual ML)
    fn simulate_resolution(&self) -> bool {
        // In production: check if kernel now classifies correctly
        // For now, 70% resolution rate based on intensity
        use std::time::{SystemTime, UNIX_EPOCH};
        let ns = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .subsec_nanos();
        (ns % 100) < (self.config.intensity * 7).min(90)
    }

    /// Get dream statistics
    pub fn stats(&self) -> DreamStats {
        DreamStats {
            dreams_completed: self.dreams_completed,
            total_resolved: self.total_resolved,
            is_dreaming: self.is_dreaming,
            intensity: self.config.intensity,
        }
    }

    /// Generate a dream summary
    pub fn summarize(&self, result: &DreamResult) -> String {
        let mut summary = String::new();

        summary.push_str("╔══════════════════════════════════════════════╗\n");
        summary.push_str("║            DREAM CYCLE REPORT               ║\n");
        summary.push_str("╠══════════════════════════════════════════════╣\n");
        summary.push_str(&format!(
            "║ Memories Processed: {:>23} ║\n",
            result.memories_processed
        ));
        summary.push_str(&format!(
            "║ Memories Resolved:  {:>23} ║\n",
            result.memories_resolved
        ));
        summary.push_str(&format!(
            "║ Training Iterations: {:>22} ║\n",
            result.training_iterations
        ));
        summary.push_str(&format!(
            "║ Coherence Before:   {:>22.1}% ║\n",
            result.coherence_before * 100.0
        ));
        summary.push_str(&format!(
            "║ Coherence After:    {:>22.1}% ║\n",
            result.coherence_after * 100.0
        ));
        summary.push_str(&format!(
            "║ Dreams Completed:   {:>22} ║\n",
            self.dreams_completed
        ));
        summary.push_str("╚══════════════════════════════════════════════╝\n");

        summary
    }
}

impl Default for DreamCycle {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Debug, Clone)]
pub struct DreamStats {
    pub dreams_completed: u64,
    pub total_resolved: u64,
    pub is_dreaming: bool,
    pub intensity: u32,
}

/// Idle monitor that triggers dream cycles
pub struct IdleDreamMonitor {
    dream_cycle: DreamCycle,
    idle_threshold_ms: u64,
    last_activity_ms: u64,
    current_time_ms: u64,
}

impl IdleDreamMonitor {
    pub fn new() -> Self {
        Self {
            dream_cycle: DreamCycle::new(),
            idle_threshold_ms: 300000, // 5 minutes
            last_activity_ms: 0,
            current_time_ms: 0,
        }
    }

    /// Mark activity (reset idle timer)
    pub fn mark_activity(&mut self, time_ms: u64) {
        self.last_activity_ms = time_ms;
        self.current_time_ms = time_ms;
    }

    /// Update current time and check if dream should trigger
    pub fn update(&mut self, time_ms: u64) -> bool {
        self.current_time_ms = time_ms;
        let idle_time = time_ms.saturating_sub(self.last_activity_ms);
        idle_time >= self.idle_threshold_ms
    }

    /// Get idle duration in milliseconds
    pub fn idle_duration_ms(&self) -> u64 {
        self.current_time_ms.saturating_sub(self.last_activity_ms)
    }

    /// Get the dream cycle engine
    pub fn dream_cycle(&self) -> &DreamCycle {
        &self.dream_cycle
    }

    /// Get mutable dream cycle engine
    pub fn dream_cycle_mut(&mut self) -> &mut DreamCycle {
        &mut self.dream_cycle
    }
}

impl Default for IdleDreamMonitor {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_dream_cycle_creation() {
        let dream = DreamCycle::new();
        assert!(!dream.is_dreaming);
        assert_eq!(dream.dreams_completed, 0);
    }

    #[test]
    fn test_dream_config() {
        let config = DreamConfig {
            intensity: 20,
            max_memories: 100,
            idle_threshold_ms: 60000,
        };

        let dream = DreamCycle::with_config(config);
        assert_eq!(dream.config.intensity, 20);
    }

    #[test]
    fn test_idle_monitor() {
        let mut monitor = IdleDreamMonitor::new();

        monitor.mark_activity(0);
        assert!(!monitor.update(1000)); // Not idle yet

        assert!(monitor.update(400000)); // 400s > 300s threshold
        assert_eq!(monitor.idle_duration_ms(), 400000);
    }
}
