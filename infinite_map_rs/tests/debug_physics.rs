//! Minimal debug test for fluid physics

use infinite_map_rs::refinery::physics::{fluid_properties, PipePhysics};
use infinite_map_rs::refinery::types::FluidType;

fn main() {
    let pipe = PipePhysics::new(50.0, 0.5, 1e-5).unwrap();
    let fluid_props = fluid_properties(FluidType::CrudeOil, 298.15);

    println!("Pipe physics test");
    println!("==================");
    println!("Length: {} m", pipe.length);
    println!("Diameter: {} m", pipe.diameter);
    println!("Roughness: {} m", pipe.roughness);
    println!();
    println!("Fluid properties:");
    println!("  Density: {} kg/m³", fluid_props.density);
    println!("  Viscosity: {} Pa·s", fluid_props.viscosity);
    println!();

    // Test flow rate from different pressure drops
    let pressures = vec![0.107e6, 0.5e6, 1.0e6, 2.0e6];

    for pressure in pressures {
        match pipe.flow_rate_from_pressure_drop(pressure, &fluid_props) {
            Ok(flow_rate) => {
                let velocity = pipe.flow_velocity(flow_rate);
                let re = pipe.reynolds_number(velocity, &fluid_props);
                println!("ΔP = {:.3} MPa → Q = {:.4} m³/s, v = {:.2} m/s, Re = {:.0}",
                    pressure / 1e6, flow_rate, velocity, re);
            }
            Err(e) => {
                println!("ΔP = {:.3} MPa → ERROR: {}", pressure / 1e6, e);
            }
        }
    }
}