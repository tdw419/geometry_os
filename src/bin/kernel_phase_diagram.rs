//! Kernel Phase Diagram Binary
//!
//! Runs the kernel under different ablation modes and outputs phase diagram
//! samples as CSV to stdout. Called by scripts/phase_diagram.py.
//!
//! Usage:
//!   cargo run --release --features gpu --bin kernel_phase_diagram -- \
//!       --mode full --ticks 10000 --sample-interval 100

use geometry_os::kernel::diagnostics::AblationFlags;
use geometry_os::kernel::kernel::Kernel;
use geometry_os::kernel::world::FileParticle;

fn main() {
    let mut mode = "full".to_string();
    let mut ticks: u64 = 10000;
    let mut sample_interval: u64 = 100;

    // Simple arg parsing (no deps)
    let args: Vec<String> = std::env::args().collect();
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--mode" => {
                mode = args[i + 1].clone();
                i += 2;
            },
            "--ticks" => {
                ticks = args[i + 1].parse().unwrap_or(10000);
                i += 2;
            },
            "--sample-interval" => {
                sample_interval = args[i + 1].parse().unwrap_or(100);
                i += 2;
            },
            _ => {
                i += 1;
            },
        }
    }

    let ablation = match mode.as_str() {
        "full" => AblationFlags::full(),
        "no_memory" => AblationFlags::no_memory(),
        "no_novelty" => AblationFlags::no_novelty(),
        "no_tec" => AblationFlags::no_tec(),
        _ => {
            eprintln!(
                "Unknown mode: {}. Use: full, no_memory, no_novelty, no_tec",
                mode
            );
            std::process::exit(1);
        },
    };

    // Create a seed that's deterministic per mode (so runs are reproducible)
    let seed: u64 = match mode.as_str() {
        "full" => 42,
        "no_memory" => 43,
        "no_novelty" => 44,
        "no_tec" => 45,
        _ => 42,
    };

    // Create initial particle population
    // 60 particles in tight cluster + 20 scattered
    let mut particles = Vec::new();

    // Tight cluster (will form CFs)
    for i in 0..60u64 {
        let angle = (i as f32 / 60.0) * 2.0 * std::f32::consts::PI;
        let r = 15.0 + (i as f32 % 5.0) * 3.0;
        let x = (512.0 + angle.cos() * r) as u32;
        let y = (512.0 + angle.sin() * r) as u32;
        particles.push(make_particle(i, x.min(1023), y.min(1023), 0.7));
    }

    // Scattered particles (environmental diversity)
    for i in 60..80u64 {
        let x = (i as f32 * 37.0 + 100.0) as u32 % 900 + 62;
        let y = (i as f32 * 53.0 + 200.0) as u32 % 900 + 62;
        particles.push(make_particle(i, x, y, 0.5));
    }

    let mut kernel = Kernel::with_diagnostics(particles, seed, ablation, sample_interval);

    // Print CSV header
    println!(
        "tick,particle_count,total_energy,tec,tec_gradient,tec_peak,\
         tracked_clusters,avg_histogram_entropy,histogram_coverage,\
         avg_repetition_score,avg_trace_count,memory_reuse_rate,\
         cf_mean_pairwise_distance,cf_count,avg_intent_magnitude,\
         effective_dimensionality,eigenvalue_0,eigenvalue_1,eigenvalue_2,eigenvalue_3,\
         semantic_variance,semantic_dimensionality,sem_eigenvalue_0,sem_eigenvalue_1,sem_eigenvalue_2,sem_eigenvalue_3"
    );

    // Run
    for _ in 0..ticks {
        kernel.step();
    }

    // Output all collected samples as CSV
    if let Some(ref collector) = kernel.phase_collector {
        for s in &collector.samples {
            println!(
                "{},{},{:.4},{:.4},{:.6},{:.4},\
                 {},{:.4},{:.4},\
                 {:.4},{:.2},{:.4},\
                 {:.2},{},{:.4},\
                 {},{:.1},{:.1},{:.1},{:.1},\
                 {:.6},{},{:.1},{:.1},{:.1},{:.1}",
                s.tick,
                s.particle_count,
                s.total_energy,
                s.tec,
                s.tec_gradient,
                s.tec_peak,
                s.tracked_clusters,
                s.avg_histogram_entropy,
                s.histogram_coverage,
                s.avg_repetition_score,
                s.avg_trace_count,
                s.memory_reuse_rate,
                s.cf_mean_pairwise_distance,
                s.cf_count,
                s.avg_intent_magnitude,
                s.effective_dimensionality,
                s.eigenvalues[0],
                s.eigenvalues[1],
                s.eigenvalues[2],
                s.eigenvalues[3],
                s.semantic_variance,
                s.semantic_dimensionality,
                s.semantic_eigenvalues[0],
                s.semantic_eigenvalues[1],
                s.semantic_eigenvalues[2],
                s.semantic_eigenvalues[3],
            );
        }
        eprintln!(
            "Mode {}: {} ticks, {} samples collected",
            mode,
            ticks,
            collector.samples.len()
        );
    }
}

fn make_particle(id: u64, x: u32, y: u32, energy: f32) -> FileParticle {
    FileParticle {
        id,
        size: 128,
        x,
        y,
        vx: 0.0,
        vy: 0.0,
        energy,
        file_type: 0,
        semantic_vector: [
            (id as f32 * 0.1).sin(),
            (id as f32 * 0.2).cos(),
            (id as f32 * 0.3).sin(),
            (id as f32 * 0.4).cos(),
        ],
    }
}
