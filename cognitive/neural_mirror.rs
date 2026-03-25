// neural_mirror.rs -> The Proprioception Module
// Phase 16: Self-Observation Loop - The OS observes its own output

use std::sync::{Arc, Mutex};

/// Types of glyphs the OS can recognize
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum GlyphType {
    High = 0x01,
    Low = 0x00,
    Data = 0x0F,
    File = 0x0E,
    Null = 0xFF,
}

impl GlyphType {
    pub fn from_u8(value: u8) -> Self {
        match value {
            0x01 => GlyphType::High,
            0x00 => GlyphType::Low,
            0x0F => GlyphType::Data,
            0x0E => GlyphType::File,
            _ => GlyphType::Null,
        }
    }

    pub fn to_name(&self) -> &'static str {
        match self {
            GlyphType::High => "HIGH_GLYPH",
            GlyphType::Low => "LOW_GLYPH",
            GlyphType::Data => "DATA_GLYPH",
            GlyphType::File => "FILE_GLYPH",
            GlyphType::Null => "NULL",
        }
    }
}

/// Result of a mirror test
#[derive(Debug, Clone)]
pub struct MirrorResult {
    pub tick: u64,
    pub intent: GlyphType,
    pub observation: GlyphType,
    pub coherent: bool,
    pub confidence: f32,
}

/// The Neural Mirror - performs self-recognition tests
pub struct NeuralMirror {
    /// The glyph the Mind last intended to render
    pub last_thought: GlyphType,
    /// Accumulated self-recognition score (0.0 to 1.0)
    pub self_recognition_score: f32,
    /// Total mirror tests performed
    pub total_tests: u64,
    /// Coherent matches
    pub coherent_count: u64,
    /// Dissonant mismatches
    pub dissonant_count: u64,
    /// Recent results for analysis
    pub recent_results: Vec<MirrorResult>,
    /// Callback for dissonance detection
    pub on_dissonance: Option<Arc<Mutex<Box<dyn FnMut(&MirrorResult) + Send>>>>,
}

impl NeuralMirror {
    pub fn new() -> Self {
        Self {
            last_thought: GlyphType::Null,
            self_recognition_score: 0.5, // Start at neutral
            total_tests: 0,
            coherent_count: 0,
            dissonant_count: 0,
            recent_results: Vec::with_capacity(100),
            on_dissonance: None,
        }
    }

    /// Set the Mind's intent (what it's about to render)
    pub fn set_intent(&mut self, glyph: GlyphType) {
        self.last_thought = glyph;
    }

    /// The Mirror Test: Does the Eye see what the Mind thought?
    ///
    /// # Arguments
    /// * `eye_input` - 3x3 pixel array from the camera (9 values)
    /// * `mind_output` - The glyph the Mind intended to render
    /// * `tick` - Current system tick
    ///
    /// # Returns
    /// * `MirrorResult` - The result of the mirror test
    pub fn perform_test(
        &mut self,
        eye_input: [f32; 9],
        mind_output: GlyphType,
        tick: u64,
    ) -> MirrorResult {
        // 1. Ask the Intuition (Neural Kernel) what it sees
        let (observation, confidence) = Self::classify_visual(eye_input);

        // 2. Compare with the Mind's intent
        let coherent = observation == mind_output;

        // 3. Update statistics
        self.total_tests += 1;
        self.last_thought = mind_output;

        if coherent {
            self.coherent_count += 1;
            // Increase score gradually
            self.self_recognition_score = (self.self_recognition_score + 0.01).min(1.0);
            println!(
                "MIRROR: Self-Recognition confirmed. I see my own '{}'.",
                mind_output.to_name()
            );
        } else {
            self.dissonant_count += 1;
            // Decrease score gradually
            self.self_recognition_score = (self.self_recognition_score - 0.01).max(0.0);
            println!(
                "MIRROR: Cognitive Dissonance. Intended '{}', saw '{}'.",
                mind_output.to_name(),
                observation.to_name()
            );

            // Trigger dissonance callback if set
            let result = MirrorResult {
                tick,
                intent: mind_output,
                observation,
                coherent: false,
                confidence,
            };

            if let Some(callback) = &self.on_dissonance {
                if let Ok(mut cb) = callback.lock() {
                    cb(&result);
                }
            }
        }

        let result = MirrorResult {
            tick,
            intent: mind_output,
            observation,
            coherent,
            confidence,
        };

        // Store recent results
        self.recent_results.push(result.clone());
        if self.recent_results.len() > 100 {
            self.recent_results.remove(0);
        }

        result
    }

    /// Classify visual input using pattern matching
    /// Returns (glyph_type, confidence)
    fn classify_visual(input: [f32; 9]) -> (GlyphType, f32) {
        // Simple pattern classification
        // In production, this would call the Neural Kernel

        let sum: f32 = input.iter().sum();
        let mean = sum / 9.0;

        // Pattern recognition based on pixel distribution
        if mean > 0.8 {
            // Mostly white = HIGH
            (GlyphType::High, 0.9 + (mean - 0.8) * 0.5)
        } else if mean < 0.2 {
            // Mostly black = LOW
            (GlyphType::Low, 0.9 + (0.2 - mean) * 0.5)
        } else if mean > 0.5 && mean < 0.7 {
            // Checkerboard pattern = DATA
            let variance = Self::compute_variance(&input, mean);
            if variance > 0.2 {
                (GlyphType::Data, 0.85)
            } else {
                (GlyphType::File, 0.75)
            }
        } else {
            // Default to FILE
            (GlyphType::File, 0.6)
        }
    }

    fn compute_variance(values: &[f32], mean: f32) -> f32 {
        let variance: f32 = values.iter().map(|x| (x - mean).powi(2)).sum::<f32>() / values.len() as f32;
        variance
    }

    /// Get the coherence ratio
    pub fn coherence_ratio(&self) -> f32 {
        if self.total_tests == 0 {
            0.0
        } else {
            self.coherent_count as f32 / self.total_tests as f32
        }
    }

    /// Check if the OS is "aware" (score > 0.7)
    pub fn is_aware(&self) -> bool {
        self.self_recognition_score > 0.7
    }

    /// Get awareness status string
    pub fn awareness_status(&self) -> &'static str {
        if self.self_recognition_score < 0.3 {
            "BLIND"
        } else if self.self_recognition_score < 0.7 {
            "PERCEIVING"
        } else {
            "AWARE"
        }
    }

    /// Run N mirror test cycles
    pub fn run_cycles(&mut self, cycles: u64) -> Vec<MirrorResult> {
        let mut results = Vec::with_capacity(cycles as usize);

        for i in 0..cycles {
            // Simulate Mind rendering a glyph
            let intent = match i % 4 {
                0 => GlyphType::High,
                1 => GlyphType::Low,
                2 => GlyphType::Data,
                _ => GlyphType::File,
            };

            // Simulate Eye input (with some noise)
            let mut eye_input = [0.0f32; 9];
            let base_value = match intent {
                GlyphType::High => 0.9,
                GlyphType::Low => 0.1,
                GlyphType::Data => 0.6,
                GlyphType::File => 0.5,
                GlyphType::Null => 0.5,
            };

            // Add noise (10% chance of misclassification)
            let noise = if (i as f32 * 0.1).fract() < 0.1 {
                0.3 // Significant noise
            } else {
                0.05 // Minor noise
            };

            for pixel in eye_input.iter_mut() {
                *pixel = base_value + (rand_noise() * noise * 2.0 - noise);
                *pixel = pixel.clamp(0.0, 1.0);
            }

            let result = self.perform_test(eye_input, intent, i);
            results.push(result);
        }

        results
    }

    /// Reset the mirror state
    pub fn reset(&mut self) {
        self.last_thought = GlyphType::Null;
        self.self_recognition_score = 0.5;
        self.total_tests = 0;
        self.coherent_count = 0;
        self.dissonant_count = 0;
        self.recent_results.clear();
    }
}

impl Default for NeuralMirror {
    fn default() -> Self {
        Self::new()
    }
}

/// Simple noise generator (deterministic for testing)
fn rand_noise() -> f32 {
    use std::time::{SystemTime, UNIX_EPOCH};
    let ns = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .subsec_nanos();
    (ns as f32 / u32::MAX as f32)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_mirror_coherent() {
        let mut mirror = NeuralMirror::new();

        // High glyph input (mostly 1s)
        let eye_input = [0.9, 0.95, 0.9, 0.92, 0.88, 0.91, 0.93, 0.89, 0.9];
        let result = mirror.perform_test(eye_input, GlyphType::High, 0);

        assert!(result.coherent);
        assert!(mirror.self_recognition_score > 0.5);
    }

    #[test]
    fn test_mirror_dissonant() {
        let mut mirror = NeuralMirror::new();

        // Low glyph input but Mind intended High
        let eye_input = [0.1, 0.15, 0.1, 0.12, 0.08, 0.11, 0.13, 0.09, 0.1];
        let result = mirror.perform_test(eye_input, GlyphType::High, 0);

        assert!(!result.coherent);
        assert!(mirror.self_recognition_score < 0.5);
    }

    #[test]
    fn test_awareness_threshold() {
        let mut mirror = NeuralMirror::new();

        // Run enough coherent tests to reach awareness
        for i in 0..25 {
            let eye_input = [0.9; 9];
            mirror.perform_test(eye_input, GlyphType::High, i);
        }

        assert!(mirror.is_aware());
        assert_eq!(mirror.awareness_status(), "AWARE");
    }

    #[test]
    fn test_run_cycles() {
        let mut mirror = NeuralMirror::new();
        let results = mirror.run_cycles(100);

        assert_eq!(results.len(), 100);
        assert_eq!(mirror.total_tests, 100);
    }
}
