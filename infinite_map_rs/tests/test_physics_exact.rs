//! Test physics with exact pipe pressure

use infinite_map_rs::refinery::physics::{fluid_properties, PipePhysics};
use infinite_map_rs::refinery::types::FluidType;

fn main() {
    let pipe = PipePhysics::new(50.0, 0.5, 4.6e-5).unwrap();
    let fluid_props = fluid_properties(FluidType::CrudeOil, 298.15);

    println!("Testing pipe physics:");
    println!("  Length: {} m", pipe.length);
    println!("  Diameter: {} m", pipe.diameter);
    println!("  Roughness: {} m", pipe.roughness);
    println!();

    // Test with exact pipe pressure from test
    let test_pressure = 2_000_000.0; // 2.0 MPa
    
    println!("Testing with pressure drop: {} Pa ({:.3} MPa)", test_pressure, test_pressure / 1e6);
    
    let area = pipe.cross_sectional_area();
    println!("  Cross-sectional area: {:.6} m²", area);
    
    let result = pipe.flow_rate_from_pressure_drop(test_pressure, &fluid_props);
    match result {
        Ok(flow_rate) => {
            let velocity = pipe.flow_velocity(flow_rate);
            let re = pipe.reynolds_number(velocity, &fluid_props);
            println!("  Result: OK");
            println!("    Flow rate: {:.4} m³/s", flow_rate);
            println!("    Velocity: {:.4} m/s", velocity);
            println!("    Reynolds: {:.0}", re);
        }
        Err(e) => {
            println!("  Result: ERROR - {:?}", e);
        }
    }
}