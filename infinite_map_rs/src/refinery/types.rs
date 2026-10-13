//! Refinery data structures - Phase 1 MVP
//!
//! Core types for simulating a crude oil refinery with spatial integration.

use std::fmt;

/// Fluid types flowing through the refinery
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FluidType {
    /// Raw crude oil from feed
    CrudeOil,
    /// Diesel product
    Diesel,
    /// Gasoline product
    Gasoline,
    /// Naphtha product
    Naphtha,
    /// Heavy fuel oil
    HeavyFuelOil,
}

impl FluidType {
    /// Get fluid density at standard temperature (298K) in kg/m³
    pub fn density_at_std_temp(&self) -> f64 {
        match self {
            FluidType::CrudeOil => 851.0,
            FluidType::Diesel => 832.0,
            FluidType::Gasoline => 745.0,
            FluidType::Naphtha => 705.0,
            FluidType::HeavyFuelOil => 980.0,
        }
    }

    /// Get fluid viscosity at standard temperature (298K) in Pa·s
    pub fn viscosity_at_std_temp(&self) -> f64 {
        match self {
            FluidType::CrudeOil => 0.371e-3,
            FluidType::Diesel => 3.0e-3,
            FluidType::Gasoline => 0.6e-3,
            FluidType::Naphtha => 0.4e-3,
            FluidType::HeavyFuelOil => 600e-3,
        }
    }
}

/// Pipe component for fluid transport
#[derive(Debug, Clone)]
pub struct Pipe {
    pub id: String,
    pub start_pos: (f64, f64),  // (x, y) in meters
    pub end_pos: (f64, f64),    // (x, y) in meters
    pub length: f64,            // Length in meters
    pub diameter: f64,          // Internal diameter in meters
    pub roughness: f64,         // Roughness height in meters
    pub flow_rate: f64,         // Volumetric flow rate in m³/s
    pub pressure: f64,          // Pressure in Pascals
    pub temperature: f64,       // Temperature in Kelvin
    pub fluid_type: FluidType,
}

impl Pipe {
    /// Create a new pipe
    pub fn new(
        id: String,
        start_pos: (f64, f64),
        end_pos: (f64, f64),
        diameter: f64,
        roughness: f64,
        flow_rate: f64,
        pressure: f64,
        temperature: f64,
        fluid_type: FluidType,
    ) -> Self {
        let dx = end_pos.0 - start_pos.0;
        let dy = end_pos.1 - start_pos.1;
        let length = (dx * dx + dy * dy).sqrt();

        Pipe {
            id,
            start_pos,
            end_pos,
            length,
            diameter,
            roughness,
            flow_rate,
            pressure,
            temperature,
            fluid_type,
        }
    }
}

/// Processing equipment (columns, reactors, heat exchangers)
#[derive(Debug, Clone)]
pub struct Equipment {
    pub id: String,
    pub name: String,
    pub position: (f64, f64),   // (x, y) in meters
    pub equipment_type: EquipmentType,
    pub status: EquipmentStatus,
}

/// Types of processing equipment
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EquipmentType {
    /// Atmospheric distillation column
    AtmosphericDistillationColumn,
    /// Vacuum distillation column
    VacuumDistillationColumn,
    /// Fluid catalytic cracker
    FluidCatalyticCracker,
    /// Hydrocracking unit
    HydrocrackingUnit,
    /// Alkylation unit
    AlkylationUnit,
    /// Heat exchanger
    HeatExchanger,
}

impl EquipmentType {
    pub fn as_str(&self) -> &'static str {
        match self {
            EquipmentType::AtmosphericDistillationColumn => "AtmosphericDistillationColumn",
            EquipmentType::VacuumDistillationColumn => "VacuumDistillationColumn",
            EquipmentType::FluidCatalyticCracker => "FluidCatalyticCracker",
            EquipmentType::HydrocrackingUnit => "HydrocrackingUnit",
            EquipmentType::AlkylationUnit => "AlkylationUnit",
            EquipmentType::HeatExchanger => "HeatExchanger",
        }
    }
}

/// Equipment operational status
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EquipmentStatus {
    /// Normal operation
    Normal,
    /// Maintenance mode
    Maintenance,
    /// Emergency shutdown
    EmergencyShutdown,
    /// Standby
    Standby,
}

/// Storage tank for products and intermediates
#[derive(Debug, Clone)]
pub struct Tank {
    pub id: String,
    pub name: String,
    pub position: (f64, f64),
    pub capacity: f64,          // Capacity in m³
    pub current_volume: f64,    // Current volume in m³
    pub fluid_type: Option<FluidType>,
    pub temperature: f64,       // Current temperature in Kelvin
}

impl Tank {
    /// Create a new tank
    pub fn new(id: String, name: String, position: (f64, f64), capacity: f64) -> Self {
        Tank {
            id,
            name,
            position,
            capacity,
            current_volume: 0.0,
            fluid_type: None,
            temperature: 298.0, // Default to 298K (25°C)
        }
    }

    /// Get tank fill level as percentage
    pub fn fill_level_percent(&self) -> f64 {
        if self.capacity > 0.0 {
            (self.current_volume / self.capacity) * 100.0
        } else {
            0.0
        }
    }

    /// Check if tank is empty
    pub fn is_empty(&self) -> bool {
        self.current_volume <= 1e-6
    }

    /// Check if tank is full
    pub fn is_full(&self) -> bool {
        self.current_volume >= self.capacity - 1e-6
    }
}

/// Valve for flow control
#[derive(Debug, Clone)]
pub struct Valve {
    pub id: String,
    pub position: (f64, f64),
    pub state: ValveState,
    pub open_percent: f64,      // 0.0 = closed, 100.0 = fully open
}

impl Valve {
    /// Create a new valve
    pub fn new(id: String, position: (f64, f64), open_percent: f64) -> Self {
        Valve {
            id,
            position,
            state: if open_percent > 0.0 {
                ValveState::Open
            } else {
                ValveState::Closed
            },
            open_percent: open_percent.clamp(0.0, 100.0),
        }
    }

    /// Set valve open position
    pub fn set_open(&mut self, open_percent: f64) {
        self.open_percent = open_percent.clamp(0.0, 100.0);
        self.state = if self.open_percent > 0.0 {
            ValveState::Open
        } else {
            ValveState::Closed
        };
    }

    /// Get flow coefficient based on open percentage
    pub fn flow_coefficient(&self) -> f64 {
        self.open_percent / 100.0
    }
}

/// Valve state
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ValveState {
    Open,
    Closed,
}

/// Pump for fluid circulation
#[derive(Debug, Clone)]
pub struct Pump {
    pub id: String,
    pub position: (f64, f64),
    pub max_flow_rate: f64,     // Maximum flow rate in m³/s
    pub max_pressure: f64,      // Maximum pressure in Pascals
    pub current_flow_rate: f64, // Current flow rate in m³/s
    pub current_pressure: f64,  // Current pressure in Pascals
    pub state: PumpState,
}

impl Pump {
    /// Create a new pump
    pub fn new(
        id: String,
        position: (f64, f64),
        max_flow_rate: f64,
        max_pressure: f64,
    ) -> Self {
        Pump {
            id,
            position,
            max_flow_rate,
            max_pressure,
            current_flow_rate: 0.0,
            current_pressure: 0.0,
            state: PumpState::Stopped,
        }
    }

    /// Set pump speed (0.0 to 1.0)
    pub fn set_speed(&mut self, speed: f64) {
        let clamped_speed = speed.clamp(0.0, 1.0);
        self.current_flow_rate = self.max_flow_rate * clamped_speed;
        self.current_pressure = self.max_pressure * clamped_speed;

        if clamped_speed > 0.0 {
            self.state = PumpState::Running;
        } else {
            self.state = PumpState::Stopped;
        }
    }
}

/// Pump state
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PumpState {
    Running,
    Stopped,
    Fault,
}

/// Complete refinery state
#[derive(Debug, Clone)]
pub struct RefineryState {
    pub pipes: Vec<Pipe>,
    pub equipment: Vec<Equipment>,
    pub tanks: Vec<Tank>,
    pub valves: Vec<Valve>,
    pub pumps: Vec<Pump>,
    pub time: f64,  // Simulation time in seconds
}

impl RefineryState {
    /// Create a new empty refinery state
    pub fn new() -> Self {
        RefineryState {
            pipes: vec![],
            equipment: vec![],
            tanks: vec![],
            valves: vec![],
            pumps: vec![],
            time: 0.0,
        }
    }

    /// Get pipe by ID
    pub fn get_pipe(&self, id: &str) -> Option<&Pipe> {
        self.pipes.iter().find(|p| p.id == id)
    }

    /// Get pipe by ID (mutable)
    pub fn get_pipe_mut(&mut self, id: &str) -> Option<&mut Pipe> {
        self.pipes.iter_mut().find(|p| p.id == id)
    }

    /// Get tank by ID
    pub fn get_tank(&self, id: &str) -> Option<&Tank> {
        self.tanks.iter().find(|t| t.id == id)
    }

    /// Get tank by ID (mutable)
    pub fn get_tank_mut(&mut self, id: &str) -> Option<&mut Tank> {
        self.tanks.iter_mut().find(|t| t.id == id)
    }

    /// Get valve by ID (mutable)
    pub fn get_valve_mut(&mut self, id: &str) -> Option<&mut Valve> {
        self.valves.iter_mut().find(|v| v.id == id)
    }

    /// Get pump by ID (mutable)
    pub fn get_pump_mut(&mut self, id: &str) -> Option<&mut Pump> {
        self.pumps.iter_mut().find(|p| p.id == id)
    }

    /// Add a pipe to the refinery
    pub fn add_pipe(&mut self, pipe: Pipe) {
        self.pipes.push(pipe);
    }

    /// Add equipment to the refinery
    pub fn add_equipment(&mut self, equipment: Equipment) {
        self.equipment.push(equipment);
    }

    /// Add a tank to the refinery
    pub fn add_tank(&mut self, tank: Tank) {
        self.tanks.push(tank);
    }

    /// Add a valve to the refinery
    pub fn add_valve(&mut self, valve: Valve) {
        self.valves.push(valve);
    }

    /// Add a pump to the refinery
    pub fn add_pump(&mut self, pump: Pump) {
        self.pumps.push(pump);
    }
}

impl Default for RefineryState {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fluid_type_properties() {
        assert_eq!(FluidType::CrudeOil.density_at_std_temp(), 851.0);
        assert!(FluidType::CrudeOil.viscosity_at_std_temp() > 0.0);
    }

    #[test]
    fn test_pipe_creation() {
        let pipe = Pipe::new(
            "P1".to_string(),
            (0.0, 0.0),
            (100.0, 0.0),
            0.5,
            1e-6,
            0.01,
            3000000.0,
            300.0,
            FluidType::CrudeOil,
        );

        assert_eq!(pipe.id, "P1");
        assert_eq!(pipe.length, 100.0);
        assert_eq!(pipe.diameter, 0.5);
    }

    #[test]
    fn test_tank_fill_level() {
        let mut tank = Tank::new("T1".to_string(), "Tank 1".to_string(), (0.0, 0.0), 100.0);

        assert_eq!(tank.fill_level_percent(), 0.0);
        assert!(tank.is_empty());
        assert!(!tank.is_full());

        tank.current_volume = 50.0;
        assert_eq!(tank.fill_level_percent(), 50.0);
        assert!(!tank.is_empty());

        tank.current_volume = 100.0;
        assert!(tank.is_full());
    }

    #[test]
    fn test_valve_control() {
        let mut valve = Valve::new("V1".to_string(), (0.0, 0.0), 50.0);

        assert_eq!(valve.open_percent, 50.0);
        assert_eq!(valve.flow_coefficient(), 0.5);
        assert_eq!(valve.state, ValveState::Open);

        valve.set_open(0.0);
        assert_eq!(valve.state, ValveState::Closed);
        assert_eq!(valve.flow_coefficient(), 0.0);
    }

    #[test]
    fn test_pump_speed_control() {
        let mut pump = Pump::new("P1".to_string(), (0.0, 0.0), 10.0, 5000000.0);

        assert_eq!(pump.state, PumpState::Stopped);

        pump.set_speed(0.5);
        assert_eq!(pump.state, PumpState::Running);
        assert_eq!(pump.current_flow_rate, 5.0);
        assert_eq!(pump.current_pressure, 2500000.0);
    }

    #[test]
    fn test_refinery_component_lookup() {
        let mut refinery = RefineryState::new();

        let pipe = Pipe::new(
            "P1".to_string(),
            (0.0, 0.0),
            (100.0, 0.0),
            0.5,
            1e-6,
            0.01,
            3000000.0,
            300.0,
            FluidType::CrudeOil,
        );
        refinery.add_pipe(pipe);

        assert!(refinery.get_pipe("P1").is_some());
        assert!(refinery.get_pipe("P2").is_none());
    }
}