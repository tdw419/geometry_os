//! Phase 17: Window Particle Orchestration
//!
//! Window particles are floating spatial entities on the infinite canvas.
//! They represent VM instances, execution zones, and other interactive regions.
//! This module provides the orchestration layer for spatial layout,
//! drag-and-drop interaction, collision detection, and Z-index management.

use crate::spatial::process_scheduler::ProcessRegion;
use glam::Vec2;
use std::collections::HashMap;

/// Window particle type - determines interaction behavior and visual styling
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum WindowParticleType {
    /// RISC-V Linux VM instance
    RiscVVM,
    /// WGSL shader execution zone
    ExecutionZone,
    /// Alpine Linux VM
    AlpineVM,
    /// Terminal tile
    Terminal,
    /// Process tile (Linux process as visual tile)
    ProcessTile,
    /// Composited Wayland surface
    WaylandSurface,
}

impl WindowParticleType {
    /// Get the base size for this particle type
    pub fn base_size(&self) -> (f32, f32) {
        match self {
            WindowParticleType::RiscVVM => (640.0, 480.0),
            WindowParticleType::ExecutionZone => (256.0, 256.0),
            WindowParticleType::AlpineVM => (800.0, 600.0),
            WindowParticleType::Terminal => (400.0, 300.0),
            WindowParticleType::ProcessTile => (300.0, 200.0),
            WindowParticleType::WaylandSurface => (500.0, 400.0),
        }
    }

    /// Get the border color for this particle type
    pub fn border_color(&self) -> [f32; 4] {
        match self {
            WindowParticleType::RiscVVM => [0.0, 0.8, 1.0, 1.0], // Cyan
            WindowParticleType::ExecutionZone => [1.0, 0.84, 0.0, 1.0], // Gold
            WindowParticleType::AlpineVM => [0.0, 1.0, 0.5, 1.0], // Green
            WindowParticleType::Terminal => [0.6, 0.2, 1.0, 1.0], // Purple
            WindowParticleType::ProcessTile => [1.0, 0.5, 0.0, 1.0], // Orange
            WindowParticleType::WaylandSurface => [0.3, 0.3, 0.3, 1.0], // Gray
        }
    }

    /// Get the background color for this particle type
    pub fn background_color(&self) -> [f32; 4] {
        match self {
            WindowParticleType::RiscVVM => [0.0, 0.2, 0.3, 0.9],
            WindowParticleType::ExecutionZone => [0.2, 0.15, 0.0, 0.9],
            WindowParticleType::AlpineVM => [0.0, 0.3, 0.15, 0.9],
            WindowParticleType::Terminal => [0.15, 0.05, 0.2, 0.9],
            WindowParticleType::ProcessTile => [0.2, 0.1, 0.0, 0.9],
            WindowParticleType::WaylandSurface => [0.1, 0.1, 0.1, 0.95],
        }
    }
}

/// Z-index layer for window particles
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
pub enum ZLayer {
    /// Background layer - always behind others
    Background = 0,
    /// Base layer for execution zones and terminals
    Base = 10,
    /// Active layer for interactive windows
    Active = 20,
    /// Modal layer for dialogs and overlays
    Modal = 30,
    /// Top layer - always in front
    Top = 40,
}

/// Window particle - a floating spatial entity
#[derive(Debug, Clone)]
pub struct WindowParticle {
    /// Unique identifier
    pub id: usize,
    /// Particle type
    pub particle_type: WindowParticleType,
    /// Title/description
    pub title: String,
    /// World position (top-left corner)
    pub position: Vec2,
    /// Dimensions (width, height)
    pub size: Vec2,
    /// Z-index layer
    pub z_layer: ZLayer,
    /// Visual Z-order within layer (higher = more front)
    pub z_order: u32,
    /// Whether this particle is currently being dragged
    pub dragging: bool,
    /// Whether this particle is currently hovered
    pub hovered: bool,
    /// Whether this particle is focused
    pub focused: bool,
    /// Associated process region (if this is a scheduled process)
    pub process_region: Option<ProcessRegion>,
    /// Associated window ID (if this wraps a Wayland window)
    pub window_id: Option<usize>,
    /// Additional metadata
    pub metadata: HashMap<String, String>,
}

impl WindowParticle {
    /// Create a new window particle
    pub fn new(
        id: usize,
        particle_type: WindowParticleType,
        title: String,
        position: Vec2,
    ) -> Self {
        let base_size = particle_type.base_size();
        WindowParticle {
            id,
            particle_type,
            title,
            position,
            size: Vec2::new(base_size.0, base_size.1),
            z_layer: ZLayer::Base,
            z_order: 0,
            dragging: false,
            hovered: false,
            focused: false,
            process_region: None,
            window_id: None,
            metadata: HashMap::new(),
        }
    }

    /// Check if a point (in world coordinates) is inside this particle
    pub fn contains_point(&self, world_point: Vec2) -> bool {
        world_point.x >= self.position.x
            && world_point.x <= self.position.x + self.size.x
            && world_point.y >= self.position.y
            && world_point.y <= self.position.y + self.size.y
    }

    /// Check if a point is in the title bar area (top 30px)
    pub fn contains_in_title_bar(&self, world_point: Vec2) -> bool {
        const TITLE_BAR_HEIGHT: f32 = 30.0;
        world_point.x >= self.position.x
            && world_point.x <= self.position.x + self.size.x
            && world_point.y >= self.position.y - TITLE_BAR_HEIGHT
            && world_point.y <= self.position.y
    }

    /// Get the bounding box of this particle (including title bar)
    pub fn bounds(&self) -> (Vec2, Vec2) {
        const TITLE_BAR_HEIGHT: f32 = 30.0;
        let min = Vec2::new(
            self.position.x,
            self.position.y - TITLE_BAR_HEIGHT,
        );
        let max = Vec2::new(
            self.position.x + self.size.x,
            self.position.y + self.size.y,
        );
        (min, max)
    }

    /// Check if this particle collides with another
    pub fn collides_with(&self, other: &WindowParticle) -> bool {
        let (self_min, self_max) = self.bounds();
        let (other_min, other_max) = other.bounds();

        // AABB collision detection
        self_min.x < other_max.x
            && self_max.x > other_min.x
            && self_min.y < other_max.y
            && self_max.y > other_min.y
    }

    /// Set the Z-index layer
    pub fn set_z_layer(&mut self, layer: ZLayer) {
        self.z_layer = layer;
    }

    /// Set the Z-order within layer
    pub fn set_z_order(&mut self, order: u32) {
        self.z_order = order;
    }

    /// Resize the particle
    pub fn resize(&mut self, width: f32, height: f32) {
        self.size.x = width.max(100.0); // Minimum width
        self.size.y = height.max(100.0); // Minimum height
    }

    /// Move the particle
    pub fn move_to(&mut self, position: Vec2) {
        self.position = position;
    }

    /// Convert this particle to a ProcessRegion (for integration with the scheduler)
    pub fn to_process_region(&self) -> Option<ProcessRegion> {
        // Convert world coordinates to grid coordinates
        // Assuming 1 world unit = 1 grid cell
        let start_x = self.position.x as usize;
        let start_y = self.position.y as usize;
        let width = self.size.x as usize;
        let height = self.size.y as usize;

        Some(ProcessRegion::new(start_x, start_y, width, height))
    }
}

/// Spatial layout manager for window particles
///
/// This manager handles:
/// - Collision detection and resolution
/// - Z-index management (bring to front, send to back)
/// - Dynamic layout algorithms (tiling, stacking, grid)
/// - Drag-and-drop orchestration
#[derive(Debug)]
pub struct SpatialLayoutManager {
    /// Collection of window particles
    particles: Vec<WindowParticle>,
    /// Next available particle ID
    next_id: usize,
    /// Whether collision detection is enabled
    collision_detection_enabled: bool,
    /// Whether auto-tiling is enabled
    auto_tiling_enabled: bool,
    /// Layout algorithm to use
    layout_algorithm: LayoutAlgorithm,
}

/// Layout algorithm for arranging window particles
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum LayoutAlgorithm {
    /// Free positioning - particles can be anywhere
    Free,
    /// Grid layout - arrange particles in a grid
    Grid,
    /// Tiling - maximize screen space usage
    Tiling,
    /// Stacking - stack particles with tabs
    Stacking,
}

impl SpatialLayoutManager {
    /// Create a new spatial layout manager
    pub fn new() -> Self {
        SpatialLayoutManager {
            particles: Vec::new(),
            next_id: 0,
            collision_detection_enabled: true,
            auto_tiling_enabled: false,
            layout_algorithm: LayoutAlgorithm::Free,
        }
    }

    /// Add a window particle
    pub fn add_particle(&mut self, mut particle: WindowParticle) {
        // Ensure unique ID
        particle.id = self.next_id;
        self.next_id += 1;

        // Assign initial Z-order based on layer
        particle.z_order = self.get_max_z_order(particle.z_layer);

        // Resolve collisions if enabled
        if self.collision_detection_enabled {
            self.resolve_collisions(&mut particle);
        }

        self.particles.push(particle);
    }

    /// Get the maximum Z-order for a given layer
    fn get_max_z_order(&self, layer: ZLayer) -> u32 {
        self.particles
            .iter()
            .filter(|p| p.z_layer == layer)
            .map(|p| p.z_order)
            .max()
            .unwrap_or(0)
    }

    /// Resolve collisions for a particle
    fn resolve_collisions(&mut self, particle: &mut WindowParticle) {
        let max_attempts = 100;
        let step_size = 10.0;

        for _attempt in 0..max_attempts {
            let mut collision = false;

            for other in &self.particles {
                if particle.collides_with(other) {
                    collision = true;
                    break;
                }
            }

            if !collision {
                break;
            }

            // Move particle to the right until no collision
            particle.position.x += step_size;
            particle.position.y += step_size;
        }
    }

    /// Get a particle by ID
    pub fn get_particle(&self, id: usize) -> Option<&WindowParticle> {
        self.particles.iter().find(|p| p.id == id)
    }

    /// Get a mutable particle by ID
    pub fn get_particle_mut(&mut self, id: usize) -> Option<&mut WindowParticle> {
        self.particles.iter_mut().find(|p| p.id == id)
    }

    /// Find the particle at a world position (topmost in Z-order)
    pub fn find_particle_at(&self, world_position: Vec2) -> Option<usize> {
        // Sort particles by Z-index (layer + order)
        let mut sorted: Vec<_> = self.particles.iter().collect();
        sorted.sort_by(|a, b| {
            let z_a = (a.z_layer as u32) * 1000 + a.z_order;
            let z_b = (b.z_layer as u32) * 1000 + b.z_order;
            z_b.cmp(&z_a) // Reverse: higher Z first
        });

        sorted
            .into_iter()
            .find(|p| p.contains_point(world_position))
            .map(|p| p.id)
    }

    /// Start dragging a particle
    pub fn start_drag(&mut self, world_position: Vec2) -> Option<usize> {
        if let Some(particle_id) = self.find_particle_at(world_position) {
            if let Some(p) = self.get_particle_mut(particle_id) {
                p.dragging = true;
                p.focused = true;
                // Bring to front
                self.bring_to_front(particle_id);
                return Some(particle_id);
            }
        }
        None
    }

    /// Update drag position
    pub fn update_drag(&mut self, id: usize, delta: Vec2) {
        if let Some(particle_idx) = self.particles.iter().position(|p| p.id == id) {
            if self.particles[particle_idx].dragging {
                self.particles[particle_idx].position += delta;

                // Resolve collisions if enabled
                if self.collision_detection_enabled {
                    // Temporarily disable collision for the dragged particle
                    // to allow moving out of tight spots
                    self.collision_detection_enabled = false;
                }
            }
        }
    }

    /// End dragging a particle
    pub fn end_drag(&mut self, id: usize) {
        if let Some(particle_idx) = self.particles.iter().position(|p| p.id == id) {
            self.particles[particle_idx].dragging = false;
        }

        // Re-enable collision detection and resolve final position
        if self.collision_detection_enabled {
            if let Some(particle_idx) = self.particles.iter().position(|p| p.id == id) {
                let layer = self.particles[particle_idx].z_layer;
                let max_z = self.particles
                    .iter()
                    .filter(|p| p.z_layer == layer)
                    .map(|p| p.z_order)
                    .max()
                    .unwrap_or(0);

                // Check and resolve collisions
                let mut collision = false;
                for other in &self.particles {
                    if other.id != id && self.particles[particle_idx].collides_with(other) {
                        collision = true;
                        break;
                    }
                }

                if collision {
                    // Move particle to resolve collision
                    const STEP_SIZE: f32 = 10.0;
                    for _ in 0..100 {
                        let mut colliding = false;
                        for other in &self.particles {
                            if other.id != id && self.particles[particle_idx].collides_with(other) {
                                colliding = true;
                                break;
                            }
                        }
                        if !colliding {
                            break;
                        }
                        self.particles[particle_idx].position.x += STEP_SIZE;
                        self.particles[particle_idx].position.y += STEP_SIZE;
                    }
                }
            }
        }
    }

    /// Bring a particle to the front of its layer
    pub fn bring_to_front(&mut self, id: usize) {
        if let Some(particle_idx) = self.particles.iter().position(|p| p.id == id) {
            let layer = self.particles[particle_idx].z_layer;
            let new_z_order = self.particles
                .iter()
                .filter(|p| p.z_layer == layer)
                .map(|p| p.z_order)
                .max()
                .unwrap_or(0) + 1;
            self.particles[particle_idx].z_order = new_z_order;
        }
    }

    /// Send a particle to the back of its layer
    pub fn send_to_back(&mut self, id: usize) {
        if let Some(particle_idx) = self.particles.iter().position(|p| p.id == id) {
            let layer = self.particles[particle_idx].z_layer;
            let current_z = self.particles[particle_idx].z_order;

            // Shift all particles in the same layer with lower Z-order up by 1
            for p in &mut self.particles {
                if p.z_layer == layer && p.z_order < current_z {
                    p.z_order += 1;
                }
            }
            self.particles[particle_idx].z_order = 0;
        }
    }

    /// Remove a particle
    pub fn remove_particle(&mut self, id: usize) -> bool {
        if let Some(pos) = self.particles.iter().position(|p| p.id == id) {
            self.particles.remove(pos);
            true
        } else {
            false
        }
    }

    /// Get all particles
    pub fn particles(&self) -> &[WindowParticle] {
        &self.particles
    }

    /// Get mutable reference to all particles
    pub fn particles_mut(&mut self) -> &mut [WindowParticle] {
        &mut self.particles
    }

    /// Get particle count
    pub fn particle_count(&self) -> usize {
        self.particles.len()
    }

    /// Set the layout algorithm
    pub fn set_layout_algorithm(&mut self, algorithm: LayoutAlgorithm) {
        self.layout_algorithm = algorithm;
        self.apply_layout();
    }

    /// Apply the current layout algorithm
    pub fn apply_layout(&mut self) {
        match self.layout_algorithm {
            LayoutAlgorithm::Free => {
                // No rearrangement needed
            }
            LayoutAlgorithm::Grid => {
                self.apply_grid_layout();
            }
            LayoutAlgorithm::Tiling => {
                self.apply_tiling_layout();
            }
            LayoutAlgorithm::Stacking => {
                self.apply_stacking_layout();
            }
        }
    }

    /// Apply grid layout
    fn apply_grid_layout(&mut self) {
        const GRID_SIZE: f32 = 50.0; // Spacing between particles
        const COLS: u32 = 4;

        for (i, particle) in self.particles.iter_mut().enumerate() {
            let col = (i as u32) % COLS;
            let row = (i as u32) / COLS;

            particle.position.x = col as f32 * (particle.size.x + GRID_SIZE);
            particle.position.y = row as f32 * (particle.size.y + GRID_SIZE);
        }
    }

    /// Apply tiling layout (maximize screen usage)
    fn apply_tiling_layout(&mut self) {
        // Simple implementation: arrange in rows that span full width
        const SCREEN_WIDTH: f32 = 1920.0;
        const MARGIN: f32 = 10.0;

        let mut current_y = 10.0;
        let mut current_x = 10.0;
        let mut row_heights: Vec<f32> = Vec::new();

        for particle in &self.particles {
            if current_x + particle.size.x > SCREEN_WIDTH - MARGIN {
                // Start new row
                current_x = 10.0;
                current_y += row_heights.last().unwrap_or(&0.0) + MARGIN;
            }

            row_heights.push(particle.size.y);
        }

        // Now apply positions
        current_y = 10.0;
        current_x = 10.0;
        let mut current_row_height = 0.0;

        for particle in self.particles.iter_mut() {
            if current_x + particle.size.x > SCREEN_WIDTH - MARGIN {
                current_x = 10.0;
                current_y += current_row_height + MARGIN;
                current_row_height = 0.0;
            }

            particle.position.x = current_x;
            particle.position.y = current_y;

            current_x += particle.size.x + MARGIN;
            current_row_height = current_row_height.max(particle.size.y);
        }
    }

    /// Apply stacking layout (stack with offset)
    fn apply_stacking_layout(&mut self) {
        const OFFSET: f32 = 20.0;

        let base_x = 100.0;
        let base_y = 100.0;

        for (i, particle) in self.particles.iter_mut().enumerate() {
            particle.position.x = base_x + (i as f32) * OFFSET;
            particle.position.y = base_y + (i as f32) * OFFSET;

            // Assign increasing Z-order
            particle.z_order = i as u32;
        }
    }

    /// Enable or disable collision detection
    pub fn set_collision_detection(&mut self, enabled: bool) {
        self.collision_detection_enabled = enabled;
    }

    /// Enable or disable auto-tiling
    pub fn set_auto_tiling(&mut self, enabled: bool) {
        self.auto_tiling_enabled = enabled;
    }
}

impl Default for SpatialLayoutManager {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_window_particle_creation() {
        let particle = WindowParticle::new(
            0,
            WindowParticleType::RiscVVM,
            "Test VM".to_string(),
            Vec2::new(100.0, 100.0),
        );

        assert_eq!(particle.id, 0);
        assert_eq!(particle.particle_type, WindowParticleType::RiscVVM);
        assert_eq!(particle.title, "Test VM");
        assert_eq!(particle.position, Vec2::new(100.0, 100.0));
    }

    #[test]
    fn test_contains_point() {
        let particle = WindowParticle::new(
            0,
            WindowParticleType::ExecutionZone,
            "Zone".to_string(),
            Vec2::new(0.0, 0.0),
        );

        assert!(particle.contains_point(Vec2::new(10.0, 10.0)));
        assert!(particle.contains_point(Vec2::new(255.0, 255.0)));
        assert!(!particle.contains_point(Vec2::new(-1.0, 10.0)));
        assert!(!particle.contains_point(Vec2::new(10.0, -1.0)));
    }

    #[test]
    fn test_collision_detection() {
        let mut particle1 = WindowParticle::new(
            0,
            WindowParticleType::Terminal,
            "Term1".to_string(),
            Vec2::new(0.0, 0.0),
        );

        let mut particle2 = WindowParticle::new(
            1,
            WindowParticleType::Terminal,
            "Term2".to_string(),
            Vec2::new(50.0, 50.0),
        );

        assert!(particle1.collides_with(&particle2));

        // Move particle2 away
        particle2.position = Vec2::new(500.0, 500.0);
        assert!(!particle1.collides_with(&particle2));
    }

    #[test]
    fn test_spatial_layout_manager() {
        let mut manager = SpatialLayoutManager::new();

        let particle1 = WindowParticle::new(
            0,
            WindowParticleType::RiscVVM,
            "VM1".to_string(),
            Vec2::new(100.0, 100.0),
        );

        let particle2 = WindowParticle::new(
            1,
            WindowParticleType::AlpineVM,
            "Alpine1".to_string(),
            Vec2::new(100.0, 100.0), // Same position - should collide
        );

        manager.add_particle(particle1);
        manager.add_particle(particle2);

        assert_eq!(manager.particle_count(), 2);

        // Check that collision was resolved
        let p1 = manager.get_particle(0).unwrap();
        let p2 = manager.get_particle(1).unwrap();
        assert!(!p1.collides_with(p2));
    }

    #[test]
    fn test_z_ordering() {
        let mut manager = SpatialLayoutManager::new();

        let particle1 = WindowParticle::new(
            0,
            WindowParticleType::Terminal,
            "Term1".to_string(),
            Vec2::new(0.0, 0.0),
        );

        let particle2 = WindowParticle::new(
            1,
            WindowParticleType::Terminal,
            "Term2".to_string(),
            Vec2::new(0.0, 0.0),
        );

        manager.add_particle(particle1);
        manager.add_particle(particle2);

        // Bring particle1 to front
        manager.bring_to_front(0);

        let p1 = manager.get_particle(0).unwrap();
        let p2 = manager.get_particle(1).unwrap();
        assert!(p1.z_order > p2.z_order);
    }

    #[test]
    fn test_grid_layout() {
        let mut manager = SpatialLayoutManager::new();

        for i in 0..6 {
            let particle = WindowParticle::new(
                i,
                WindowParticleType::Terminal,
                format!("Term{}", i),
                Vec2::new(0.0, 0.0),
            );
            manager.add_particle(particle);
        }

        manager.set_layout_algorithm(LayoutAlgorithm::Grid);
        manager.apply_layout();

        // Check that particles are arranged in a grid
        let p0 = manager.get_particle(0).unwrap();
        let p1 = manager.get_particle(1).unwrap();
        let p4 = manager.get_particle(4).unwrap();

        // p0 and p1 should be in the same row
        assert!((p0.position.y - p1.position.y).abs() < 1.0);
        // p0 and p4 should be in different rows
        assert!((p0.position.y - p4.position.y).abs() > 100.0);
    }

    #[test]
    fn test_to_process_region() {
        let particle = WindowParticle::new(
            0,
            WindowParticleType::RiscVVM,
            "VM".to_string(),
            Vec2::new(100.0, 200.0),
        );

        let region = particle.to_process_region().unwrap();
        assert_eq!(region.start_x, 100);
        assert_eq!(region.start_y, 200);
        assert_eq!(region.width, 640); // base_size for RiscVVM
        assert_eq!(region.height, 480);
    }
}