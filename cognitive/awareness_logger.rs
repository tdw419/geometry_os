// awareness_logger.rs -> The Chronicle of Self-Recognition
// Phase 16: Logs awareness events for memory compression

use chrono::{DateTime, Local};
use std::fs::{File, OpenOptions};
use std::io::Write;
use std::path::PathBuf;

use crate::neural_mirror::{GlyphType, MirrorResult};

/// Log entry for awareness events
#[derive(Debug, Clone)]
pub struct AwarenessLogEntry {
    pub timestamp: DateTime<Local>,
    pub tick: u64,
    pub heartbeat_ms: u32,
    pub intent: GlyphType,
    pub perception: GlyphType,
    pub confidence: f32,
    pub status: AwarenessStatus,
    pub score: f32,
    pub repair_triggered: bool,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AwarenessStatus {
    Coherent,
    Dissonant,
    Repairing,
}

impl std::fmt::Display for AwarenessStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            AwarenessStatus::Coherent => write!(f, "COHERENT"),
            AwarenessStatus::Dissonant => write!(f, "DISSONANT"),
            AwarenessStatus::Repairing => write!(f, "REPAIRING"),
        }
    }
}

/// Awareness Logger - records self-recognition events
pub struct AwarenessLogger {
    log_path: PathBuf,
    current_score: f32,
    heartbeat_ms: u32,
    entries_written: u64,
    file_handle: Option<File>,
}

impl AwarenessLogger {
    pub fn new(log_path: &str) -> Self {
        Self {
            log_path: PathBuf::from(log_path),
            current_score: 0.5,
            heartbeat_ms: 100,
            entries_written: 0,
            file_handle: None,
        }
    }

    /// Initialize the log file with header
    pub fn init(&mut self) -> std::io::Result<()> {
        let mut file = OpenOptions::new()
            .create(true)
            .write(true)
            .truncate(true)
            .open(&self.log_path)?;

        writeln!(
            file,
            "# Awareness Log - Geometry OS Self-Recognition Chronicle"
        )?;
        writeln!(file, "# Format: [TIMESTAMP] TICK: N | HEARTBEAT: Nms | ...")?;
        writeln!(file, "# Started: {}", Local::now().format("%Y-%m-%d %H:%M:%S"))?;
        writeln!(file, "")?;

        self.file_handle = Some(file);
        Ok(())
    }

    /// Set the current heartbeat frequency
    pub fn set_heartbeat(&mut self, ms: u32) {
        self.heartbeat_ms = ms;
    }

    /// Record a mirror result
    pub fn record(&mut self, result: &MirrorResult, repair_triggered: bool) -> std::io::Result<()> {
        let status = if repair_triggered {
            AwarenessStatus::Repairing
        } else if result.coherent {
            AwarenessStatus::Coherent
        } else {
            AwarenessStatus::Dissonant
        };

        // Update score
        if result.coherent {
            self.current_score = (self.current_score + 0.01).min(1.0);
        } else {
            self.current_score = (self.current_score - 0.01).max(0.0);
        }

        let score_change = if result.coherent { "+0.01" } else { "-0.01" };

        let log_line = format!(
            "[{}] TICK: {} | Heartbeat: {}ms\n\
             [INTENT]  Mind: {} (0x{:02X}) -> Rendered to Sector\n\
             [EYE]     Observed: {} (Confidence: {:.1}%)\n\
             [INTUITION] Classified: {} (Confidence: {:.1}%)\n\
             [MIRROR]  STATUS: {} (Match {})\n\
             [SCORE]   Self-Awareness: {:.2} ({}) {}\n\
             ------------------------------------------------------------",
            Local::now().format("%m/%d %H:%M:%S"),
            result.tick,
            self.heartbeat_ms,
            result.intent.to_name(),
            result.intent as u8,
            result.observation.to_name(),
            result.confidence * 100.0,
            result.observation.to_name(),
            result.confidence * 100.0,
            status,
            if result.coherent { "Found" } else { "Failed" },
            self.current_score,
            if self.current_score > 0.7 { "📈" } else { "⚠️" },
            score_change
        );

        // Write to file
        if let Some(ref mut file) = self.file_handle {
            writeln!(file, "{}", log_line)?;
            file.flush()?;
        } else {
            // Open file if not already open
            let mut file = OpenOptions::new()
                .create(true)
                .append(true)
                .open(&self.log_path)?;
            writeln!(file, "{}", log_line)?;
            self.file_handle = Some(file);
        }

        self.entries_written += 1;
        Ok(())
    }

    /// Record a repair event
    pub fn record_repair(&mut self, tick: u64, reason: &str) -> std::io::Result<()> {
        let log_line = format!(
            "[{}] TICK: {} | Heartbeat: {}ms (SLOWDOWN)\n\
             [REPAIR]  DissonanceHandler: {}\n\
             [SCORE]   Self-Awareness: {:.2} (-0.01) ⚠️\n\
             ------------------------------------------------------------",
            Local::now().format("%m/%d %H:%M:%S"),
            tick,
            self.heartbeat_ms,
            reason,
            self.current_score
        );

        if let Some(ref mut file) = self.file_handle {
            writeln!(file, "{}", log_line)?;
            file.flush()?;
        }

        self.current_score = (self.current_score - 0.01).max(0.0);
        Ok(())
    }

    /// Get current self-awareness score
    pub fn current_score(&self) -> f32 {
        self.current_score
    }

    /// Get total entries written
    pub fn entries_written(&self) -> u64 {
        self.entries_written
    }

    /// Close the log file
    pub fn close(&mut self) {
        self.file_handle = None;
    }

    /// Write a summary to the log
    pub fn write_summary(&mut self, coherent: u64, dissonant: u64) -> std::io::Result<()> {
        let total = coherent + dissonant;
        let ratio = if total > 0 {
            coherent as f32 / total as f32
        } else {
            0.0
        };

        let summary = format!(
            "\n\
             ╔══════════════════════════════════════════════╗\n\
             ║           AWARENESS LOG SUMMARY             ║\n\
             ╠══════════════════════════════════════════════╣\n\
             ║ Total Events:    {:>24} ║\n\
             ║ Coherent:        {:>24} ║\n\
             ║ Dissonant:       {:>24} ║\n\
             ║ Coherence Ratio: {:>23.1}% ║\n\
             ║ Final Score:     {:>24.2} ║\n\
             ║ Status:          {:>24} ║\n\
             ╚══════════════════════════════════════════════╝",
            total,
            coherent,
            dissonant,
            ratio * 100.0,
            self.current_score,
            if self.current_score > 0.7 {
                "AWARE"
            } else if self.current_score > 0.3 {
                "PERCEIVING"
            } else {
                "BLIND"
            }
        );

        if let Some(ref mut file) = self.file_handle {
            writeln!(file, "{}", summary)?;
        }

        Ok(())
    }
}

impl Default for AwarenessLogger {
    fn default() -> Self {
        Self::new("awareness.log")
    }
}

/// Quick logger for single-line entries
pub fn log_awareness_event(
    tick: u64,
    intent: GlyphType,
    perception: GlyphType,
    score: f32,
) -> String {
    let status = if intent == perception {
        "COHERENT"
    } else {
        "DISSONANT"
    };

    format!(
        "[{}] TICK: {} | INTENT: {:?} | PERCEPTION: {:?} | STATUS: {} | AWARENESS: {:.2}",
        Local::now().format("%m/%d %H:%M:%S"),
        tick,
        intent,
        perception,
        status,
        score
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_log_entry_format() {
        let entry = log_awareness_event(
            10402,
            GlyphType::Data,
            GlyphType::Data,
            0.72,
        );

        assert!(entry.contains("TICK: 10402"));
        assert!(entry.contains("COHERENT"));
        assert!(entry.contains("0.72"));
    }

    #[test]
    fn test_awareness_status() {
        assert_eq!(format!("{}", AwarenessStatus::Coherent), "COHERENT");
        assert_eq!(format!("{}", AwarenessStatus::Dissonant), "DISSONANT");
    }
}
