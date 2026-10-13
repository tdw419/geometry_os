//! Phase 17.5: ProcessRegion Bridge
//!
//! This module bridges the SpatialLayoutManager (visual window particles)
//! with the ProcessScheduler (spatial OS execution zones).
//!
//! When a WindowParticle is created, moved, or resized, its ProcessRegion
//! is automatically synchronized with the ProcessScheduler so that the
//! actual OS processing is physically mapped to those coordinates on the
//! infinite canvas.

use crate::spatial::process_scheduler::{ProcessRegion, ProcessScheduler};
use crate::window_particle::{SpatialLayoutManager, WindowParticle, WindowParticleType};
use std::collections::HashMap;

/// Bridge that maintains synchronization between visual windows and execution zones
///
/// This is the core of Step 4: ProcessRegion Bridge. It ensures that:
/// 1. When a window particle is created, a corresponding process region is allocated
/// 2. When a window particle is moved, its execution zone moves with it
/// 3. When a window particle is resized, its execution zone boundaries update
/// 4. Process regions are always valid and non-overlapping
/// 5. The scheduler has accurate spatial constraints for execution
#[derive(Debug)]
pub struct ProcessRegionBridge {
    /// Spatial layout manager for window particles (visual layer)
    layout_manager: SpatialLayoutManager,
    /// Process scheduler for execution zones (OS layer)
    scheduler: ProcessScheduler,
    /// Mapping from particle IDs to process PIDs
    particle_to_process: HashMap<usize, u32>,
    /// Mapping from process PIDs to particle IDs
    process_to_particle: HashMap<u32, usize>,
    /// Wall/membrane boundary cells owned by the bridge, keyed by PID.
    /// The scheduler itself owns no cell raster (walls are materialized by
    /// GeoAsmMaterializer), so the bridge tracks the boundary overlay here.
    /// Tuple layout: (pid, x, y, cell_type).
    wall_cells: Vec<(u32, u32, u32, u32)>,
    /// Grid dimensions for spatial mapping
    grid_w: u32,
    grid_h: u32,
    /// Whether synchronization is enabled
    sync_enabled: bool,
}

impl ProcessRegionBridge {
    /// Create a new ProcessRegion Bridge
    ///
    /// Initializes both the spatial layout manager and the process scheduler
    /// with a shared coordinate system.
    pub fn new(grid_w: u32, grid_h: u32) -> Self {
        ProcessRegionBridge {
            layout_manager: SpatialLayoutManager::new(),
            scheduler: ProcessScheduler::new(grid_w, grid_h),
            particle_to_process: HashMap::new(),
            process_to_particle: HashMap::new(),
            wall_cells: Vec::new(),
            grid_w,
            grid_h,
            sync_enabled: true,
        }
    }

    /// Create a window particle with automatic process region allocation
    ///
    /// This is the primary entry point for creating execution zones.
    /// When a visual window is created, the bridge automatically:
    /// 1. Creates the WindowParticle for visual representation
    /// 2. Converts it to a ProcessRegion for spatial mapping
    /// 3. Allocates a process in the ProcessScheduler with that region
    /// 4. Maintains the bidirectional mapping between particle and process
    ///
    /// # Arguments
    /// * `particle_type` - Type of window (RiscVVM, ExecutionZone, etc.)
    /// * `title` - Window title
    /// * `position` - Initial world position
    /// * `entry_point` - Linear cell index for process entry point
    ///
    /// # Returns
    /// The ID of the created window particle and the PID of the allocated process
    pub fn create_execution_zone(
        &mut self,
        particle_type: WindowParticleType,
        title: String,
        position: glam::Vec2,
        entry_point: u32,
    ) -> (usize, u32) {
        // Step 1: Hand the particle to the layout manager — it assigns the ID.
        // Bridge-level overlap detection/resolution is the authority here, so
        // manager auto-collision-resolution is disabled (it would silently
        // shift new particles and preempt detect_overlaps/resolve_overlaps).
        self.layout_manager.set_collision_detection(false);
        let particle = WindowParticle::new(0, particle_type, title, position);
        self.layout_manager.add_particle(particle);

        // Step 2: Read back the assigned ID and the particle
        let particle_id = self.layout_manager.particle_count() - 1;
        let pid = self.scheduler.next_pid;

        // Step 3: Convert particle bounds to ProcessRegion
        let process_region = {
            let particle = self
                .layout_manager
                .get_particle(particle_id)
                .expect("Particle should exist after add_particle");
            particle
                .to_process_region()
                .expect("Particle should be convertible to ProcessRegion")
        };

        // Step 4: Allocate process in scheduler with the spatial region
        let pid = self
            .scheduler
            .create_process(process_region.clone(), entry_point);

        // Step 5: Maintain bidirectional mapping
        self.particle_to_process.insert(particle_id, pid);
        self.process_to_particle.insert(pid, particle_id);

        // Step 6: Store region reference in particle metadata
        if let Some(p) = self.layout_manager.get_particle_mut(particle_id) {
            p.process_region = Some(process_region.clone());
            p.metadata.insert("pid".to_string(), pid.to_string());
        }

        // Step 7: Materialize the boundary walls for the new zone
        self.rebuild_process_walls(pid, &process_region);

        (particle_id, pid)
    }

    /// Move a window particle and synchronize its execution zone
    ///
    /// When a window is dragged or moved, the execution zone moves with it.
    /// This ensures that the spatial OS continues executing in the new location.
    ///
    /// # Arguments
    /// * `particle_id` - ID of the window particle to move
    /// * `new_position` - New world position
    pub fn move_execution_zone(&mut self, particle_id: usize, new_position: glam::Vec2) -> bool {
        // Skip if synchronization is disabled
        if !self.sync_enabled {
            return false;
        }

        // Step 1: Resolve the associated process (before any mutable borrow)
        let pid = match self.particle_to_process.get(&particle_id) {
            Some(&pid) => pid,
            None => return false, // No process associated with this particle
        };

        // Step 2: Move the particle and compute its new region (scoped so the
        // mutable borrow of layout_manager ends before the scheduler update)
        let new_region = {
            let particle = match self.layout_manager.get_particle_mut(particle_id) {
                Some(p) => p,
                None => return false,
            };
            particle.move_to(new_position);
            match particle.to_process_region() {
                Some(region) => region,
                None => return false,
            }
        };

        // Step 3: Update the process region in the scheduler
        match self.scheduler.get_process_mut(pid) {
            Some(pcb) => pcb.region = new_region.clone(),
            None => return false,
        }

        // Step 4: Update the particle's stored region
        if let Some(p) = self.layout_manager.get_particle_mut(particle_id) {
            p.process_region = Some(new_region.clone());
        }

        // Step 5: Rebuild the boundary walls at the new location
        self.rebuild_process_walls(pid, &new_region);

        true
    }

    /// Resize a window particle and synchronize its execution zone
    ///
    /// When a window is resized, the execution zone boundaries update.
    /// This requires rebuilding the wall boundaries around the new region.
    ///
    /// # Arguments
    /// * `particle_id` - ID of the window particle to resize
    /// * `new_width` - New width in world units
    /// * `new_height` - New height in world units
    pub fn resize_execution_zone(
        &mut self,
        particle_id: usize,
        new_width: f32,
        new_height: f32,
    ) -> bool {
        // Skip if synchronization is disabled
        if !self.sync_enabled {
            return false;
        }

        // Step 1: Resolve the associated process (before any mutable borrow)
        let pid = match self.particle_to_process.get(&particle_id) {
            Some(&pid) => pid,
            None => return false,
        };

        // Step 2: Resize the particle and compute its new region (scoped borrow)
        let new_region = {
            let particle = match self.layout_manager.get_particle_mut(particle_id) {
                Some(p) => p,
                None => return false,
            };
            particle.resize(new_width, new_height);
            match particle.to_process_region() {
                Some(region) => region,
                None => return false,
            }
        };

        // Step 3: Update the process region in the scheduler
        match self.scheduler.get_process_mut(pid) {
            Some(pcb) => pcb.region = new_region.clone(),
            None => return false,
        }

        // Step 4: Update the particle's stored region
        if let Some(p) = self.layout_manager.get_particle_mut(particle_id) {
            p.process_region = Some(new_region.clone());
        }

        // Step 5: Rebuild the boundary walls for the new extent
        self.rebuild_process_walls(pid, &new_region);

        true
    }

    /// Rebuild the wall boundaries for a process region
    ///
    /// Called whenever a zone is created, moved, or resized. Replaces this
    /// process's WALL/MEMBRANE cells in the bridge-owned boundary overlay
    /// at the region's current coordinates. Regions use exclusive extents:
    /// the boundary spans start..start+width (X) and start..start+height (Y).
    ///
    /// # Arguments
    /// * `pid` - Process ID
    /// * `region` - New process region bounds
    fn rebuild_process_walls(&mut self, pid: u32, region: &ProcessRegion) {
        self.clear_process_walls(pid);

        let end_x = region.start_x + region.width();
        let end_y = region.start_y + region.height();
        let wall = crate::geoasm_materializer::TYPE_WALL;
        let membrane = crate::geoasm_materializer::TYPE_MEMBRANE;

        // Top and bottom WALL rows
        for x in region.start_x..end_x {
            self.wall_cells
                .push((pid, x as u32, region.start_y as u32, wall));
            self.wall_cells.push((pid, x as u32, end_y as u32, wall));
        }

        // Left and right WALL columns, with MEMBRANE access points near the
        // top corners for scheduler entry/exit
        for y in (region.start_y + 1)..end_y {
            let left_type = if y == region.start_y + 1 {
                membrane
            } else {
                wall
            };
            let right_type = if y == region.start_y + 2 {
                membrane
            } else {
                wall
            };
            self.wall_cells
                .push((pid, region.start_x as u32, y as u32, left_type));
            self.wall_cells
                .push((pid, end_x as u32, y as u32, right_type));
        }
    }

    /// Clear wall cells for a process (before rebuilding)
    ///
    /// # Arguments
    /// * `pid` - Process ID
    fn clear_process_walls(&mut self, pid: u32) {
        self.wall_cells
            .retain(|&(cell_pid, _, _, _)| cell_pid != pid);
    }

    /// Inspect the bridge-owned boundary overlay (read-only)
    pub fn wall_cells(&self) -> &[(u32, u32, u32, u32)] {
        &self.wall_cells
    }

    /// Get the layout manager (for visual operations)
    pub fn layout_manager(&mut self) -> &mut SpatialLayoutManager {
        &mut self.layout_manager
    }

    /// Get the scheduler (for execution operations)
    pub fn scheduler(&mut self) -> &mut ProcessScheduler {
        &mut self.scheduler
    }

    /// Get a particle by ID
    pub fn get_particle(&self, particle_id: usize) -> Option<&WindowParticle> {
        self.layout_manager.get_particle(particle_id)
    }

    /// Get a mutable particle by ID
    pub fn get_particle_mut(&mut self, particle_id: usize) -> Option<&mut WindowParticle> {
        self.layout_manager.get_particle_mut(particle_id)
    }

    /// Get a process by PID
    pub fn get_process(
        &self,
        pid: u32,
    ) -> Option<&crate::spatial::process_scheduler::ProcessControlBlock> {
        self.scheduler.get_process(pid)
    }

    /// Get the PID associated with a particle ID
    pub fn get_process_id(&self, particle_id: usize) -> Option<u32> {
        self.particle_to_process.get(&particle_id).copied()
    }

    /// Get the particle ID associated with a PID
    pub fn get_particle_id(&self, pid: u32) -> Option<usize> {
        self.process_to_particle.get(&pid).copied()
    }

    /// Execute one tick of the scheduler
    ///
    /// Returns the PID of the process that should execute this tick,
    /// or None if no process is ready. (The scheduler's tick returns the
    /// running process's base_index; the bridge re-exposes the PID.)
    pub fn tick(&mut self) -> Option<u32> {
        let _base_index = self.scheduler.tick();
        self.scheduler.current_pid
    }

    /// Get the number of execution zones (processes)
    pub fn process_count(&self) -> usize {
        self.scheduler.process_count()
    }

    /// Get the number of window particles
    pub fn particle_count(&self) -> usize {
        self.layout_manager.particle_count()
    }

    /// Enable or disable synchronization
    ///
    /// When disabled, window movements don't trigger process region updates.
    /// This is useful for temporary visual operations.
    pub fn set_sync_enabled(&mut self, enabled: bool) {
        self.sync_enabled = enabled;
    }

    /// Check if synchronization is enabled
    pub fn is_sync_enabled(&self) -> bool {
        self.sync_enabled
    }

    /// Serialize the scheduler to binary format (for GridRunner)
    pub fn to_binary(&self) -> Vec<u8> {
        self.scheduler.to_binary()
    }

    /// Get grid dimensions
    pub fn grid_dimensions(&self) -> (u32, u32) {
        (self.grid_w, self.grid_h)
    }

    /// Validate all process regions are within grid bounds
    ///
    /// Returns true if all regions are valid, false otherwise.
    /// Checks the LIVE particle positions (converted to regions), not the
    /// stored snapshots, so externally-moved particles are caught.
    /// Regions use exclusive extents: start + size must not exceed the grid.
    pub fn validate_regions(&self) -> bool {
        for particle in self.layout_manager.particles() {
            if let Some(live_region) = particle.to_process_region() {
                let end_x = live_region.start_x + live_region.width();
                let end_y = live_region.start_y + live_region.height();
                if end_x > self.grid_w as usize || end_y > self.grid_h as usize {
                    return false;
                }
            }
        }
        true
    }

    /// Detect overlapping process regions
    ///
    /// Returns a list of (pid1, pid2) pairs that overlap.
    pub fn detect_overlaps(&self) -> Vec<(u32, u32)> {
        let mut overlaps = Vec::new();

        let mut regions: Vec<(u32, ProcessRegion)> = self
            .particle_to_process
            .iter()
            .filter_map(|(&particle_id, &pid)| {
                let particle = self.layout_manager.get_particle(particle_id)?;
                let region = particle.process_region.clone()?;
                Some((pid, region))
            })
            .collect();

        // Sort by PID so overlap pairs are deterministic regardless of
        // HashMap iteration order (pair = (lower_pid, higher_pid)).
        regions.sort_by_key(|entry| entry.0);

        for (i, (pid1, region1)) in regions.iter().enumerate() {
            for (pid2, region2) in regions.iter().skip(i + 1) {
                if self.regions_overlap(region1, region2) {
                    overlaps.push((*pid1, *pid2));
                }
            }
        }

        overlaps
    }

    /// Check if two regions overlap
    ///
    /// Regions use exclusive extents, so two regions overlap iff each
    /// region's start is strictly inside the other's half-open extent.
    fn regions_overlap(&self, r1: &ProcessRegion, r2: &ProcessRegion) -> bool {
        let r1_end_x = r1.start_x + r1.width();
        let r1_end_y = r1.start_y + r1.height();
        let r2_end_x = r2.start_x + r2.width();
        let r2_end_y = r2.start_y + r2.height();

        !(r1_end_x <= r2.start_x
            || r2_end_x <= r1.start_x
            || r1_end_y <= r2.start_y
            || r2_end_y <= r1.start_y)
    }

    /// Resolve overlaps by moving conflicting regions
    ///
    /// Moves the second particle of each overlapping pair clear of the
    /// first (by the first region's full extent plus a 10-unit gap), so
    /// the shift is guaranteed to separate windows of any default size.
    pub fn resolve_overlaps(&mut self) -> usize {
        let overlaps = self.detect_overlaps();
        let mut resolved = 0;

        for (pid1, pid2) in overlaps {
            // Find the associated particles
            let particle1_id = self.process_to_particle.get(&pid1).copied();
            let particle2_id = self.process_to_particle.get(&pid2).copied();

            if let (Some(_p1_id), Some(p2_id)) = (particle1_id, particle2_id) {
                // Shift particle2 beyond particle1's full extent
                let shift_target = {
                    let Some(p1) = particle1_id.and_then(|id| self.layout_manager.get_particle(id))
                    else {
                        continue;
                    };
                    let Some(p2) = self.layout_manager.get_particle(p2_id) else {
                        continue;
                    };
                    glam::Vec2::new(
                        p1.position.x + p1.size.x + 10.0,
                        p1.position.y + p1.size.y + 10.0,
                    )
                };

                if self.move_execution_zone(p2_id, shift_target) {
                    resolved += 1;
                }
            }
        }

        resolved
    }
}
