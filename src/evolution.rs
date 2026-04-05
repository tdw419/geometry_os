// Evolution Loop -- generate, execute, measure, select, repeat
//
// "Programs write programs. The better program survives."
//
// Phase 4 culmination. Closes the self-improvement loop by tying together:
//   - mutation.rs: generates variants
//   - governance.rs: gates execution (Seven Laws)
//   - fitness.rs: measures quality
//   - software_vm.rs: runs programs on CPU
//
// The loop runs for a configurable number of generations. Each generation:
//   1. Mutate every individual
//   2. Check governance
//   3. Execute governed offspring on the software VM
//   4. Measure fitness
//   5. Rank by composite fitness
//   6. Keep top K, discard rest
//   7. Refill population via crossover + mutation of survivors
//
// The loop MUST NOT crash or degrade. If all individuals fail governance,
// it reinitializes from the last known good population.

use crate::assembler::{self, Program};
use crate::fitness::{self, BenchmarkConfig, FitnessScore};
use crate::mutation::{self, MutationMethod};
use rand::prelude::*;

/// Configuration for the evolution loop.
#[derive(Debug, Clone)]
pub struct EvolutionConfig {
    /// Number of individuals in the population (default: 20).
    pub population_size: usize,
    /// Number of top performers to keep each generation (default: 5).
    pub elite_count: usize,
    /// Maximum generations to run (default: 1000).
    pub max_generations: u32,
    /// Bit-flip mutation rate (default: 0.05 = 5%).
    pub mutation_rate: f64,
    /// Maximum frames per fitness benchmark (default: 10).
    pub benchmark_frames: u32,
    /// Seed program to initialize the population from.
    pub seed: Program,
}

impl Default for EvolutionConfig {
    fn default() -> Self {
        Self {
            population_size: 20,
            elite_count: 5,
            max_generations: 1000,
            mutation_rate: 0.05,
            benchmark_frames: 10,
            seed: assembler::self_replicator(),
        }
    }
}

/// A single individual in the population.
#[derive(Debug, Clone)]
pub struct Individual {
    /// Unique identifier (monotonic counter).
    pub id: u64,
    /// The pixel program.
    pub pixels: Vec<u32>,
    /// Fitness score from the last benchmark.
    pub fitness: FitnessScore,
    /// Mutation method that produced this individual.
    pub method: MutationMethod,
    /// Parent's hash (0 for seed).
    pub parent_hash: u64,
    /// This individual's hash.
    pub hash: u64,
    /// Generation this individual belongs to.
    pub generation: u32,
    /// Whether governance approved this individual.
    pub governed: bool,
}

/// A row in the evolution CSV log.
#[derive(Debug, Clone)]
pub struct LogRow {
    pub generation: u32,
    pub individual_id: u64,
    pub parent_hash: u64,
    pub fitness_composite: f64,
    pub fitness_speed: f64,
    pub fitness_correctness: f64,
    pub fitness_memory: f64,
    pub fitness_locality: f64,
    pub governance_result: String,
    pub mutation_type: String,
}

/// Statistics for a single generation.
#[derive(Debug, Clone)]
pub struct GenerationStats {
    pub generation: u32,
    pub best_fitness: f64,
    pub avg_fitness: f64,
    pub worst_fitness: f64,
    pub diversity: f64,
    pub governance_violations: usize,
    pub population_size: usize,
}

/// Safely benchmark a program, catching panics from the software VM.
fn safe_benchmark(pixels: &[u32], max_frames: u32) -> FitnessScore {
    let prog = Program { pixels: pixels.to_vec() };
    let cfg = BenchmarkConfig::default().with_max_frames(max_frames);
    match std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
        fitness::benchmark(&prog, &cfg)
    })) {
        Ok(score) => score,
        Err(_) => FitnessScore {
            speed: 0.0,
            correctness: 0.0,
            memory: 0.0,
            locality: 0.0,
            composite: 0.0,
            cycles: 0,
            program_size: pixels.len(),
        },
    }
}

/// Zero fitness score for unrunnable programs.
fn zero_fitness(pixel_count: usize) -> FitnessScore {
    FitnessScore {
        speed: 0.0,
        correctness: 0.0,
        memory: 0.0,
        locality: 0.0,
        composite: 0.0,
        cycles: 0,
        program_size: pixel_count,
    }
}

/// The evolution loop state machine.
pub struct EvolutionLoop {
    config: EvolutionConfig,
    population: Vec<Individual>,
    log: Vec<LogRow>,
    stats: Vec<GenerationStats>,
    next_id: u64,
    generation: u32,
    /// Last population where at least one individual was governed.
    last_good_population: Vec<Individual>,
}

impl EvolutionLoop {
    /// Create a new evolution loop with the given configuration.
    pub fn new(config: EvolutionConfig) -> Self {
        let seed_hash = mutation::hash_program(&config.seed.pixels);
        let seed_fitness = fitness::benchmark(
            &config.seed,
            &BenchmarkConfig::default().with_max_frames(config.benchmark_frames),
        );

        let seed_individual = Individual {
            id: 0,
            pixels: config.seed.pixels.clone(),
            fitness: seed_fitness.clone(),
            method: MutationMethod::Seed,
            parent_hash: 0,
            hash: seed_hash,
            generation: 0,
            governed: true,
        };

        // Initialize population as copies of the seed
        let mut population = Vec::with_capacity(config.population_size);
        let mut next_id = 1u64;
        population.push(seed_individual.clone());
        for _ in 1..config.population_size {
            let copy = Individual {
                id: next_id,
                pixels: config.seed.pixels.clone(),
                fitness: seed_fitness.clone(),
                method: MutationMethod::Seed,
                parent_hash: 0,
                hash: seed_hash,
                generation: 0,
                governed: true,
            };
            population.push(copy);
            next_id += 1;
        }

        let last_good = population.clone();

        Self {
            config,
            population,
            log: Vec::new(),
            stats: Vec::new(),
            next_id,
            generation: 0,
            last_good_population: last_good,
        }
    }

    /// Run the evolution loop for max_generations.
    /// Returns the final population sorted by fitness (best first).
    pub fn run(&mut self) -> Vec<Individual> {
        for _ in 0..self.config.max_generations {
            self.step();
        }
        self.population.sort_by(|a, b| {
            b.fitness.composite.partial_cmp(&a.fitness.composite).unwrap()
        });
        self.population.clone()
    }

    /// Run a single generation step.
    pub fn step(&mut self) -> GenerationStats {
        let generation = self.generation;
        let mut rng = SmallRng::from_entropy();

        // ── Phase 1: Mutate each individual ──
        let mut offspring: Vec<Individual> = Vec::with_capacity(self.population.len());

        for parent in &self.population {
            let method = MutationMethod::BitFlip {
                rate: self.config.mutation_rate,
            };
            let mutant = mutation::evolve_one(&parent.pixels, generation + 1, method);

            let fitness = if mutant.governed {
                safe_benchmark(&mutant.pixels, self.config.benchmark_frames)
            } else {
                zero_fitness(mutant.pixels.len())
            };

            let gov_summary = if mutant.governed {
                "approved".to_string()
            } else {
                format!("rejected: {}", mutant.governance_result.reason)
            };

            let method_str = format!("{:?}", mutant.lineage.method);

            self.log.push(LogRow {
                generation: generation + 1,
                individual_id: self.next_id,
                parent_hash: mutant.lineage.parent_hash,
                fitness_composite: fitness.composite,
                fitness_speed: fitness.speed,
                fitness_correctness: fitness.correctness,
                fitness_memory: fitness.memory,
                fitness_locality: fitness.locality,
                governance_result: gov_summary,
                mutation_type: method_str,
            });

            let individual = Individual {
                id: self.next_id,
                pixels: mutant.pixels.clone(),
                fitness,
                method: mutant.lineage.method,
                parent_hash: mutant.lineage.parent_hash,
                hash: mutant.lineage.hash,
                generation: generation + 1,
                governed: mutant.governed,
            };
            self.next_id += 1;
            offspring.push(individual);
        }

        // ── Phase 2: Check if any offspring passed governance ──
        let any_governed = offspring.iter().any(|i| i.governed);

        if !any_governed {
            offspring = self.last_good_population.clone();
            for ind in &mut offspring {
                ind.generation = generation + 1;
            }
        }

        // ── Phase 3: Rank by composite fitness ──
        offspring.sort_by(|a, b| {
            b.fitness.composite.partial_cmp(&a.fitness.composite).unwrap()
        });

        // ── Phase 4: Keep top K (elite) ──
        // Include current population (parents) in the candidate pool so fitness
        // never degrades -- parents survive unless offspring beats them.
        let mut candidates: Vec<Individual> = offspring;
        candidates.extend(self.population.iter().cloned());
        candidates.sort_by(|a, b| {
            b.fitness.composite.partial_cmp(&a.fitness.composite).unwrap()
        });

        let elite_count = self.config.elite_count.min(candidates.len());
        let mut survivors: Vec<Individual> = candidates[..elite_count].to_vec();

        if survivors.iter().any(|i| i.governed) {
            self.last_good_population = survivors.clone();
        }

        // ── Phase 5: Refill population via crossover + mutation ──
        while survivors.len() < self.config.population_size {
            let parent_a_idx = rng.gen_range(0..elite_count);
            let parent_b_idx = rng.gen_range(0..elite_count);

            let child_pixels = mutation::crossover(
                &survivors[parent_a_idx].pixels,
                &survivors[parent_b_idx].pixels,
            );

            let mutated = mutation::mutate(&child_pixels, self.config.mutation_rate);
            let gov_result = crate::governance::check(&mutated);

            let fitness = if gov_result.approved {
                safe_benchmark(&mutated, self.config.benchmark_frames)
            } else {
                zero_fitness(mutated.len())
            };

            let gov_summary = if gov_result.approved {
                "approved".to_string()
            } else {
                format!("rejected: {}", gov_result.reason)
            };

            self.log.push(LogRow {
                generation: generation + 1,
                individual_id: self.next_id,
                parent_hash: mutation::hash_program(&child_pixels),
                fitness_composite: fitness.composite,
                fitness_speed: fitness.speed,
                fitness_correctness: fitness.correctness,
                fitness_memory: fitness.memory,
                fitness_locality: fitness.locality,
                governance_result: gov_summary,
                mutation_type: "Crossover+BitFlip".to_string(),
            });

            survivors.push(Individual {
                id: self.next_id,
                pixels: mutated,
                fitness,
                method: MutationMethod::Crossover { cut_point: 0 },
                parent_hash: mutation::hash_program(&survivors[parent_a_idx].pixels),
                hash: 0,
                generation: generation + 1,
                governed: gov_result.approved,
            });
            self.next_id += 1;
        }

        // ── Phase 6: Compute generation stats ──
        let composites: Vec<f64> = survivors.iter().map(|i| i.fitness.composite).collect();
        let best = composites.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
        let worst = composites.iter().cloned().fold(f64::INFINITY, f64::min);
        let avg = composites.iter().sum::<f64>() / composites.len() as f64;
        let violations = survivors.iter().filter(|i| !i.governed).count();

        let mut hashes: Vec<u64> = survivors.iter().map(|i| i.hash).collect();
        hashes.sort();
        hashes.dedup();
        let diversity = hashes.len() as f64 / survivors.len() as f64;

        let stat = GenerationStats {
            generation: generation + 1,
            best_fitness: best,
            avg_fitness: avg,
            worst_fitness: worst,
            diversity,
            governance_violations: violations,
            population_size: survivors.len(),
        };

        self.population = survivors;
        self.generation = generation + 1;
        self.stats.push(stat.clone());

        stat
    }

    /// Get the best individual seen so far.
    pub fn best(&self) -> &Individual {
        self.population
            .iter()
            .max_by(|a, b| {
                a.fitness.composite.partial_cmp(&b.fitness.composite).unwrap()
            })
            .unwrap()
    }

    /// Get all generation stats.
    pub fn stats(&self) -> &[GenerationStats] {
        &self.stats
    }

    /// Get the CSV log.
    pub fn log(&self) -> &[LogRow] {
        &self.log
    }

    /// Export the log as CSV string.
    pub fn csv(&self) -> String {
        let mut csv = String::from(
            "generation,individual_id,parent_id,fitness_composite,fitness_speed,\
             fitness_correctness,fitness_memory,fitness_locality,governance_result,mutation_type\n",
        );
        for row in &self.log {
            csv.push_str(&format!(
                "{},{},{},{:.6},{:.6},{:.6},{:.6},{:.6},{},{}\n",
                row.generation,
                row.individual_id,
                row.parent_hash,
                row.fitness_composite,
                row.fitness_speed,
                row.fitness_correctness,
                row.fitness_memory,
                row.fitness_locality,
                row.governance_result,
                row.mutation_type,
            ));
        }
        csv
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn evolution_loop() {
        // Run 10 generations on the self-replicator seed
        let config = EvolutionConfig {
            population_size: 6,
            elite_count: 2,
            max_generations: 3,
            mutation_rate: 0.05,
            benchmark_frames: 5,
            seed: assembler::self_replicator(),
        };

        let mut loop_ = EvolutionLoop::new(config);

        // Record initial best fitness
        let initial_best = loop_.best().fitness.composite;

        // Run the loop
        let final_population = loop_.run();

        // ── Verify: 3 generations completed without crash ──
        assert_eq!(loop_.stats().len(), 3, "should have 3 generation stats");

        // ── Verify: final population has correct size ──
        assert_eq!(final_population.len(), 6, "population should be 6");

        // ── Verify: best fitness >= initial fitness (elitism preserves best) ──
        let final_best = final_population
            .iter()
            .map(|i| i.fitness.composite)
            .fold(f64::NEG_INFINITY, f64::max);
        assert!(
            final_best >= initial_best - 1e-9,
            "best fitness ({}) should be >= initial ({})",
            final_best,
            initial_best,
        );

        // ── Verify: fitness is non-decreasing across generations ──
        let stats = loop_.stats();
        for i in 1..stats.len() {
            assert!(
                stats[i].best_fitness >= stats[i - 1].best_fitness - 1e-9,
                "generation {} best fitness ({}) dropped below gen {} ({})",
                stats[i].generation,
                stats[i].best_fitness,
                stats[i - 1].generation,
                stats[i - 1].best_fitness,
            );
        }

        // ── Verify: CSV log is valid ──
        let csv = loop_.csv();
        let lines: Vec<&str> = csv.lines().collect();
        assert!(lines.len() > 1, "CSV should have header + data rows");

        // ── Verify: log was populated ──
        assert!(!loop_.log().is_empty(), "log should not be empty");

        eprintln!("\n=== Evolution Loop Results ===");
        for stat in stats {
            eprintln!(
                "Gen {:3}: best={:.4} avg={:.4} diversity={:.2} violations={}",
                stat.generation,
                stat.best_fitness,
                stat.avg_fitness,
                stat.diversity,
                stat.governance_violations,
            );
        }
        eprintln!("Initial best: {:.4}", initial_best);
        eprintln!("Final best:   {:.4}", final_best);
    }
}
