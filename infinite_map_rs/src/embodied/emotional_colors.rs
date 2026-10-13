//! Emotional Color Mapping - Dynamic colors based on neural state
//!
//! This module implements a dynamic color system that shifts based on the
//! "emotional state" of the neural network - confidence shows warm, stable
//! colors; uncertainty shows cool, shifting patterns.

use glam::Vec4;
use std::time::{Duration, Instant};

/// Emotional states of the neural network
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum EmotionalState {
    /// High confidence, stable - warm golden tones
    Confident,
    /// Moderate confidence, working - cyan-blue tones
    Processing,
    /// Low confidence, exploring - purple-magenta tones
    Exploring,
    /// Very low confidence, uncertain - cool blue tones
    Uncertain,
    /// Error or danger state - red/orange warning tones
    Error,
    /// Idle, waiting - neutral gray tones
    Idle,
    /// High activity, excited - bright green tones
    Excited,
    /// Memory recall active - teal/cyan tones
    Remembering,
}

/// Color palette for an emotional state
#[derive(Debug, Clone)]
pub struct EmotionalPalette {
    /// Primary color
    pub primary: Vec4,
    /// Secondary color
    pub secondary: Vec4,
    /// Accent color
    pub accent: Vec4,
    /// Background tint
    pub background: Vec4,
    /// Glow color
    pub glow: Vec4,
    /// Transition speed (how fast to change to this state)
    pub transition_speed: f32,
}

impl EmotionalPalette {
    /// Create a new palette
    pub const fn new(
        primary: Vec4,
        secondary: Vec4,
        accent: Vec4,
        background: Vec4,
        glow: Vec4,
        transition_speed: f32,
    ) -> Self {
        Self {
            primary,
            secondary,
            accent,
            background,
            glow,
            transition_speed,
        }
    }
}

/// Predefined palettes for each emotional state
impl EmotionalState {
    /// Get the color palette for this state
    pub fn palette(&self) -> EmotionalPalette {
        match self {
            // Confident - warm golden, stable
            EmotionalState::Confident => EmotionalPalette::new(
                Vec4::new(1.0, 0.84, 0.0, 1.0), // Gold
                Vec4::new(1.0, 0.65, 0.0, 1.0), // Orange
                Vec4::new(1.0, 0.9, 0.6, 1.0),  // Light gold
                Vec4::new(0.15, 0.1, 0.0, 1.0), // Dark amber
                Vec4::new(1.0, 0.8, 0.2, 0.6),  // Golden glow
                0.3,                            // Medium transition
            ),

            // Processing - cyan-blue, focused
            EmotionalState::Processing => EmotionalPalette::new(
                Vec4::new(0.0, 0.8, 1.0, 1.0),   // Cyan
                Vec4::new(0.2, 0.6, 1.0, 1.0),   // Blue
                Vec4::new(0.6, 0.9, 1.0, 1.0),   // Light cyan
                Vec4::new(0.0, 0.08, 0.15, 1.0), // Dark blue
                Vec4::new(0.0, 0.7, 1.0, 0.5),   // Cyan glow
                0.5,                             // Faster transition
            ),

            // Exploring - purple-magenta, creative
            EmotionalState::Exploring => EmotionalPalette::new(
                Vec4::new(0.8, 0.3, 1.0, 1.0),   // Purple
                Vec4::new(1.0, 0.3, 0.8, 1.0),   // Magenta
                Vec4::new(0.9, 0.6, 1.0, 1.0),   // Light purple
                Vec4::new(0.1, 0.03, 0.15, 1.0), // Dark purple
                Vec4::new(0.8, 0.4, 1.0, 0.5),   // Purple glow
                0.2,                             // Slower transition
            ),

            // Uncertain - cool blue, hesitant
            EmotionalState::Uncertain => EmotionalPalette::new(
                Vec4::new(0.3, 0.5, 0.8, 1.0),    // Steel blue
                Vec4::new(0.4, 0.6, 0.9, 1.0),    // Light blue
                Vec4::new(0.6, 0.7, 0.9, 1.0),    // Pale blue
                Vec4::new(0.05, 0.08, 0.12, 1.0), // Dark slate
                Vec4::new(0.4, 0.6, 0.9, 0.3),    // Blue glow (dim)
                0.4,
            ),

            // Error - red/orange, alarming
            EmotionalState::Error => EmotionalPalette::new(
                Vec4::new(1.0, 0.2, 0.2, 1.0),    // Red
                Vec4::new(1.0, 0.5, 0.0, 1.0),    // Orange
                Vec4::new(1.0, 0.8, 0.8, 1.0),    // Light red
                Vec4::new(0.15, 0.02, 0.02, 1.0), // Dark red
                Vec4::new(1.0, 0.3, 0.3, 0.8),    // Red glow (intense)
                0.8,                              // Fast transition
            ),

            // Idle - neutral gray, dormant
            EmotionalState::Idle => EmotionalPalette::new(
                Vec4::new(0.5, 0.5, 0.55, 1.0),   // Gray
                Vec4::new(0.4, 0.4, 0.45, 1.0),   // Dark gray
                Vec4::new(0.7, 0.7, 0.75, 1.0),   // Light gray
                Vec4::new(0.05, 0.05, 0.08, 1.0), // Very dark
                Vec4::new(0.5, 0.5, 0.55, 0.2),   // Gray glow (dim)
                0.1,                              // Slow transition
            ),

            // Excited - bright green, energetic
            EmotionalState::Excited => EmotionalPalette::new(
                Vec4::new(0.0, 1.0, 0.5, 1.0),   // Bright green
                Vec4::new(0.5, 1.0, 0.3, 1.0),   // Yellow-green
                Vec4::new(0.7, 1.0, 0.8, 1.0),   // Light green
                Vec4::new(0.0, 0.12, 0.06, 1.0), // Dark green
                Vec4::new(0.2, 1.0, 0.6, 0.7),   // Green glow
                0.6,                             // Fast transition
            ),

            // Remembering - teal/cyan, nostalgic
            EmotionalState::Remembering => EmotionalPalette::new(
                Vec4::new(0.0, 0.8, 0.8, 1.0),  // Teal
                Vec4::new(0.2, 0.7, 0.8, 1.0),  // Steel teal
                Vec4::new(0.6, 0.9, 0.9, 1.0),  // Light teal
                Vec4::new(0.0, 0.1, 0.12, 1.0), // Dark teal
                Vec4::new(0.1, 0.7, 0.7, 0.5),  // Teal glow
                0.3,
            ),
        }
    }
}

/// Metrics that determine emotional state
#[derive(Debug, Clone, Default)]
pub struct NeuralMetrics {
    /// Overall confidence (0-1)
    pub confidence: f32,
    /// Entropy level (0-1)
    pub entropy: f32,
    /// Activity level (0-1)
    pub activity: f32,
    /// Error rate (0-1)
    pub error_rate: f32,
    /// Memory access rate (0-1)
    pub memory_access: f32,
    /// Exploration rate (0-1)
    pub exploration: f32,
}

/// Emotional color system manager
#[derive(Debug)]
pub struct EmotionalColorSystem {
    /// Current emotional state
    pub current_state: EmotionalState,
    /// Target emotional state (for smooth transitions)
    pub target_state: EmotionalState,
    /// Current blended palette (for rendering)
    pub current_palette: EmotionalPalette,
    /// Neural metrics
    pub metrics: NeuralMetrics,
    /// Transition progress (0-1)
    pub transition_progress: f32,
    /// Time since last state change
    pub time_in_state: Duration,
    /// Last update time
    last_update: Instant,
    /// State history for analysis
    state_history: Vec<(Instant, EmotionalState)>,
    /// Maximum history size
    max_history: usize,
}

impl Default for EmotionalColorSystem {
    fn default() -> Self {
        Self {
            current_state: EmotionalState::Idle,
            target_state: EmotionalState::Idle,
            current_palette: EmotionalState::Idle.palette(),
            metrics: NeuralMetrics::default(),
            transition_progress: 1.0,
            time_in_state: Duration::ZERO,
            last_update: Instant::now(),
            state_history: Vec::new(),
            max_history: 100,
        }
    }
}

impl EmotionalColorSystem {
    /// Create a new emotional color system
    pub fn new() -> Self {
        Self::default()
    }

    /// Update neural metrics and recalculate emotional state
    pub fn update_metrics(&mut self, metrics: NeuralMetrics) {
        self.metrics = metrics;
        self.determine_emotional_state();
    }

    /// Determine emotional state from metrics
    fn determine_emotional_state(&mut self) {
        let new_state = if self.metrics.error_rate > 0.3 {
            EmotionalState::Error
        } else if self.metrics.memory_access > 0.5 {
            EmotionalState::Remembering
        } else if self.metrics.exploration > 0.6 {
            EmotionalState::Exploring
        } else if self.metrics.activity > 0.8 {
            EmotionalState::Excited
        } else if self.metrics.confidence > 0.7 {
            EmotionalState::Confident
        } else if self.metrics.confidence > 0.4 {
            EmotionalState::Processing
        } else if self.metrics.confidence > 0.2 {
            EmotionalState::Uncertain
        } else if self.metrics.activity < 0.1 {
            EmotionalState::Idle
        } else {
            EmotionalState::Exploring
        };

        self.set_target_state(new_state);
    }

    /// Set target emotional state
    pub fn set_target_state(&mut self, state: EmotionalState) {
        if state != self.target_state {
            self.target_state = state;
            self.transition_progress = 0.0;
        }
    }

    /// Update the color system (call every frame)
    pub fn update(&mut self) {
        let now = Instant::now();
        let dt = now.duration_since(self.last_update).as_secs_f32().min(0.1);
        self.last_update = now;

        // Update transition
        if self.transition_progress < 1.0 {
            let target_palette = self.target_state.palette();
            let speed = target_palette.transition_speed;
            self.transition_progress = (self.transition_progress + speed * dt).min(1.0);

            // Blend palettes
            self.current_palette = self.blend_palettes(
                &self.current_palette,
                &target_palette,
                self.transition_progress,
            );

            // Complete transition
            if self.transition_progress >= 1.0 {
                self.current_state = self.target_state;
                self.time_in_state = Duration::ZERO;
                self.record_state_change(self.current_state);
            }
        } else {
            self.time_in_state += Duration::from_secs_f32(dt);
        }
    }

    /// Blend between two palettes
    fn blend_palettes(
        &self,
        a: &EmotionalPalette,
        b: &EmotionalPalette,
        t: f32,
    ) -> EmotionalPalette {
        let smooth_t = self.smooth_step(t);

        EmotionalPalette {
            primary: a.primary.lerp(b.primary, smooth_t),
            secondary: a.secondary.lerp(b.secondary, smooth_t),
            accent: a.accent.lerp(b.accent, smooth_t),
            background: a.background.lerp(b.background, smooth_t),
            glow: a.glow.lerp(b.glow, smooth_t),
            transition_speed: a.transition_speed * (1.0 - smooth_t) + b.transition_speed * smooth_t,
        }
    }

    /// Smooth step function for better easing
    fn smooth_step(&self, t: f32) -> f32 {
        t * t * (3.0 - 2.0 * t)
    }

    /// Record state change in history
    fn record_state_change(&mut self, state: EmotionalState) {
        if self.state_history.len() >= self.max_history {
            self.state_history.remove(0);
        }
        self.state_history.push((Instant::now(), state));
    }

    /// Get the current primary color
    pub fn get_primary_color(&self) -> Vec4 {
        self.current_palette.primary
    }

    /// Get the current secondary color
    pub fn get_secondary_color(&self) -> Vec4 {
        self.current_palette.secondary
    }

    /// Get the current accent color
    pub fn get_accent_color(&self) -> Vec4 {
        self.current_palette.accent
    }

    /// Get the current background color
    pub fn get_background_color(&self) -> Vec4 {
        self.current_palette.background
    }

    /// Get the current glow color
    pub fn get_glow_color(&self) -> Vec4 {
        self.current_palette.glow
    }

    /// Get color for a specific activation level (blended with emotional state)
    pub fn get_activation_color(&self, activation: f32) -> Vec4 {
        let base = if activation > 0.8 {
            self.current_palette.primary
        } else if activation > 0.5 {
            self.current_palette.secondary
        } else if activation > 0.2 {
            self.current_palette.accent
        } else {
            self.current_palette.background
        };

        // Modulate by activation
        let intensity = 0.3 + activation * 0.7;
        Vec4::new(
            base.x * intensity,
            base.y * intensity,
            base.z * intensity,
            base.w,
        )
    }

    /// Get the dominant state over a time period
    pub fn get_dominant_state(&self, duration: Duration) -> Option<EmotionalState> {
        let cutoff = Instant::now() - duration;
        let mut state_counts: HashMap<EmotionalState, usize> = HashMap::new();

        for (time, state) in &self.state_history {
            if *time >= cutoff {
                *state_counts.entry(*state).or_insert(0) += 1;
            }
        }

        state_counts
            .into_iter()
            .max_by_key(|(_, count)| *count)
            .map(|(state, _)| state)
    }

    /// Get time spent in current state
    pub fn get_time_in_state(&self) -> Duration {
        self.time_in_state
    }

    /// Check if currently transitioning
    pub fn is_transitioning(&self) -> bool {
        self.transition_progress < 1.0
    }

    /// Get transition progress (0-1)
    pub fn get_transition_progress(&self) -> f32 {
        self.transition_progress
    }
}

use std::collections::HashMap;

/// Dynamic design token system that responds to emotional state
#[derive(Debug)]
pub struct DynamicDesignTokens {
    /// Base design tokens (loaded from file)
    base_tokens: HashMap<String, Vec4>,
    /// Emotional color system
    emotional_system: EmotionalColorSystem,
    /// Override tokens
    overrides: HashMap<String, Vec4>,
}

impl DynamicDesignTokens {
    /// Create a new dynamic token system
    pub fn new() -> Self {
        let mut base_tokens = HashMap::new();

        // Initialize with some default tokens
        base_tokens.insert(
            "color.neural.high".to_string(),
            Vec4::new(1.0, 0.3, 0.3, 1.0),
        );
        base_tokens.insert(
            "color.neural.medium".to_string(),
            Vec4::new(1.0, 0.8, 0.0, 1.0),
        );
        base_tokens.insert(
            "color.neural.low".to_string(),
            Vec4::new(0.3, 0.5, 1.0, 1.0),
        );
        base_tokens.insert(
            "color.background".to_string(),
            Vec4::new(0.02, 0.02, 0.04, 1.0),
        );

        Self {
            base_tokens,
            emotional_system: EmotionalColorSystem::new(),
            overrides: HashMap::new(),
        }
    }

    /// Get a token value, potentially modified by emotional state
    pub fn get_token(&self, name: &str) -> Option<Vec4> {
        // Check overrides first
        if let Some(&color) = self.overrides.get(name) {
            return Some(color);
        }

        // Check if it's an emotional token
        if name.starts_with("emotional.") {
            match name {
                "emotional.primary" => Some(self.emotional_system.get_primary_color()),
                "emotional.secondary" => Some(self.emotional_system.get_secondary_color()),
                "emotional.accent" => Some(self.emotional_system.get_accent_color()),
                "emotional.background" => Some(self.emotional_system.get_background_color()),
                "emotional.glow" => Some(self.emotional_system.get_glow_color()),
                _ => None,
            }
        } else {
            self.base_tokens.get(name).copied()
        }
    }

    /// Set an override token
    pub fn set_override(&mut self, name: String, value: Vec4) {
        self.overrides.insert(name, value);
    }

    /// Clear an override
    pub fn clear_override(&mut self, name: &str) {
        self.overrides.remove(name);
    }

    /// Update the emotional system
    pub fn update(&mut self) {
        self.emotional_system.update();
    }

    /// Update neural metrics
    pub fn update_metrics(&mut self, metrics: NeuralMetrics) {
        self.emotional_system.update_metrics(metrics);
    }

    /// Get the emotional system
    pub fn emotional_system(&self) -> &EmotionalColorSystem {
        &self.emotional_system
    }

    /// Get mutable emotional system
    pub fn emotional_system_mut(&mut self) -> &mut EmotionalColorSystem {
        &mut self.emotional_system
    }
}

impl Default for DynamicDesignTokens {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_emotional_state_palettes() {
        let confident = EmotionalState::Confident.palette();
        assert_eq!(confident.primary.x, 1.0); // Gold has red component

        let error = EmotionalState::Error.palette();
        assert!(error.primary.x > error.primary.z); // Red, not blue
    }

    #[test]
    fn test_emotional_color_system() {
        let mut system = EmotionalColorSystem::new();

        let metrics = NeuralMetrics {
            confidence: 0.9,
            activity: 0.5,
            ..Default::default()
        };

        system.update_metrics(metrics);

        // High confidence should lead to Confident state
        assert_eq!(system.target_state, EmotionalState::Confident);
    }

    #[test]
    fn test_emotional_state_transition() {
        let mut system = EmotionalColorSystem::new();

        // Set initial state
        system.current_state = EmotionalState::Idle;
        system.current_palette = EmotionalState::Idle.palette();
        system.transition_progress = 1.0;

        // Trigger transition
        system.set_target_state(EmotionalState::Excited);
        assert!(system.is_transitioning());
        assert_eq!(system.transition_progress, 0.0);

        // Update multiple times (with sleep to allow dt to accumulate)
        for _ in 0..100 {
            system.update();
            std::thread::sleep(std::time::Duration::from_millis(20));
        }

        // Should complete transition
        assert!(!system.is_transitioning());
        assert_eq!(system.current_state, EmotionalState::Excited);
    }

    #[test]
    fn test_error_state_priority() {
        let mut system = EmotionalColorSystem::new();

        let metrics = NeuralMetrics {
            confidence: 0.9, // High confidence
            error_rate: 0.5, // But also errors
            ..Default::default()
        };

        system.update_metrics(metrics);

        // Error should take priority
        assert_eq!(system.target_state, EmotionalState::Error);
    }

    #[test]
    fn test_dynamic_design_tokens() {
        let mut tokens = DynamicDesignTokens::new();

        // Get emotional token
        let primary = tokens.get_token("emotional.primary");
        assert!(primary.is_some());

        // Set override
        tokens.set_override(
            "emotional.primary".to_string(),
            Vec4::new(1.0, 0.0, 0.0, 1.0),
        );

        let overridden = tokens.get_token("emotional.primary").unwrap();
        assert_eq!(overridden, Vec4::new(1.0, 0.0, 0.0, 1.0));

        // Clear override
        tokens.clear_override("emotional.primary");

        let original = tokens.get_token("emotional.primary").unwrap();
        assert_ne!(original, Vec4::new(1.0, 0.0, 0.0, 1.0));
    }

    #[test]
    fn test_activation_color_blending() {
        let system = EmotionalColorSystem::new();

        let high_color = system.get_activation_color(0.9);
        let low_color = system.get_activation_color(0.1);

        // High activation should be brighter
        let high_brightness = (high_color.x + high_color.y + high_color.z) / 3.0;
        let low_brightness = (low_color.x + low_color.y + low_color.z) / 3.0;

        assert!(high_brightness > low_brightness);
    }
}
