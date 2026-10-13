//! Generative Evolution Demo with Visualization - Phase 21.2
//!
//! Demonstrates the complete generative evolution pipeline with real-time
//! browser-based visualization:
//! 1. TournamentManager partitions grid into 256 sandboxes
//! 2. CircuitMutator applies topology-aware mutations
//! 3. CircuitExecutor measures real performance
//! 4. EvolutionStreamServer streams to PixiJS frontend
//! 5. Multi-generational evolution toward optimal circuits
//! 6. Memory Palace persistence for Pareto frontier survivors
//! 7. Neural pattern injection via Ollama on fitness stagnation

use std::path::{Path, PathBuf};
use std::sync::Arc;
use std::time::{Instant, SystemTime, UNIX_EPOCH};
use log::info;

use infinite_map_rs::geoasm_materializer::{CellState, TYPE_ADD_RR, TYPE_JMP, TYPE_JZ, TYPE_LDI};

use infinite_map_rs::spatial::{
    circuit_executor::{CircuitExecutor, ExecutionConfig},
    evolution_daemon::{CircuitMutator, FitnessMetrics},
    tournament_manager::{TournamentConfig, TournamentManager},
    evolution_stream::{EvolutionStreamServer, StreamConfig, GenerationUpdate},
    memory_palace_circuit::{CircuitEncoder, CircuitMetadata},
    neural_prompter::{NeuralPrompter, NeuralPrompt, NeuralConstraints},
    pattern_materializer::PatternMaterializer,
};

/// Check if a circuit dominates another (Pareto optimization)
/// Returns true if a is better or equal in all metrics and strictly better in at least one
fn dominates(a: &FitnessMetrics, b: &FitnessMetrics) -> bool {
    // Higher fitness, FPS, throughput, spatial_density, and correctness are better
    // Lower avg_tick_us is better
    let at_least_one_strictly_better =
        a.fitness_score > b.fitness_score ||
        a.fps > b.fps ||
        a.throughput > b.throughput ||
        a.spatial_density > b.spatial_density ||
        a.correctness > b.correctness ||
        a.avg_tick_us < b.avg_tick_us;
    
    let all_better_or_equal =
        a.fitness_score >= b.fitness_score &&
        a.fps >= b.fps &&
        a.throughput >= b.throughput &&
        a.spatial_density >= b.spatial_density &&
        a.correctness >= b.correctness &&
        a.avg_tick_us <= b.avg_tick_us;
    
    at_least_one_strictly_better && all_better_or_equal
}

/// Update Pareto frontier and save apex survivors to Memory Palace
fn update_and_save_pareto_frontier(
    frontier: &mut Vec<(Vec<CellState>, FitnessMetrics, usize)>,
    new_circuit: Vec<CellState>,
    new_metrics: FitnessMetrics,
    generation: usize,
    palace_dir: &Path,
) -> usize {
    let mut is_dominated = false;
    let mut dominated_indices = Vec::new();
    
    // Check if new circuit dominates any existing ones
    for (idx, (_, existing_metrics, _)) in frontier.iter().enumerate() {
        if dominates(existing_metrics, &new_metrics) {
            is_dominated = true;
            break;
        }
        if dominates(&new_metrics, existing_metrics) {
            dominated_indices.push(idx);
        }
    }
    
    if is_dominated {
        return 0; // New circuit is dominated, skip
    }
    
    // Remove dominated circuits
    for idx in dominated_indices.into_iter().rev() {
        frontier.remove(idx);
    }
    
    // Add new circuit to frontier
    let variant_id = frontier.len();
    frontier.push((new_circuit.clone(), new_metrics.clone(), generation));
    
    // Save to Memory Palace
    let timestamp = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap()
        .as_secs();
    
    let metadata = CircuitMetadata {
        variant_id,
        fitness: new_metrics.fitness_score,
        generation,
        timestamp,
        width: 32,
        height: 32,
    };
    
    let png_path = palace_dir.join(format!("circuit_g{}_v{}.rts.png", generation, variant_id));
    
    match CircuitEncoder::encode_to_palace(&new_circuit, &metadata, &png_path) {
        Ok(()) => {
            info!(
                "🏛️  Saved Pareto apex (gen {} variant {}): fitness={:.2} to {}",
                generation, variant_id, new_metrics.fitness_score, png_path.display()
            );
            1
        },
        Err(e) => {
            log::error!("Failed to save circuit to palace: {:?}", e);
            0
        }
    }
}

/// Populate sandbox with diverse circuit patterns
fn populate_sandbox(circuit: &mut [CellState], pattern_type: usize, size: usize) {
    match pattern_type {
        0 => {
            // Pattern 0: Linear instruction chain
            for i in 0..(size * size).min(10) {
                circuit[i] = CellState::new(TYPE_LDI, 0, (i % 4) as i32);
            }
        },
        1 => {
            // Pattern 1: Grid of LDI instructions
            for y in 0..size / 4 {
                for x in 0..size / 4 {
                    let idx = (y * size) + x;
                    if idx < circuit.len() {
                        circuit[idx] = CellState::new(TYPE_ADD_RR, 0, 1);
                    }
                }
            }
        },
        2 => {
            // Pattern 2: Scattered JZ instructions
            for i in 0..20 {
                let idx = (i * 13) % circuit.len();
                circuit[idx] = CellState::new(TYPE_JZ, 0, 1);
            }
        },
        _ => {
            // Pattern 3: Mixed instructions
            for i in 0..(size * size).min(15) {
                let op = match i % 3 {
                    0 => TYPE_LDI,
                    1 => TYPE_ADD_RR,
                    _ => TYPE_JMP,
                };
                circuit[i] = CellState::new(op, 0, (i % 4) as i32);
            }
        }
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Initialize logger
    env_logger::Builder::from_default_env()
        .filter_level(log::LevelFilter::Info)
        .init();

    info!("🧬 Generative Evolution Demo - Phase 21.0 Integration");
    info!("=========================================================");
    info!("Real-time circuit visualization via PixiJS frontend");
    info!("");

    // Initialize WebSocket stream server
    let stream_config = StreamConfig {
        host: "127.0.0.1".to_string(),
        port: 8765,
    };
    let stream_server = Arc::new(EvolutionStreamServer::new(stream_config.clone()));

    info!("✅ EvolutionStreamServer initialized");
    info!("   WebSocket: ws://{}:{}", stream_config.host, stream_config.port);
    info!("   Visualizer: systems/infinite_map_rs/web/evolution_visualizer.html");
    info!("");

    // Spawn WebSocket server task
    let stream_server_task = stream_server.clone();
    tokio::spawn(async move {
        if let Err(e) = stream_server_task.run().await {
            log::error!("Stream server error: {}", e);
        }
    });

    // Give the server time to start
    tokio::time::sleep(tokio::time::Duration::from_millis(500)).await;

    // Step 1: Initialize TournamentManager for multi-region grid
    let tournament_config = TournamentConfig {
        grid_width: 512,
        grid_height: 512,
        sandbox_size: 32,
    };

    let mut tournament_manager = TournamentManager::new(tournament_config.clone());
    let _tournament_grid = tournament_manager.initialize_grid();

    info!("✅ TournamentManager initialized:");
    info!("   Grid: {}x{} ({} cells)", 512, 512, 512 * 512);
    info!("   Sandbox size: {}x{} ({} cells)", 32, 32, 32 * 32);
    info!("   Total sandboxes: {}", tournament_manager.sandboxes.len());
    info!("");

    // Step 2: Populate sandboxes with initial circuits
    let mut generation = 0;
    let mut sandbox_variants: Vec<Vec<CellState>> = Vec::new();

    // Initialize 256 sandboxes with varied circuit patterns
    for sandbox_id in 0..256 {
        if let Some(sandbox) = tournament_manager.allocate_sandbox() {
            let mut circuit = vec![CellState::data(0); 32 * 32];

            // Generate diverse initial patterns
            let pattern_type = sandbox_id % 4;
            populate_sandbox(&mut circuit, pattern_type, 32);

            sandbox_variants.push(circuit);
            sandbox.current_fitness = Some(0.5);
        }
    }

    info!("✅ Populated {} sandboxes with initial circuit variants", sandbox_variants.len());
    info!("");

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
    info!("");

    // Step 3.6: Initialize NeuralPrompter for stagnation recovery.
    // The prompter uses reqwest's blocking client, which panics if created
    // or dropped directly on an async runtime thread.
    let neural_prompter = tokio::task::block_in_place(NeuralPrompter::new)
        .map_err(|e| format!("Failed to initialize NeuralPrompter: {}", e))?;
    let pattern_materializer = PatternMaterializer::new(32, 32);

    info!("✅ NeuralPrompter initialized for Ollama integration");
    info!("");

    // Step 3.7: Initialize Memory Palace for Pareto apex persistence
    let palace_dir = PathBuf::from("evolution_palace");
    std::fs::create_dir_all(&palace_dir).expect("Failed to create evolution palace directory");
    info!("🏛️  Memory Palace initialized: {}", palace_dir.display());

    let mut pareto_frontier: Vec<(Vec<CellState>, FitnessMetrics, usize)> = Vec::new();
    let mut total_saved: usize = 0;
    let mut fitness_history: Vec<f32> = Vec::new();
    info!("");

    // Step 4: Run generative evolution for several generations
    // Override with MAX_GENERATIONS=n for short verification runs
    let max_generations: usize = std::env::var("MAX_GENERATIONS")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(10);
    let mut fitness_scores: Vec<(usize, FitnessMetrics)> = Vec::new();

    for gen in 0..max_generations {
        generation = gen;
        info!("");
        info!("🔄 Generation {} / {}", gen + 1, max_generations);
        info!("----------------------------------------");

        let gen_start = Instant::now();

        // Step 4.1: Evaluate fitness of all variants
        // (reuses the outer vec so final statistics see the last generation)
        fitness_scores.clear();

        info!("📊 Evaluating fitness for {} variants...", sandbox_variants.len());

        for (sandbox_id, circuit) in sandbox_variants.iter().enumerate() {
            // Execute circuit and measure metrics
            let execution_result = executor.execute_and_measure(circuit);

            let metrics = FitnessMetrics {
                fps: execution_result.fps,
                avg_tick_us: execution_result.avg_tick_us,
                throughput: execution_result.throughput,
                spatial_density: execution_result.spatial_density,
                correctness: execution_result.correctness,
                fitness_score: execution_result.fitness_score,
            };

            // Keep TournamentManager fitness records in sync so
            // get_worst_sandboxes() reflects this generation's results
            if let Some(sandbox) = tournament_manager.sandboxes.get_mut(sandbox_id) {
                sandbox.current_fitness = Some(metrics.fitness_score);
            }

            fitness_scores.push((sandbox_id, metrics));

            // Broadcast circuit snapshot to frontend
            let snapshot = stream_server.cells_to_snapshot(sandbox_id, circuit, gen);
            let _ = stream_server.broadcast_circuit(snapshot);
        }

        // Step 4.2: Find best circuit
        let (best_sandbox_id, best_metrics) = fitness_scores
            .iter()
            .max_by(|a, b| a.1.fitness_score.partial_cmp(&b.1.fitness_score).unwrap())
            .unwrap();

        info!("🏆 Best Circuit: Sandbox {} with fitness {:.2}", best_sandbox_id, best_metrics.fitness_score);
        info!("   FPS: {:.1}, Throughput: {:.1}, Density: {:.3}", best_metrics.fps, best_metrics.throughput, best_metrics.spatial_density);

        // Step 4.3: Update Pareto frontier and save apex survivors to Memory Palace
        for (sandbox_id, circuit) in sandbox_variants.iter().enumerate() {
            if let Some((_, metrics)) = fitness_scores.get(sandbox_id) {
                let saved = update_and_save_pareto_frontier(
                    &mut pareto_frontier,
                    circuit.clone(),
                    metrics.clone(),
                    gen,
                    &palace_dir,
                );
                total_saved += saved;
            }
        }

        // Step 4.4: Track fitness history and inject neural seeds on stagnation
        fitness_history.push(best_metrics.fitness_score);

        if gen > 5 && TournamentManager::detect_stagnation(&fitness_history, 0.05, 3) {
            info!("🔁 Fitness plateau detected (3 generations with <5% improvement)");
            info!("   Best fitness: {:.2}, History: {:?}", best_metrics.fitness_score, fitness_history);

            // Get worst-performing sandboxes to replace (never the best one)
            let worst_sandbox_count = 16.min(sandbox_variants.len());
            let worst_sandboxes: Vec<_> = tournament_manager
                .get_worst_sandboxes(worst_sandbox_count + 1)
                .into_iter()
                .filter(|&id| id != *best_sandbox_id && id < sandbox_variants.len())
                .take(worst_sandbox_count)
                .collect();

            info!("   Replacing {} worst-performing sandboxes with neural seeds...", worst_sandboxes.len());

            // Query Ollama for neural patterns
            let neural_prompt = NeuralPrompt {
                goal: format!(
                    "Design circuits with high parallelization potential (current best fitness: {:.2})",
                    best_metrics.fitness_score
                ),
                width: 32,
                height: 32,
                constraints: Some(NeuralConstraints {
                    low_latency: true,
                    high_throughput: true,
                    high_density: false,
                }),
            };

            info!("   Querying Ollama for {} neural patterns...", worst_sandboxes.len());

            let generation_result = tokio::task::block_in_place(|| {
                neural_prompter.generate_patterns(&neural_prompt, worst_sandboxes.len())
            });
            match generation_result {
                Ok(patterns) => {
                    info!("   ✅ Generated {} neural patterns", patterns.len());

                    // Materialize patterns to circuits
                    let mut neural_circuits = Vec::new();
                    for (idx, pattern) in patterns.iter().enumerate() {
                        match pattern_materializer.materialize_to_grid(&pattern.cells) {
                            Ok(circuit) => {
                                neural_circuits.push(circuit);
                                info!("     Pattern {}: {} cells, rationale: {}", idx, pattern.cells.len(),
                                    pattern.rationale.lines().next().unwrap_or("(no rationale)"));
                            }
                            Err(e) => {
                                log::error!("   Failed to materialize pattern {}: {:?}", idx, e);
                            }
                        }
                    }

                    // Inject neural circuits into worst sandboxes.
                    // Some patterns may have failed generation/materialization,
                    // so only target as many sandboxes as we have circuits.
                    if !neural_circuits.is_empty() {
                        let target_count = neural_circuits.len().min(worst_sandboxes.len());
                        let target_sandboxes = &worst_sandboxes[..target_count];
                        let injected = tournament_manager.inject_neural_seeds(
                            target_sandboxes,
                            &neural_circuits[..target_count],
                        );
                        info!("   🧠 Injected {} neural circuits into worst sandboxes", injected);

                        // Update sandbox_variants with neural circuits
                        for (idx, sandbox_id) in target_sandboxes.iter().enumerate() {
                            if *sandbox_id < sandbox_variants.len() {
                                info!("     Replaced sandbox {} with neural pattern {}", sandbox_id, idx);
                                sandbox_variants[*sandbox_id] = neural_circuits[idx].clone();
                            }
                        }
                    }
                }
                Err(e) => {
                    log::error!("   Failed to generate neural patterns: {:?}. Continuing with mutations.", e);
                }
            }
        }

        // Step 4.5: Broadcast generation update
        let gen_duration = gen_start.elapsed();
        let gen_update = GenerationUpdate {
            generation: gen,
            variant_count: sandbox_variants.len(),
            best_fitness: best_metrics.fitness_score,
            best_sandbox_id: *best_sandbox_id,
            duration_ms: gen_duration.as_millis() as u64,
            pareto_frontier_size: pareto_frontier.len(),
        };
        let _ = stream_server.broadcast_generation(gen_update);

        info!("⏱️  Generation {} completed in {:.2}ms | Pareto apex: {} | Total saved: {}",
            gen + 1,
            gen_duration.as_millis(),
            pareto_frontier.len(),
            total_saved
        );

        // Step 4.5: Evolve next generation (unless last)
        if gen < max_generations - 1 {
            info!("🧬 Evolving next generation...");

            let mut next_generation_variants = Vec::new();

            for (sandbox_id, circuit) in sandbox_variants.iter().enumerate() {
                let mut mutated = circuit.clone();

                // Apply mutations
                mutator.mutate_circuit(&mut mutated, 0.1);

                next_generation_variants.push(mutated);
            }

            sandbox_variants = next_generation_variants;
        }
    }

    info!("");
    info!("📈 Final Statistics");
    info!("================================");

    let (best_sandbox_id, best_metrics) = fitness_scores
        .iter()
        .max_by(|a, b| a.1.fitness_score.partial_cmp(&b.1.fitness_score).unwrap())
        .unwrap();

    info!("🏆 Best Circuit:");
    info!("   Sandbox ID: {}", best_sandbox_id);
    info!("   Fitness Score: {:.2}", best_metrics.fitness_score);
    info!("   FPS: {:.1}", best_metrics.fps);
    info!("   Throughput: {:.1}", best_metrics.throughput);
    info!("   Spatial Density: {:.3}", best_metrics.spatial_density);

    info!("");
    info!("✅ Evolution Complete!");
    info!("   Open visualizer: systems/infinite_map_rs/web/evolution_visualizer.html");
    info!("   WebSocket: ws://{}:{}", stream_config.host, stream_config.port);
    info!("");

    // Keep server running
    info!("Press Ctrl+C to stop the stream server...");
    tokio::signal::ctrl_c().await?;

    info!("👋 Shutting down...");

    Ok(())
}