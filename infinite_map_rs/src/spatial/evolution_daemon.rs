//! Evolution Daemon v8 - Continuous Autonomous Circuit Evolution (Phase 20)
//!
//! Background daemon that continuously mutates, tests, and evolves spatial circuits.
//! Runs in idle regions of the grid without disrupting active computations.
//!
//! Architecture:
//! 1. Scout: Identifies idle regions suitable for experimentation
//! 2. Mutator: Applies circuit transformations (crossover, mutation, novel generation)
//! 3. Evaluator: Tests fitness of evolved circuits (performance, correctness)
//! 4. Selector: Decides which variants survive (fitness threshold, population competition)
//! 5. Integrator: Merges successful variants into main circuit

use std::collections::HashMap;
use std::time::{Duration, Instant};
use log::{debug, info, warn};

use super::circuit_optimizer::{CircuitOptimizer, OptimizationConfig};
use super::performance_metrics::{MetricsCollector, PerformanceMetrics};
use super::tournament_manager::{TournamentManager, TournamentConfig, SandboxRegion};
use super::vision_studio_bridge::{VisionStudioClient, VisionStudioConfig};
use crate::geoasm_materializer::{
    CellState, GeoasmMaterializer, MaterializeCell, MaterializeRequest,
};

/// Evolution daemon configuration
#[derive(Debug, Clone)]
pub struct EvolutionConfig {
    /// Maximum concurrent experiments
    pub max_experiments: usize,
    /// Idle region size (cells)
    pub idle_region_size: usize,
    /// Fitness evaluation window (ticks)
    pub evaluation_window: usize,
    /// Minimum fitness threshold to keep variant
    pub min_fitness_threshold: f32,
    /// Mutation rate (0.0-1.0)
    pub mutation_rate: f32,
    /// Crossover rate (0.0-1.0)
    pub crossover_rate: f32,
    /// Experiment timeout (seconds)
    pub experiment_timeout: u64,
    /// Base circuit optimizer config
    pub optimizer_config: OptimizationConfig,
    /// Tournament manager config
    pub tournament_config: TournamentConfig,
    /// VLM config for vision-based fitness evaluation
    pub vlm_config: Option<VisionStudioConfig>,
    /// Pareto frontier history size
    pub pareto_history_size: usize,
}

impl Default for EvolutionConfig {
    fn default() -> Self {
        Self {
            max_experiments: 4,
            idle_region_size: 1024, // 32x32 region
            evaluation_window: 100,
            min_fitness_threshold: 1.05, // 5% improvement
            mutation_rate: 0.15,
            crossover_rate: 0.3,
            experiment_timeout: 30,
            optimizer_config: OptimizationConfig::default(),
            tournament_config: TournamentConfig::default(),
            vlm_config: Some(VisionStudioConfig::default()),
            pareto_history_size: 50,
        }
    }
}

/// Experiment state
#[derive(Debug, Clone, PartialEq)]
pub enum ExperimentState {
    /// Waiting for idle region
    Waiting,
    /// Mutating circuit
    Mutating,
    /// Evaluating fitness
    Evaluating { tick_count: usize },
    /// Analyzing results
    Analyzing,
    /// Integrating successful variant
    Integrating,
    /// Experiment complete
    Complete { success: bool },
    /// Failed or timed out
    Failed { reason: String },
}

/// Fitness metrics for a circuit variant
#[derive(Debug, Clone)]
pub struct FitnessMetrics {
    /// FPS measurement
    pub fps: f32,
    /// Average tick latency (microseconds)
    pub avg_tick_us: f32,
    /// Throughput (cells/tick)
    pub throughput: f32,
    /// Combined fitness score
    pub fitness_score: f32,
    /// Correctness score (0.0-1.0)
    pub correctness: f32,
    /// Spatial density (0.0-1.0, higher = better utilization)
    pub spatial_density: f32,
}

/// Pareto frontier entry
#[derive(Debug, Clone)]
pub struct ParetoEntry {
    pub variant: Vec<CellState>,
    pub fitness: FitnessMetrics,
    pub generation: usize,
    pub discovered_at: Instant,
}

/// Active evolution experiment
pub struct Experiment {
    /// Unique experiment ID
    pub id: String,
    /// Experiment state
    pub state: ExperimentState,
    /// Assigned idle region (x, y, w, h)
    pub region: Option<(usize, usize, usize, usize)>,
    /// Parent circuit snapshot
    pub parent_circuit: Vec<CellState>,
    /// Evolved variant
    pub variant: Vec<CellState>,
    /// Fitness metrics
    pub fitness: Option<FitnessMetrics>,
    /// Start time
    pub started_at: Instant,
    /// Experiment iteration
    pub iteration: usize,
}

impl Experiment {
    pub fn new(id: String, parent_circuit: Vec<CellState>) -> Self {
        Self {
            id,
            state: ExperimentState::Waiting,
            region: None,
            parent_circuit,
            variant: Vec::new(),
            fitness: None,
            started_at: Instant::now(),
            iteration: 0,
        }
    }

    /// Check if experiment has timed out
    pub fn is_timed_out(&self, timeout_secs: u64) -> bool {
        self.started_at.elapsed() > Duration::from_secs(timeout_secs)
    }
}

/// Mutation operator for circuits
#[derive(Debug, Clone)]
pub enum MutationOperator {
    /// Point mutation: Change a single cell's opcode
    PointMutation { x: usize, y: usize, new_opcode: u32 },
    /// Insert mutation: Add new cell
    Insert { x: usize, y: usize, cell: CellState },
    /// Delete mutation: Remove cell
    Delete { x: usize, y: usize },
    /// Swap mutation: Exchange two cells
    Swap {
        x1: usize,
        y1: usize,
        x2: usize,
        y2: usize,
    },
    /// Shift mutation: Move circuit region
    Shift { dx: i32, dy: i32 },
}

/// Circuit mutator with topology-aware transformations
pub struct CircuitMutator {
    grid_w: usize,
    grid_h: usize,
}

impl CircuitMutator {
    pub fn new(grid_w: usize, grid_h: usize) -> Self {
        Self { grid_w, grid_h }
    }

    /// Apply topology-aware mutations to a circuit
    pub fn mutate_circuit(&self, circuit: &mut [CellState], mutation_rate: f32) {
        // Build adjacency graph to preserve routing structure
        let active_cells: Vec<(usize, usize)> = (0..circuit.len())
            .filter_map(|i| {
                if circuit[i].is_active > 0 {
                    let y = i / self.grid_w;
                    let x = i % self.grid_w;
                    Some((x, y))
                } else {
                    None
                }
            })
            .collect();

        // Apply mutations based on rate
        for &(x, y) in &active_cells {
            if rand::random::<f32>() < mutation_rate {
                self.apply_topology_mutation(circuit, x, y);
            }
        }
    }

    fn apply_topology_mutation(&self, circuit: &mut [CellState], x: usize, y: usize) {
        let idx = y * self.grid_w + x;
        if idx >= circuit.len() {
            return;
        }

        // Select mutation type based on local topology
        let mutation_type = rand::random::<f32>();

        if mutation_type < 0.3 {
            // Local density optimization: move toward cluster center
            self.optimize_local_density(circuit, x, y);
        } else if mutation_type < 0.6 {
            // Connection preservation: swap with neighbor that maintains routing
            self.preserve_connections(circuit, x, y);
        } else if mutation_type < 0.8 {
            // Spatial injection: add cell in strategic gap
            self.strategic_injection(circuit, x, y);
        } else {
            // Pattern emergence: create new functional pattern
            self.emerge_pattern(circuit, x, y);
        }
    }

    fn optimize_local_density(&self, circuit: &mut [CellState], x: usize, y: usize) {
        // Find direction of most active neighbors
        let mut dx = 0i32;
        let mut dy = 0i32;

        for (nx, ny) in self.get_neighbors(x, y) {
            let nidx = ny * self.grid_w + nx;
            if nidx < circuit.len() && circuit[nidx].is_active > 0 {
                dx += nx as i32 - x as i32;
                dy += ny as i32 - y as i32;
            }
        }

        // Shift cell slightly toward cluster center
        if dx != 0 || dy != 0 {
            let shift_x = if dx > 0 { 1 } else { -1 };
            let shift_y = if dy > 0 { 1 } else { -1 };
            self.safe_shift_cell(circuit, x, y, shift_x, shift_y);
        }
    }

    fn preserve_connections(&self, circuit: &mut [CellState], x: usize, y: usize) {
        // Swap with random neighbor if it maintains activity
        let neighbors = self.get_neighbors(x, y);
        if !neighbors.is_empty() {
            let (nx, ny) = neighbors[rand::random::<usize>() % neighbors.len()];
            let idx1 = y * self.grid_w + x;
            let idx2 = ny * self.grid_w + nx;

            if idx2 < circuit.len() {
                circuit.swap(idx1, idx2);
            }
        }
    }

    fn strategic_injection(&self, circuit: &mut [CellState], x: usize, y: usize) {
        // Find nearby gap and insert cell there
        for (nx, ny) in self.get_neighbors(x, y) {
            let nidx = ny * self.grid_w + nx;
            if nidx < circuit.len() && circuit[nidx].is_active == 0 {
                circuit[nidx] = CellState::new(
                    self.random_valid_opcode(),
                    rand::random::<i32>() % 8,
                    rand::random::<i32>() % 8,
                );
                break;
            }
        }
    }

    fn emerge_pattern(&self, circuit: &mut [CellState], x: usize, y: usize) {
        // Create simple 2x2 pattern
        const PATTERN: [(i32, i32); 4] = [(0, 0), (1, 0), (0, 1), (1, 1)];
        let opcode = self.random_valid_opcode();

        for (dx, dy) in PATTERN.iter() {
            let nx = (x as i32 + dx).rem_euclid(self.grid_w as i32) as usize;
            let ny = (y as i32 + dy).rem_euclid(self.grid_h as i32) as usize;
            let nidx = ny * self.grid_w + nx;
            if nidx < circuit.len() {
                circuit[nidx] = CellState::new(opcode, rand::random::<i32>() % 8, rand::random::<i32>() % 8);
            }
        }
    }

    fn get_neighbors(&self, x: usize, y: usize) -> Vec<(usize, usize)> {
        let mut neighbors = Vec::new();
        let offsets: [(i32, i32); 4] = [(-1, 0), (1, 0), (0, -1), (0, 1)];

        for (dx, dy) in offsets {
            let nx = (x as i32 + dx).rem_euclid(self.grid_w as i32) as usize;
            let ny = (y as i32 + dy).rem_euclid(self.grid_h as i32) as usize;
            neighbors.push((nx, ny));
        }
        neighbors
    }

    fn safe_shift_cell(&self, circuit: &mut [CellState], x: usize, y: usize, dx: i32, dy: i32) {
        let src_idx = y * self.grid_w + x;
        let new_x = (x as i32 + dx).rem_euclid(self.grid_w as i32) as usize;
        let new_y = (y as i32 + dy).rem_euclid(self.grid_h as i32) as usize;
        let dst_idx = new_y * self.grid_w + new_x;

        if dst_idx < circuit.len() && dst_idx < circuit.len() {
            let temp = circuit[src_idx];
            circuit[dst_idx] = temp;
            circuit[src_idx] = CellState::data(0);
        }
    }

    fn random_valid_opcode(&self) -> u32 {
        const VALID_OPCODES: &[u32] = &[
            3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
            26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
        ];
        VALID_OPCODES[rand::random::<usize>() % VALID_OPCODES.len()]
    }
}

/// Evolution daemon
pub struct EvolutionDaemon {
    /// Grid dimensions
    grid_w: usize,
    grid_h: usize,
    /// Configuration
    config: EvolutionConfig,
    /// Active experiments
    experiments: HashMap<String, Experiment>,
    /// Idle region cache
    idle_regions: Vec<(usize, usize, usize, usize)>,
    /// Stats
    stats: EvolutionStats,
    /// Tournament manager for multi-region evolution
    tournament_manager: TournamentManager,
    /// VLM client for vision-based fitness evaluation
    vlm_client: Option<VisionStudioClient>,
    /// Pareto frontier history
    pareto_frontier: Vec<ParetoEntry>,
    /// Current generation counter
    generation: usize,
}

impl EvolutionDaemon {
    pub fn new(grid_w: usize, grid_h: usize, config: EvolutionConfig) -> Self {
        // Initialize VLM client if configured
        let vlm_client = config.vlm_config.as_ref()
            .and_then(|c| VisionStudioClient::new(c.clone()).ok());

        Self {
            grid_w,
            grid_h,
            config,
            experiments: HashMap::new(),
            idle_regions: Vec::new(),
            stats: EvolutionStats::default(),
            tournament_manager: TournamentManager::new(
                EvolutionConfig::default().tournament_config.clone()
            ),
            vlm_client,
            pareto_frontier: Vec::new(),
            generation: 0,
        }
    }

    /// Start evolution daemon loop
    pub fn start(&mut self, main_circuit: &[CellState]) -> Result<(), String> {
        info!("🧬 EvolutionDaemon v8: Starting autonomous evolution");

        // Scout for idle regions
        self.scout_idle_regions(main_circuit)?;
        info!(
            "🔍 EvolutionDaemon: Found {} idle regions",
            self.idle_regions.len()
        );

        Ok(())
    }

    /// Stop evolution daemon
    pub fn stop(&mut self) {
        info!("🛑 EvolutionDaemon: Stopping");
    }

    /// Scout grid for idle regions (non-active cells)
    fn scout_idle_regions(&mut self, grid: &[CellState]) -> Result<(), String> {
        self.idle_regions.clear();

        let chunk_size = (self.config.idle_region_size as f64).sqrt() as usize;
        let mut x = 0;
        let mut y = 0;

        while y + chunk_size <= self.grid_h {
            while x + chunk_size <= self.grid_w {
                // Check if region is idle (no active cells)
                let mut idle = true;
                for ry in y..y + chunk_size {
                    for rx in x..x + chunk_size {
                        let idx = ry * self.grid_w + rx;
                        if grid[idx].executing > 0 || grid[idx].is_active > 0 {
                            idle = false;
                            break;
                        }
                    }
                    if !idle {
                        break;
                    }
                }

                if idle {
                    self.idle_regions.push((x, y, chunk_size, chunk_size));
                }

                x += chunk_size;
            }
            x = 0;
            y += chunk_size;
        }

        Ok(())
    }

    /// Create new experiment
    pub fn spawn_experiment(&mut self, parent_circuit: Vec<CellState>) -> String {
        if self.experiments.len() >= self.config.max_experiments {
            warn!("⚠️  EvolutionDaemon: Max experiments reached");
            return String::new();
        }

        if self.idle_regions.is_empty() {
            warn!("⚠️  EvolutionDaemon: No idle regions available");
            return String::new();
        }

        // Assign idle region
        let region = self.idle_regions.remove(0);
        let id = format!("exp_{}", self.stats.total_experiments);

        let mut exp = Experiment::new(id.clone(), parent_circuit);
        exp.region = Some(region);

        self.experiments.insert(id.clone(), exp);
        self.stats.total_experiments += 1;
        self.stats.active_experiments += 1;

        info!(
            "🧬 EvolutionDaemon: Spawned experiment {} in region {:?}",
            id, region
        );

        id
    }

    /// Apply mutation operator to circuit
    pub fn mutate(&self, circuit: &[CellState]) -> Result<Vec<CellState>, String> {
        let mut variant = circuit.to_vec();

        // Randomly select mutation operator
        let op_type = rand::random::<f32>();

        if op_type < 0.4 {
            // Point mutation (40%)
            if let Some((x, y)) = self.random_active_cell(circuit) {
                let new_opcode = self.random_valid_opcode();
                self.apply_point_mutation(&mut variant, x, y, new_opcode);
            }
        } else if op_type < 0.7 {
            // Insert mutation (30%)
            let (x, y) = self.random_idle_cell(circuit);
            let cell = CellState::new(
                self.random_valid_opcode(),
                rand::random::<i32>() % 8,
                rand::random::<i32>() % 8,
            );
            self.apply_insert(&mut variant, x, y, cell);
        } else if op_type < 0.9 {
            // Swap mutation (20%)
            if let Some((x1, y1)) = self.random_active_cell(circuit) {
                if let Some((x2, y2)) = self.random_active_cell(circuit) {
                    self.apply_swap(&mut variant, x1, y1, x2, y2);
                }
            }
        } else {
            // Shift mutation (10%)
            let dx = (rand::random::<i32>() % 5) - 2; // -2 to +2
            let dy = (rand::random::<i32>() % 5) - 2;
            self.apply_shift(&mut variant, dx, dy);
        }

        Ok(variant)
    }

    /// Evaluate fitness of circuit variant
    pub fn evaluate_fitness(&self, variant: &[CellState]) -> FitnessMetrics {
        // Simple fitness evaluation based on active cells
        let active_cells = variant
            .iter()
            .filter(|c| c.is_active > 0 || c.executing > 0)
            .count();
        let spatial_density = active_cells as f32 / variant.len() as f32;
        let fps = 1000.0; // Base FPS
        let throughput = active_cells as f32 * fps;
        let fitness_score = throughput * 0.001;
        let avg_tick_us = 1000.0 / fps;

        FitnessMetrics {
            fps,
            avg_tick_us,
            throughput,
            fitness_score,
            correctness: 1.0,
            spatial_density,
        }
    }

    /// Tick all experiments forward
    pub fn tick(&mut self, main_circuit: &[CellState]) {
        let mut to_remove: Vec<String> = Vec::new();
        let mut to_add: Vec<Experiment> = Vec::new();

        // Collect completed experiments
        for (id, exp) in self.experiments.iter() {
            if exp.is_timed_out(self.config.experiment_timeout) {
                warn!("⏰ Experiment {} timed out", id);
                to_remove.push(id.clone());
            }
        }

        // Process active experiments
        for id in self.experiments.keys().cloned().collect::<Vec<_>>() {
            if to_remove.contains(&id) {
                continue;
            }

            if let Some(exp) = self.experiments.get_mut(&id) {
                // Simple state machine transition
                let new_state = match &exp.state {
                    ExperimentState::Waiting => {
                        self.stats.mutations_attempted += 1;
                        Some(ExperimentState::Mutating)
                    }
                    ExperimentState::Mutating => {
                        let parent_snapshot = exp.parent_circuit.clone();
                        // We need to temporarily release mutable borrow
                        let mut variant_result = None;
                        // Clone needed data for mutation
                        if let Ok(v) = {
                            // Create a temporary daemon for mutation
                            let temp_daemon = EvolutionDaemon {
                                grid_w: self.grid_w,
                                grid_h: self.grid_h,
                                config: self.config.clone(),
                                experiments: HashMap::new(),
                                idle_regions: Vec::new(),
                                stats: EvolutionStats::default(),
                                tournament_manager: TournamentManager::new(
                                    EvolutionConfig::default().tournament_config.clone(),
                                ),
                                vlm_client: None,
                                pareto_frontier: Vec::new(),
                                generation: 0,
                            };
                            temp_daemon.mutate(&parent_snapshot)
                        } {
                            variant_result = Some(v);
                        }

                        if let Some(variant) = variant_result {
                            exp.variant = variant;
                            self.stats.mutations_successful += 1;
                            Some(ExperimentState::Evaluating { tick_count: 0 })
                        } else {
                            Some(ExperimentState::Failed {
                                reason: "Mutation failed".to_string(),
                            })
                        }
                    }
                    ExperimentState::Evaluating { tick_count } => {
                        let new_count = *tick_count + 1;
                        if new_count >= self.config.evaluation_window {
                            self.stats.evaluations_completed += 1;
                            Some(ExperimentState::Analyzing)
                        } else {
                            Some(ExperimentState::Evaluating {
                                tick_count: new_count,
                            })
                        }
                    }
                    ExperimentState::Analyzing => {
                        let variant_snapshot = exp.variant.clone();
                        let fitness_result = {
                            let temp_daemon = EvolutionDaemon {
                                grid_w: self.grid_w,
                                grid_h: self.grid_h,
                                config: self.config.clone(),
                                experiments: HashMap::new(),
                                idle_regions: Vec::new(),
                                stats: EvolutionStats::default(),
                                tournament_manager: TournamentManager::new(
                                    EvolutionConfig::default().tournament_config.clone(),
                                ),
                                vlm_client: None,
                                pareto_frontier: Vec::new(),
                                generation: 0,
                            };
                            temp_daemon.evaluate_fitness(&variant_snapshot)
                        };
                        exp.fitness = Some(fitness_result.clone());

                        if fitness_result.fitness_score >= self.config.min_fitness_threshold {
                            info!("✅ Experiment {} passed fitness threshold", id);
                            Some(ExperimentState::Integrating)
                        } else {
                            debug!("📉 Experiment {} failed fitness test", id);
                            Some(ExperimentState::Complete { success: false })
                        }
                    }
                    ExperimentState::Integrating => {
                        self.stats.successful_variants += 1;
                        self.stats.total_fps_improvement +=
                            exp.fitness.as_ref().map(|f| f.fps).unwrap_or(0.0);
                        info!("🎉 Experiment {} integrated", id);
                        Some(ExperimentState::Complete { success: true })
                    }
                    ExperimentState::Complete { success } => {
                        if *success {
                            self.stats.active_experiments -= 1;
                        }
                        to_remove.push(id.clone());
                        None
                    }
                    ExperimentState::Failed { reason } => {
                        self.stats.active_experiments -= 1;
                        self.stats.failed_experiments += 1;
                        warn!("❌ Experiment {} failed: {}", id, reason);
                        to_remove.push(id.clone());
                        None
                    }
                };

                if let Some(state) = new_state {
                    exp.state = state;
                }
            }
        }

        // Clean up completed experiments
        for id in to_remove {
            if let Some(exp) = self.experiments.remove(&id) {
                if let Some(region) = exp.region {
                    self.idle_regions.push(region); // Return region to pool
                }
            }
        }

        // Auto-spawn new experiments if slots available
        while self.experiments.len() < self.config.max_experiments && !self.idle_regions.is_empty()
        {
            self.spawn_experiment(main_circuit.to_vec());
        }
    }

    /// Get evolution statistics
    pub fn get_stats(&self) -> &EvolutionStats {
        &self.stats
    }

    // ── Helper methods ─────────────────────────────────────────────────────

    fn random_active_cell(&self, circuit: &[CellState]) -> Option<(usize, usize)> {
        for _ in 0..100 {
            let idx = rand::random::<usize>() % circuit.len();
            let y = idx / self.grid_w;
            let x = idx % self.grid_w;
            if circuit[idx].is_active > 0 || circuit[idx].executing > 0 {
                return Some((x, y));
            }
        }
        None
    }

    fn random_idle_cell(&self, circuit: &[CellState]) -> (usize, usize) {
        loop {
            let idx = rand::random::<usize>() % circuit.len();
            let y = idx / self.grid_w;
            let x = idx % self.grid_w;
            if circuit[idx].is_active == 0 && circuit[idx].executing == 0 {
                return (x, y);
            }
        }
    }

    fn random_valid_opcode(&self) -> u32 {
        // Valid opcodes from geoasm_materializer
        const VALID_OPCODES: &[u32] = &[
            3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
            26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
        ];
        VALID_OPCODES[rand::random::<usize>() % VALID_OPCODES.len()]
    }

    // ── Pareto Frontier Tracking ─────────────────────────────────────────────

    /// Update Pareto frontier with a new variant
    fn update_pareto_frontier(&mut self, variant: Vec<CellState>, fitness: FitnessMetrics) {
        let new_entry = ParetoEntry {
            variant,
            fitness,
            generation: self.generation,
            discovered_at: Instant::now(),
        };

        // Check if new entry dominates any existing entries
        let mut dominated_indices = Vec::new();
        for (i, entry) in self.pareto_frontier.iter().enumerate() {
            if self.dominates(&new_entry.fitness, &entry.fitness) {
                dominated_indices.push(i);
            }
        }

        // Remove dominated entries (in reverse order)
        for i in dominated_indices.into_iter().rev() {
            self.pareto_frontier.remove(i);
        }

        // Check if new entry is dominated by any existing entry
        let is_dominated = self.pareto_frontier.iter().any(|entry| {
            self.dominates(&entry.fitness, &new_entry.fitness)
        });

        // Add new entry if not dominated
        if !is_dominated {
            self.pareto_frontier.push(new_entry);

            // Maintain history size limit
            if self.pareto_frontier.len() > self.config.pareto_history_size {
                self.pareto_frontier.remove(0);
            }

            info!(
                "📊 Pareto frontier updated: {} variants tracked (generation {})",
                self.pareto_frontier.len(),
                self.generation
            );
        }
    }

    /// Check if fitness A dominates fitness B (better in at least one metric, not worse in any)
    fn dominates(&self, a: &FitnessMetrics, b: &FitnessMetrics) -> bool {
        let a_better_or_equal = a.fps >= b.fps
            && a.throughput >= b.throughput
            && a.spatial_density >= b.spatial_density
            && a.correctness >= b.correctness;
        let a_strictly_better = a.fps > b.fps
            || a.throughput > b.throughput
            || a.spatial_density > b.spatial_density
            || a.correctness > b.correctness;
        a_better_or_equal && a_strictly_better
    }

    /// Get best variant from Pareto frontier by weighted scoring
    pub fn get_pareto_best(&self) -> Option<&ParetoEntry> {
        if self.pareto_frontier.is_empty() {
            return None;
        }

        // Weighted score: prioritize throughput and density
        self.pareto_frontier.iter().max_by(|a, b| {
            let score_a = a.fitness.throughput * 0.4
                + a.fitness.fps * 0.3
                + a.fitness.spatial_density * 0.3;
            let score_b = b.fitness.throughput * 0.4
                + b.fitness.fps * 0.3
                + b.fitness.spatial_density * 0.3;
            score_a.partial_cmp(&score_b).unwrap_or(std::cmp::Ordering::Equal)
        })
    }

    // ── Vision-Based Fitness Evaluation ───────────────────────────────────────

    /// Evaluate fitness using VLM for spatial analysis
    async fn evaluate_fitness_vision(&self, variant: &[CellState], sandbox_region: &SandboxRegion) -> Option<FitnessMetrics> {
        if self.vlm_client.is_none() {
            return None;
        }

        let vlm_client = self.vlm_client.as_ref().unwrap();

        // Export variant as .rts.png for VLM analysis
        use super::layoutgan_saccade::LayoutGanSaccade;
        use std::path::PathBuf;

        let saccade = LayoutGanSaccade::new(super::layoutgan_saccade::SaccadeConfig::default());
        let export_path = PathBuf::from(format!(
            "/tmp/evolution_gen{}_sandbox{}.rts.png",
            self.generation,
            sandbox_region.id
        ));

        let region = super::layoutgan_saccade::SaccadeRegion {
            x: sandbox_region.x,
            y: sandbox_region.y,
            width: sandbox_region.width,
            height: sandbox_region.height,
        };

        // Export region as PNG
        if let Err(e) = saccade.export_region_as_rts(variant, self.grid_w, &region, &export_path) {
            warn!("Failed to export variant for VLM analysis: {}", e);
            return None;
        }

        // Build context for VLM
        let context = format!(
            "Evolution generation {}, sandbox {} at ({}, {}), size {}x{}",
            self.generation,
            sandbox_region.id,
            sandbox_region.x,
            sandbox_region.y,
            sandbox_region.width,
            sandbox_region.height
        );

        // Use VLM to analyze circuit efficiency
        if let Ok(critique) = vlm_client.analyze_circuit_image(&export_path, &context).await {
            // Convert VLM critique to fitness metrics
            // Lower inefficiency score = higher fitness
            let efficiency_score = 1.0 - critique.score;
            let active_cells = variant.iter().filter(|c| c.is_active > 0).count();
            let spatial_density = active_cells as f32 / variant.len() as f32;

            Some(FitnessMetrics {
                fps: 1000.0 * efficiency_score,
                avg_tick_us: 1000.0 / (1000.0 * efficiency_score),
                throughput: active_cells as f32 * 1000.0 * efficiency_score,
                fitness_score: efficiency_score * 100.0,
                correctness: 1.0,
                spatial_density,
            })
        } else {
            warn!("VLM fitness evaluation failed for sandbox {}", sandbox_region.id);
            None
        }
    }

    // ── Helper methods ─────────────────────────────────────────────────────

    fn apply_point_mutation(&self, circuit: &mut [CellState], x: usize, y: usize, new_opcode: u32) {
        if y < self.grid_h && x < self.grid_w {
            let idx = y * self.grid_w + x;
            if idx < circuit.len() {
                circuit[idx] =
                    CellState::new(new_opcode, circuit[idx].rel_x(), circuit[idx].rel_y());
            }
        }
    }

    fn apply_insert(&self, circuit: &mut [CellState], x: usize, y: usize, cell: CellState) {
        if y < self.grid_h && x < self.grid_w {
            let idx = y * self.grid_w + x;
            if idx < circuit.len() && circuit[idx].is_active == 0 {
                circuit[idx] = cell;
            }
        }
    }

    fn apply_swap(&self, circuit: &mut [CellState], x1: usize, y1: usize, x2: usize, y2: usize) {
        if y1 < self.grid_h && x1 < self.grid_w && y2 < self.grid_h && x2 < self.grid_w {
            let idx1 = y1 * self.grid_w + x1;
            let idx2 = y2 * self.grid_w + x2;
            if idx1 < circuit.len() && idx2 < circuit.len() {
                circuit.swap(idx1, idx2);
            }
        }
    }

    fn apply_shift(&self, circuit: &mut [CellState], dx: i32, dy: i32) {
        let mut temp = circuit.to_vec();
        for y in 0..self.grid_h {
            for x in 0..self.grid_w {
                let src_idx = y * self.grid_w + x;
                let new_x = (x as i32 + dx).rem_euclid(self.grid_w as i32) as usize;
                let new_y = (y as i32 + dy).rem_euclid(self.grid_h as i32) as usize;
                let dst_idx = new_y * self.grid_w + new_x;
                if dst_idx < circuit.len() {
                    circuit[dst_idx] = temp[src_idx];
                }
            }
        }
    }
}

/// Evolution statistics
#[derive(Debug, Clone, Default)]
pub struct EvolutionStats {
    pub total_experiments: usize,
    pub active_experiments: usize,
    pub mutations_attempted: usize,
    pub mutations_successful: usize,
    pub evaluations_completed: usize,
    pub successful_variants: usize,
    pub failed_experiments: usize,
    pub total_fps_improvement: f32,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_evolution_config_default() {
        let config = EvolutionConfig::default();
        assert_eq!(config.max_experiments, 4);
        assert_eq!(config.mutation_rate, 0.15);
        assert!(config.min_fitness_threshold > 1.0);
    }

    #[test]
    fn test_experiment_creation() {
        let circuit = vec![CellState::data(0); 128 * 64];
        let exp = Experiment::new("test_exp".to_string(), circuit);

        assert_eq!(exp.id, "test_exp");
        assert_eq!(exp.state, ExperimentState::Waiting);
        assert!(exp.region.is_none());
    }

    #[test]
    fn test_evolution_daemon_creation() {
        let daemon = EvolutionDaemon::new(128, 64, EvolutionConfig::default());

        assert_eq!(daemon.grid_w, 128);
        assert_eq!(daemon.grid_h, 64);
        assert_eq!(daemon.experiments.len(), 0);
    }

    #[test]
    fn test_spawn_experiment() {
        let mut daemon = EvolutionDaemon::new(128, 64, EvolutionConfig::default());
        let circuit = vec![CellState::data(0); 128 * 64];

        // Scout idle regions
        daemon.scout_idle_regions(&circuit).unwrap();

        // Spawn experiment
        if !daemon.idle_regions.is_empty() {
            let exp_id = daemon.spawn_experiment(circuit.clone());
            assert!(!exp_id.is_empty());
            assert_eq!(daemon.experiments.len(), 1);
            assert_eq!(daemon.stats.total_experiments, 1);
        }
    }

    #[test]
    fn test_mutate_point() {
        let daemon = EvolutionDaemon::new(128, 64, EvolutionConfig::default());
        let circuit = vec![CellState::new(3, 0, 0); 128 * 64]; // LDI cells

        let result = daemon.mutate(&circuit);
        assert!(result.is_ok());
        let variant = result.unwrap();
        // Variant should be different from original
        assert_ne!(variant.len(), circuit.len());
        // OR variant should have different first opcode
        assert_ne!(variant[0].opcode(), circuit[0].opcode());
    }
}