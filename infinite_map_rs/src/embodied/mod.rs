//! Embodied Cognition Navigation - Immersive neural visualization UX
//!
//! This module implements a new user experience paradigm that makes the neural
//! visualization feel like a living, explorable environment. Users navigate
//! through the AI's cognitive landscape with physics-based movement and receive
//! visceral visual feedback.
//!
//! # Architecture
//!
//! - [`momentum_camera`]: Physics-based camera with inertia and smooth movement
//! - [`neural_pulse`]: Visual pulse effects for neural interactions
//! - [`emotional_colors`]: Dynamic color system based on neural state
//! - [`temporal_ghost`]: Previous states as faded overlays
//! - [`gesture_recognition`]: Shape-based command input
//!
//! # Example
//!
//! ```no_run
//! use infinite_map_rs::embodied::{
//!     MomentumCamera, MomentumCameraConfig, CameraInput,
//!     PulseManager, PulseType,
//!     EmotionalColorSystem, NeuralMetrics,
//!     TemporalGhostSystem, TemporalGhostConfig, NeuralSnapshot,
//!     GestureRecognizer, GestureConfig,
//! };
//!
//! // Create momentum camera
//! let mut camera = MomentumCamera::new(MomentumCameraConfig::default());
//!
//! // Create pulse manager for visual feedback
//! let mut pulse_manager = PulseManager::new();
//!
//! // Create emotional color system
//! let mut color_system = EmotionalColorSystem::new();
//!
//! // Create temporal ghost system
//! let mut ghost_system = TemporalGhostSystem::new(TemporalGhostConfig::default());
//!
//! // Create gesture recognizer
//! let mut gesture_recognizer = GestureRecognizer::new(GestureConfig::default());
//!
//! // In your update loop:
//! fn update(dt: f32) {
//!     // Apply camera input with physics
//!     let input = CameraInput {
//!         movement: glam::Vec3::new(0.0, 0.0, -1.0),
//!         is_active: true,
//!         ..Default::default()
//!     };
//!     camera.apply_input(&input);
//!     
//!     // Update pulses
//!     pulse_manager.update(dt);
//!     
//!     // Update emotional colors
//!     color_system.update();
//!     
//!     // Update temporal ghosts
//!     ghost_system.update();
//! }
//! ```

pub mod emotional_colors;
pub mod gesture_recognition;
pub mod momentum_camera;
pub mod neural_pulse;
pub mod temporal_ghost;

// Re-export main types
pub use momentum_camera::easing;
pub use momentum_camera::{CameraInput, CameraPhysics, MomentumCamera, MomentumCameraConfig};

pub use neural_pulse::{
    NeuralConnection, NeuralTopology, Pulse, PulseConfig, PulseId, PulseManager, PulseRenderData,
    PulseType,
};

pub use emotional_colors::{
    DynamicDesignTokens, EmotionalColorSystem, EmotionalPalette, EmotionalState, NeuralMetrics,
};

pub use temporal_ghost::{
    GhostComparisonMode, GhostFrame, GhostVisualizer, NeuralSnapshot, TemporalGhostConfig,
    TemporalGhostSystem,
};

pub use gesture_recognition::{
    ActiveGesture, GestureBounds, GestureConfig, GestureRecognizer, GestureType, GestureVisualizer,
    RecognizedGesture,
};

/// Integration layer that combines all embodied cognition components
pub struct EmbodiedCognitionLayer {
    /// Physics-based camera
    pub camera: MomentumCamera,
    /// Visual pulse effects
    pub pulses: PulseManager,
    /// Emotional color system
    pub colors: EmotionalColorSystem,
    /// Temporal ghost overlays
    pub ghosts: TemporalGhostSystem,
    /// Gesture recognizer
    pub gestures: GestureRecognizer,
    /// Whether the layer is enabled
    pub enabled: bool,
}

impl Default for EmbodiedCognitionLayer {
    fn default() -> Self {
        Self::new()
    }
}

impl EmbodiedCognitionLayer {
    /// Create a new embodied cognition layer with default configuration
    pub fn new() -> Self {
        Self {
            camera: MomentumCamera::default(),
            pulses: PulseManager::new(),
            colors: EmotionalColorSystem::new(),
            ghosts: TemporalGhostSystem::default(),
            gestures: GestureRecognizer::default(),
            enabled: true,
        }
    }

    /// Create with custom configurations
    pub fn with_config(
        camera_config: MomentumCameraConfig,
        ghost_config: TemporalGhostConfig,
        gesture_config: GestureConfig,
    ) -> Self {
        Self {
            camera: MomentumCamera::new(camera_config),
            pulses: PulseManager::new(),
            colors: EmotionalColorSystem::new(),
            ghosts: TemporalGhostSystem::new(ghost_config),
            gestures: GestureRecognizer::new(gesture_config),
            enabled: true,
        }
    }

    /// Update all systems (call every frame)
    pub fn update(&mut self, dt: f32) {
        if !self.enabled {
            return;
        }

        self.pulses.update(dt);
        self.colors.update();
        self.ghosts.update();
    }

    /// Apply camera input
    pub fn apply_camera_input(&mut self, input: &CameraInput) {
        if self.enabled {
            self.camera.apply_input(input);
        }
    }

    /// Emit a pulse at a position
    pub fn emit_pulse(
        &mut self,
        node_id: &str,
        position: glam::Vec3,
        pulse_type: PulseType,
    ) -> PulseId {
        if self.enabled {
            self.pulses.emit(node_id, position, pulse_type)
        } else {
            0
        }
    }

    /// Update neural metrics for emotional colors
    pub fn update_metrics(&mut self, metrics: NeuralMetrics) {
        if self.enabled {
            self.colors.update_metrics(metrics);
        }
    }

    /// Capture a snapshot for temporal ghosts
    pub fn capture_snapshot(&mut self, snapshot: &mut NeuralSnapshot) {
        if self.enabled {
            self.ghosts.capture(snapshot);
        }
    }

    /// Start a gesture
    pub fn start_gesture(&mut self, point: glam::Vec2) {
        if self.enabled {
            self.gestures.start_gesture(point);
        }
    }

    /// Add point to gesture
    pub fn add_gesture_point(&mut self, point: glam::Vec2) {
        if self.enabled {
            self.gestures.add_point(point);
        }
    }

    /// Finish gesture and get recognition result
    pub fn finish_gesture(&mut self) -> Option<RecognizedGesture> {
        if self.enabled {
            self.gestures.finish_gesture()
        } else {
            None
        }
    }

    /// Get current emotional primary color
    pub fn get_emotional_color(&self) -> glam::Vec4 {
        self.colors.get_primary_color()
    }

    /// Get ghost frames for rendering
    pub fn get_ghost_frames(&self) -> &[GhostFrame] {
        self.ghosts.get_ghost_frames()
    }

    /// Get active pulses for rendering
    pub fn get_pulses(&self) -> impl Iterator<Item = &Pulse> {
        self.pulses.get_pulses()
    }

    /// Enable/disable the layer
    pub fn set_enabled(&mut self, enabled: bool) {
        self.enabled = enabled;
    }

    /// Check if enabled
    pub fn is_enabled(&self) -> bool {
        self.enabled
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_embodied_layer_creation() {
        let layer = EmbodiedCognitionLayer::new();
        assert!(layer.enabled);
    }

    #[test]
    fn test_embodied_layer_update() {
        let mut layer = EmbodiedCognitionLayer::new();
        layer.update(0.016); // 60 FPS frame
                             // Should not panic
    }

    #[test]
    fn test_embodied_layer_disabled() {
        let mut layer = EmbodiedCognitionLayer::new();
        layer.set_enabled(false);

        let input = CameraInput::default();
        layer.apply_camera_input(&input);

        // Camera should not move when disabled
        // (The camera's internal velocity would remain zero)
    }

    #[test]
    fn test_pulse_emission() {
        let mut layer = EmbodiedCognitionLayer::new();
        let id = layer.emit_pulse("test", glam::Vec3::ZERO, PulseType::Selection);
        assert!(layer.pulses.get_pulse(id).is_some());
    }

    #[test]
    fn test_metrics_update() {
        let mut layer = EmbodiedCognitionLayer::new();
        let metrics = NeuralMetrics {
            confidence: 0.9,
            ..Default::default()
        };
        layer.update_metrics(metrics);
        // Emotional state should update based on confidence
    }
}
