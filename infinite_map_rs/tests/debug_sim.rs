//! Minimal simulation test

use infinite_map_rs::refinery::simulation::{RefinerySimulation, NetworkConnection};
use infinite_map_rs::refinery::types::{RefineryState, Pipe, Tank, FluidType};

fn main() {
    let mut state = RefineryState::new();

    // Source tank
    let source = Tank::new("T_SOURCE".to_string(), "Source".to_string(), (10.0, 10.0), 1000.0);
    state.add_tank(source);

    // Destination tank
    let dest = Tank::new("T_DEST".to_string(), "Dest".to_string(), (30.0, 10.0), 1000.0);
    state.add_tank(dest);

    // Pipe
    let pipe = Pipe::new(
        "P_TRANSFER".to_string(),
        (15.0, 10.0),
        (25.0, 10.0),
        0.5,
        4.6e-5,
        0.1,
        2.0e6,
        298.15,
        FluidType::CrudeOil,
    );
    state.add_pipe(pipe);

    // Fill source tank
    if let Some(tank) = state.get_tank_mut("T_SOURCE") {
        tank.current_volume = 1000.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    println!("Initial state:");
    println!("  Source: {:.1} m³", state.get_tank("T_SOURCE").unwrap().current_volume);
    println!("  Dest: {:.1} m³", state.get_tank("T_DEST").unwrap().current_volume);
    println!("  Pipe pressure: {:.2} MPa", state.get_pipe("P_TRANSFER").unwrap().pressure / 1e6);

    let mut sim = RefinerySimulation::new(state, 0.5);

    let conn = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_TRANSFER".to_string(),
        direction: 1.0,
    };
    sim.add_connection(conn);

    println!("\nRunning simulation...");
    for i in 0..5 {
        println!("\nStep {} (t={:.1}s)", i+1, sim.current_time());
        match sim.step() {
            Ok(_) => {
                println!("  Source: {:.1} m³", sim.state().get_tank("T_SOURCE").unwrap().current_volume);
                println!("  Dest: {:.1} m³", sim.state().get_tank("T_DEST").unwrap().current_volume);
                println!("  Pipe flow: {:.4} m³/s", sim.state().get_pipe("P_TRANSFER").unwrap().flow_rate);
            }
            Err(e) => {
                println!("  ERROR: {:?}", e);
            }
        }
    }
}