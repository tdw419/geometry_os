//! 1D fluid flow physics simulation for pipes
//!
//! Implements Darcy-Weisbach equation, friction factor calculation,
//! and fluid property models for crude oil and refined products.

use super::types::FluidType;

/// Physics errors
#[derive(Debug, Clone, PartialEq)]
pub enum PhysicsError {
    /// Invalid pipe parameters
    InvalidPipeParameters(String),
    /// Friction factor calculation failed to converge
    FrictionFactorConvergenceFailed,
    /// Invalid flow conditions
    InvalidFlowConditions(String),
}

impl std::fmt::Display for PhysicsError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            PhysicsError::InvalidPipeParameters(msg) => {
                write!(f, "Invalid pipe parameters: {}", msg)
            }
            PhysicsError::FrictionFactorConvergenceFailed => {
                write!(f, "Friction factor calculation failed to converge")
            }
            PhysicsError::InvalidFlowConditions(msg) => {
                write!(f, "Invalid flow conditions: {}", msg)
            }
        }
    }
}

impl std::error::Error for PhysicsError {}

/// Fluid properties at given temperature
#[derive(Debug, Clone)]
pub struct FluidProperties {
    /// Density in kg/m³
    pub density: f64,
    /// Dynamic viscosity in Pa·s
    pub viscosity: f64,
    /// Temperature in Kelvin
    pub temperature: f64,
}

/// Calculate fluid properties based on type and temperature
pub fn fluid_properties(fluid_type: FluidType, temperature_k: f64) -> FluidProperties {
    // Convert Kelvin to Celsius for empirical correlations
    let temp_c = temperature_k - 273.15;

    match fluid_type {
        FluidType::CrudeOil => {
            // Crude oil density: ρ = A - B*T (T in Celsius)
            // Density decreases with temperature
            let density = 851.0 - 0.7 * temp_c;

            // Crude oil viscosity (Andrade equation): μ = A * exp(B/T)
            // Simplified correlation
            let viscosity = 0.371e-3 * (298.15 / temperature_k).powf(3.5);

            FluidProperties {
                density,
                viscosity,
                temperature: temperature_k,
            }
        }
        FluidType::Diesel => {
            let density = 832.0 - 0.7 * temp_c;
            let viscosity = 3.0e-3 * (298.15 / temperature_k).powf(4.0);

            FluidProperties {
                density,
                viscosity,
                temperature: temperature_k,
            }
        }
        FluidType::Gasoline => {
            let density = 745.0 - 0.9 * temp_c;
            let viscosity = 0.6e-3 * (298.15 / temperature_k).powf(3.0);

            FluidProperties {
                density,
                viscosity,
                temperature: temperature_k,
            }
        }
        FluidType::Naphtha => {
            let density = 705.0 - 0.8 * temp_c;
            let viscosity = 0.4e-3 * (298.15 / temperature_k).powf(3.0);

            FluidProperties {
                density,
                viscosity,
                temperature: temperature_k,
            }
        }
        FluidType::HeavyFuelOil => {
            let density = 980.0 - 0.5 * temp_c;
            let viscosity = 600e-3 * (298.15 / temperature_k).powf(6.0);

            FluidProperties {
                density,
                viscosity,
                temperature: temperature_k,
            }
        }
    }
}

/// Pipe physics calculations
pub struct PipePhysics {
    /// Pipe length in meters
    pub length: f64,
    /// Pipe internal diameter in meters
    pub diameter: f64,
    /// Pipe roughness height in meters
    pub roughness: f64,
}

impl PipePhysics {
    /// Create new pipe physics validator
    pub fn new(length: f64, diameter: f64, roughness: f64) -> Result<Self, PhysicsError> {
        if length <= 0.0 {
            return Err(PhysicsError::InvalidPipeParameters(
                "Length must be positive".to_string(),
            ));
        }
        if diameter <= 0.0 {
            return Err(PhysicsError::InvalidPipeParameters(
                "Diameter must be positive".to_string(),
            ));
        }
        if roughness < 0.0 {
            return Err(PhysicsError::InvalidPipeParameters(
                "Roughness must be non-negative".to_string(),
            ));
        }

        Ok(PipePhysics {
            length,
            diameter,
            roughness,
        })
    }

    /// Calculate cross-sectional area of pipe
    pub fn cross_sectional_area(&self) -> f64 {
        let radius = self.diameter / 2.0;
        std::f64::consts::PI * radius * radius
    }

    /// Calculate flow velocity from volumetric flow rate
    pub fn flow_velocity(&self, flow_rate: f64) -> f64 {
        if self.cross_sectional_area() > 0.0 {
            flow_rate / self.cross_sectional_area()
        } else {
            0.0
        }
    }

    /// Calculate Reynolds number
    pub fn reynolds_number(&self, velocity: f64, fluid_props: &FluidProperties) -> f64 {
        if fluid_props.viscosity > 0.0 && self.diameter > 0.0 {
            (fluid_props.density * velocity * self.diameter) / fluid_props.viscosity
        } else {
            0.0
        }
    }

    /// Calculate friction factor using Colebrook-White equation (iterative)
    pub fn friction_factor(&self, reynolds_number: f64) -> Result<f64, PhysicsError> {
        if reynolds_number <= 0.0 {
            return Err(PhysicsError::InvalidFlowConditions(
                "Reynolds number must be positive".to_string(),
            ));
        }

        // Laminar flow (Re < 2300)
        if reynolds_number < 2300.0 {
            return Ok(64.0 / reynolds_number);
        }

        // Turbulent flow: Colebrook-White equation (iterative solution)
        // 1/sqrt(f) = -2 * log10( (ε/D) / 3.7 + 2.51 / (Re * sqrt(f)) )

        let relative_roughness = self.roughness / self.diameter;
        let mut f: f64 = 0.02; // Initial guess for friction factor
        const TOLERANCE: f64 = 1e-6;
        const MAX_ITERATIONS: u32 = 100;

        for iteration in 0..MAX_ITERATIONS {
            let sqrt_f = f64::sqrt(f);

            // Colebrook-White equation rearranged for iteration
            let term1 = relative_roughness / 3.7;
            let term2 = 2.51 / (reynolds_number * sqrt_f);
            let new_f: f64 = 1.0 / (-2.0 * (term1 + term2).log10()).powi(2);

            let error = (new_f - f).abs();

            if error < TOLERANCE {
                return Ok(new_f);
            }

            f = new_f;
        }

        Err(PhysicsError::FrictionFactorConvergenceFailed)
    }

    /// Calculate pressure drop using Darcy-Weisbach equation
    ///
    /// ΔP = f * (L/D) * (ρ * v² / 2)
    pub fn pressure_drop(
        &self,
        flow_rate: f64,
        fluid_props: &FluidProperties,
    ) -> Result<f64, PhysicsError> {
        let velocity = self.flow_velocity(flow_rate);
        let re = self.reynolds_number(velocity, fluid_props);
        let f = self.friction_factor(re)?;

        // Darcy-Weisbach equation
        let pressure_drop = f * (self.length / self.diameter)
            * (fluid_props.density * velocity.powi(2) / 2.0);

        Ok(pressure_drop)
    }

    /// Calculate pressure drop with given velocity
    pub fn pressure_drop_from_velocity(
        &self,
        velocity: f64,
        fluid_props: &FluidProperties,
    ) -> Result<f64, PhysicsError> {
        let re = self.reynolds_number(velocity, fluid_props);
        let f = self.friction_factor(re)?;

        let pressure_drop = f * (self.length / self.diameter)
            * (fluid_props.density * velocity.powi(2) / 2.0);

        Ok(pressure_drop)
    }

    /// Calculate flow rate from pressure drop (inverse Darcy-Weisbach)
    pub fn flow_rate_from_pressure_drop(
        &self,
        pressure_drop: f64,
        fluid_props: &FluidProperties,
    ) -> Result<f64, PhysicsError> {
        if pressure_drop <= 0.0 {
            return Ok(0.0);
        }

        // This requires iterative solution since friction factor depends on Reynolds
        // Use simple approximation for laminar flow, iteration for turbulent
        let area = self.cross_sectional_area();

        // Initial guess: laminar flow assumption
        let v_initial = (pressure_drop * self.diameter) / (32.0 * fluid_props.viscosity * self.length);
        let re_initial = self.reynolds_number(v_initial, fluid_props);

        if re_initial < 2300.0 {
            // Laminar flow - use Hagen-Poiseuille equation directly
            let flow_rate = (pressure_drop * std::f64::consts::PI * self.diameter.powi(4))
                / (128.0 * fluid_props.viscosity * self.length);
            return Ok(flow_rate);
        }

        // Turbulent flow - iterate to find velocity
        let mut velocity = v_initial;
        const MAX_ITERATIONS: u32 = 50;
        const TOLERANCE: f64 = 1e-4;

        for _iteration in 0..MAX_ITERATIONS {
            let re = self.reynolds_number(velocity, fluid_props);
            let f = self.friction_factor(re)?;

            // Darcy-Weisbach: ΔP = f * (L/D) * (ρ * v² / 2)
            // Solve for v: v = sqrt(2 * ΔP * D / (f * L * ρ))
            let new_velocity = f64::sqrt(2.0 * pressure_drop * self.diameter
                / (f * self.length * fluid_props.density));

            let error = (new_velocity - velocity).abs();

            if error < TOLERANCE {
                return Ok(new_velocity * area);
            }

            velocity = new_velocity;
        }

        Err(PhysicsError::FrictionFactorConvergenceFailed)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pipe_physics_creation() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5);
        assert!(physics.is_ok());

        let invalid = PipePhysics::new(-1.0, 0.5, 1e-5);
        assert!(invalid.is_err());
    }

    #[test]
    fn test_cross_sectional_area() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let area = physics.cross_sectional_area();
        let radius = 0.5 / 2.0;
        let expected = std::f64::consts::PI * radius * radius;
        assert!((area - expected).abs() < 1e-10);
    }

    #[test]
    fn test_flow_velocity() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let flow_rate = 0.1; // m³/s
        let velocity = physics.flow_velocity(flow_rate);
        assert!(velocity > 0.0);
    }

    #[test]
    fn test_fluid_properties_crude_oil() {
        let props = fluid_properties(FluidType::CrudeOil, 298.15); // 25°C
        let expected_density = 851.0 - 0.7 * (298.15 - 273.15); // 833.5 at 25°C
        assert!((props.density - expected_density).abs() < 1.0);
        assert!(props.viscosity > 0.0);
    }

    #[test]
    fn test_fluid_properties_temperature_effect() {
        let props_cold = fluid_properties(FluidType::CrudeOil, 273.15); // 0°C
        let props_hot = fluid_properties(FluidType::CrudeOil, 373.15); // 100°C

        // Density decreases with temperature
        assert!(props_hot.density < props_cold.density);

        // Viscosity decreases with temperature
        assert!(props_hot.viscosity < props_cold.viscosity);
    }

    #[test]
    fn test_laminar_friction_factor() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let re = 1000.0; // Laminar flow
        let f = physics.friction_factor(re).unwrap();
        let expected = 64.0 / re;
        assert!((f - expected).abs() < 1e-10);
    }

    #[test]
    fn test_turbulent_friction_factor() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let re = 10000.0; // Turbulent flow
        let f = physics.friction_factor(re);
        assert!(f.is_ok());
        let f_value = f.unwrap();
        assert!(f_value > 0.0 && f_value < 0.1);
    }

    #[test]
    fn test_pressure_drop_calculation() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let flow_rate = 0.1; // m³/s
        let props = fluid_properties(FluidType::CrudeOil, 298.15);
        let pressure_drop = physics.pressure_drop(flow_rate, &props);
        assert!(pressure_drop.is_ok());
        assert!(pressure_drop.unwrap() > 0.0);
    }

    #[test]
    fn test_pressure_drop_increases_with_length() {
        let physics_short = PipePhysics::new(50.0, 0.5, 1e-5).unwrap();
        let physics_long = PipePhysics::new(200.0, 0.5, 1e-5).unwrap();

        let flow_rate = 0.1;
        let props = fluid_properties(FluidType::CrudeOil, 298.15);

        let drop_short = physics_short.pressure_drop(flow_rate, &props).unwrap();
        let drop_long = physics_long.pressure_drop(flow_rate, &props).unwrap();

        assert!(drop_long > drop_short);
        // Should be roughly 4x (200/50)
        assert!((drop_long / drop_short - 4.0).abs() < 0.5);
    }

    #[test]
    fn test_flow_rate_from_pressure_drop() {
        let physics = PipePhysics::new(100.0, 0.5, 1e-5).unwrap();
        let props = fluid_properties(FluidType::CrudeOil, 298.15);

        // Calculate pressure drop for a given flow rate
        let original_flow = 0.1;
        let pressure_drop = physics.pressure_drop(original_flow, &props).unwrap();

        // Invert to get flow rate back
        let calculated_flow = physics
            .flow_rate_from_pressure_drop(pressure_drop, &props)
            .unwrap();

        // Should be close to original
        assert!((calculated_flow - original_flow).abs() / original_flow < 0.01);
    }
}