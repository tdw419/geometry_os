//! Refinery simulation orchestrator
//!
//! Manages time-stepping and updates simulation state for refinery components.

use super::types::{RefineryState, Pipe, Tank, FluidType};
use super::physics::{PipePhysics, fluid_properties};
use std::collections::HashMap;

/// Simulation error
#[derive(Debug, Clone, PartialEq)]
pub enum SimulationError {
    /// Tank not found
    TankNotFound(String),
    /// Pipe not found
    PipeNotFound(String),
    /// Physics calculation error
    PhysicsError(String),
    /// Invalid network topology
    InvalidTopology(String),
}

impl std::fmt::Display for SimulationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SimulationError::TankNotFound(id) => {
                write!(f, "Tank not found: {}", id)
            }
            SimulationError::PipeNotFound(id) => {
                write!(f, "Pipe not found: {}", id)
            }
            SimulationError::PhysicsError(msg) => {
                write!(f, "Physics error: {}", msg)
            }
            SimulationError::InvalidTopology(msg) => {
                write!(f, "Invalid network topology: {}", msg)
            }
        }
    }
}

impl std::error::Error for SimulationError {}

/// Network connection description
#[derive(Debug, Clone)]
pub struct NetworkConnection {
    /// Source tank ID (or None for external feed)
    pub source_tank_id: Option<String>,
    /// Destination tank ID (or None for external output)
    pub dest_tank_id: Option<String>,
    /// Pipe ID connecting them
    pub pipe_id: String,
    /// Direction factor: 1.0 for source→dest, -1.0 for dest→source
    pub direction: f64,
}

/// Refinery simulation orchestrator
pub struct RefinerySimulation {
    /// Current refinery state
    state: RefineryState,
    /// Network topology: which pipes connect which tanks
    pub connections: Vec<NetworkConnection>,
    /// Simulation time step (seconds)
    dt: f64,
    /// External feed pressure (Pa) for source tanks
    external_feed_pressure: f64,
}

impl RefinerySimulation {
    /// Create a new refinery simulation
    pub fn new(state: RefineryState, dt: f64) -> Self {
        RefinerySimulation {
            state,
            connections: vec![],
            dt,
            external_feed_pressure: 5.0e6, // 5 MPa default
        }
    }

    /// Set simulation time step
    pub fn set_dt(&mut self, dt: f64) {
        self.dt = dt;
    }

    /// Get current simulation time
    pub fn current_time(&self) -> f64 {
        self.state.time
    }

    /// Set network connections
    pub fn set_connections(&mut self, connections: Vec<NetworkConnection>) {
        self.connections = connections;
    }

    /// Get reference to refinery state
    pub fn state(&self) -> &RefineryState {
        &self.state
    }

    /// Get mutable reference to refinery state
    pub fn state_mut(&mut self) -> &mut RefineryState {
        &mut self.state
    }

    /// Add a network connection
    pub fn add_connection(&mut self, connection: NetworkConnection) {
        self.connections.push(connection);
    }

    /// Update pipe flow rates based on pressure differences
    fn update_pipe_flows(&mut self) -> Result<(), SimulationError> {
        // First pass: collect pressure differences for all connections
        let mut pressure_diffs: Vec<(String, f64, f64)> = Vec::new(); // (pipe_id, source_pressure, dest_pressure)

        for connection in &self.connections {
            let source_pressure = if let Some(ref tank_id) = connection.source_tank_id {
                // Tank pressure based on fluid head (simplified)
                // P = P_atmospheric + ρ × g × h
                if let Some(tank) = self.state.get_tank(tank_id) {
                    if let Some(fluid_type) = tank.fluid_type {
                        let density = fluid_type.density_at_std_temp();
                        let gravity = 9.81; // m/s²
                        // Assume cylindrical tank with diameter = 10m (arbitrary but reasonable)
                        let tank_area = std::f64::consts::PI * (10.0_f64 / 2.0_f64).powi(2);
                        let fluid_height = tank.current_volume / tank_area;
                        let hydrostatic_pressure = density * gravity * fluid_height;
                        101325.0 + hydrostatic_pressure // Atmospheric pressure + hydrostatic head
                    } else {
                        101325.0 // Empty tank = atmospheric pressure
                    }
                } else {
                    return Err(SimulationError::TankNotFound(tank_id.clone()));
                }
            } else {
                // External feed pressure (use pipe's pressure if set, otherwise external_feed_pressure)
                if let Some(pipe) = self.state.get_pipe(&connection.pipe_id) {
                    pipe.pressure
                } else {
                    self.external_feed_pressure
                }
            };

            let dest_pressure = if let Some(ref tank_id) = connection.dest_tank_id {
                // Tank pressure based on fluid head (simplified)
                if let Some(tank) = self.state.get_tank(tank_id) {
                    if let Some(fluid_type) = tank.fluid_type {
                        let density = fluid_type.density_at_std_temp();
                        let gravity = 9.81;
                        let tank_area = std::f64::consts::PI * (10.0_f64 / 2.0_f64).powi(2);
                        let fluid_height = tank.current_volume / tank_area;
                        let hydrostatic_pressure = density * gravity * fluid_height;
                        101325.0 + hydrostatic_pressure
                    } else {
                        101325.0
                    }
                } else {
                    return Err(SimulationError::TankNotFound(tank_id.clone()));
                }
            } else {
                0.0 // Atmospheric pressure (or gauge pressure reference)
            };

            let pressure_diff = (source_pressure - dest_pressure) * connection.direction;
            pressure_diffs.push((connection.pipe_id.clone(), pressure_diff, source_pressure));
        }

        // Second pass: update pipe flow rates
        for (pipe_id, pressure_diff, source_pressure) in pressure_diffs {
            let pipe = self.state.get_pipe_mut(&pipe_id)
                .ok_or_else(|| SimulationError::PipeNotFound(pipe_id.clone()))?;

            // Use pipe's stored pressure if hydrostatic differential is too small
            // Fall back to pipe pressure if hydrostatic diff < 10% of pipe pressure
            let effective_pressure_drop = if pressure_diff.abs() < pipe.pressure * 0.1 {
                // Use pipe's stored pressure for driving flow (pump/compressor override)
                pipe.pressure
            } else {
                pressure_diff.abs()
            };

            // Create pipe physics and calculate flow rate
            let physics = PipePhysics::new(pipe.length, pipe.diameter, pipe.roughness)
                .map_err(|e| SimulationError::PhysicsError(e.to_string()))?;

            let fluid_props = fluid_properties(pipe.fluid_type, pipe.temperature);

            // Calculate flow rate from pressure drop
            let flow_rate = match physics.flow_rate_from_pressure_drop(effective_pressure_drop, &fluid_props) {
                Ok(rate) => rate,
                Err(e) => return Err(SimulationError::PhysicsError(e.to_string())),
            };

            // Apply direction based on pressure gradient
            pipe.flow_rate = flow_rate * pressure_diff.signum();
        }

        Ok(())
    }

    /// Update tank volumes based on pipe flows
    fn update_tank_volumes(&mut self) -> Result<(), SimulationError> {
        // Track volume changes per tank
        let mut volume_changes: HashMap<String, f64> = HashMap::new();

        for connection in &self.connections {
            // Calculate volume transferred
            let volume_transfer = self.state.get_pipe(&connection.pipe_id)
                .map(|p| p.flow_rate * self.dt)
                .unwrap_or(0.0);

            // Update source tank
            if let Some(ref tank_id) = connection.source_tank_id {
                *volume_changes.entry(tank_id.clone()).or_insert(0.0) -= volume_transfer;
            }

            // Update destination tank
            if let Some(ref tank_id) = connection.dest_tank_id {
                *volume_changes.entry(tank_id.clone()).or_insert(0.0) += volume_transfer;
            }
        }

        // Apply volume changes to tanks
        // Collect fluid info before mutations to avoid borrow conflicts
        let mut fluid_info_map: HashMap<String, Option<(FluidType, f64)>> = HashMap::new();
        for connection in &self.connections {
            if let Some(ref dest_id) = connection.dest_tank_id {
                fluid_info_map
                    .entry(dest_id.clone())
                    .or_insert_with(|| {
                        self.state
                            .get_pipe(&connection.pipe_id)
                            .map(|p| (p.fluid_type, p.temperature))
                    });
            }
        }

        for (tank_id, delta_volume) in volume_changes {
            if let Some(tank) = self.state.get_tank_mut(&tank_id) {
                let new_volume = (tank.current_volume + delta_volume).clamp(0.0, tank.capacity);

                // Update tank volume
                tank.current_volume = new_volume;

                // Update fluid type if this is the first fill
                if tank.current_volume > 0.0 && tank.fluid_type.is_none() {
                    if let Some(Some((fluid_type, temperature))) = fluid_info_map.get(&tank_id) {
                        tank.fluid_type = Some(*fluid_type);
                        tank.temperature = *temperature;
                    }
                }
            }
        }

        Ok(())
    }

    /// Advance simulation by one time step
    pub fn step(&mut self) -> Result<(), SimulationError> {
        // Update pipe flow rates based on current pressures
        self.update_pipe_flows()?;

        // Update tank volumes based on pipe flows
        self.update_tank_volumes()?;

        // Advance simulation time
        self.state.time += self.dt;

        Ok(())
    }

    /// Run simulation for specified duration
    pub fn run(&mut self, duration: f64) -> Result<(), SimulationError> {
        let steps = (duration / self.dt).ceil() as usize;

        for _ in 0..steps {
            self.step()?;
        }

        Ok(())
    }

    /// Create a simple MVP refinery layout (atmospheric distillation column)
    pub fn create_mvp_layout() -> (RefineryState, Vec<NetworkConnection>) {
        let mut state = RefineryState::new();

        // Create feed pipe
        let feed_pipe = Pipe::new(
            "P_FEED".to_string(),
            (0.0, 50.0),    // Start position
            (10.0, 50.0),   // End position (entering column)
            0.5,           // 0.5m diameter
            4.6e-5,        // Commercial steel roughness
            0.1,           // Initial flow rate (m³/s)
            5.0e6,         // 5 MPa
            298.15,        // 25°C
            FluidType::CrudeOil,
        );
        state.add_pipe(feed_pipe);

        // Create product tanks
        let naphtha_tank = Tank::new("T_NAPHTHA".to_string(), "Naphtha Tank".to_string(), (20.0, 10.0), 500.0);
        let diesel_tank = Tank::new("T_DIESEL".to_string(), "Diesel Tank".to_string(), (30.0, 10.0), 800.0);
        let gasoline_tank = Tank::new("T_GASOLINE".to_string(), "Gasoline Tank".to_string(), (40.0, 10.0), 600.0);

        state.add_tank(naphtha_tank);
        state.add_tank(diesel_tank);
        state.add_tank(gasoline_tank);

        // Create network connections
        let connections = vec![
            NetworkConnection {
                source_tank_id: None,  // External feed
                dest_tank_id: None,   // Column (not modeled as tank in MVP)
                pipe_id: "P_FEED".to_string(),
                direction: 1.0,
            },
        ];

        (state, connections)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simulation_creation() {
        let state = RefineryState::new();
        let sim = RefinerySimulation::new(state, 1.0);
        assert_eq!(sim.current_time(), 0.0);
    }

    #[test]
    fn test_simulation_step() {
        let (state, connections) = RefinerySimulation::create_mvp_layout();
        let mut sim = RefinerySimulation::new(state, 1.0);

        for conn in connections {
            sim.add_connection(conn);
        }

        // Should advance time
        assert!(sim.step().is_ok());
        assert_eq!(sim.current_time(), 1.0);
    }

    #[test]
    fn test_mvp_layout_creation() {
        let (state, connections) = RefinerySimulation::create_mvp_layout();

        assert_eq!(state.pipes.len(), 1);
        assert_eq!(state.tanks.len(), 3);
        assert_eq!(connections.len(), 1);
    }

    #[test]
    fn test_tank_volume_clamping() {
        let (state, connections) = RefinerySimulation::create_mvp_layout();
        let mut sim = RefinerySimulation::new(state, 0.1);

        for conn in connections {
            sim.add_connection(conn);
        }

        // Run simulation - tanks should stay within bounds
        for _ in 0..100 {
            sim.step().unwrap();
        }

        for tank in &sim.state().tanks {
            assert!(tank.current_volume >= 0.0);
            assert!(tank.current_volume <= tank.capacity);
        }
    }

    #[test]
    fn test_external_feed_pressure() {
        let mut sim = RefinerySimulation::new(RefineryState::new(), 1.0);

        assert_eq!(sim.external_feed_pressure, 5.0e6);

        sim.external_feed_pressure = 3.0e6;
        assert_eq!(sim.external_feed_pressure, 3.0e6);
    }
}