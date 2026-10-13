//! Refinery visualization and rendering for Geometry OS
//!
//! Provides real-time visualization of refinery state including pipe flows,
//! equipment status, and sensor readings.

use crate::refinery::types::{RefineryState, Pipe, Tank, Equipment, Valve, Pump, PumpState};
use crate::geoasm_materializer::CellState;
use std::collections::HashMap;

/// Visualization configuration
#[derive(Debug, Clone)]
pub struct VisualizationConfig {
    /// Show flow animations
    pub animate_flows: bool,
    /// Show temperature gradients
    pub show_temperature: bool,
    /// Show pressure indicators
    pub show_pressure: bool,
    /// Show equipment status overlays
    pub show_status: bool,
    /// Animation speed (1.0 = normal)
    pub animation_speed: f32,
}

impl Default for VisualizationConfig {
    fn default() -> Self {
        Self {
            animate_flows: true,
            show_temperature: true,
            show_pressure: true,
            show_status: true,
            animation_speed: 1.0,
        }
    }
}

/// Color scheme for refinery visualization
#[derive(Debug, Clone, Copy)]
pub struct Color {
    pub r: u8,
    pub g: u8,
    pub b: u8,
    pub a: u8,
}

impl Color {
    pub const fn new(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self { r, g, b, a }
    }

    /// Convert to RGBA u32 for GPU
    pub fn to_rgba_u32(self) -> u32 {
        ((self.a as u32) << 24)
            | ((self.b as u32) << 16)
            | ((self.g as u32) << 8)
            | (self.r as u32)
    }
}

/// Color palette for refinery components
pub mod colors {
    use super::Color;

    pub const OIL_FLOW: Color = Color::new(139, 69, 19, 255);      // Brown
    pub const STEAM_FLOW: Color = Color::new(200, 200, 200, 255);  // Light gray
    pub const VALVE_OPEN: Color = Color::new(0, 255, 0, 255);      // Green
    pub const VALVE_CLOSED: Color = Color::new(255, 0, 0, 255);    // Red
    pub const VALVE_PARTIAL: Color = Color::new(255, 255, 0, 255); // Yellow
    pub const PUMP_RUNNING: Color = Color::new(0, 200, 255, 255);  // Cyan
    pub const PUMP_STOPPED: Color = Color::new(100, 100, 100, 255); // Gray
    pub const HEATER_ACTIVE: Color = Color::new(255, 100, 0, 255); // Orange
    pub const HEATER_IDLE: Color = Color::new(100, 50, 0, 255);    // Dark brown
    pub const TANK_LOW: Color = Color::new(255, 200, 100, 255);    // Light orange
    pub const TANK_MEDIUM: Color = Color::new(255, 150, 50, 255);  // Orange
    pub const TANK_HIGH: Color = Color::new(255, 100, 0, 255);     // Red-orange
    pub const SENSOR_NORMAL: Color = Color::new(0, 255, 100, 255); // Light green
    pub const SENSOR_WARNING: Color = Color::new(255, 200, 0, 255); // Yellow
    pub const SENSOR_ALARM: Color = Color::new(255, 0, 0, 255);    // Red
    pub const SEPARATOR: Color = Color::new(100, 100, 150, 255);   // Blue-gray
    pub const WALL: Color = Color::new(50, 50, 50, 255);           // Dark gray
    pub const MEMBRANE: Color = Color::new(100, 200, 200, 100);    // Transparent cyan
}

/// Renderable element for refinery visualization
#[derive(Debug, Clone)]
pub enum RenderElement {
    /// Pipe segment with flow
    Pipe {
        start_x: f32,
        start_y: f32,
        end_x: f32,
        end_y: f32,
        color: Color,
        flow_rate: f32,
        temperature: f32,
    },
    /// Equipment (separator, heater, etc.)
    Equipment {
        x: f32,
        y: f32,
        width: f32,
        height: f32,
        color: Color,
        label: String,
    },
    /// Valve with position
    Valve {
        x: f32,
        y: f32,
        open_percent: f32,
        color: Color,
    },
    /// Pump with status
    Pump {
        x: f32,
        y: f32,
        is_running: bool,
        pressure_out: f32,
        color: Color,
    },
    /// Tank with level
    Tank {
        x: f32,
        y: f32,
        width: f32,
        height: f32,
        current_volume: f32,
        capacity: f32,
        color: Color,
        label: String,
    },
    /// Sensor with reading
    Sensor {
        x: f32,
        y: f32,
        value: f32,
        unit: String,
        color: Color,
    },
    /// Wall or membrane
    Barrier {
        x: f32,
        y: f32,
        width: f32,
        height: f32,
        color: Color,
    },
}

/// Refinery renderer
pub struct RefineryRenderer {
    pub config: VisualizationConfig,
    pub render_elements: Vec<RenderElement>,
    flow_animations: HashMap<String, f32>, // Track animation phase for each pipe
}

impl RefineryRenderer {
    /// Create new refinery renderer
    pub fn new(config: VisualizationConfig) -> Self {
        Self {
            config,
            render_elements: Vec::new(),
            flow_animations: HashMap::new(),
        }
    }

    /// Create renderer with default configuration
    pub fn with_defaults() -> Self {
        Self::new(VisualizationConfig::default())
    }

    /// Update visualization configuration
    pub fn set_config(&mut self, config: VisualizationConfig) {
        self.config = config;
    }

    /// Clear all render elements
    pub fn clear(&mut self) {
        self.render_elements.clear();
    }

    /// Convert refinery state to render elements
    pub fn render_state(&mut self, state: &RefineryState, time: f32) {
        self.clear();

        // Render pipes
        for pipe in &state.pipes {
            self.render_pipe(pipe, time);
        }

        // Render tanks
        for tank in &state.tanks {
            self.render_tank(tank);
        }

        // Render equipment
        for equipment in &state.equipment {
            self.render_equipment(equipment);
        }

        // Render valves
        for valve in &state.valves {
            self.render_valve(valve);
        }

        // Render pumps
        for pump in &state.pumps {
            self.render_pump(pump);
        }
    }

    /// Render a single pipe
    fn render_pipe(&mut self, pipe: &Pipe, time: f32) {
        let color = self.get_pipe_color(pipe);

        self.render_elements.push(RenderElement::Pipe {
            start_x: pipe.start_pos.0 as f32,
            start_y: pipe.start_pos.1 as f32,
            end_x: pipe.end_pos.0 as f32,
            end_y: pipe.end_pos.1 as f32,
            color,
            flow_rate: pipe.flow_rate as f32,
            temperature: pipe.temperature as f32,
        });

        // Update flow animation
        if self.config.animate_flows && pipe.flow_rate > 0.0 {
            let phase = self.flow_animations
                .entry(pipe.id.clone())
                .or_insert(0.0);

            *phase = (*phase + pipe.flow_rate.abs() as f32 * self.config.animation_speed * 0.1) % 1.0;
        }
    }

    /// Get pipe color based on temperature and fluid type
    fn get_pipe_color(&self, pipe: &Pipe) -> Color {
        // Temperature-based color gradient
        let temp_c = pipe.temperature - 273.15; // Convert to Celsius

        if temp_c < 50.0 {
            colors::OIL_FLOW
        } else if temp_c < 150.0 {
            // Blend from brown to red
            let t = (temp_c - 50.0) / 100.0;
            Color::new(
                (139.0 + (255.0 - 139.0) * t) as u8,
                (69.0 + (100.0 - 69.0) * t) as u8,
                (19.0 + (0.0 - 19.0) * t) as u8,
                255,
            )
        } else {
            // Hot - red
            Color::new(255, 100, 50, 255)
        }
    }

    /// Render a single tank
    fn render_tank(&mut self, tank: &Tank) {
        let fill_percent = (tank.current_volume / tank.capacity) as f32;
        let color = self.get_tank_color(fill_percent);

        self.render_elements.push(RenderElement::Tank {
            x: tank.position.0 as f32,
            y: tank.position.1 as f32,
            width: 10.0,
            height: 15.0,
            current_volume: tank.current_volume as f32,
            capacity: tank.capacity as f32,
            color,
            label: tank.name.clone(),
        });
    }

    /// Get tank color based on fill level
    fn get_tank_color(&self, fill_percent: f32) -> Color {
        if fill_percent < 0.3 {
            colors::TANK_LOW
        } else if fill_percent < 0.7 {
            colors::TANK_MEDIUM
        } else {
            colors::TANK_HIGH
        }
    }

    /// Render equipment (separator, heater, etc.)
    fn render_equipment(&mut self, equipment: &Equipment) {
        let color = match equipment.equipment_type.as_str() {
            "separator" => colors::SEPARATOR,
            "heater" => colors::HEATER_ACTIVE,
            "mixer" => Color::new(150, 100, 200, 255),
            _ => Color::new(100, 100, 100, 255),
        };

        self.render_elements.push(RenderElement::Equipment {
            x: equipment.position.0 as f32,
            y: equipment.position.1 as f32,
            width: 8.0,
            height: 12.0,
            color,
            label: equipment.name.clone(),
        });
    }

    /// Render a valve
    fn render_valve(&mut self, valve: &Valve) {
        let color = if valve.open_percent < 0.1 {
            colors::VALVE_CLOSED
        } else if valve.open_percent > 0.9 {
            colors::VALVE_OPEN
        } else {
            colors::VALVE_PARTIAL
        };

        self.render_elements.push(RenderElement::Valve {
            x: valve.position.0 as f32,
            y: valve.position.1 as f32,
            open_percent: valve.open_percent as f32,
            color,
        });
    }

    /// Render a pump
    fn render_pump(&mut self, pump: &Pump) {
        let is_running = pump.state == PumpState::Running;
        let color = if is_running {
            colors::PUMP_RUNNING
        } else {
            colors::PUMP_STOPPED
        };

        self.render_elements.push(RenderElement::Pump {
            x: pump.position.0 as f32,
            y: pump.position.1 as f32,
            is_running,
            pressure_out: pump.current_pressure as f32,
            color,
        });
    }

    /// Get all render elements
    pub fn get_render_elements(&self) -> &[RenderElement] {
        &self.render_elements
    }

    /// Convert render elements to spatial grid cells for GPU rendering
    ///
    /// This maps the refinery visualization onto the 128x64 spatial grid
    pub fn to_spatial_cells(&self, grid_width: usize, grid_height: usize) -> Vec<CellState> {
        // Initialize all cells as NOP (inactive)
        let nop_cell = CellState {
            opcode_or_type: 17, // TYPE_NOP
            is_active: 0,
            data_buffer: 0,
            executing: 0,
        };

        let mut cells = Vec::with_capacity(grid_width * grid_height);
        for _ in 0..(grid_width * grid_height) {
            cells.push(nop_cell);
        }

        for element in &self.render_elements {
            match element {
                RenderElement::Pipe {
                    start_x,
                    start_y,
                    end_x,
                    end_y,
                    color,
                    ..
                } => {
                    // Rasterize pipe as line on grid (opcode 18 = Oil flow)
                    self.rasterize_line(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *start_x,
                        *start_y,
                        *end_x,
                        *end_y,
                        color.to_rgba_u32(),
                        18, // TYPE_OIL_FLOW
                    );
                }
                RenderElement::Equipment {
                    x, y, width, height, color, label,
                } => {
                    // Map equipment type to opcode
                    let opcode = match label.as_str() {
                        "heater" => 21, // TYPE_HEATER
                        "separator" => 22, // TYPE_SEPARATOR
                        "mixer" => 25, // TYPE_MIXER
                        _ => 22, // Default to separator
                    };
                    // Rasterize equipment as rectangle
                    self.rasterize_rect(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *x,
                        *y,
                        *width,
                        *height,
                        color.to_rgba_u32(),
                        opcode,
                    );
                }
                RenderElement::Tank {
                    x,
                    y,
                    width,
                    height,
                    current_volume,
                    capacity,
                    color,
                    ..
                } => {
                    // Always draw tank outline (empty or full)
                    self.rasterize_rect(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *x,
                        *y,
                        *width,
                        *height,
                        color.to_rgba_u32(),
                        23, // TYPE_STORAGE
                    );
                    // Draw fill level on top if non-empty
                    if *capacity > 0.0 && *current_volume > 0.0 {
                        let fill_height = height * (current_volume / capacity);
                        // Use darker color for fill
                        let fill_color = Color::new(
                            (color.r as u32 * 3 / 4) as u8,
                            (color.g as u32 * 3 / 4) as u8,
                            (color.b as u32 * 3 / 4) as u8,
                            255,
                        ).to_rgba_u32();
                        self.rasterize_rect(
                            &mut cells,
                            grid_width,
                            grid_height,
                            *x,
                            *y + *height - fill_height,
                            *width,
                            fill_height,
                            fill_color,
                            23, // TYPE_STORAGE (same opcode)
                        );
                    }
                }
                RenderElement::Valve {
                    x, y, color, ..
                } => {
                    // Rasterize valve as point (opcode 19 = Valve)
                    self.rasterize_point(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *x,
                        *y,
                        color.to_rgba_u32(),
                        19, // TYPE_VALVE
                    );
                }
                RenderElement::Pump {
                    x, y, color, ..
                } => {
                    // Rasterize pump as point (opcode 20 = Pump)
                    self.rasterize_point(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *x,
                        *y,
                        color.to_rgba_u32(),
                        20, // TYPE_PUMP
                    );
                }
                RenderElement::Sensor {
                    x, y, color, ..
                } => {
                    // Rasterize sensor as point (opcode 24 = Sensor)
                    self.rasterize_point(
                        &mut cells,
                        grid_width,
                        grid_height,
                        *x,
                        *y,
                        color.to_rgba_u32(),
                        24, // TYPE_SENSOR
                    );
                }
                _ => {
                    // Other elements rendered as points
                }
            }
        }

        cells
    }

    /// Rasterize a line on the grid using Bresenham's algorithm
    fn rasterize_line(
        &self,
        cells: &mut [CellState],
        grid_width: usize,
        grid_height: usize,
        x0: f32,
        y0: f32,
        x1: f32,
        y1: f32,
        color: u32,
        opcode: u32,
    ) {
        let ix0 = x0 as i32;
        let iy0 = y0 as i32;
        let ix1 = x1 as i32;
        let iy1 = y1 as i32;

        let dx = (ix1 - ix0).abs();
        let dy = (iy1 - iy0).abs();
        let sx = if ix0 < ix1 { 1 } else { -1 };
        let sy = if iy0 < iy1 { 1 } else { -1 };

        let mut err = dx - dy;
        let mut x = ix0;
        let mut y = iy0;

        loop {
            if x >= 0 && x < grid_width as i32 && y >= 0 && y < grid_height as i32 {
                let idx = (y as usize) * grid_width + (x as usize);
                cells[idx].opcode_or_type = opcode;
                cells[idx].data_buffer = color;
                cells[idx].is_active = 1;
            }

            if x == ix1 && y == iy1 {
                break;
            }

            let e2 = 2 * err;
            if e2 > -dy {
                err -= dy;
                x += sx;
            }
            if e2 < dx {
                err += dx;
                y += sy;
            }
        }
    }

    /// Rasterize a filled rectangle on the grid
    fn rasterize_rect(
        &self,
        cells: &mut [CellState],
        grid_width: usize,
        grid_height: usize,
        x: f32,
        y: f32,
        width: f32,
        height: f32,
        color: u32,
        opcode: u32,
    ) {
        let x_start = (x.max(0.0) as usize).min(grid_width);
        let x_end = ((x + width).max(0.0) as usize).min(grid_width);
        let y_start = (y.max(0.0) as usize).min(grid_height);
        let y_end = ((y + height).max(0.0) as usize).min(grid_height);

        for py in y_start..y_end {
            for px in x_start..x_end {
                let idx = py * grid_width + px;
                cells[idx].opcode_or_type = opcode;
                cells[idx].data_buffer = color;
                cells[idx].is_active = 1;
            }
        }
    }

    /// Rasterize a single point on the grid
    fn rasterize_point(
        &self,
        cells: &mut [CellState],
        grid_width: usize,
        grid_height: usize,
        x: f32,
        y: f32,
        color: u32,
        opcode: u32,
    ) {
        let ix = x as usize;
        let iy = y as usize;

        if ix < grid_width && iy < grid_height {
            let idx = iy * grid_width + ix;
            cells[idx].opcode_or_type = opcode;
            cells[idx].data_buffer = color;
            cells[idx].is_active = 1;
        }
    }

    /// Convert render elements to sparse binary format compatible with GridRunner::load_overlay()
    ///
    /// Binary format:
    /// bytes 0-3:   grid_w (u32 LE)
    /// bytes 4-7:   grid_h (u32 LE)
    /// bytes 8-11:  cell_count (u32 LE)
    /// bytes 12-15: reserved (u32)
    /// bytes 16-19: reserved2 (u32)
    /// bytes 20+:   for each cell: x (4), y (4), opcode_or_type (4), data_buffer (4) = 16 bytes
    pub fn to_binary(&self, grid_width: usize, grid_height: usize) -> Vec<u8> {
        let cells = self.to_spatial_cells(grid_width, grid_height);

        // Collect active cells (sparse format)
        let active_cells: Vec<_> = cells
            .iter()
            .enumerate()
            .filter(|(_, c)| c.is_active > 0 || c.opcode_or_type != 17)
            .map(|(i, c)| {
                let x = i % grid_width;
                let y = i / grid_width;
                (x, y, c.opcode_or_type, c.data_buffer)
            })
            .collect();

        let cell_count = active_cells.len();
        let expected_len = 20 + cell_count * 16; // 20-byte header
        let mut binary = Vec::with_capacity(expected_len);

        // Write header (20 bytes total)
        binary.extend_from_slice(&(grid_width as u32).to_le_bytes()); // 4
        binary.extend_from_slice(&(grid_height as u32).to_le_bytes()); // 4
        binary.extend_from_slice(&(cell_count as u32).to_le_bytes()); // 4
        binary.extend_from_slice(&0u32.to_le_bytes()); // reserved - 4
        binary.extend_from_slice(&0u32.to_le_bytes()); // reserved2 - 4

        // Write cells in sparse format: x, y, opcode_or_type, data_buffer
        for (x, y, opcode, data) in active_cells {
            binary.extend_from_slice(&(x as u32).to_le_bytes()); // 4
            binary.extend_from_slice(&(y as u32).to_le_bytes()); // 4
            binary.extend_from_slice(&opcode.to_le_bytes()); // 4
            binary.extend_from_slice(&data.to_le_bytes()); // 4
        }

        assert_eq!(
            binary.len(),
            expected_len,
            "Binary length mismatch: expected {}, got {} (header 20 + {} cells × 16)",
            expected_len,
            binary.len(),
            cell_count
        );
        binary
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_color_conversion() {
        let color = Color::new(255, 128, 64, 255);
        let rgba = color.to_rgba_u32();
        assert_eq!(rgba, 0xFF4080FF); // ABGR order
    }

    #[test]
    fn test_renderer_creation() {
        let renderer = RefineryRenderer::with_defaults();
        assert_eq!(renderer.get_render_elements().len(), 0);
    }

    #[test]
    fn test_tank_color_levels() {
        let renderer = RefineryRenderer::with_defaults();

        let low_color = renderer.get_tank_color(0.2);
        let medium_color = renderer.get_tank_color(0.5);
        let high_color = renderer.get_tank_color(0.8);

        // Different fill levels should give different colors (check R, G, or B channel)
        assert!(low_color.r != high_color.r || low_color.g != high_color.g || low_color.b != high_color.b,
                "Different fill levels should produce different colors");
    }

    #[test]
    fn test_spatial_cell_conversion() {
        let mut renderer = RefineryRenderer::with_defaults();

        // Create a simple state with one pipe
        let mut state = RefineryState::new();
        state.add_pipe(Pipe::new(
            "test".to_string(),
            (10.0, 20.0),
            (30.0, 40.0),
            0.5,
            1e-5,
            0.1,
            5.0e6,
            298.15,
            crate::refinery::types::FluidType::CrudeOil,
        ));

        renderer.render_state(&state, 0.0);
        let cells = renderer.to_spatial_cells(128, 64);

        // Should have some cells colored
        let colored_cells = cells.iter().filter(|c| c.data_buffer != 0).count();
        assert!(colored_cells > 0);
    }
}