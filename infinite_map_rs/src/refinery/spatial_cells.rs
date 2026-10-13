//! Spatial cell types for refinery simulation on Geometry OS
//!
//! Defines custom cell types for refinery components that integrate with
//! the spatial routing system (WALL, MEMBRANE, etc.)

use crate::geoasm_materializer::{CellState, MaterializeCell};

/// Custom refinery cell type IDs
/// These extend beyond the standard GeoASM opcodes
pub const TYPE_OIL_FLOW: u32 = 18;     // Oil flows through this cell
pub const TYPE_VALVE: u32 = 19;        // Flow control valve
pub const TYPE_PUMP: u32 = 20;         // Pressure source / pump
pub const TYPE_HEATER: u32 = 21;       // Heat exchanger / heater
pub const TYPE_SEPARATOR: u32 = 22;    // Product separator (distillation column)
pub const TYPE_STORAGE: u32 = 23;      // Storage tank
pub const TYPE_SENSOR: u32 = 24;       // Sensor (temperature, pressure, flow)
pub const TYPE_MIXER: u32 = 25;        // Mixing vessel

/// Create a valve cell with position and state
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `open_percent` - Valve position 0.0 (closed) to 1.0 (fully open)
pub fn create_valve_cell(x: usize, y: usize, open_percent: f32) -> MaterializeCell {
    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_VALVE,
            is_active: 1,
            data_buffer: f32::to_bits(open_percent), // Valve position
            executing: 0,
        },
    }
}

/// Create an oil flow cell with flow parameters
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `flow_rate` - Flow rate in m³/s
/// * `pressure` - Pressure in Pa
/// * `temperature` - Temperature in Kelvin
pub fn create_oil_flow_cell(
    x: usize,
    y: usize,
    flow_rate: f32,
    pressure: f32,
    temperature: f32,
) -> MaterializeCell {
    // Pack flow_rate and pressure into executing field (as u32)
    // High 16 bits: flow_rate, Low 16 bits: pressure (scaled)
    let flow_scaled = (flow_rate * 1000.0) as u32;
    let pressure_scaled = (pressure / 1000.0) as u32;
    let packed = (flow_scaled << 16) | pressure_scaled;

    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_OIL_FLOW,
            is_active: 1,
            data_buffer: f32::to_bits(temperature),
            executing: packed,
        },
    }
}

/// Create a pump cell with pressure and flow characteristics
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `pressure_out` - Output pressure in Pa
/// * `max_flow_rate` - Maximum flow rate in m³/s
/// * `is_running` - Whether the pump is currently running
pub fn create_pump_cell(
    x: usize,
    y: usize,
    pressure_out: f32,
    max_flow_rate: f32,
    is_running: bool,
) -> MaterializeCell {
    let pressure_scaled = (pressure_out / 1000.0) as u32;
    let flow_scaled = (max_flow_rate * 1000.0) as u32;
    let packed = (pressure_scaled << 16) | flow_scaled;

    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_PUMP,
            is_active: if is_running { 1 } else { 0 },
            data_buffer: packed,
            executing: 0,
        },
    }
}

/// Create a heater/heat exchanger cell
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `target_temperature` - Target temperature in Kelvin
/// * `current_temperature` - Current temperature in Kelvin
/// * `power_level` - Heater power 0.0 to 1.0
pub fn create_heater_cell(
    x: usize,
    y: usize,
    target_temperature: f32,
    current_temperature: f32,
    power_level: f32,
) -> MaterializeCell {
    // Pack temperatures into executing field
    let target_scaled = (target_temperature - 273.15) as u32; // Store as Celsius
    let current_scaled = (current_temperature - 273.15) as u32;
    let packed = (target_scaled << 16) | current_scaled;

    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_HEATER,
            is_active: 1,
            data_buffer: f32::to_bits(power_level),
            executing: packed,
        },
    }
}

/// Create a separator (distillation column) cell
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `column_height` - Height of separation zone
/// * `efficiency` - Separation efficiency 0.0 to 1.0
pub fn create_separator_cell(
    x: usize,
    y: usize,
    column_height: f32,
    efficiency: f32,
) -> MaterializeCell {
    let height_scaled = (column_height * 10.0) as u32;
    let efficiency_scaled = (efficiency * 100.0) as u32;
    let packed = (height_scaled << 16) | efficiency_scaled;

    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_SEPARATOR,
            is_active: 1,
            data_buffer: 0,
            executing: packed,
        },
    }
}

/// Create a storage tank cell
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `current_volume` - Current volume in m³
/// * `capacity` - Maximum capacity in m³
pub fn create_storage_cell(
    x: usize,
    y: usize,
    current_volume: f32,
    capacity: f32,
) -> MaterializeCell {
    let volume_scaled = (current_volume * 100.0) as u32;
    let capacity_scaled = (capacity * 100.0) as u32;
    let packed = (volume_scaled << 16) | capacity_scaled;

    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_STORAGE,
            is_active: 1,
            data_buffer: 0,
            executing: packed,
        },
    }
}

/// Create a sensor cell
///
/// # Arguments
/// * `x` - Grid X coordinate
/// * `y` - Grid Y coordinate
/// * `sensor_type` - Sensor type identifier
/// * `reading` - Current sensor reading
pub fn create_sensor_cell(
    x: usize,
    y: usize,
    sensor_type: SensorType,
    reading: f32,
) -> MaterializeCell {
    MaterializeCell {
        x,
        y,
        cell: CellState {
            opcode_or_type: TYPE_SENSOR,
            is_active: 1,
            data_buffer: f32::to_bits(reading),
            executing: sensor_type as u32,
        },
    }
}

/// Sensor types for refinery monitoring
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u32)]
pub enum SensorType {
    Temperature = 0,
    Pressure = 1,
    FlowRate = 2,
    Level = 3,
    Composition = 4,
}

/// Create a basic refinery layout on the spatial grid
///
/// Returns a vector of MaterializeCell that can be loaded into GridRunner
pub fn create_refinery_layout() -> Vec<MaterializeCell> {
    let mut cells = Vec::new();

    // Create feed pipe (top of refinery) - horizontal flow
    for x in 50..70 {
        cells.push(create_oil_flow_cell(x, 5, 0.1, 5.0e6, 298.15));
    }

    // Create feed pump
    cells.push(create_pump_cell(55, 3, 5.0e6, 0.15, true));

    // Create distillation column (vertical separator)
    for y in 10..30 {
        cells.push(create_separator_cell(60, y, 20.0, 0.85));
    }

    // Create product pipes (horizontal output)
    // Naphtha draw-off
    for x in 60..80 {
        cells.push(create_oil_flow_cell(x, 15, 0.03, 1.0e6, 320.0));
    }

    // Diesel draw-off
    for x in 60..80 {
        cells.push(create_oil_flow_cell(x, 20, 0.04, 1.0e6, 380.0));
    }

    // Gasoline draw-off
    for x in 60..80 {
        cells.push(create_oil_flow_cell(x, 25, 0.03, 1.0e6, 350.0));
    }

    // Create control valves
    cells.push(create_valve_cell(60, 12, 0.8)); // Feed valve
    cells.push(create_valve_cell(60, 17, 0.6)); // Naphtha valve
    cells.push(create_valve_cell(60, 22, 0.7)); // Diesel valve
    cells.push(create_valve_cell(60, 27, 0.5)); // Gasoline valve

    // Create heaters
    cells.push(create_heater_cell(62, 8, 350.0, 298.15, 0.7)); // Pre-heater

    // Create storage tanks
    cells.push(create_storage_cell(85, 15, 200.0, 500.0)); // Naphtha tank
    cells.push(create_storage_cell(85, 20, 150.0, 800.0)); // Diesel tank
    cells.push(create_storage_cell(85, 25, 180.0, 600.0)); // Gasoline tank

    // Create sensors for monitoring
    cells.push(create_sensor_cell(55, 5, SensorType::Temperature, 298.15)); // Feed temp
    cells.push(create_sensor_cell(55, 5, SensorType::Pressure, 5.0e6));     // Feed pressure
    cells.push(create_sensor_cell(60, 15, SensorType::FlowRate, 0.03));     // Naphtha flow
    cells.push(create_sensor_cell(60, 20, SensorType::FlowRate, 0.04));     // Diesel flow
    cells.push(create_sensor_cell(60, 25, SensorType::FlowRate, 0.03));     // Gasoline flow

    cells
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_valve_cell_creation() {
        let valve = create_valve_cell(10, 20, 0.5);
        assert_eq!(valve.x, 10);
        assert_eq!(valve.y, 20);
        assert_eq!(valve.cell.opcode_or_type, TYPE_VALVE);
        assert_eq!(valve.cell.is_active, 1);
    }

    #[test]
    fn test_oil_flow_cell_creation() {
        let flow = create_oil_flow_cell(5, 10, 0.1, 5.0e6, 298.15);
        assert_eq!(flow.x, 5);
        assert_eq!(flow.y, 10);
        assert_eq!(flow.cell.opcode_or_type, TYPE_OIL_FLOW);
        assert_eq!(flow.cell.is_active, 1);
    }

    #[test]
    fn test_pump_cell_creation() {
        let pump = create_pump_cell(15, 25, 5.0e6, 0.15, true);
        assert_eq!(pump.x, 15);
        assert_eq!(pump.y, 25);
        assert_eq!(pump.cell.opcode_or_type, TYPE_PUMP);
        assert_eq!(pump.cell.is_active, 1); // Running
    }

    #[test]
    fn test_refinery_layout() {
        let layout = create_refinery_layout();
        assert!(!layout.is_empty());
        
        // Verify we have different cell types
        let has_valve = layout.iter().any(|c| c.cell.opcode_or_type == TYPE_VALVE);
        let has_flow = layout.iter().any(|c| c.cell.opcode_or_type == TYPE_OIL_FLOW);
        let has_pump = layout.iter().any(|c| c.cell.opcode_or_type == TYPE_PUMP);
        let has_separator = layout.iter().any(|c| c.cell.opcode_or_type == TYPE_SEPARATOR);
        
        assert!(has_valve);
        assert!(has_flow);
        assert!(has_pump);
        assert!(has_separator);
    }

    #[test]
    fn test_sensor_cell_types() {
        let temp_sensor = create_sensor_cell(0, 0, SensorType::Temperature, 25.0);
        let pressure_sensor = create_sensor_cell(0, 0, SensorType::Pressure, 101325.0);
        
        assert_eq!(temp_sensor.cell.executing, SensorType::Temperature as u32);
        assert_eq!(pressure_sensor.cell.executing, SensorType::Pressure as u32);
    }
}