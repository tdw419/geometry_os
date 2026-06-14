use crate::framebuffer::Framebuffer;
use crate::input_evdev::EvdevReader;
use minifb::{Error, Key, KeyRepeat, MouseButton, MouseMode, Window, WindowOptions};

pub struct GeOsWindow {
    pub inner: Option<Window>,
    pub fb: Option<Framebuffer>,
    pub evdev: Option<EvdevReader>,
}

impl GeOsWindow {
    pub fn new(
        title: &str,
        width: usize,
        height: usize,
        opts: WindowOptions,
        use_fb: bool,
    ) -> Result<Self, String> {
        if use_fb {
            let fb = Framebuffer::new()?;
            let evdev = EvdevReader::new();
            Ok(GeOsWindow {
                inner: None,
                fb: Some(fb),
                evdev: Some(evdev),
            })
        } else {
            let win = Window::new(title, width, height, opts)
                .map_err(|e| format!("Failed to create window: {}", e))?;
            Ok(GeOsWindow {
                inner: Some(win),
                fb: None,
                evdev: None,
            })
        }
    }

    pub fn set_target_fps(&mut self, fps: usize) {
        if let Some(ref mut win) = self.inner {
            win.set_target_fps(fps);
        }
    }

    pub fn is_open(&self) -> bool {
        if let Some(ref win) = self.inner {
            win.is_open()
        } else {
            true // Framebuffer mode is always "open"
        }
    }

    pub fn is_key_down(&self, key: Key) -> bool {
        if let Some(ref win) = self.inner {
            win.is_key_down(key)
        } else if let Some(ref reader) = self.evdev {
            let state = reader.get_state();
            for &k in &state.keys {
                if let Some(mapped) = evdev_code_to_minifb_key(k) {
                    if mapped == key {
                        return true;
                    }
                }
            }
            false
        } else {
            false
        }
    }

    pub fn get_keys_pressed(&self, _repeat: KeyRepeat) -> Vec<Key> {
        if let Some(ref win) = self.inner {
            win.get_keys_pressed(_repeat)
        } else if let Some(ref reader) = self.evdev {
            let state = reader.get_state();
            state
                .keys_pressed
                .iter()
                .filter_map(|&k| evdev_code_to_minifb_key(k))
                .collect()
        } else {
            Vec::new()
        }
    }

    pub fn get_mouse_down(&self, button: MouseButton) -> bool {
        if let Some(ref win) = self.inner {
            win.get_mouse_down(button)
        } else if let Some(ref reader) = self.evdev {
            let state = reader.get_state();
            match button {
                MouseButton::Left => state.mouse_left,
                MouseButton::Right => state.mouse_right,
                MouseButton::Middle => state.mouse_middle,
            }
        } else {
            false
        }
    }

    pub fn get_mouse_pos(&self, _mode: MouseMode) -> Option<(f32, f32)> {
        if let Some(ref win) = self.inner {
            win.get_mouse_pos(_mode)
        } else if let Some(ref reader) = self.evdev {
            let state = reader.get_state();
            // Evdev positions are absolute or relative accumulation. Clip to canvas boundaries.
            Some((state.mouse_x, state.mouse_y))
        } else {
            None
        }
    }

    pub fn get_scroll_wheel(&self) -> Option<(f32, f32)> {
        if let Some(ref win) = self.inner {
            win.get_scroll_wheel()
        } else if let Some(ref reader) = self.evdev {
            let state = reader.get_state();
            if state.scroll_y != 0.0 {
                Some((0.0, state.scroll_y))
            } else {
                None
            }
        } else {
            None
        }
    }

    pub fn update_with_buffer(
        &mut self,
        buffer: &[u32],
        width: usize,
        height: usize,
    ) -> Result<(), Error> {
        if let Some(ref mut win) = self.inner {
            win.update_with_buffer(buffer, width, height)
        } else if let Some(ref mut fb) = self.fb {
            unsafe {
                fb.blit(buffer, width, height);
            }
            // Sleep briefly to simulate target framerate limit
            std::thread::sleep(std::time::Duration::from_millis(16));
            Ok(())
        } else {
            Ok(())
        }
    }
}

/// Helper translation function mapping common Linux evdev codes to minifb::Key
fn evdev_code_to_minifb_key(code: u16) -> Option<Key> {
    match code {
        1 => Some(Key::Escape),
        2 => Some(Key::Key1),
        3 => Some(Key::Key2),
        4 => Some(Key::Key3),
        5 => Some(Key::Key4),
        6 => Some(Key::Key5),
        7 => Some(Key::Key6),
        8 => Some(Key::Key7),
        9 => Some(Key::Key8),
        10 => Some(Key::Key9),
        11 => Some(Key::Key0),
        12 => Some(Key::Minus),
        13 => Some(Key::Equal),
        14 => Some(Key::Backspace),
        15 => Some(Key::Tab),
        16 => Some(Key::Q),
        17 => Some(Key::W),
        18 => Some(Key::E),
        19 => Some(Key::R),
        20 => Some(Key::T),
        21 => Some(Key::Y),
        22 => Some(Key::U),
        23 => Some(Key::I),
        24 => Some(Key::O),
        25 => Some(Key::P),
        26 => Some(Key::LeftBracket),
        27 => Some(Key::RightBracket),
        28 => Some(Key::Enter),
        29 => Some(Key::LeftCtrl),
        30 => Some(Key::A),
        31 => Some(Key::S),
        32 => Some(Key::D),
        33 => Some(Key::F),
        34 => Some(Key::G),
        35 => Some(Key::H),
        36 => Some(Key::J),
        37 => Some(Key::K),
        38 => Some(Key::L),
        39 => Some(Key::Semicolon),
        40 => Some(Key::Apostrophe),
        41 => Some(Key::Backquote),
        42 => Some(Key::LeftShift),
        43 => Some(Key::Backslash),
        44 => Some(Key::Z),
        45 => Some(Key::X),
        46 => Some(Key::C),
        47 => Some(Key::V),
        48 => Some(Key::B),
        49 => Some(Key::N),
        50 => Some(Key::M),
        51 => Some(Key::Comma),
        52 => Some(Key::Period),
        53 => Some(Key::Slash),
        54 => Some(Key::RightShift),
        56 => Some(Key::LeftAlt),
        57 => Some(Key::Space),
        58 => Some(Key::CapsLock),
        59 => Some(Key::F1),
        60 => Some(Key::F2),
        61 => Some(Key::F3),
        62 => Some(Key::F4),
        63 => Some(Key::F5),
        64 => Some(Key::F6),
        65 => Some(Key::F7),
        66 => Some(Key::F8),
        67 => Some(Key::F9),
        68 => Some(Key::F10),
        87 => Some(Key::F11),
        88 => Some(Key::F12),
        97 => Some(Key::RightCtrl),
        100 => Some(Key::RightAlt),
        103 => Some(Key::Up),
        104 => Some(Key::PageUp),
        105 => Some(Key::Left),
        106 => Some(Key::Right),
        108 => Some(Key::Down),
        109 => Some(Key::PageDown),
        110 => Some(Key::Insert),
        111 => Some(Key::Delete),
        _ => None,
    }
}
