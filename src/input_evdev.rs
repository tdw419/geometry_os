use std::fs::{self, File};
use std::io::Read;
use std::os::unix::io::AsRawFd;
use std::sync::{Arc, Mutex};
use std::thread;

// Basic Linux evdev structures
#[repr(C)]
struct TimeVal {
    tv_sec: libc::time_t,
    tv_usec: libc::suseconds_t,
}

#[repr(C)]
struct InputEvent {
    time: TimeVal,
    type_: u16,
    code: u16,
    value: i32,
}

const EV_KEY: u16 = 0x01;
const EV_REL: u16 = 0x02;
const EV_ABS: u16 = 0x03;
const SYN_REPORT: u16 = 0x00;

#[derive(Default, Clone)]
pub struct InputState {
    pub keys: Vec<u16>,         // Active keys held (raw code)
    pub keys_pressed: Vec<u16>, // Keys pressed since last tick
    pub mouse_x: f32,
    pub mouse_y: f32,
    pub mouse_left: bool,
    pub mouse_right: bool,
    pub mouse_middle: bool,
    pub scroll_y: f32,
}

pub struct EvdevReader {
    state: Arc<Mutex<InputState>>,
}

impl EvdevReader {
    pub fn new() -> Self {
        let state = Arc::new(Mutex::new(InputState::default()));
        let state_clone = state.clone();

        // Spawn background thread to find and monitor input devices
        thread::spawn(move || {
            // Locate keyboard and mouse event paths
            let mut devices = Vec::new();
            if let Ok(entries) = fs::read_dir("/dev/input") {
                for entry in entries.flatten() {
                    let path = entry.path();
                    if let Some(name) = path.file_name().and_then(|n| n.to_str()) {
                        if name.starts_with("event") {
                            if let Ok(file) = File::open(&path) {
                                devices.push(file);
                            }
                        }
                    }
                }
            }

            if devices.is_empty() {
                eprintln!("[evdev] No input devices found in /dev/input/. Run with sudo?");
                return;
            }

            println!("[evdev] Monitoring {} input devices...", devices.len());

            // Monitor devices using poll
            let mut poll_fds: Vec<libc::pollfd> = devices
                .iter()
                .map(|f| libc::pollfd {
                    fd: f.as_raw_fd(),
                    events: libc::POLLIN,
                    revents: 0,
                })
                .collect();

            let mut buffer = [0u8; std::mem::size_of::<InputEvent>()];

            loop {
                let ret = unsafe {
                    libc::poll(
                        poll_fds.as_mut_ptr(),
                        poll_fds.len() as libc::nfds_t,
                        100, // Timeout 100ms
                    )
                };

                if ret > 0 {
                    for (i, pfd) in poll_fds.iter().enumerate() {
                        if (pfd.revents & libc::POLLIN) != 0 {
                            if let Ok(n) = (&devices[i]).read(&mut buffer) {
                                if n == std::mem::size_of::<InputEvent>() {
                                    let event: InputEvent = unsafe { std::mem::transmute(buffer) };
                                    Self::process_event(&state_clone, &event);
                                }
                            }
                        }
                    }
                }
            }
        });

        EvdevReader { state }
    }

    pub fn get_state(&self) -> InputState {
        let mut guard = self.state.lock().unwrap();
        let state = guard.clone();
        // Clear pressed keys and scroll buffer on tick read
        guard.keys_pressed.clear();
        guard.scroll_y = 0.0;
        state
    }

    fn process_event(state_lock: &Arc<Mutex<InputState>>, event: &InputEvent) {
        let mut state = state_lock.lock().unwrap();
        match event.type_ {
            EV_KEY => {
                let code = event.code;
                let val = event.value; // 0 = release, 1 = press, 2 = autorepeat
                if val == 1 {
                    if !state.keys.contains(&code) {
                        state.keys.push(code);
                    }
                    state.keys_pressed.push(code);
                } else if val == 0 {
                    state.keys.retain(|&k| k != code);
                }

                // Map mouse buttons (common codes)
                match code {
                    272 => state.mouse_left = val != 0,
                    273 => state.mouse_right = val != 0,
                    274 => state.mouse_middle = val != 0,
                    _ => {},
                }
            },
            EV_REL => {
                // Relative mouse motion
                match event.code {
                    0 => {
                        state.mouse_x = (state.mouse_x + event.value as f32)
                            .max(0.0)
                            .min(256.0 * 4.0)
                    }, // Scale boundaries
                    1 => {
                        state.mouse_y = (state.mouse_y + event.value as f32)
                            .max(0.0)
                            .min(256.0 * 4.0)
                    },
                    8 => state.scroll_y = event.value as f32, // scroll wheel
                    _ => {},
                }
            },
            EV_ABS => {
                // Absolute coordinate tracking (e.g. tablet or touchscreen)
                match event.code {
                    0 => state.mouse_x = event.value as f32,
                    1 => state.mouse_y = event.value as f32,
                    _ => {},
                }
            },
            _ => {},
        }
    }
}
