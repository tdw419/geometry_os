// interaction_bridge.rs - Human-to-AI Interface
// Phase 25: Bridge human input to GPU perception buffer

/// Input state from human
#[derive(Debug, Clone)]
pub struct InputState {
    pub mouse_x: f32,
    pub mouse_y: f32,
    pub mouse_down: bool,
    pub active_keys: Vec<u32>,
    pub last_interaction_tick: u64,
}

impl InputState {
    pub fn new() -> Self {
        Self {
            mouse_x: 0.0,
            mouse_y: 0.0,
            mouse_down: false,
            active_keys: Vec::new(),
            last_interaction_tick: 0,
        }
    }
    
    /// Map mouse position to 576:1 grid coordinates
    pub fn to_grid_coords(&self, grid_width: u32, grid_height: u32) -> (u32, u32) {
        let grid_x = (self.mouse_x * grid_width as f32) as u32;
        let grid_y = (self.mouse_y * grid_height as f32) as u32;
        
        (grid_x.min(grid_width - 1), grid_y.min(grid_height - 1))
    }
    
    /// Check if a key is active
    pub fn is_key_active(&self, keycode: u32) -> bool {
        self.active_keys.contains(&keycode)
    }
    
    /// Inject input signal into a buffer
    pub fn inject_signal(&self, buffer: &mut [u8], grid_width: u32, grid_height: u32) {
        let (x, y) = self.to_grid_coords(grid_width, grid_height);
        
        if self.mouse_down {
            // Inject HIGH signal at mouse position
            let brush_size = 3u32;
            
            for dx in 0..brush_size {
                for dy in 0..brush_size {
                    let px = (x + dx).min(grid_width - 1);
                    let py = (y + dy).min(grid_height - 1);
                    let idx = (py * grid_width + px) as usize;
                    
                    if idx < buffer.len() {
                        buffer[idx] = 0xFF; // HIGH signal
                    }
                }
            }
        }
        
        // Inject glyph signals from keyboard
        // A = XOR gate, S = NAND gate, D = AND gate, F = OR gate
        for &key in &self.active_keys {
            let glyph = match key {
                65 => Some(0x0A), // A = XOR
                83 => Some(0x0B), // S = NAND
                68 => Some(0x0C), // D = AND
                70 => Some(0x0D), // F = OR
                _ => None,
            };
            
            if let Some(glyph_value) = glyph {
                let idx = (y * grid_width + x) as usize;
                if idx < buffer.len() {
                    buffer[idx] = glyph_value;
                }
            }
        }
    }
}

impl Default for InputState {
    fn default() -> Self {
        Self::new()
    }
}

/// The interaction bridge connects human input to AI perception
pub struct InteractionBridge {
    pub input: InputState,
    pub interaction_count: u64,
    pub last_injection_tick: u64,
    pub interaction_log: Vec<InteractionEvent>,
}

#[derive(Debug, Clone)]
pub struct InteractionEvent {
    pub tick: u64,
    pub event_type: InteractionType,
    pub x: u32,
    pub y: u32,
    pub data: u8,
}

#[derive(Debug, Clone, Copy)]
pub enum InteractionType {
    MouseDown,
    MouseUp,
    MouseMove,
    KeyPress,
    KeyRelease,
}

impl InteractionBridge {
    pub fn new() -> Self {
        Self {
            input: InputState::new(),
            interaction_count: 0,
            last_injection_tick: 0,
            interaction_log: Vec::new(),
        }
    }
    
    /// Handle mouse movement
    pub fn on_mouse_move(&mut self, x: f32, y: f32, tick: u64) {
        self.input.mouse_x = x;
        self.input.mouse_y = y;
        self.input.last_interaction_tick = tick;
        
        if self.input.mouse_down {
            self.log_event(tick, InteractionType::MouseMove, x, y, 0);
        }
    }
    
    /// Handle mouse press
    pub fn on_mouse_down(&mut self, x: f32, y: f32, tick: u64) {
        self.input.mouse_x = x;
        self.input.mouse_y = y;
        self.input.mouse_down = true;
        self.input.last_interaction_tick = tick;
        self.interaction_count += 1;
        
        self.log_event(tick, InteractionType::MouseDown, x, y, 1);
    }
    
    /// Handle mouse release
    pub fn on_mouse_up(&mut self, x: f32, y: f32, tick: u64) {
        self.input.mouse_x = x;
        self.input.mouse_y = y;
        self.input.mouse_down = false;
        self.input.last_interaction_tick = tick;
        
        self.log_event(tick, InteractionType::MouseUp, x, y, 0);
    }
    
    /// Handle key press
    pub fn on_key_press(&mut self, keycode: u32, tick: u64) {
        if !self.input.active_keys.contains(&keycode) {
            self.input.active_keys.push(keycode);
            self.input.last_interaction_tick = tick;
            self.interaction_count += 1;
            
            self.log_event(tick, InteractionType::KeyPress, self.input.mouse_x, self.input.mouse_y, keycode as u8);
        }
    }
    
    /// Handle key release
    pub fn on_key_release(&mut self, keycode: u32, tick: u64) {
        self.input.active_keys.retain(|&k| k != keycode);
        self.input.last_interaction_tick = tick;
        
        self.log_event(tick, InteractionType::KeyRelease, self.input.mouse_x, self.input.mouse_y, keycode as u8);
    }
    
    fn log_event(&mut self, tick: u64, event_type: InteractionType, x: f32, y: f32, data: u8) {
        self.interaction_log.push(InteractionEvent {
            tick,
            event_type,
            x: (x * 576.0) as u32,
            y: (y * 576.0) as u32,
            data,
        });
        
        // Keep log size bounded
        if self.interaction_log.len() > 1000 {
            self.interaction_log.remove(0);
        }
    }
    
    /// Inject current input state into GPU buffer
    pub fn inject_to_gpu(&mut self, buffer: &mut [u8], grid_width: u32, grid_height: u32, tick: u64) {
        self.input.inject_signal(buffer, grid_width, grid_height);
        self.last_injection_tick = tick;
    }
    
    /// Get interaction statistics
    pub fn stats(&self) -> InteractionStats {
        let mouse_events = self.interaction_log.iter()
            .filter(|e| matches!(e.event_type, InteractionType::MouseDown | InteractionType::MouseUp))
            .count();
        let key_events = self.interaction_log.iter()
            .filter(|e| matches!(e.event_type, InteractionType::KeyPress))
            .count();
        
        InteractionStats {
            total_interactions: self.interaction_count,
            mouse_events,
            key_events,
            last_interaction_tick: self.input.last_interaction_tick,
        }
    }
}

impl Default for InteractionBridge {
    fn default() -> Self {
        Self::new()
    }
}

#[derive(Debug, Clone)]
pub struct InteractionStats {
    pub total_interactions: u64,
    pub mouse_events: usize,
    pub key_events: usize,
    pub last_interaction_tick: u64,
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_input_state() {
        let input = InputState::new();
        assert_eq!(input.mouse_x, 0.0);
        assert_eq!(input.mouse_down, false);
    }
    
    #[test]
    fn test_grid_coords() {
        let mut input = InputState::new();
        input.mouse_x = 0.5;
        input.mouse_y = 0.5;
        
        let (x, y) = input.to_grid_coords(100, 100);
        assert_eq!(x, 50);
        assert_eq!(y, 50);
    }
    
    #[test]
    fn test_signal_injection() {
        let mut input = InputState::new();
        input.mouse_x = 0.5;
        input.mouse_y = 0.5;
        input.mouse_down = true;
        
        let mut buffer = [0u8; 10000];
        input.inject_signal(&mut buffer, 100, 100);
        
        // Check that signals were injected
        assert!(buffer.iter().any(|&b| b == 0xFF));
    }
    
    #[test]
    fn test_interaction_bridge() {
        let mut bridge = InteractionBridge::new();
        
        bridge.on_mouse_down(0.5, 0.5, 100);
        assert_eq!(bridge.interaction_count, 1);
        assert!(bridge.input.mouse_down);
        
        bridge.on_mouse_up(0.5, 0.5, 110);
        assert!(!bridge.input.mouse_down);
    }
}
