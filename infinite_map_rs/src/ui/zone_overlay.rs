//! Zone Overlay UI
//!
//! Provides visual feedback and metrics for execution zones on the infinite map.
//! Displays shader name, workgroup size, active state, and position information.

use glam::Vec2;

/// Generate overlay text for an execution zone
///
/// Creates formatted text displaying the shader name, workgroup size,
/// and active state for visual overlay on the map.
///
/// # Arguments
///
/// * `shader_name` - Name of the shader (e.g., "pixel_cpu.wgsl")
/// * `workgroup` - Workgroup size as (x, y, z) tuple
/// * `is_active` - Whether the shader is currently active/running
///
/// # Returns
///
/// Formatted overlay text string
///
/// # Examples
///
/// ```
/// use infinite_map_rs::ui::zone_overlay::generate_zone_overlay_text;
///
/// let text = generate_zone_overlay_text("test.wgsl", (64, 1, 1), true);
/// assert!(text.contains("test.wgsl"));
/// assert!(text.contains("64x1x1"));
/// assert!(text.contains("Running"));
/// ```
pub fn generate_zone_overlay_text(
    shader_name: &str,
    workgroup: (u32, u32, u32),
    is_active: bool,
) -> String {
    let status = if is_active { "Running" } else { "Inactive" };
    format!(
        "{}\nWorkgroup: {}x{}x{}\nStatus: {}",
        shader_name, workgroup.0, workgroup.1, workgroup.2, status
    )
}

/// Generate overlay text with position information
///
/// Creates formatted text displaying the shader name, workgroup size,
/// active state, and map position for visual overlay.
///
/// # Arguments
///
/// * `shader_name` - Name of the shader (e.g., "pixel_cpu.wgsl")
/// * `workgroup` - Workgroup size as (x, y, z) tuple
/// * `is_active` - Whether the shader is currently active/running
/// * `position` - Position on the infinite map
///
/// # Returns
///
/// Formatted overlay text string with position
///
/// # Examples
///
/// ```
/// use infinite_map_rs::ui::zone_overlay::generate_zone_overlay_text_with_position;
/// use glam::Vec2;
///
/// let text = generate_zone_overlay_text_with_position(
///     "test.wgsl",
///     (64, 1, 1),
///     true,
///     Vec2::new(100.0, 200.0)
/// );
/// assert!(text.contains("Position:"));
/// assert!(text.contains("100"));
/// assert!(text.contains("200"));
/// ```
pub fn generate_zone_overlay_text_with_position(
    shader_name: &str,
    workgroup: (u32, u32, u32),
    is_active: bool,
    position: Vec2,
) -> String {
    let base_text = generate_zone_overlay_text(shader_name, workgroup, is_active);
    format!("{}\nPosition: ({}, {})", base_text, position.x, position.y)
}

/// Render a border around an execution zone
///
/// Draws a visual border indicating the bounds of an execution zone.
/// This is a placeholder function - actual rendering requires wgpu device
/// and will be implemented in integration tests.
///
/// # Arguments
///
/// * `position` - Center position of the zone on the map
/// * `size` - Size of the zone in pixels
/// * `is_active` - Whether the zone is active (affects border color)
///
/// # Returns
///
/// Border rendering configuration (placeholder for now)
///
/// # TODO
///
/// This function should return a proper `BorderConfig` struct and
/// be integrated with the wgpu render pipeline. Implementation will
/// be added in integration tests.
pub fn render_zone_border(position: Vec2, size: (f32, f32), is_active: bool) -> BorderRenderConfig {
    let color = if is_active {
        BorderColor::Active
    } else {
        BorderColor::Inactive
    };

    BorderRenderConfig {
        position,
        width: size.0,
        height: size.1,
        color,
        line_width: 2.0,
    }
}

/// Border color options for zone rendering
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BorderColor {
    /// Active zone - green or blue tint
    Active,
    /// Inactive zone - gray or muted color
    Inactive,
    /// Error state - red
    Error,
}

/// Configuration for rendering a zone border
#[derive(Debug, Clone, Copy)]
pub struct BorderRenderConfig {
    /// Center position of the zone
    pub position: Vec2,
    /// Width of the zone in pixels
    pub width: f32,
    /// Height of the zone in pixels
    pub height: f32,
    /// Color of the border
    pub color: BorderColor,
    /// Width of the border line in pixels
    pub line_width: f32,
}

impl BorderRenderConfig {
    /// Get the top-left corner of the border
    pub fn top_left(&self) -> Vec2 {
        Vec2::new(
            self.position.x - self.width / 2.0,
            self.position.y - self.height / 2.0,
        )
    }

    /// Get the bottom-right corner of the border
    pub fn bottom_right(&self) -> Vec2 {
        Vec2::new(
            self.position.x + self.width / 2.0,
            self.position.y + self.height / 2.0,
        )
    }

    /// Get the border bounds as (min_x, min_y, max_x, max_y)
    pub fn bounds(&self) -> (f32, f32, f32, f32) {
        let tl = self.top_left();
        let br = self.bottom_right();
        (tl.x, tl.y, br.x, br.y)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_zone_overlay_text() {
        let text = generate_zone_overlay_text("test.wgsl", (64, 1, 1), true);
        assert!(text.contains("test.wgsl"));
        assert!(text.contains("64x1x1"));
        assert!(text.contains("Running"));
    }

    #[test]
    fn test_generate_zone_overlay_text_inactive() {
        let text = generate_zone_overlay_text("shader.wgsl", (32, 2, 1), false);
        assert!(text.contains("shader.wgsl"));
        assert!(text.contains("32x2x1"));
        assert!(text.contains("Inactive"));
        assert!(!text.contains("Running"));
    }

    #[test]
    fn test_generate_zone_overlay_text_with_position() {
        let text = generate_zone_overlay_text_with_position(
            "pos.wgsl",
            (16, 16, 1),
            true,
            Vec2::new(100.0, 200.0),
        );
        assert!(text.contains("pos.wgsl"));
        assert!(text.contains("16x16x1"));
        assert!(text.contains("Running"));
        // Note: Vec2 Display format may vary, check for position components separately
        assert!(text.contains("Position:"));
        assert!(text.contains("100"));
        assert!(text.contains("200"));
    }

    #[test]
    fn test_render_zone_border_active() {
        let config = render_zone_border(Vec2::new(50.0, 50.0), (100.0, 100.0), true);
        assert_eq!(config.position, Vec2::new(50.0, 50.0));
        assert_eq!(config.width, 100.0);
        assert_eq!(config.height, 100.0);
        assert_eq!(config.color, BorderColor::Active);
        assert_eq!(config.line_width, 2.0);
    }

    #[test]
    fn test_render_zone_border_inactive() {
        let config = render_zone_border(Vec2::new(0.0, 0.0), (64.0, 64.0), false);
        assert_eq!(config.position, Vec2::new(0.0, 0.0));
        assert_eq!(config.width, 64.0);
        assert_eq!(config.height, 64.0);
        assert_eq!(config.color, BorderColor::Inactive);
    }

    #[test]
    fn test_border_render_config_top_left() {
        let config = BorderRenderConfig {
            position: Vec2::new(100.0, 100.0),
            width: 50.0,
            height: 50.0,
            color: BorderColor::Active,
            line_width: 2.0,
        };
        assert_eq!(config.top_left(), Vec2::new(75.0, 75.0));
    }

    #[test]
    fn test_border_render_config_bottom_right() {
        let config = BorderRenderConfig {
            position: Vec2::new(100.0, 100.0),
            width: 50.0,
            height: 50.0,
            color: BorderColor::Active,
            line_width: 2.0,
        };
        assert_eq!(config.bottom_right(), Vec2::new(125.0, 125.0));
    }

    #[test]
    fn test_border_render_config_bounds() {
        let config = BorderRenderConfig {
            position: Vec2::new(0.0, 0.0),
            width: 100.0,
            height: 100.0,
            color: BorderColor::Inactive,
            line_width: 2.0,
        };
        assert_eq!(config.bounds(), (-50.0, -50.0, 50.0, 50.0));
    }
}

// Include integration tests from separate file
#[path = "zone_overlay_tests.rs"]
mod integration_tests;
