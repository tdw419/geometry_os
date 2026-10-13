//! Generative Evolution Demo - Phase 20.4 Integration
//!
//! Demonstrates the complete generative evolution pipeline:
//! 1. TournamentManager partitions grid into 256 sandboxes
//! 2. CircuitMutator applies topology-aware mutations
//! 3. Pareto frontier tracking prevents devolution
//! 4. Vision-based fitness evaluation (optional, with VLM)
//! 5. Multi-generational evolution toward optimal circuits

use std::time::Instant;
use log::{info, warn};

use infinite_map_rs::geoasm_materializer::{CellState, TYPE_ADD_RR, TYPE_JMP, TYPE_LDI, TYPE_NOP};

use infinite_map_rs::spatial::{
    circuit_executor::{CircuitExecutor, ExecutionConfig},
    evolution_daemon::{
        CircuitMutator, EvolutionConfig, EvolutionDaemon, FitnessMetrics, ParetoEntry,
    },
    tournament_manager::{TournamentConfig, TournamentManager},
    vision_studio_bridge::{VisionStudioClient, VisionStudioConfig},
};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Initialize logger
    env_logger::Builder::from_default_env()
        .filter_level(log::LevelFilter::Info)
        .init();

    info!("🧬 Generative Evolution Demo - Phase 20.4 Integration");
    info!("=========================================================");

    // Step 1: Initialize TournamentManager for multi-region grid
    let tournament_config = TournamentConfig {
        grid_width: 512,
        grid_height: 512,
        sandbox_size: 32,
    };

    let mut tournament_manager = TournamentManager::new(tournament_config.clone());
    let tournament_grid = tournament_manager.initialize_grid();

    info!("✅ TournamentManager initialized:");
    info!("   Grid: {}x{} ({} cells)", 512, 512, 512 * 512);
    info!("   Sandbox size: {}x{} ({} cells)", 32, 32, 32 * 32);
    info!("   Total sandboxes: {}", tournament_manager.sandboxes.len());

    // Step 2: Populate sandboxes with initial circuits
    let mut generation = 0;
    let mut pareto_frontier: Vec<ParetoEntry> = Vec::new();

    // Use a simple 32x32 region for initial population
    let mut sandbox_variants: Vec<Vec<CellState>> = Vec::new();

    // Initialize 256 sandboxes with varied circuit patterns
    for sandbox_id in 0..256 {
        if let Some(sandbox) = tournament_manager.allocate_sandbox() {
            let mut circuit = vec![CellState::data(0); 32 * 32];

            // Generate diverse initial patterns
            let pattern_type = sandbox_id % 4;
            populate_sandbox(&mut circuit, pattern_type, 32);

            sandbox_variants.push(circuit);
            sandbox.current_fitness = Some(0.5); // Initial placeholder fitness
        }
    }

    info!(
        "✅ Populated {} sandboxes with initial circuit variants",
        sandbox_variants.len()
    );

    // Step 3: Initialize CircuitMutator for topology-aware mutations
    let mutator = CircuitMutator::new(32, 32);

    // Step 3.5: Initialize CircuitExecutor for real fitness evaluation
    let exec_config = ExecutionConfig {
        measurement_ticks: 50,
        warmup_ticks: 5,
        timeout_secs: 3,
        verify_correctness: true,
    };
    let mut executor = CircuitExecutor::new(exec_config);

    info!("✅ CircuitExecutor initialized for real fitness evaluation");

    // Step 4: Run generative evolution for several generations
    const MAX_GENERATIONS: usize = 5;

    for gen in 0..MAX_GENERATIONS {
        generation = gen;
        info!("\n🔄 Generation {} / {}", gen + 1, MAX_GENERATIONS);
        info!("----------------------------------------");

        let gen_start = Instant::now();

        // Step 4.1: Evaluate fitness of all variants
        let mut fitness_scores: Vec<(usize, FitnessMetrics)> = Vec::new();

        for (sandbox_id, circuit) in sandbox_variants.iter().enumerate() {
            let fitness = evaluate_circuit_fitness(circuit, gen, &mut executor);
            fitness_scores.push((sandbox_id, fitness.clone()));

            // Update sandbox fitness
            if let Some(sandbox) = tournament_manager.sandboxes.get_mut(sandbox_id) {
                sandbox.current_fitness = Some(fitness.fitness_score);
            }
        }

        info!("✅ Evaluated fitness for {} variants", fitness_scores.len());

        // Step 4.2: Identify apex survivor (best fitness)
        let best_idx = fitness_scores
            .iter()
            .max_by(|a, b| a.1.fitness_score.partial_cmp(&b.1.fitness_score).unwrap())
            .map(|(idx, _)| *idx)
            .expect("No variants found");

        let best_fitness = fitness_scores[best_idx].1.clone();
        let best_variant = sandbox_variants[best_idx].clone();

        info!(
            "🏆 Apex Survivor: Sandbox {} with fitness {:.2}",
            best_idx, best_fitness.fitness_score
        );
        info!(
            "   FPS: {:.1}, Throughput: {:.1}, Density: {:.3}",
            best_fitness.fps, best_fitness.throughput, best_fitness.spatial_density
        );

        // Step 4.3: Update Pareto frontier
        update_pareto_frontier(
            &mut pareto_frontier,
            best_variant.clone(),
            best_fitness.clone(),
            gen,
        );

        info!("📊 Pareto frontier size: {}", pareto_frontier.len());

        // Step 4.4: Generate next generation using apex survivor
        sandbox_variants.clear();

        for sandbox_id in 0..256 {
            let mut variant = best_variant.clone();

            // Apply topology-aware mutations
            let mutation_rate = 0.15 * (1.0 - (gen as f32 / MAX_GENERATIONS as f32)); // Decrease over time
            mutator.mutate_circuit(&mut variant, mutation_rate);

            sandbox_variants.push(variant);
        }

        let gen_duration = gen_start.elapsed();
        info!("⏱️  Generation {} completed in {:?}", gen + 1, gen_duration);
    }

    // Step 5: Report final statistics
    info!("\n📈 Final Statistics");
    info!("====================");

    // Get best from Pareto frontier
    if let Some(best_entry) = pareto_frontier.iter().max_by(|a, b| {
        let score_a =
            a.fitness.throughput * 0.4 + a.fitness.fps * 0.3 + a.fitness.spatial_density * 0.3;
        let score_b =
            b.fitness.throughput * 0.4 + b.fitness.fps * 0.3 + b.fitness.spatial_density * 0.3;
        score_a
            .partial_cmp(&score_b)
            .unwrap_or(std::cmp::Ordering::Equal)
    }) {
        info!("🏆 Best Pareto-Optimal Circuit:");
        info!("   Discovered in generation {}", best_entry.generation);
        info!("   Fitness score: {:.2}", best_entry.fitness.fitness_score);
        info!(
            "   FPS: {:.1}, Throughput: {:.1}, Density: {:.3}",
            best_entry.fitness.fps,
            best_entry.fitness.throughput,
            best_entry.fitness.spatial_density
        );
        info!("   Correctness: {:.3}", best_entry.fitness.correctness);
    }

    info!("\n✅ Generative Evolution Demo Complete!");
    info!("🎯 Successfully demonstrated:");
    info!("   - TournamentManager multi-region grid (256 sandboxes)");
    info!("   - CircuitMutator topology-aware mutations");
    info!(
        "   - Pareto frontier tracking across {} generations",
        MAX_GENERATIONS
    );
    info!("   - Generative evolution toward optimal circuits");

    Ok(())
}

/// Populate a sandbox with a specific pattern type
fn populate_sandbox(circuit: &mut [CellState], pattern_type: usize, size: usize) {
    let center = size / 2;
    let radius = size / 3;

    for y in 0..size {
        for x in 0..size {
            let idx = y * size + x;
            let dx = x as i32 - center as i32;
            let dy = y as i32 - center as i32;
            let dist = ((dx * dx + dy * dy) as f32).sqrt();

            match pattern_type {
                0 => {
                    // Radial pattern
                    if dist < radius as f32 {
                        circuit[idx] = CellState::new(TYPE_LDI, dx as i32 % 8, dy as i32 % 8);
                        circuit[idx].is_active = 1;
                    }
                }
                1 => {
                    // Grid pattern
                    if x % 4 == 0 || y % 4 == 0 {
                        circuit[idx] = CellState::new(TYPE_JMP, x as i32 % 8, y as i32 % 8);
                        circuit[idx].is_active = 1;
                    }
                }
                2 => {
                    // Checkerboard pattern
                    if (x + y) % 2 == 0 {
                        circuit[idx] = CellState::new(TYPE_ADD_RR, x as i32 % 8, y as i32 % 8);
                        circuit[idx].is_active = 1;
                    }
                }
                3 => {
                    // Diagonal pattern
                    if x == y || x + y == size - 1 {
                        circuit[idx] = CellState::new(TYPE_LDI, x as i32 % 8, y as i32 % 8);
                        circuit[idx].is_active = 1;
                    }
                }
                _ => {}
            }
        }
    }
}

/// Evaluate circuit fitness using real execution
fn evaluate_circuit_fitness(
    circuit: &[CellState],
    generation: usize,
    executor: &mut CircuitExecutor,
) -> FitnessMetrics {
    // Execute circuit and get real metrics
    let exec_result = executor.execute_and_measure(circuit);

    if !exec_result.success {
        // If execution failed, return poor fitness
        warn!("⚠️ Circuit execution failed: {:?}", exec_result.error);
        return FitnessMetrics {
            fps: 0.0,
            avg_tick_us: 0.0,
            throughput: 0.0,
            fitness_score: 0.0,
            correctness: 0.0,
            spatial_density: exec_result.spatial_density,
        };
    }

    // Return real measured metrics
    FitnessMetrics {
        fps: exec_result.fps,
        avg_tick_us: exec_result.avg_tick_us,
        throughput: exec_result.throughput,
        fitness_score: exec_result.fitness_score,
        correctness: exec_result.correctness,
        spatial_density: exec_result.spatial_density,
    }
}

/// Update Pareto frontier with new variant
fn update_pareto_frontier(
    frontier: &mut Vec<ParetoEntry>,
    variant: Vec<CellState>,
    fitness: FitnessMetrics,
    generation: usize,
) {
    let new_entry = ParetoEntry {
        variant,
        fitness,
        generation,
        discovered_at: Instant::now(),
    };

    // Check if new entry dominates any existing entries
    let mut dominated_indices = Vec::new();
    for (i, entry) in frontier.iter().enumerate() {
        if dominates(&new_entry.fitness, &entry.fitness) {
            dominated_indices.push(i);
        }
    }

    // Remove dominated entries (in reverse order)
    for i in dominated_indices.into_iter().rev() {
        frontier.remove(i);
    }

    // Check if new entry is dominated by any existing entry
    let is_dominated = frontier
        .iter()
        .any(|entry| dominates(&entry.fitness, &new_entry.fitness));

    // Add new entry if not dominated
    if !is_dominated {
        frontier.push(new_entry);

        // Maintain history size limit
        if frontier.len() > 50 {
            frontier.remove(0);
        }
    }
}

/// Check if fitness A dominates fitness B
fn dominates(a: &FitnessMetrics, b: &FitnessMetrics) -> bool {
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