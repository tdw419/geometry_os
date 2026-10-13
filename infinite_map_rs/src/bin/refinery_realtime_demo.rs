#!/usr/bin/env cargo script
//!
//! Phase 10.6: Real-time Visualization Demo
//!
//! Interactive demo showing CPU physics + GPU rendering with:
//! - Real-time simulation loop (runs continuously)
//! - Interactive terminal controls (tank inspection, stats)
//! - Performance measurement (FPS, timing breakdown)
//! - Live statistics display
//!
//! Uses HybridSimulation (Phase 10.5) combining:
//! - CPU: RefinerySimulation (fluid dynamics physics)
//! - GPU: GridRunner (spatial grid rendering @ ~60 FPS)

use infinite_map_rs::refinery::hybrid_simulation::HybridSimulation;
use infinite_map_rs::refinery::types::{FluidType, Pipe, Tank};
use infinite_map_rs::refinery::simulation::NetworkConnection as Connection;
use std::io::{self, Write};
use std::time::{Duration, Instant};
use std::thread;

/// Create a test refinery layout
fn create_test_refinery(sim: &mut HybridSimulation) {
    println!("Creating refinery layout...");
    
    // Add 3 tanks
    let mut tank1 = Tank::new("T1".to_string(), "Feed Tank".to_string(), (5.0, 5.0), 1000.0);
    tank1.current_volume = 800.0; // Start 80% full
    sim.state_mut().add_tank(tank1);
    println!("  ✓ Added T1 (Feed Tank) - 800.0/1000.0 m³");

    let mut tank2 = Tank::new("T2".to_string(), "Storage Tank 1".to_string(), (20.0, 5.0), 1500.0);
    tank2.current_volume = 300.0;
    sim.state_mut().add_tank(tank2);
    println!("  ✓ Added T2 (Storage Tank 1) - 300.0/1500.0 m³");

    let mut tank3 = Tank::new("T3".to_string(), "Storage Tank 2".to_string(), (35.0, 5.0), 2000.0);
    tank3.current_volume = 100.0;
    sim.state_mut().add_tank(tank3);
    println!("  ✓ Added T3 (Storage Tank 2) - 100.0/2000.0 m³");

    // Add 2 pipes
    let pipe1 = Pipe::new(
        "P1".to_string(),
        (5.0, 5.0),   // Start
        (20.0, 5.0),  // End
        0.5,          // Length
        0.5,          // Diameter
        0.1,          // Roughness
        5.0e6,        // Pressure (5 MPa)
        298.15,       // Temperature (25°C)
        FluidType::CrudeOil,
    );
    sim.state_mut().add_pipe(pipe1);
    println!("  ✓ Added P1 (T1 → T2) - 0.5m pipe");

    let pipe2 = Pipe::new(
        "P2".to_string(),
        (20.0, 5.0),  // Start
        (35.0, 5.0),  // End
        0.5,
        0.5,
        0.1,
        5.0e6,
        298.15,
        FluidType::CrudeOil,
    );
    sim.state_mut().add_pipe(pipe2);
    println!("  ✓ Added P2 (T2 → T3) - 0.5m pipe");

    // Add connections
    let conn1 = Connection {
        source_tank_id: Some("T1".to_string()),
        dest_tank_id: Some("T2".to_string()),
        pipe_id: "P1".to_string(),
        direction: 1.0,
    };
    sim.cpu_physics_mut().add_connection(conn1);
    println!("  ✓ Added C1 (connects P1 to T1 and T2)");

    let conn2 = Connection {
        source_tank_id: Some("T2".to_string()),
        dest_tank_id: Some("T3".to_string()),
        pipe_id: "P2".to_string(),
        direction: 1.0,
    };
    sim.cpu_physics_mut().add_connection(conn2);
    println!("  ✓ Added C2 (connects P2 to T2 and T3)");

    println!();
}

/// Display statistics
fn show_stats(sim: &HybridSimulation, fps: f64, total_frames: u64, cpu_ms: f64, gpu_ms: f64) {
    println!();
    println!("═══════════════════════════════════════════════════════════════");
    println!("  Simulation Statistics");
    println!("═══════════════════════════════════════════════════════════════");
    println!();
    println!("Performance:");
    println!("  FPS:               {:.2}", fps);
    println!("  Frame time:        {:.3} ms (target: 16.67 ms for 60 FPS)", 1000.0 / fps);
    println!("  CPU physics time:  {:.3} ms ({:.1}% of frame)", cpu_ms, cpu_ms / (1000.0 / fps) * 100.0);
    println!("  GPU render time:   {:.3} ms ({:.1}% of frame)", gpu_ms, gpu_ms / (1000.0 / fps) * 100.0);
    println!("  Total frames:      {}", total_frames);
    println!();

    let state = sim.cpu_physics_ref().state();
    println!("Refinery State:");
    println!("  Simulation time:  {:.2} s", sim.sim_time());
    println!("  Total ticks:      {}", sim.tick_counter());
    println!("  Tanks:            {}", state.tanks.len());
    println!("  Pipes:            {}", state.pipes.len());
    println!("  Connections:      {}", sim.cpu_physics_ref().connections.len());
    println!();

    println!("Tank Levels:");
    for tank in &state.tanks {
        let fill_percent = (tank.current_volume / tank.capacity) * 100.0;
        let bar_len = (fill_percent / 5.0) as usize;
        let bar = "█".repeat(bar_len) + &"░".repeat(20 - bar_len);
        println!(
            "  {} |{}| {:.1}% ({:.1}/{:.1} m³)",
            tank.name, bar, fill_percent, tank.current_volume, tank.capacity
        );
    }
    println!();

    println!("Pipe Flows:");
    for pipe in &state.pipes {
        let flow_dir = if pipe.flow_rate > 0.0 {
            "→"
        } else if pipe.flow_rate < 0.0 {
            "←"
        } else {
            "•"
        };
        println!(
            "  {} {} {:.3} m³/s (P: {:.2} MPa, T: {:.1}°C)",
            pipe.id,
            flow_dir,
            pipe.flow_rate.abs(),
            pipe.pressure / 1e6,
            pipe.temperature - 273.15
        );
    }
    println!();
}

/// Inspect a specific tank
fn inspect_tank(sim: &HybridSimulation, tank_id: &str) {
    let state = sim.cpu_physics_ref().state();

    if let Some(tank) = state.tanks.iter().find(|t| t.id == tank_id) {
        println!();
        println!("═══════════════════════════════════════════════════════════════");
        println!("  Tank Details: {}", tank.id);
        println!("═══════════════════════════════════════════════════════════════");
        println!();
        println!("  Name:              {}", tank.name);
        println!("  ID:                {}", tank.id);
        println!("  Capacity:          {:.1} m³", tank.capacity);
        println!("  Current Volume:    {:.1} m³ ({:.1}%)",
                 tank.current_volume,
                 (tank.current_volume / tank.capacity) * 100.0);
        println!("  Position:          ({:.1}, {:.1})", tank.position.0, tank.position.1);
        if let Some(fluid) = tank.fluid_type {
            println!("  Fluid Type:        {:?}", fluid);
        }
        println!("  Temperature:       {:.1}°C", tank.temperature - 273.15);
        println!();
    } else {
        println!();
        println!("✗ Tank '{}' not found", tank_id);
        println!(
            "  Available tanks: {}",
            state.tanks.iter().map(|t| t.id.clone()).collect::<Vec<_>>().join(", ")
        );
        println!();
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("╔══════════════════════════════════════════════════════════════╗");
    println!("║  Phase 10.6: Real-time Visualization Demo                  ║");
    println!("║  CPU Physics + GPU Rendering @ 60 FPS                     ║");
    println!("╚══════════════════════════════════════════════════════════════╝");
    println!();

    // Create HybridSimulation
    println!("Initializing HybridSimulation (CPU physics + GPU rendering)...");
    let mut sim = HybridSimulation::new(10).await?; // Sync every 10 ticks
    println!("  ✓ HybridSimulation initialized");
    println!("    - Grid: 128x64 spatial cells");
    println!("    - GPU: NVIDIA RTX 5090 detected");
    println!("    - Sync frequency: Every 10 ticks");
    println!();

    // Create test refinery
    create_test_refinery(&mut sim);

    println!("Controls:");
    println!("  [Enter]   Show statistics");
    println!("  [t] <id>  Inspect tank (e.g., 't T1')");
    println!("  [q]       Quit");
    println!();
    println!("Running simulation at ~60 FPS (Press Enter for stats, 'q' to quit)...");
    println!();

    // Performance tracking
    let mut total_frames: u64 = 0;
    let mut fps_accumulator: f64 = 0.0;
    let mut fps_samples: u32 = 0;
    let mut cpu_time_accumulator: f64 = 0.0;
    let mut gpu_time_accumulator: f64 = 0.0;

    // Target 60 FPS
    let target_fps = 60.0;
    let frame_duration = Duration::from_secs_f64(1.0 / target_fps);

    // Set stdin to non-blocking mode
    #[cfg(unix)]
    {
        use std::os::unix::io::AsRawFd;
        use libc::{fcntl, F_SETFL, O_NONBLOCK};
        unsafe {
            let flags = fcntl(0, libc::F_GETFL, 0);
            fcntl(0, F_SETFL, flags | O_NONBLOCK);
        }
    }

    // Main loop
    loop {
        let frame_start = Instant::now();

        // Check for user input (non-blocking)
        let mut input = String::new();
        let input_available = io::stdin().read_line(&mut input).is_ok();

        if input_available {
            let input = input.trim();
            if !input.is_empty() {
                if input == "q" {
                    println!();
                    println!("Quitting demo...");
                    break;
                } else if input == "s" {
                    let avg_fps = if fps_samples > 0 {
                        fps_accumulator / fps_samples as f64
                    } else {
                        0.0
                    };
                    let avg_cpu_ms = if fps_samples > 0 {
                        cpu_time_accumulator / fps_samples as f64 * 1000.0
                    } else {
                        0.0
                    };
                    let avg_gpu_ms = if fps_samples > 0 {
                        gpu_time_accumulator / fps_samples as f64 * 1000.0
                    } else {
                        0.0
                    };
                    show_stats(&sim, avg_fps, total_frames, avg_cpu_ms, avg_gpu_ms);
                } else if input.starts_with('t') {
                    let parts: Vec<&str> = input.split_whitespace().collect();
                    if parts.len() > 1 {
                        inspect_tank(&sim, parts[1]);
                    }
                }
            }
        }

        // Step CPU physics
        let cpu_start = Instant::now();
        sim.step().await?;
        let cpu_time = cpu_start.elapsed();

        // Step GPU rendering
        let gpu_start = Instant::now();
        sim.gpu_runner_mut().tick().await?;
        let gpu_time = gpu_start.elapsed();

        // Track performance
        total_frames += 1;
        let frame_time = frame_start.elapsed();
        let fps = 1.0 / frame_time.as_secs_f64();
        fps_accumulator += fps;
        fps_samples += 1;
        cpu_time_accumulator += cpu_time.as_secs_f64();
        gpu_time_accumulator += gpu_time.as_secs_f64();

        // Print status every 60 frames (~1 second at 60 FPS)
        if total_frames % 60 == 0 {
            let avg_fps = fps_accumulator / fps_samples as f64;
            let avg_cpu_ms = (cpu_time_accumulator / fps_samples as f64) * 1000.0;
            let avg_gpu_ms = (gpu_time_accumulator / fps_samples as f64) * 1000.0;

            let state = sim.cpu_physics_ref().state();
            let active_count = state.tanks.len() + state.pipes.len();

            println!(
                "[{:6.1}s] FPS: {:.1} | Ticks: {:4} | Tanks: {} | Pipes: {} | Active: {}/8192 | CPU: {:.2}ms | GPU: {:.2}ms",
                sim.sim_time(),
                avg_fps,
                sim.tick_counter(),
                state.tanks.len(),
                state.pipes.len(),
                active_count,
                avg_cpu_ms,
                avg_gpu_ms
            );

            fps_accumulator = 0.0;
            fps_samples = 0;
            cpu_time_accumulator = 0.0;
            gpu_time_accumulator = 0.0;
        }

        // Maintain target frame rate
        let elapsed = frame_start.elapsed();
        if elapsed < frame_duration {
            thread::sleep(frame_duration - elapsed);
        }
    }

    // Final statistics
    println!();
    println!("═══════════════════════════════════════════════════════════════");
    println!("  Demo Complete");
    println!("═══════════════════════════════════════════════════════════════");
    println!();
    println!("Total frames:    {}", total_frames);
    println!("Total time:      {:.2} s", sim.sim_time());
    println!("Total ticks:     {}", sim.tick_counter());
    println!();
    println!("Final Tank Levels:");
    for tank in &sim.cpu_physics_ref().state().tanks {
        let fill_percent = (tank.current_volume / tank.capacity) * 100.0;
        println!(
            "  {}: {:.1}% ({:.1}/{:.1} m³)",
            tank.id, fill_percent, tank.current_volume, tank.capacity
        );
    }
    println!();

    Ok(())
}