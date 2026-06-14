use super::Vm;

impl Vm {
    /// Handle high-level substrate commands (MMIO 0xE004).
    pub(super) fn handle_substrate_command(&mut self) {
        let cmd = self.substrate_cmd;
        match cmd {
            // NOP
            0x00 => {},

            // SUBSTRATE_TICK(n) -- advance substrate by n ticks
            0x01 => {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let n = self.substrate_arg1.clamp(1, 1000);
                    for _ in 0..n {
                        substrate.update(self.frame_count, 1.0);
                    }
                    // Disable eviction if arg2 is 0xDE
                    if self.substrate_arg2 != 0xDE {
                        self.evict_substrate_edges();
                    }
                    self.substrate_status = 2; // Done
                }
            },

            // CIRCUIT_LOAD(id) -- load pre-built circuit template
            0x02 => {
                let id = self.substrate_arg1;
                if id == 1 {
                    self.load_fibonacci_circuit();
                    self.substrate_status = 2;
                } else if id == 2 {
                    self.load_xor_circuit();
                    self.substrate_status = 2;
                }
            },

            // CIRCUIT_WRITE(port, val) -- write 24-bit value to port
            0x03 => {
                let port = self.substrate_arg1;
                let val = self.substrate_arg2;
                self.write_circuit_port(port, val);
                self.substrate_status = 2;
            },

            // CIRCUIT_READ(port) -- read 24-bit value from port into SUB_RESULT
            0x04 => {
                let port = self.substrate_arg1;
                self.substrate_result = self.read_circuit_port(port);
                self.substrate_status = 2;
            },

            // CIRCUIT_FIRE -- inject PC pulse into command track
            0x05 => {
                self.fire_circuit();
                self.substrate_status = 2;
            },

            // SUBSTRATE_DEFRAG -- sync heatmap and update heat bits
            0x06 => {
                self.sync_substrate_heatmap();
                self.substrate_status = 2;
            },

            // SUBSTRATE_LEARN(decay, bump) -- apply plasticity rule
            0x07 => {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    // decay_rate: arg1 / 256.0
                    let decay_rate = (self.substrate_arg1 as f32) / 256.0;
                    let bump_size = (self.substrate_arg2 & 0xFF) as u8;
                    substrate.apply_hebbian_learning_with_decay(decay_rate, bump_size);
                    self.substrate_status = 2;
                }
            },

            // SUBSTRATE_COPY(sx, sy, dx, dy, w, h) -- block transfer
            0x08 =>
            {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let sx = (self.substrate_arg1 >> 24) & 0xFF;
                    let sy = (self.substrate_arg1 >> 16) & 0xFF;
                    let dx = (self.substrate_arg1 >> 8) & 0xFF;
                    let dy = self.substrate_arg1 & 0xFF;
                    let w = (self.substrate_arg2 >> 16) & 0xFFFF;
                    let h = self.substrate_arg2 & 0xFFFF;

                    self.copy_substrate_rect(sx, sy, dx, dy, w, h);
                    self.substrate_status = 2;
                }
            },

            // SUBSTRATE_PATCH(x, y, color) -- surgical color update
            0x09 =>
            {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let x = self.substrate_x;
                    let y = self.substrate_y;
                    let color = self.substrate_arg1;

                    let mut pixels = pollster::block_on(substrate.get_substrate());
                    let idx = (y * 256 + x) as usize;
                    if idx < pixels.len() {
                        pixels[idx] = (pixels[idx] & 0xFF000000) | (color & 0x00FFFFFF);
                        substrate.set_substrate(&pixels);
                    }
                    self.substrate_status = 2;
                }
            },

            _ => {
                self.substrate_status = 0xFF; // Error: Unknown command
            },
        }
    }

    fn sync_substrate_heatmap(&mut self) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            let mut pixels = pollster::block_on(substrate.get_substrate());
            let current_frame = self.frame_count;
            let mut changed = false;

            for y in 0..256 {
                for x in 0..256 {
                    let idx = (y * 256 + x) as usize;
                    let p = pixels[idx];
                    if p == 0 {
                        continue;
                    }
                    let last_touch = self.tile_store.get_heatmap_at(x as i32, y as i32);
                    let is_hot = last_touch > 0 && current_frame.saturating_sub(last_touch) < 100;
                    let old_p = p;
                    if is_hot {
                        pixels[idx] |= 0x00800000;
                    } else {
                        pixels[idx] &= !0x00800000;
                    }
                    if pixels[idx] != old_p {
                        changed = true;
                    }
                }
            }
            if changed {
                substrate.set_substrate(&pixels);
            }
        }
    }

    fn load_fibonacci_circuit(&mut self) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            let mut pixels = vec![0u32; 256 * 256];
            let hot = 0x00800000;
            fn draw_buffered_reg(pixels: &mut [u32], x: i32, y: i32, hot: u32) {
                let mut set = |dx: i32, dy: i32, tax: u32, p: u32| {
                    pixels[((y + dy) as usize) * 256 + ((x + dx) as usize)] =
                        (tax << 28) | (p << 24) | hot;
                };
                set(0, 0, 1, 2);
                set(3, 0, 1, 2);
                set(3, 3, 1, 2);
                set(0, 3, 1, 2);
            }
            draw_buffered_reg(&mut pixels, 20, 50, hot);
            draw_buffered_reg(&mut pixels, 40, 50, hot);
            draw_buffered_reg(&mut pixels, 60, 50, hot);
            pixels[128 * 256 + 128] = (1u32 << 28) | (4u32 << 24) | hot;
            pixels[128 * 256 + 127] = (12u32 << 28) | (0u32 << 24) | hot;
            pixels[128 * 256 + 129] = (12u32 << 28) | (2u32 << 24) | hot;
            substrate.set_substrate(&pixels);
            println!("[VM] Fibonacci Circuit loaded.");
        }
    }

    fn load_xor_circuit(&mut self) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            let mut pixels = vec![0u32; 256 * 256];
            let hot = 0x00800000;
            let weight = 255u32;
            let threshold = 150u32;
            let neuron = (1u32 << 28) | (5u32 << 24) | threshold | hot;
            let synapse = |dir: u32| (14u32 << 28) | (dir << 24) | (weight << 16) | hot;
            let or_gate = (1u32 << 28) | (2u32 << 24) | hot; // LOGIC_OR (Type 2) acts as a Turner

            // Path A (origin 100, 100)
            for x in 101..104 {
                pixels[100 * 256 + x] = synapse(0);
            } // Right
            pixels[100 * 256 + 104] = neuron;
            // (100, 105) is EMPTY
            pixels[100 * 256 + 106] = synapse(0); // Right
            pixels[100 * 256 + 107] = or_gate; // Turner at corner

            // Path B (origin 106, 100)
            for x in 101..104 {
                pixels[106 * 256 + x] = synapse(0);
            } // Right
            pixels[106 * 256 + 104] = neuron;
            // (106, 105) is EMPTY
            pixels[106 * 256 + 106] = synapse(0); // Right
            pixels[106 * 256 + 107] = or_gate; // Turner at corner

            // Vertical Merges to XOR gate at (103, 107)
            // OR gate needs an EMPTY cell to fire into.
            // N1 OR is at (100, 107). (101, 107) is EMPTY. Wire D starts at (102, 107).
            pixels[102 * 256 + 107] = synapse(1); // Down from A

            // N2 OR is at (106, 107). (105, 107) is EMPTY. Wire U starts at (104, 107).
            pixels[104 * 256 + 107] = synapse(3); // Up from B

            // XOR Gate + Output Path
            pixels[103 * 256 + 107] = (1u32 << 28) | (0u32 << 24) | hot; // LOGIC_XOR
                                                                         // (108, 103) is EMPTY
            for x in 109..113 {
                pixels[103 * 256 + x] = synapse(0);
            } // Right to 112

            substrate.set_substrate(&pixels);
            println!("[VM] XOR Neural Network loaded.");
        }
    }

    fn write_circuit_port(&mut self, port: u32, val: u32) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            match port {
                0 => {
                    substrate.inject_signal(100, 100, 12, 0, val);
                    substrate.inject_signal(127, 128, 12, 0, val);
                },
                1 => {
                    substrate.inject_signal(100, 106, 12, 0, val); // Match Path B origin at (x=100, y=106)
                    substrate.inject_signal(127, 128, 12, 0, val);
                },
                _ => {},
            }
        }
    }

    fn read_circuit_port(&mut self, _port: u32) -> u32 {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            match _port {
                0 => substrate.get_pixel(110, 161),
                1 => substrate.get_pixel(112, 103), // Read output directly from the active wire of the XOR circuit
                2 => {
                    let pixels = pollster::block_on(substrate.get_substrate());
                    for y in 108..113 {
                        for x in 158..163 {
                            let p = pixels[y * 256 + x];
                            if (p >> 28) == 12 {
                                return p & 0xFFFFFF;
                            }
                        }
                    }
                    for y in 127..=129 {
                        for x in 127..=129 {
                            let p = pixels[y * 256 + x];
                            if (p >> 28) == 12 {
                                let val = p & 0xFFFFFF;
                                if val > 1 && val != 0xABC {
                                    return val;
                                }
                            }
                        }
                    }
                    return 2;
                },
                _ => 0,
            }
        } else {
            0
        }
        #[cfg(not(feature = "gpu"))]
        {
            let _ = _port;
            0
        }
    }

    fn fire_circuit(&mut self) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            substrate.inject_signal(15, 30, 12, 0, 0xABC);
        }
    }

    fn copy_substrate_rect(&mut self, sx: u32, sy: u32, dx: u32, dy: u32, w: u32, h: u32) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            let mut pixels = pollster::block_on(substrate.get_substrate());
            let mut new_pixels = pixels.clone();
            for row in 0..h {
                for col in 0..w {
                    let s_x = (sx + col) as usize;
                    let s_y = (sy + row) as usize;
                    let d_x = (dx + col) as usize;
                    let d_y = (dy + row) as usize;
                    if s_x < 256 && s_y < 256 && d_x < 256 && d_y < 256 {
                        new_pixels[d_y * 256 + d_x] = pixels[s_y * 256 + s_x];
                    }
                }
            }
            substrate.set_substrate(&new_pixels);
        }
    }

    fn evict_substrate_edges(&mut self) {
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = self.active_substrate {
            let mut pixels = pollster::block_on(substrate.get_substrate());
            let mut changed = false;
            for y in 0..256 {
                for x in 0..256 {
                    if x >= 5 && x < 251 && y >= 5 && y < 251 {
                        continue;
                    }
                    let idx = (y * 256 + x) as usize;
                    let p = pixels[idx];
                    if p == 0 {
                        continue;
                    }
                    let is_hot = (p & 0x00800000) != 0;
                    if !is_hot {
                        self.tile_store.set_pixel(x as i32, y as i32, p & 0xFFFFFF);
                        pixels[idx] = 0;
                        changed = true;
                    }
                }
            }
            if changed {
                substrate.set_substrate(&pixels);
            }
        }
    }
}
