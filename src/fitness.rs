// Fitness Function - Objective program quality measurement
//
// Measures pixel programs across four dimensions:
//   1. Speed (cycles to complete)
//   2. Correctness (does it produce expected output?)
//   3. Memory efficiency (bytes used vs available)
//   4. Spatial locality (Hilbert distance between related instructions)
//
// Each metric is normalized to [0.0, 1.0] where 1.0 is best.
// The composite score is a weighted average.

use crate::assembler::Program;
use crate::hilbert;
use crate::software_vm::SoftwareVm;
use crate::vm::{VmState, vm_state};

/// Per-metric fitness scores, all normalized to [0.0, 1.0].
#[derive(Debug, Clone)]
pub struct FitnessScore {
    /// Speed: 1.0 = fastest (fewest cycles), 0.0 = hit cycle budget without halting.
    pub speed: f64,
    /// Correctness: ratio of expected output pixels that match actual output.
    pub correctness: f64,
    /// Memory efficiency: 1.0 = tight program (minimal footprint), 0.0 = bloated.
    pub memory: f64,
    /// Spatial locality: average Hilbert-neighbor proximity of sequential instructions.
    /// 1.0 = all adjacent, 0.0 = maximally scattered.
    pub locality: f64,
    /// Weighted composite: 0.4*speed + 0.3*correctness + 0.2*memory + 0.1*locality
    pub composite: f64,
    /// Raw cycles consumed.
    pub cycles: u32,
    /// Program size in pixels.
    pub program_size: usize,
}

/// Configuration for a fitness benchmark run.
pub struct BenchmarkConfig {
    /// Maximum frames to run before declaring "did not halt".
    pub max_frames: u32,
    /// Address at which to load the program.
    pub load_addr: u32,
    /// VM slot to use (0-7).
    pub vm_slot: u32,
    /// Expected output as (address, value) pairs.
    /// Empty = skip correctness check (score 1.0).
    pub expected_output: Vec<(u32, u32)>,
}

impl Default for BenchmarkConfig {
    fn default() -> Self {
        Self {
            max_frames: 10,
            load_addr: 0,
            vm_slot: 0,
            expected_output: Vec::new(),
        }
    }
}

impl BenchmarkConfig {
    /// Convenience: benchmark a program that writes known output at specific addresses.
    pub fn with_expected_output(mut self, outputs: Vec<(u32, u32)>) -> Self {
        self.expected_output = outputs;
        self
    }

    /// Set load address.
    pub fn with_load_addr(mut self, addr: u32) -> Self {
        self.load_addr = addr;
        self
    }

    /// Set max frames.
    pub fn with_max_frames(mut self, frames: u32) -> Self {
        self.max_frames = frames;
        self
    }
}

/// Run a fitness benchmark against a program.
///
/// Loads the program into a fresh SoftwareVm, runs it up to max_frames,
/// then scores it on all four metrics.
pub fn benchmark(program: &Program, config: &BenchmarkConfig) -> FitnessScore {
    let mut svm = SoftwareVm::new();
    svm.load_program(config.load_addr, &program.pixels);
    svm.spawn_vm(config.vm_slot, config.load_addr);

    // Run until halted or budget exhausted
    let mut frames_run = 0u32;
    for _ in 0..config.max_frames {
        svm.execute_frame();
        frames_run += 1;
        let vm = svm.vm_state(config.vm_slot as usize);
        if vm.halted != 0 || vm.state != vm_state::RUNNING {
            break;
        }
    }

    let vm = svm.vm_state(config.vm_slot as usize);
    let cycles = vm.cycles;
    let program_size = program.pixels.len();

    // ── Speed ──
    // Best case: program halts in 1 cycle. Worst: runs full budget without halting.
    let max_cycles = config.max_frames * crate::CYCLES_PER_FRAME;
    let halted = vm.halted != 0;
    let speed = if halted {
        // Normalize: 1.0 at 1 cycle, decays toward 0 at max_cycles
        1.0 - (cycles as f64 / max_cycles as f64).min(1.0)
    } else {
        0.0 // didn't halt
    };

    // ── Correctness ──
    let correctness = if config.expected_output.is_empty() {
        1.0 // no expected output specified = assume correct
    } else {
        let total = config.expected_output.len() as f64;
        let matching = config
            .expected_output
            .iter()
            .filter(|(addr, expected)| svm.peek(config.load_addr + *addr) == *expected)
            .count() as f64;
        matching / total
    };

    // ── Memory efficiency ──
    // Smaller programs get higher scores. We use a logarithmic scale.
    // A 1-pixel program scores 1.0, a 1024-pixel program scores ~0.0.
    let memory = if program_size == 0 {
        0.0
    } else {
        // 1 pixel = 1.0, 256 pixels = 0.5, 1024 pixels ~ 0.0
        1.0 - (program_size as f64).log2() / 10.0 // log2(1024) = 10
    }
    .clamp(0.0, 1.0);

    // ── Spatial locality ──
    // Average physical (x,y) distance between consecutive instruction pixels.
    // In Hilbert space, sequential addresses are often nearby, so this measures
    // how well the program layout preserves spatial coherence.
    let locality = compute_locality(config.load_addr, &program.pixels);

    // ── Composite ──
    let composite = 0.4 * speed + 0.3 * correctness + 0.2 * memory + 0.1 * locality;

    FitnessScore {
        speed,
        correctness,
        memory,
        locality,
        composite,
        cycles,
        program_size,
    }
}

/// Compute spatial locality: average normalized inverse distance between
/// consecutive instruction pixels in physical (x,y) space.
fn compute_locality(base_addr: u32, pixels: &[u32]) -> f64 {
    if pixels.len() < 2 {
        return 1.0; // single pixel is trivially local
    }

    let max_dist = (4096.0_f64 * 2.0).sqrt(); // diagonal of 4096x4096 grid
    let mut total_proximity = 0.0;
    let mut count = 0usize;

    let mut prev_xy = hilbert::d2xy(base_addr);

    for i in 1..pixels.len() {
        let curr_xy = hilbert::d2xy(base_addr + i as u32);
        let dx = (curr_xy.0 as f64 - prev_xy.0 as f64).abs();
        let dy = (curr_xy.1 as f64 - prev_xy.1 as f64).abs();
        let dist = (dx * dx + dy * dy).sqrt();
        // Normalize to [0,1] where 1 = adjacent
        let proximity = 1.0 - (dist / max_dist).min(1.0);
        total_proximity += proximity;
        count += 1;
        prev_xy = curr_xy;
    }

    total_proximity / count as f64
}

/// Run a fitness benchmark on the **real GPU** via `GlyphVm`.
///
/// This is the "programs write programs on hardware" path. Each program is
/// loaded into the GPU's RAM texture, dispatched as a compute shader, and
/// the results are read back. Cycle counts come from actual GPU execution,
/// not simulated.
///
/// Returns the same `FitnessScore` as `benchmark()` so the evolution loop
/// can swap between CPU and GPU backends transparently.
pub fn gpu_benchmark(
    gpu: &mut crate::vm::GlyphVm,
    pixels: &[u32],
    config: &BenchmarkConfig,
) -> FitnessScore {
    // Reset GPU state for a clean run
    gpu.reset();

    // Load the program into the substrate (which feeds the GPU texture)
    gpu.substrate().load_program(config.load_addr, pixels);

    // Spawn the requested VM slot
    gpu.spawn_vm(config.vm_slot, config.load_addr);

    let program_size = pixels.len();

    // Run up to max_frames on real GPU hardware
    let mut frames_run = 0u32;
    for _ in 0..config.max_frames {
        gpu.execute_frame();
        frames_run += 1;
        let vm = gpu.vm_state(config.vm_slot as usize);
        if vm.halted != 0 || vm.state != crate::vm::vm_state::RUNNING {
            break;
        }
    }

    let vm = gpu.vm_state(config.vm_slot as usize).clone();
    let cycles = vm.cycles;

    // ── Speed ── (same scoring as CPU path)
    let max_cycles = config.max_frames * crate::CYCLES_PER_FRAME;
    let halted = vm.halted != 0;
    let speed = if halted {
        1.0 - (cycles as f64 / max_cycles as f64).min(1.0)
    } else {
        0.0
    };

    // ── Correctness ──
    let correctness = if config.expected_output.is_empty() {
        1.0
    } else {
        let total = config.expected_output.len() as f64;
        let matching = config
            .expected_output
            .iter()
            .filter(|(addr, expected)| gpu.substrate().peek(config.load_addr + *addr) == *expected)
            .count() as f64;
        matching / total
    };

    // ── Memory efficiency ──
    let memory = if program_size == 0 {
        0.0
    } else {
        1.0 - (program_size as f64).log2() / 10.0
    }
    .clamp(0.0, 1.0);

    // ── Spatial locality ──
    let locality = compute_locality(config.load_addr, pixels);

    // ── Composite ──
    let composite = 0.4 * speed + 0.3 * correctness + 0.2 * memory + 0.1 * locality;

    FitnessScore {
        speed,
        correctness,
        memory,
        locality,
        composite,
        cycles,
        program_size,
    }
}

/// Batch GPU benchmark: run up to 8 individuals simultaneously on the GPU.
///
/// Each individual gets its own VM slot (0-7). The GPU dispatches all 8 in
/// parallel via a single compute pass. This is the fast path for evolution.
///
/// Returns fitness scores in the same order as the input individuals.
/// Individuals beyond 8 are benchmarked in subsequent batches.
pub fn gpu_benchmark_batch(
    gpu: &mut crate::vm::GlyphVm,
    batch: &[(u32, &[u32])], // (load_addr, pixels) pairs
    max_frames: u32,
) -> Vec<FitnessScore> {
    let mut results = Vec::with_capacity(batch.len());

    for chunk in batch.chunks(8) {
        // Don't full-reset -- just clear VM states. Substrate gets overwritten.
        // Full reset causes excessive GPU resource churn under evolution load.
        for i in 0..8 {
            gpu.vm_state_mut(i).halted = 0;
            gpu.vm_state_mut(i).state = 0u32;
            gpu.vm_state_mut(i).pc = 0;
            gpu.vm_state_mut(i).cycles = 0;
        }

        for (i, (load_addr, pixels)) in chunk.iter().enumerate() {
            let vm_slot = i as u32;
            gpu.substrate().load_program(*load_addr, pixels);
            gpu.spawn_vm(vm_slot, *load_addr);
        }

        // Run all VMs for max_frames
        let mut all_done = false;
        for _ in 0..max_frames {
            if all_done {
                break;
            }
            gpu.execute_frame();
            all_done = true;
            for i in 0..chunk.len() {
                let vm = gpu.vm_state(i);
                if vm.halted == 0 && vm.state == crate::vm::vm_state::RUNNING {
                    all_done = false;
                    break;
                }
            }
        }

        // Score each VM
        let max_cycles = max_frames * crate::CYCLES_PER_FRAME;
        for (i, (load_addr, pixels)) in chunk.iter().enumerate() {
            let vm = gpu.vm_state(i).clone();
            let cycles = vm.cycles;
            let program_size = pixels.len();

            let halted = vm.halted != 0;
            let speed = if halted {
                1.0 - (cycles as f64 / max_cycles as f64).min(1.0)
            } else {
                0.0
            };

            let memory = if program_size == 0 {
                0.0
            } else {
                1.0 - (program_size as f64).log2() / 10.0
            }
            .clamp(0.0, 1.0);

            let locality = compute_locality(*load_addr, pixels);

            let composite = 0.4 * speed + 0.3 * 1.0 + 0.2 * memory + 0.1 * locality;

            results.push(FitnessScore {
                speed,
                correctness: 1.0, // no expected output in batch mode
                memory,
                locality,
                composite,
                cycles,
                program_size,
            });
        }
    }

    results
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler;

    #[test]
    fn test_self_replicator_gets_fitness_score() {
        let program = assembler::self_replicator();
        // Self-replicator copies 18 pixels from addr 0 to addr 100
        let mut expected = Vec::new();
        for i in 0..18u32 {
            expected.push((100 + i, program.pixels[i as usize]));
        }

        let config = BenchmarkConfig::default().with_expected_output(expected);
        let score = benchmark(&program, &config);

        // Self-replicator should halt (speed > 0)
        assert!(score.speed > 0.0, "Speed should be positive, got {}", score.speed);
        assert!(score.speed <= 1.0, "Speed should be <= 1.0, got {}", score.speed);

        // It should produce correct output
        assert_eq!(score.correctness, 1.0, "Self-replicator should be correct");

        // Memory should be reasonable (18 pixels)
        assert!(score.memory > 0.5, "18-pixel program should have good memory score, got {}", score.memory);

        // Locality should be near 1.0 (sequential Hilbert addresses)
        assert!(score.locality > 0.98, "Sequential program should have high locality, got {}", score.locality);

        // Composite should be positive
        assert!(score.composite > 0.5, "Composite should be > 0.5, got {}", score.composite);

        // Should have halted
        assert!(score.cycles > 0, "Should have consumed some cycles");

        println!("Self-replicator fitness: {:?}", score);
    }

    #[test]
    fn test_worse_program_scores_lower() {
        // Good program: self-replicator (halts, correct, 18 pixels)
        let good = assembler::self_replicator();
        let mut good_expected = Vec::new();
        for i in 0..18u32 {
            good_expected.push((100 + i, good.pixels[i as usize]));
        }
        let good_config = BenchmarkConfig::default().with_expected_output(good_expected);
        let good_score = benchmark(&good, &good_config);

        // Bad program: just NOPs (never halts, no output)
        let mut bad = Program::new();
        for _ in 0..50 {
            bad.pixels.push(0); // NOP
        }
        // No expected output -- correctness = 1.0 by default, but speed = 0
        let bad_config = BenchmarkConfig::default().with_max_frames(2);
        let bad_score = benchmark(&bad, &bad_config);

        // Good should score higher than bad
        assert!(
            good_score.composite > bad_score.composite,
            "Good program ({}) should score higher than bad ({})",
            good_score.composite,
            bad_score.composite
        );

        // Bad should have speed = 0 (didn't halt)
        assert_eq!(bad_score.speed, 0.0, "NOP program should have speed 0");

        println!("Good score: {:?}", good_score);
        println!("Bad score:  {:?}", bad_score);
    }

    #[test]
    fn test_fitness_score_basics() {
        // A tiny program that just halts
        let mut p = Program::new();
        p.halt(); // single pixel halt instruction

        let config = BenchmarkConfig::default();
        let score = benchmark(&p, &config);

        assert!(score.speed > 0.99, "Single-instruction halt should be fast, got {}", score.speed);
        assert_eq!(score.correctness, 1.0, "No expected output = correct by default");
        assert!(score.program_size == 1);
    }

    #[test]
    fn test_locality_sequential() {
        // Sequential addresses should have very high locality
        let mut p = Program::new();
        for _ in 0..20 {
            p.pixels.push(0);
        }
        let loc = compute_locality(0, &p.pixels);
        assert!(loc > 0.98, "Sequential should have locality > 0.98, got {}", loc);
    }
}
