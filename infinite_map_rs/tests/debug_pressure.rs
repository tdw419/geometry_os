//! Debug simulation with pressure logging

use infinite_map_rs::refinery::simulation::{NetworkConnection, RefinerySimulation};
use infinite_map_rs::refinery::types::{FluidType, Pipe, RefineryState, Tank};

fn main() {
    let mut state = RefineryState::new();

    let source = Tank::new(
        "T_SOURCE".to_string(),
        "Source".to_string(),
        (10.0, 10.0),
        1000.0,
    );
    state.add_tank(source);

    let dest = Tank::new("T_DEST".to_string(), "Dest".to_string(), (30.0, 10.0), 1000.0);
    state.add_tank(dest);

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

    if let Some(tank) = state.get_tank_mut("T_SOURCE") {
        tank.current_volume = 1000.0;
        tank.fluid_type = Some(FluidType::CrudeOil);
    }

    println!("=== Pressure Calculation Debug ===");
    let density = FluidType::CrudeOil.density_at_std_temp();
    let gravity = 9.81_f64;
    let tank_area = std::f64::consts::PI * (10.0_f64 / 2.0_f64).powi(2);

    let source_vol = state.get_tank("T_SOURCE").unwrap().current_volume;
    let source_height = source_vol / tank_area;
    let source_hydro = density * gravity * source_height;
    let source_total = 101325.0_f64 + source_hydro;

    let dest_vol = state.get_tank("T_DEST").unwrap().current_volume;
    let dest_type = state.get_tank("T_DEST").unwrap().fluid_type;
    let dest_total = if let Some(ft) = dest_type {
        let dest_height = dest_vol / tank_area;
        let dest_density = ft.density_at_std_temp();
        101325.0_f64 + dest_density * gravity * dest_height
    } else {
        101325.0_f64
    };

    println!(
        "Source tank: vol={:.1} m³, height={:.2} m, hydrostatic={:.0} Pa, total={:.0} Pa ({:.3} MPa)",
        source_vol, source_height, source_hydro, source_total, source_total / 1e6_f64
    );
    println!(
        "Dest tank: vol={:.1} m³, fluid_type={:?}, total={:.0} Pa ({:.3} MPa)",
        dest_vol, dest_type, dest_total, dest_total / 1e6_f64
    );
    println!(
        "Pressure diff: {:.0} Pa ({:.3} MPa)",
        source_total - dest_total,
        (source_total - dest_total) / 1e6_f64
    );
    println!("Pipe pressure: {:.0} Pa ({:.3} MPa)", 2.0e6_f64, 2.0_f64);
    println!(
        "Threshold: {:.0} Pa ({:.3} MPa) [10% of pipe pressure]",
        2.0e6_f64 * 0.1_f64,
        2.0_f64 * 0.1_f64
    );
    println!(
        "Use pipe pressure? {}",
        (source_total - dest_total).abs() < 2.0e6_f64 * 0.1_f64
    );

    let mut sim = RefinerySimulation::new(state, 0.5_f64);

    let conn = NetworkConnection {
        source_tank_id: Some("T_SOURCE".to_string()),
        dest_tank_id: Some("T_DEST".to_string()),
        pipe_id: "P_TRANSFER".to_string(),
        direction: 1.0_f64,
    };
    sim.add_connection(conn);

    sim.step().unwrap();

    println!("\n=== After first step ===");
    println!(
        "Pipe flow rate: {:.4} m³/s",
        sim.state().get_pipe("P_TRANSFER").unwrap().flow_rate
    );
}