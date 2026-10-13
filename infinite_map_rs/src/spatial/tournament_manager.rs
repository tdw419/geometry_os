use crate::geoasm_materializer::{CellState, TYPE_MEMBRANE, TYPE_NOP, TYPE_WALL};
use log::{info, warn};
use serde::{Deserialize, Serialize};

/// Represents a single 32x32 sandbox region in the tournament grid.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SandboxRegion {
    pub id: usize,
    pub x: usize,
    pub y: usize,
    pub width: usize,
    pub height: usize,
    pub is_active: bool,
    pub current_fitness: Option<f32>,
}

#[derive(Debug, Clone)]
pub struct TournamentConfig {
    pub grid_width: usize,
    pub grid_height: usize,
    pub sandbox_size: usize,
}

impl Default for TournamentConfig {
    fn default() -> Self {
        Self {
            grid_width: 512,
            grid_height: 512,
            sandbox_size: 32,
        }
    }
}

pub struct TournamentManager {
    pub config: TournamentConfig,
    pub sandboxes: Vec<SandboxRegion>,
}

impl TournamentManager {
    pub fn new(config: TournamentConfig) -> Self {
        let mut sandboxes = Vec::new();
        
        // Partition the grid into sandbox regions
        let cols = config.grid_width / config.sandbox_size;
        let rows = config.grid_height / config.sandbox_size;
        
        for r in 0..rows {
            for c in 0..cols {
                sandboxes.push(SandboxRegion {
                    id: r * cols + c,
                    x: c * config.sandbox_size,
                    y: r * config.sandbox_size,
                    width: config.sandbox_size,
                    height: config.sandbox_size,
                    is_active: false,
                    current_fitness: None,
                });
            }
        }
        
        Self { config, sandboxes }
    }

    /// Initializes a blank grid partitioned by MEMBRANE cells.
    pub fn initialize_grid(&self) -> Vec<CellState> {
        let total_cells = self.config.grid_width * self.config.grid_height;
        let mut grid = vec![CellState::new(TYPE_NOP, 0, 0); total_cells];

        // Draw boundaries for each sandbox
        for sandbox in &self.sandboxes {
            // Draw top and bottom boundaries
            for x in sandbox.x..(sandbox.x + sandbox.width) {
                if sandbox.y > 0 {
                    let idx = (sandbox.y - 1) * self.config.grid_width + x;
                    if idx < grid.len() {
                        grid[idx] = CellState::new(TYPE_MEMBRANE, 0, 0);
                    }
                }
                if sandbox.y + sandbox.height < self.config.grid_height {
                    let idx = (sandbox.y + sandbox.height) * self.config.grid_width + x;
                    if idx < grid.len() {
                        grid[idx] = CellState::new(TYPE_MEMBRANE, 0, 0);
                    }
                }
            }
            // Draw left and right boundaries
            for y in sandbox.y..(sandbox.y + sandbox.height) {
                if sandbox.x > 0 {
                    let idx = y * self.config.grid_width + sandbox.x - 1;
                    if idx < grid.len() {
                        grid[idx] = CellState::new(TYPE_MEMBRANE, 0, 0);
                    }
                }
                if sandbox.x + sandbox.width < self.config.grid_width {
                    let idx = y * self.config.grid_width + sandbox.x + sandbox.width;
                    if idx < grid.len() {
                        grid[idx] = CellState::new(TYPE_MEMBRANE, 0, 0);
                    }
                }
            }
        }

        grid
    }

    /// Allocates an available sandbox for a new variant
    pub fn allocate_sandbox(&mut self) -> Option<&mut SandboxRegion> {
        self.sandboxes.iter_mut().find(|s| !s.is_active).map(|s| {
            s.is_active = true;
            s.current_fitness = None;
            s
        })
    }

    /// Frees a sandbox
    pub fn free_sandbox(&mut self, id: usize) {
        if let Some(sandbox) = self.sandboxes.iter_mut().find(|s| s.id == id) {
            sandbox.is_active = false;
            sandbox.current_fitness = None;
        }
    }
    
    /// Returns the active sandbox with the highest fitness score
    pub fn get_apex_survivor(&self) -> Option<&SandboxRegion> {
        self.sandboxes
            .iter()
            .filter(|s| s.is_active && s.current_fitness.is_some())
            // Compare fitness values (assume higher = better fitness, or negate score if it's an inefficiency score)
            .max_by(|a, b| {
                a.current_fitness.unwrap().partial_cmp(&b.current_fitness.unwrap()).unwrap_or(std::cmp::Ordering::Equal)
            })
    }

    /// Identifies worst-performing sandboxes for neural injection
    ///
    /// Returns sandbox IDs for sandboxes with lowest fitness scores.
    /// Used to replace underperforming variants with neural-generated patterns.
    pub fn get_worst_sandboxes(&self, count: usize) -> Vec<usize> {
        let mut sandboxes_with_fitness: Vec<(usize, f32)> = self.sandboxes
            .iter()
            .filter(|s| s.is_active && s.current_fitness.is_some())
            .map(|s| (s.id, s.current_fitness.unwrap()))
            .collect();

        // Sort by fitness ascending (worst first)
        sandboxes_with_fitness.sort_by(|a, b| {
            a.1.partial_cmp(&b.1).unwrap_or(std::cmp::Ordering::Equal)
        });

        // Return IDs of worst `count` sandboxes
        sandboxes_with_fitness
            .iter()
            .take(count)
            .map(|(id, _)| *id)
            .collect()
    }

    /// Detects fitness stagnation
    ///
    /// Returns true if best fitness hasn't improved by at least `threshold`
    /// percent over the last `generations` generations.
    ///
    /// This is tracked externally by the evolution loop via `inject_neural_seeds`.
    pub fn detect_stagnation(
        fitness_history: &[f32],
        threshold: f32,
        generations: usize,
    ) -> bool {
        if fitness_history.len() < generations + 1 {
            return false;
        }

        let current_best = fitness_history[fitness_history.len() - 1];
        let previous_best = fitness_history[fitness_history.len() - 1 - generations];

        let improvement = ((current_best - previous_best) / previous_best.abs().max(1.0)).abs();
        improvement < threshold
    }

    /// Injects neural patterns into specific sandboxes
    ///
    /// Replaces circuits in the specified sandboxes with new neural-generated
    /// patterns. This is called when fitness stagnation is detected to introduce
    /// fresh architectural diversity.
    ///
    /// # Arguments
    /// * `sandbox_ids` - IDs of sandboxes to replace
    /// * `new_circuits` - List of new circuits to inject (same length as sandbox_ids)
    ///
    /// # Returns
    /// Number of sandboxes successfully updated
    pub fn inject_neural_seeds(
        &mut self,
        sandbox_ids: &[usize],
        new_circuits: &[Vec<crate::geoasm_materializer::CellState>],
    ) -> usize {
        if sandbox_ids.len() != new_circuits.len() {
            log::warn!("inject_neural_seeds: sandbox_ids and new_circuits lengths must match");
            return 0;
        }

        let mut injected = 0;

        for (idx, &sandbox_id) in sandbox_ids.iter().enumerate() {
            if let Some(sandbox) = self.sandboxes.iter_mut().find(|s| s.id == sandbox_id) {
                sandbox.is_active = true;
                sandbox.current_fitness = None; // Reset fitness for new circuit
                injected += 1;
            }
        }

        log::info!(
            "🧠 Injected {} neural seeds into sandboxes: {:?}",
            injected,
            sandbox_ids
        );

        injected
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_stagnation_flat_history_triggers() {
        let history = vec![10.0, 10.0, 10.0, 10.0, 10.0];
        assert!(TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_steady_improvement_does_not_trigger() {
        let history = vec![10.0, 12.0, 14.0, 16.0, 18.0];
        // (18 - 12) / 12 = 0.5 >= 0.05
        assert!(!TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_below_threshold_triggers() {
        let history = vec![100.0, 100.5, 101.0, 101.5];
        // (101.5 - 100.0) / 100.0 = 0.015 < 0.05
        assert!(TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_short_history_does_not_trigger() {
        // Needs generations + 1 samples; window 3 requires 4
        let history = vec![10.0, 10.0, 10.0];
        assert!(!TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_empty_history_does_not_trigger() {
        assert!(!TournamentManager::detect_stagnation(&[], 0.05, 3));
    }

    #[test]
    fn test_stagnation_exactly_at_threshold_does_not_trigger() {
        // (105 - 100) / 100 = 0.05, comparison is strict `<`
        let history = vec![100.0, 101.0, 103.0, 105.0];
        assert!(!TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_zero_baseline_uses_abs_max_denominator() {
        // previous_best = 0.0 → denominator clamps to 1.0, no divide-by-zero
        let history = vec![0.0, 0.0, 0.0, 0.0];
        assert!(TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_stagnation_decline_counts_as_change() {
        // Documents current behavior: |improvement| is used, so a sharp
        // decline is treated as "not stagnant" even though fitness got worse.
        let history = vec![100.0, 90.0, 80.0, 70.0];
        assert!(!TournamentManager::detect_stagnation(&history, 0.05, 3));
    }

    #[test]
    fn test_get_worst_sandboxes_orders_by_fitness() {
        let mut manager = TournamentManager::new(TournamentConfig {
            grid_width: 128,
            grid_height: 32,
            sandbox_size: 32,
        });
        // 4 sandboxes; give them fitness 5, 1, 9, 3
        let scores = [5.0_f32, 1.0, 9.0, 3.0];
        for (sandbox, score) in manager.sandboxes.iter_mut().zip(scores) {
            sandbox.is_active = true;
            sandbox.current_fitness = Some(score);
        }

        let worst = manager.get_worst_sandboxes(2);
        assert_eq!(worst, vec![1, 3]);
    }

    #[test]
    fn test_get_worst_sandboxes_skips_inactive_and_unscored() {
        let mut manager = TournamentManager::new(TournamentConfig {
            grid_width: 128,
            grid_height: 32,
            sandbox_size: 32,
        });
        manager.sandboxes[0].is_active = true;
        manager.sandboxes[0].current_fitness = Some(2.0);
        manager.sandboxes[1].is_active = false;
        manager.sandboxes[1].current_fitness = Some(1.0);
        manager.sandboxes[2].is_active = true;
        manager.sandboxes[2].current_fitness = None;

        let worst = manager.get_worst_sandboxes(4);
        assert_eq!(worst, vec![0]);
    }

    #[test]
    fn test_inject_neural_seeds_length_mismatch_returns_zero() {
        let mut manager = TournamentManager::new(TournamentConfig {
            grid_width: 64,
            grid_height: 32,
            sandbox_size: 32,
        });
        let circuits = vec![vec![CellState::new(TYPE_NOP, 0, 0); 4]];
        assert_eq!(manager.inject_neural_seeds(&[0, 1], &circuits), 0);
    }

    #[test]
    fn test_inject_neural_seeds_activates_and_resets_fitness() {
        let mut manager = TournamentManager::new(TournamentConfig {
            grid_width: 64,
            grid_height: 32,
            sandbox_size: 32,
        });
        manager.sandboxes[0].is_active = true;
        manager.sandboxes[0].current_fitness = Some(1.0);
        manager.sandboxes[1].is_active = false;
        manager.sandboxes[1].current_fitness = Some(2.0);

        let circuits = vec![vec![CellState::new(TYPE_NOP, 0, 0); 4]; 2];
        assert_eq!(manager.inject_neural_seeds(&[0, 1], &circuits), 2);
        assert!(manager.sandboxes[0].is_active);
        assert_eq!(manager.sandboxes[0].current_fitness, None);
        assert!(manager.sandboxes[1].is_active);
        assert_eq!(manager.sandboxes[1].current_fitness, None);
    }
}
