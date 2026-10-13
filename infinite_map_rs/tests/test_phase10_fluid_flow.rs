//! Phase 10.2 - Dynamic Fluid Flow Tests
//!
//! Tests real-time fluid transfer between connected tanks and pipes.
//! Verifies tanks fill/empty correctly over simulation time.

use infinite_map_rs::refinery::simulation::{RefinerySimulation, NetworkConnection};
use infinite_map_rs::refinery::types::{RefineryState, Pipe, Tank, FluidType};

#[test]
fn test_fluid_flow_single_pipe() {
    // Test: Fluid transfers between two connected tanks

    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.2 Test: Fluid Flow - Single Pipe");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Create refinery with source tank and destination tank
    let mut state = RefineryState::new();

    // Source tank (full of crude oil)
    let source_tank = Tank::new(
        "T_SOURCE".to_string(),
        "Source Tank".to_string(),
        (10.0, 10.0),
        1000.0, // 1000 m³ capacity
    );
    state.add_tank(source_tank);

    // Destination tank (empty)
    let dest_tank = Tank::new(
        "T_DEST".to_string(),
        "Destination Tank".to_string(),
        (30.0, 10.0),
        1000.0, // 1000 m³ capacity
    );
    state.add_tank(dest_tank);

    // Pipe connecting them
    let transfer_pipe = Pipe::new(
        "P_TRANSFER".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        0.5,           // 0.5m diameter
        4.6e-5,        // Commercial steel roughness
        0.1,           // Initial flow rate (m³/s)
        2.0e6,         // 2 MPa (pressure differential drives flow)
        298.15,        // 25°C
        FluidType::CrudeOil,
    );
    state.add_pipe(transfer_pipe);

    // Fill source tank
    if let Some(tank) = state.get_tank_mut("T_SOURCE") {
        tank.current_volume = 1000.0; // Full
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    println!("Initial state:");
    println!("  Source tank (T_SOURCE): {:.1} / {:.1} m³",
             state.get_tank("T_SOURCE").unwrap().current_volume,
             state.get_tank("T_SOURCE").unwrap().capacity);
    println!("  Destination tank (T_DEST): {:.1} / {:.1} m³",
             state.get_tank("T_DEST").unwrap().current_volume,
             state.get_tank("T_DEST").unwrap().capacity);

    // Create simulation
    let mut sim = RefinerySimulation::new(state, 0.5); // 0.5s time step

    // Add connection: source → destination
    let connection = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_TRANSFER".to_string(),
        direction: 1.0, // Source → Destination
    };
    sim.add_connection(connection);

    // Run simulation for 10 seconds
    let steps = (10.0_f64 / 0.5_f64).ceil() as usize;

    for i in 0..steps {
        sim.step().unwrap();

        if i % 2 == 0 { // Print every 1 second
            println!("  t={:.1}s: Source={:.1} m³, Dest={:.1} m³, Flow={:.3} m³/s",
                     sim.current_time(),
                     sim.state().get_tank("T_SOURCE").unwrap().current_volume,
                     sim.state().get_tank("T_DEST").unwrap().current_volume,
                     sim.state().get_pipe("P_TRANSFER").unwrap().flow_rate.abs());
        }
    }

    // Verify final state
    let source_final = sim.state().get_tank("T_SOURCE").unwrap().current_volume;
    let dest_final = sim.state().get_tank("T_DEST").unwrap().current_volume;
    let pipe_flow = sim.state().get_pipe("P_TRANSFER").unwrap().flow_rate;

    println!("\nFinal state:");
    println!("  Source tank (T_SOURCE): {:.1} / {:.1} m³", source_final, 1000.0);
    println!("  Destination tank (T_DEST): {:.1} / {:.1} m³", dest_final, 1000.0);
    println!("  Pipe flow rate: {:.3} m³/s", pipe_flow);

    // Assertions
    assert!(source_final < 1000.0, "Source tank should have drained");
    assert!(dest_final > 0.0, "Destination tank should have filled");
    assert!((source_final + dest_final - 1000.0).abs() < 1.0, "Mass should be conserved");
    assert!(pipe_flow > 0.0, "Flow should be positive");

    println!("\n✓ Test PASSED: Fluid transferred correctly\n");
}

#[test]
fn test_fluid_flow_network() {
    // Test: Multi-tank, multi-pipe network

    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.2 Test: Fluid Flow - Network (3 tanks)");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut state = RefineryState::new();

    // Tank A (full)
    let tank_a = Tank::new("T_A".to_string(), "Tank A".to_string(), (10.0, 10.0), 500.0);
    state.add_tank(tank_a);

    // Tank B (empty)
    let tank_b = Tank::new("T_B".to_string(), "Tank B".to_string(), (30.0, 10.0), 500.0);
    state.add_tank(tank_b);

    // Tank C (empty)
    let tank_c = Tank::new("T_C".to_string(), "Tank C".to_string(), (50.0, 10.0), 500.0);
    state.add_tank(tank_c);

    // Pipe A → B
    let pipe_ab = Pipe::new(
        "P_AB".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        0.3, 0.5e-5, 0.05, 2.0e6, 298.15, FluidType::CrudeOil,
    );
    state.add_pipe(pipe_ab);

    // Pipe B → C
    let pipe_bc = Pipe::new(
        "P_BC".to_string(),
        (35.0, 10.0),
        (45.0, 10.0),
        0.3, 0.5e-5, 0.05, 1.5e6, 298.15, FluidType::CrudeOil,
    );
    state.add_pipe(pipe_bc);

    // Fill Tank A
    if let Some(tank) = state.get_tank_mut("T_A") {
        tank.current_volume = 500.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    println!("Initial state: A=500 m³, B=0 m³, C=0 m³");

    let mut sim = RefinerySimulation::new(state, 0.5);

    // Network: A → B → C
    let conn_ab = NetworkConnection {
        source_tank_id: Some("T_A".to_string()),
        dest_tank_id: Some("T_B".to_string()),
        pipe_id: "P_AB".to_string(),
        direction: 1.0,
    };
    let conn_bc = NetworkConnection {
        source_tank_id: Some("T_B".to_string()),
        dest_tank_id: Some("T_C".to_string()),
        pipe_id: "P_BC".to_string(),
        direction: 1.0,
    };

    sim.add_connection(conn_ab);
    sim.add_connection(conn_bc);

    // Run simulation
    let steps = (10.0_f64 / 0.5_f64).ceil() as usize;

    for i in 0..steps {
        sim.step().unwrap();

        if i % 2 == 0 {
            let a_vol = sim.state().get_tank("T_A").unwrap().current_volume;
            let b_vol = sim.state().get_tank("T_B").unwrap().current_volume;
            let c_vol = sim.state().get_tank("T_C").unwrap().current_volume;

            println!("  t={:.1}s: A={:.1} m³, B={:.1} m³, C={:.1} m³",
                     sim.current_time(), a_vol, b_vol, c_vol);
        }
    }

    // Verify mass conservation
    let a_final = sim.state().get_tank("T_A").unwrap().current_volume;
    let b_final = sim.state().get_tank("T_B").unwrap().current_volume;
    let c_final = sim.state().get_tank("T_C").unwrap().current_volume;
    let total_final = a_final + b_final + c_final;

    println!("\nFinal state: A={:.1} m³, B={:.1} m³, C={:.1} m³ (Total={:.1})",
             a_final, b_final, c_final, total_final);

    assert!((total_final - 500.0).abs() < 2.0, "Total mass should be conserved");
    assert!(a_final < 500.0, "Tank A should have drained");
    assert!(c_final > 0.0, "Tank C should have received fluid");

    println!("\n✓ Test PASSED: Network flow conserved mass\n");
}

#[test]
fn test_overflow_handling() {
    // Test: Tank fills to capacity, flow stops

    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.2 Test: Overflow Handling");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut state = RefineryState::new();

    // Large source tank
    let source = Tank::new("T_SOURCE".to_string(), "Source".to_string(), (10.0, 10.0), 2000.0);
    state.add_tank(source);

    // Small destination tank (200 m³ capacity)
    let dest = Tank::new("T_DEST".to_string(), "Destination".to_string(), (30.0, 10.0), 200.0);
    state.add_tank(dest);

    // Large pipe (fast flow)
    let pipe = Pipe::new(
        "P_BIG".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        1.0, 0.5e-5, 1.0, 5.0e6, 298.15, FluidType::CrudeOil,
    );
    state.add_pipe(pipe);

    // Fill source
    if let Some(tank) = state.get_tank_mut("T_SOURCE") {
        tank.current_volume = 2000.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    println!("Initial: Source=2000 m³, Dest=0 m³ (capacity=200 m³)");

    let mut sim = RefinerySimulation::new(state, 0.5);

    let connection = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_BIG".to_string(),
        direction: 1.0,
    };
    sim.add_connection(connection);

    // Run until overflow would happen
    for _ in 0..40 { // 20 seconds
        sim.step().unwrap();
    }

    let dest_final = sim.state().get_tank("T_DEST").unwrap().current_volume;
    let dest_capacity = sim.state().get_tank("T_DEST").unwrap().capacity;

    println!("Final: Dest={:.1} m³ (capacity={:.1} m³)", dest_final, dest_capacity);

    // Destination should not exceed capacity
    assert!(dest_final <= dest_capacity + 0.1, "Tank should not overflow");

    // Tank should be nearly full (within tolerance of capacity)
    assert!(dest_final >= dest_capacity - 10.0, "Tank should be nearly full");

    println!("\n✓ Test PASSED: Overflow handled correctly\n");
}

#[test]
fn test_pressure_differential_flow() {
    // Test: Flow rate matches pressure difference

    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 10.2 Test: Pressure Differential → Flow Rate");
    println!("═══════════════════════════════════════════════════════════════\n");

    let mut state = RefineryState::new();

    let source = Tank::new("T_SOURCE".to_string(), "Source".to_string(), (10.0, 10.0), 1000.0);
    let dest = Tank::new("T_DEST".to_string(), "Dest".to_string(), (30.0, 10.0), 1000.0);
    state.add_tank(source);
    state.add_tank(dest);

    // Pipe with high pressure (5 MPa)
    let high_pressure_pipe = Pipe::new(
        "P_HIGH".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        0.5, 0.5e-5, 0.0, 5.0e6, 298.15, FluidType::CrudeOil,
    );
    state.add_pipe(high_pressure_pipe);

    if let Some(tank) = state.get_tank_mut("T_SOURCE") {
        tank.current_volume = 1000.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    let mut sim = RefinerySimulation::new(state, 0.5);

    let connection = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_HIGH".to_string(),
        direction: 1.0,
    };
    sim.add_connection(connection);

    sim.step().unwrap();

    let high_flow = sim.state().get_pipe("P_HIGH").unwrap().flow_rate.abs();

    // Reset with low pressure (1 MPa)
    let mut state2 = RefineryState::new();
    let source2 = Tank::new("T_SOURCE".to_string(), "Source".to_string(), (10.0, 10.0), 1000.0);
    let dest2 = Tank::new("T_DEST".to_string(), "Dest".to_string(), (30.0, 10.0), 1000.0);
    state2.add_tank(source2);
    state2.add_tank(dest2);

    let low_pressure_pipe = Pipe::new(
        "P_LOW".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        0.5, 0.5e-5, 0.0, 1.0e6, 298.15, FluidType::CrudeOil,
    );
    state2.add_pipe(low_pressure_pipe);

    if let Some(tank) = state2.get_tank_mut("T_SOURCE") {
        tank.current_volume = 1000.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    let mut sim2 = RefinerySimulation::new(state2, 0.5);

    let connection2 = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_LOW".to_string(),
        direction: 1.0,
    };
    sim2.add_connection(connection2);

    sim2.step().unwrap();

    let low_flow = sim2.state().get_pipe("P_LOW").unwrap().flow_rate.abs();

    println!("  High pressure (5 MPa): Flow = {:.3} m³/s", high_flow);
    println!("  Low pressure (1 MPa): Flow = {:.3} m³/s", low_flow);
    println!("  Ratio: {:.2}x", high_flow / low_flow);

    // Higher pressure should produce higher flow
    // (Darcy-Weisbach: flow ∝ sqrt(pressure_drop))
    assert!(high_flow > low_flow, "Higher pressure should produce higher flow");

    // Check approximate relationship
    // For turbulent flow, Q ∝ √(ΔP), but friction factor decreases with Re
    // so the ratio can be larger than √(pressure_ratio)
    let ratio = high_flow / low_flow;
    assert!(ratio > 2.0 && ratio < 10.0, "Flow ratio should be reasonable: {:.2}", ratio);

    println!("\n✓ Test PASSED: Flow rate matches pressure differential\n");
}

fn main() {
    println!("\n🧪 Running Phase 10.2 - Dynamic Fluid Flow Tests");
    println!("========================================\n");

    test_fluid_flow_single_pipe();
    test_fluid_flow_network();
    test_overflow_handling();
    test_pressure_differential_flow();

    println!("\n🎉 All Phase 10.2 tests PASSED!");
    println!("========================================\n");
}