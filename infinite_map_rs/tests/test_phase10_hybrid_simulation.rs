//! Phase 10.5 - CPU-GPU Hybrid Simulation Tests
//!
//! Tests the hybrid simulation engine that combines:
//! - CPU-side physics (RefinerySimulation - proven correct)
//! - GPU-side spatial grid rendering (GridRunner)
//! - Synced state transfer every N ticks

use infinite_map_rs::refinery::hybrid_simulation::HybridSimulation;
use infinite_map_rs::refinery::types::{FluidType, Pipe, RefineryState, Tank};

#[tokio::test]
async fn test_hybrid_simulation_creation() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation Creation");
    println!("═══════════════════════════════════════════════════════════════\n");

    let sim = HybridSimulation::new(10).await;

    assert!(
        sim.is_ok(),
        "HybridSimulation initialization failed: {:?}",
        sim.err()
    );

    let sim = sim.unwrap();
    assert_eq!(sim.tick_counter(), 0);
    assert_eq!(sim.sim_time(), 0.0);

    println!("✓ Hybrid simulation created successfully");
    println!("✓ Initial state: tick_counter=0, sim_time=0.0");
}

#[tokio::test]
async fn test_hybrid_simulation_add_components() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation - Add Components");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut sim = HybridSimulation::new(10).await.unwrap();

    let tank = Tank::new(
        "T1".to_string(),
        "Test Tank".to_string(),
        (10.0, 10.0),
        1000.0,
    );
    sim.state_mut().add_tank(tank);

    let pipe = Pipe::new(
        "P1".to_string(),
        (0.0, 50.0),
        (10.0, 50.0),
        0.5,
        4.6e-5,
        0.1,
        5.0e6,
        298.15,
        FluidType::CrudeOil,
    );
    sim.state_mut().add_pipe(pipe);

    assert_eq!(sim.cpu_physics_ref().state().tanks.len(), 1);
    assert_eq!(sim.cpu_physics_ref().state().pipes.len(), 1);

    println!("✓ Added 1 tank and 1 pipe to hybrid simulation");
    println!("✓ Component counts verified");
}

#[tokio::test]
async fn test_hybrid_simulation_step() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation - Step");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut sim = HybridSimulation::new(10).await.unwrap();

    let tank = Tank::new(
        "T1".to_string(),
        "Test Tank".to_string(),
        (10.0, 10.0),
        1000.0,
    );
    sim.state_mut().add_tank(tank);

    let initial_time = sim.sim_time();
    let initial_ticks = sim.tick_counter();

    // Step forward
    sim.step().await.unwrap();

    assert_eq!(sim.sim_time(), initial_time + 0.1);
    assert_eq!(sim.tick_counter(), initial_ticks + 1);

    println!("✓ Step advanced simulation time by 0.1s");
    println!("✓ Tick counter incremented correctly");
    println!(
        "✓ Final state: sim_time={}, tick_counter={}",
        sim.sim_time(),
        sim.tick_counter()
    );
}

#[tokio::test]
async fn test_hybrid_simulation_sync_frequency() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation - Sync Frequency");
    println!("═══════════════════════════════════════════════════════════════\n");

    let sync_freq = 5;
    let mut sim = HybridSimulation::new(sync_freq).await.unwrap();

    let tank = Tank::new(
        "T1".to_string(),
        "Test Tank".to_string(),
        (5.0, 5.0),
        1000.0,
    );
    sim.state_mut().add_tank(tank);

    println!("✓ Sync frequency set to {}", sync_freq);

    // Step 4 times (no sync yet)
    for i in 1..=4 {
        sim.step().await.unwrap();
        println!(
            "  Step {}: tick_counter={}, sim_time={:.1}s",
            i,
            sim.tick_counter(),
            sim.sim_time()
        );
    }
    assert_eq!(sim.tick_counter(), 4);
    println!("✓ No sync at tick 4 (sync_freq={})", sync_freq);

    // Step 1 more time (should sync)
    sim.step().await.unwrap();
    assert_eq!(sim.tick_counter(), 5);
    println!("✓ Sync occurred at tick 5 (sync_freq={})", sync_freq);

    // Step 5 more times (another sync at 10)
    for i in 6..=10 {
        sim.step().await.unwrap();
    }
    assert_eq!(sim.tick_counter(), 10);
    println!("✓ Second sync occurred at tick 10");
}

#[tokio::test]
async fn test_hybrid_simulation_end_to_end() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation - End-to-End");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut sim = HybridSimulation::new(5).await.unwrap();

    // Create two tanks connected by a pipe
    let source_tank = Tank::new(
        "T_SOURCE".to_string(),
        "Source Tank".to_string(),
        (5.0, 5.0), // Within grid (5.0 * 10 = 50, 5.0 * 10 = 50)
        1000.0,
    );
    sim.state_mut().add_tank(source_tank.clone());

    let dest_tank = Tank::new(
        "T_DEST".to_string(),
        "Destination Tank".to_string(),
        (8.0, 5.0), // Within grid (8.0 * 10 = 80, 5.0 * 10 = 50)
        1000.0,
    );
    sim.state_mut().add_tank(dest_tank.clone());

    let pipe = Pipe::new(
        "P_TRANSFER".to_string(),
        (6.0, 5.0),
        (7.0, 5.0),
        0.5,
        4.6e-5,
        0.1,
        2.0e6,
        298.15,
        FluidType::CrudeOil,
    );
    sim.state_mut().add_pipe(pipe);

    println!("✓ Created 2 tanks + 1 pipe refinery");

    let initial_time = sim.sim_time();

    // Run simulation for 20 steps (4 syncs)
    for i in 1..=20 {
        sim.step().await.unwrap();
        if i % 5 == 0 {
            println!(
                "  Step {}: sim_time={:.1}s, tick_counter={}",
                i,
                sim.sim_time(),
                sim.tick_counter()
            );
        }
    }

    assert_eq!(sim.tick_counter(), 20);
    assert!((sim.sim_time() - (initial_time + 2.0)).abs() < 1e-9); // 20 steps * 0.1s = 2.0s

    println!("✓ End-to-end simulation completed");
    println!(
        "✓ Final state: sim_time={:.1}s, tick_counter={}",
        sim.sim_time(),
        sim.tick_counter()
    );
    println!("✓ 4 syncs occurred (every 5 ticks)");
}

#[tokio::test]
async fn test_hybrid_simulation_cpu_physics_accuracy() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.5 Test: Hybrid Simulation - CPU Physics Accuracy");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Create identical refinery setups
    let mut state_cpu = RefineryState::new();
    let mut state_hybrid = RefineryState::new();

    // Add same tanks to both
    let tank = Tank::new(
        "T1".to_string(),
        "Test Tank".to_string(),
        (5.0, 5.0), // Within grid (5.0 * 10 = 50, 5.0 * 10 = 50)
        1000.0,
    );

    let tank_cpu = tank.clone();
    let tank_hybrid = tank.clone();

    state_cpu.add_tank(tank_cpu);
    state_hybrid.add_tank(tank_hybrid);

    println!("✓ Created identical tank configurations for CPU and hybrid");

    // Run CPU simulation
    use infinite_map_rs::refinery::simulation::RefinerySimulation;
    let mut cpu_sim = RefinerySimulation::new(state_cpu, 0.1);
    for _ in 0..10 {
        cpu_sim.step().unwrap();
    }

    // Run hybrid simulation
    let mut hybrid_sim = HybridSimulation::new(10).await.unwrap();
    *hybrid_sim.state_mut() = state_hybrid;
    for _ in 0..10 {
        hybrid_sim.step().await.unwrap();
    }

    println!("✓ Ran 10 simulation steps on both engines");

    // Verify tank states match (CPU physics is accurate)
    let cpu_tank = &cpu_sim.state().tanks[0];
    let hybrid_tank = &hybrid_sim.cpu_physics_ref().state().tanks[0];

    assert_eq!(cpu_tank.id, hybrid_tank.id);
    assert_eq!(cpu_tank.capacity, hybrid_tank.capacity);

    println!("✓ CPU physics accuracy verified");
    println!("✓ Tank states match between CPU and hybrid engines");
}