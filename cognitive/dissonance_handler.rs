// dissonance_handler.rs -> The Cognitive Repair System
// Phase 16: Handles mismatches between Mind intent and Eye perception

use std::sync::{Arc, Mutex};

use crate::awareness_logger::AwarenessLogger;
use crate::neural_mirror::{MirrorResult, NeuralMirror};

/// System bus commands for cognitive control
#[derive(Debug, Clone)]
pub enum BusCommand {
    ClockSlowdown(u32),  // Slow heartbeat to specified ms
    ClockResume,         // Resume normal heartbeat (100ms)
    PauseWorldEngine,    // Pause the biosphere
    ResumeWorldEngine,   // Resume the biosphere
    TriggerBackprop,     // Trigger localized training
}

/// Configuration for the Dissonance Handler
#[derive(Debug, Clone)]
pub struct DissonanceConfig {
    /// Score threshold below which repair is triggered
    pub error_threshold: f32,
    /// How much to slow the clock during repair (ms)
    pub repair_clock_ms: u32,
    /// Number of training epochs during repair
    pub repair_epochs: u32,
    /// Minimum time between repairs (in ticks)
    pub repair_cooldown: u64,
    /// Maximum consecutive repairs before escalating
    pub max_consecutive_repairs: u32,
}

impl Default for DissonanceConfig {
    fn default() -> Self {
        Self {
            error_threshold: 0.8,
            repair_clock_ms: 500,
            repair_epochs: 10,
            repair_cooldown: 100,
            max_consecutive_repairs: 3,
        }
    }
}

/// The Dissonance Handler - maintains cognitive coherence
pub struct DissonanceHandler {
    config: DissonanceConfig,
    /// Current clock frequency
    current_clock_ms: u32,
    /// Number of repairs performed
    repairs_performed: u64,
    /// Consecutive repairs without recovery
    consecutive_repairs: u32,
    /// Last repair tick
    last_repair_tick: u64,
    /// Currently in repair mode
    in_repair_mode: bool,
    /// Bus command sender
    bus_sender: Option<Arc<Mutex<Box<dyn FnMut(BusCommand) + Send>>>>,
    /// Reference to awareness logger
    logger: Option<Arc<Mutex<AwarenessLogger>>>,
}

impl DissonanceHandler {
    pub fn new() -> Self {
        Self {
            config: DissonanceConfig::default(),
            current_clock_ms: 100,
            repairs_performed: 0,
            consecutive_repairs: 0,
            last_repair_tick: 0,
            in_repair_mode: false,
            bus_sender: None,
            logger: None,
        }
    }

    pub fn with_config(config: DissonanceConfig) -> Self {
        Self {
            config,
            ..Self::new()
        }
    }

    /// Set the bus command callback
    pub fn set_bus_callback(&mut self, callback: Box<dyn FnMut(BusCommand) + Send>) {
        self.bus_sender = Some(Arc::new(Mutex::new(callback)));
    }

    /// Set the awareness logger
    pub fn set_logger(&mut self, logger: Arc<Mutex<AwarenessLogger>>) {
        self.logger = Some(logger);
    }

    /// Send a command to the system bus
    fn send_bus_command(&self, command: BusCommand) {
        if let Some(sender) = &self.bus_sender {
            if let Ok(mut cb) = sender.lock() {
                cb(command);
            }
        }
    }

    /// Handle a mirror test result
    pub fn handle_result(&mut self, result: &MirrorResult, mirror: &mut NeuralMirror) {
        if result.coherent {
            // Reset consecutive repair counter on coherent result
            self.consecutive_repairs = 0;

            // If we were in repair mode, check if we can resume
            if self.in_repair_mode && mirror.self_recognition_score > self.config.error_threshold {
                self.exit_repair_mode(result.tick);
            }
        } else {
            // Dissonant result
            self.handle_mismatch(result, mirror);
        }
    }

    /// Respond to a failed Mirror Test
    fn handle_mismatch(&mut self, result: &MirrorResult, mirror: &mut NeuralMirror) {
        // Check if we're in cooldown
        if result.tick - self.last_repair_tick < self.config.repair_cooldown {
            return;
        }

        // Check if repair is needed
        if mirror.self_recognition_score < self.config.error_threshold {
            println!(
                "⚠️ COGNITIVE DISSONANCE: Discrepancy detected. Score: {:.2}",
                mirror.self_recognition_score
            );

            // Check for escalation
            if self.consecutive_repairs >= self.config.max_consecutive_repairs {
                self.escalate(result);
                return;
            }

            // Enter repair mode
            self.enter_repair_mode(result);
        }
    }

    /// Enter repair mode
    fn enter_repair_mode(&mut self, result: &MirrorResult) {
        self.in_repair_mode = true;
        self.repairs_performed += 1;
        self.consecutive_repairs += 1;
        self.last_repair_tick = result.tick;

        // 1. Slow the Heartbeat to allow for deeper 'thinking'
        self.send_bus_command(BusCommand::ClockSlowdown(self.config.repair_clock_ms));
        self.current_clock_ms = self.config.repair_clock_ms;

        // 2. Pause the world engine
        self.send_bus_command(BusCommand::PauseWorldEngine);

        // 3. Trigger localized backprop
        self.send_bus_command(BusCommand::TriggerBackprop);

        // Log the repair
        if let Some(logger) = &self.logger {
            if let Ok(mut log) = logger.lock() {
                let _ = log.record_repair(
                    result.tick,
                    &format!(
                        "Triggering Localized Backprop (epochs: {})",
                        self.config.repair_epochs
                    ),
                );
            }
        }

        println!(
            "🛠️ REPAIR STARTED: Epochs={}, Clock={}ms",
            self.config.repair_epochs, self.config.repair_clock_ms
        );
    }

    /// Exit repair mode
    fn exit_repair_mode(&mut self, tick: u64) {
        self.in_repair_mode = false;

        // Resume normal clock
        self.send_bus_command(BusCommand::ClockResume);
        self.current_clock_ms = 100;

        // Resume world engine
        self.send_bus_command(BusCommand::ResumeWorldEngine);

        println!("✅ REPAIR COMPLETE: Perception resynced with Intent.");
    }

    /// Escalate when repairs aren't working
    fn escalate(&mut self, result: &MirrorResult) {
        println!(
            "🚨 COGNITIVE CRISIS: {} consecutive repairs failed!",
            self.consecutive_repairs
        );
        println!("   Consider: Full system reset or human intervention.");

        // Log the crisis
        if let Some(logger) = &self.logger {
            if let Ok(mut log) = logger.lock() {
                let _ = log.record_repair(
                    result.tick,
                    &format!(
                        "CRISIS: {} consecutive repairs failed. Escalation required.",
                        self.consecutive_repairs
                    ),
                );
            }
        }
    }

    /// Recalibrate perception (called after backprop)
    pub fn recalibrate_perception(&self) {
        // In production, this would trigger backprop.rs
        println!("🧠 RECALIBRATION: Running localized backpropagation...");
    }

    /// Get current status
    pub fn status(&self) -> DissonanceStatus {
        DissonanceStatus {
            in_repair_mode: self.in_repair_mode,
            current_clock_ms: self.current_clock_ms,
            repairs_performed: self.repairs_performed,
            consecutive_repairs: self.consecutive_repairs,
            error_threshold: self.config.error_threshold,
        }
    }

    /// Reset the handler
    pub fn reset(&mut self) {
        self.current_clock_ms = 100;
        self.repairs_performed = 0;
        self.consecutive_repairs = 0;
        self.last_repair_tick = 0;
        self.in_repair_mode = false;
    }
}

impl Default for DissonanceHandler {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Debug, Clone)]
pub struct DissonanceStatus {
    pub in_repair_mode: bool,
    pub current_clock_ms: u32,
    pub repairs_performed: u64,
    pub consecutive_repairs: u32,
    pub error_threshold: f32,
}

impl std::fmt::Display for DissonanceStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "DissonanceHandler: {} (Clock: {}ms, Repairs: {}, Consecutive: {})",
            if self.in_repair_mode { "REPAIRING" } else { "NORMAL" },
            self.current_clock_ms,
            self.repairs_performed,
            self.consecutive_repairs
        )
    }
}

/// Integration with NeuralMirror
pub fn create_mirror_with_handler() -> (NeuralMirror, DissonanceHandler) {
    let mut mirror = NeuralMirror::new();
    let handler = DissonanceHandler::new();

    // Set up callback from mirror to handler
    // Note: In production, this would be set up with proper Arc<Mutex<>> handling

    (mirror, handler)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_handler_creation() {
        let handler = DissonanceHandler::new();
        assert!(!handler.in_repair_mode);
        assert_eq!(handler.current_clock_ms, 100);
    }

    #[test]
    fn test_coherent_result_no_repair() {
        let mut handler = DissonanceHandler::new();
        let mut mirror = NeuralMirror::new();

        // Set up a coherent result
        mirror.self_recognition_score = 0.9;

        let result = MirrorResult {
            tick: 100,
            intent: GlyphType::High,
            observation: GlyphType::High,
            coherent: true,
            confidence: 0.95,
        };

        handler.handle_result(&result, &mut mirror);

        assert!(!handler.in_repair_mode);
    }

    #[test]
    fn test_config_custom() {
        let config = DissonanceConfig {
            error_threshold: 0.6,
            repair_clock_ms: 1000,
            repair_epochs: 20,
            repair_cooldown: 200,
            max_consecutive_repairs: 5,
        };

        let handler = DissonanceHandler::with_config(config);
        assert_eq!(handler.config.error_threshold, 0.6);
        assert_eq!(handler.config.repair_clock_ms, 1000);
    }

    #[test]
    fn test_status_display() {
        let handler = DissonanceHandler::new();
        let status = handler.status();

        let display = format!("{}", status);
        assert!(display.contains("NORMAL"));
        assert!(display.contains("100ms"));
    }
}
