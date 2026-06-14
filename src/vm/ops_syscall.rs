use super::Vm;
use crate::vm::types::*;

impl Vm {
    /// Handle syscall execution (Opcode 0x52..=0x5F).
    pub fn step_syscall(&mut self, opcode: u32) -> bool {
        match opcode {
            // SYSCALL (0x52)
            0x52 => {
                let syscall_num = self.regs[0];
                match syscall_num {
                    // 0: EXIT(status)
                    0 => {
                        let status = self.regs[1];
                        self.halted = true;
                        self.step_exit_code = Some(status);
                        return false;
                    },

                    // 1: BRK(addr) -- set heap break (currently no-op)
                    1 => {
                        self.regs[0] = 0;
                    },

                    // 2: FORK() -- spawn child process (TODO: implement child fork)
                    2 => {
                        self.regs[0] = geos_errno(GEOS_ENOTSUP);
                    },

                    // 3: GETPID() -- return current PID
                    3 => {
                        self.regs[0] = self.current_pid;
                    },

                    // 10: AGENT_ASSIGN(role, x, y, w, h)
                    // r1=role, r2=x, r3=y, r4=w, r5=h
                    // Returns agent_id in r0, or errno.
                    10 => {
                        let role = self.regs[1];
                        let x = self.regs[2] as i32;
                        let y = self.regs[3] as i32;
                        let w = self.regs[4];
                        let h = self.regs[5];

                        match self.area_manager.assign_sector(role, x, y, w, h) {
                            Ok(id) => {
                                self.regs[0] = id as u32;
                                // Synchronize RAM table immediately
                                self.area_manager.write_to_ram(&mut self.ram);
                            },
                            Err(_) => {
                                self.regs[0] = geos_errno(GEOS_ENOMEM); // or EINVAL
                            },
                        }
                    },

                    // 11: AGENT_CONTROL(cmd)
                    // r1=cmd (1=start, 2=stop)
                    11 => {
                        let cmd = self.regs[1];
                        if cmd == 1 {
                            self.area_manager.start();
                        } else if cmd == 2 {
                            self.area_manager.stop();
                        }
                        self.regs[0] = 0;
                    },

                    // 12: CHAIN_LOAD(path_addr)
                    // r1=path_addr in RAM
                    // Replaces current program with target. Returns 0 on success (but doesn't return), or errno.
                    12 => {
                        let path_addr = self.regs[1] as usize;
                        if let Some(filename) = Self::read_string_static(&self.ram, path_addr) {
                            if self.chain_load(&filename) {
                                self.regs[0] = 0;
                                return true;
                            }
                        }
                        self.regs[0] = geos_errno(GEOS_ENOENT);
                    },

                    // 59: BACKBUF(sub_cmd, data) -- double buffer operations
                    // r1 = sub_cmd, r2 = data
                    // sub_cmd 0 (ALLOCBB): Allocate back buffer (SCREEN_SIZE pixels). Returns 0 on success.
                    // sub_cmd 1 (SWAPBB):  Copy back_buffer -> screen. Returns error if not allocated.
                    // sub_cmd 2 (SETACTIVE): Set back_buffer_active = r2. When active, pixel ops write to back buffer.
                    59 => {
                        let sub_cmd = self.regs[1];
                        let data = self.regs[2];
                        match sub_cmd {
                            0 => {
                                // ALLOCBB
                                if self.back_buffer.is_empty() {
                                    self.back_buffer = vec![0; SCREEN_SIZE];
                                }
                                self.regs[0] = 0;
                            },
                            1 => {
                                // SWAPBB
                                if self.back_buffer.is_empty() {
                                    self.regs[0] = geos_errno(GEOS_EINVAL);
                                } else {
                                    self.screen.copy_from_slice(&self.back_buffer);
                                    self.regs[0] = 0;
                                }
                            },
                            2 => {
                                // SETACTIVE
                                self.back_buffer_active = data != 0;
                                self.regs[0] = 0;
                            },
                            _ => {
                                self.regs[0] = geos_errno(GEOS_EINVAL);
                            },
                        }
                    },

                    _ => {
                        // Unknown syscall -- return ENOTSUP
                        self.regs[0] = geos_errno(GEOS_ENOTSUP);
                    },
                }
            },

            // RETK (0x53) -- return from syscall handler
            // Pops (return_pc, saved_mode) from kernel_stack
            0x53 => {
                if let Some((return_pc, saved_mode)) = self.kernel_stack.pop() {
                    self.pc = return_pc;
                    self.mode = saved_mode;
                } else {
                    // RETK with empty kernel stack = protection fault
                    self.halted = true;
                    return false;
                }
            },

            // 54: OPEN path_reg, mode_reg -- returns fd in r0
            0x54 => {
                if let (Some(path_reg), Some(mode_reg)) = (self.fetch_reg(), self.fetch_reg()) {
                    let path_addr = self.regs[path_reg];
                    let mode = self.regs[mode_reg];
                    let path_str = Self::read_string_static(&self.ram, path_addr as usize);

                    // Phase 102: Capability enforcement
                    if let Some(ref path) = path_str {
                        let caps = if self.current_capabilities.is_some() {
                            self.current_capabilities.clone()
                        } else {
                            let pid = self.current_pid;
                            self.processes
                                .iter()
                                .find(|p| p.pid == pid)
                                .and_then(|p| p.capabilities.clone())
                        };
                        let perm = if mode == 0 {
                            Capability::PERM_READ
                        } else {
                            Capability::PERM_WRITE
                        };
                        if !check_path_capability(&caps, path, perm) {
                            self.regs[0] = geos_errno(GEOS_EPERM);
                            return true;
                        }
                    }

                    if let Some(ref path) = path_str {
                        // Check for devices
                        for (i, &name) in DEVICE_NAMES.iter().enumerate() {
                            if path == name {
                                self.regs[0] = DEVICE_FD_BASE + i as u32;
                                return true;
                            }
                        }

                        // Phase P: Spatial File System Bridge
                        if path.starts_with("/grid/") || path.starts_with("/hilbert/") {
                            let (x, y, w, h) = if path.starts_with("/grid/") {
                                let coords = &path["/grid/".len()..];
                                let parts: Vec<&str> = coords.split(',').collect();
                                if parts.len() == 4 {
                                    (
                                        parts[0].parse::<u32>().unwrap_or(0),
                                        parts[1].parse::<u32>().unwrap_or(0),
                                        parts[2].parse::<u32>().unwrap_or(1),
                                        parts[3].parse::<u32>().unwrap_or(1),
                                    )
                                } else {
                                    (0, 0, 0, 0) // Invalid
                                }
                            } else {
                                // /hilbert/index -> map to 64x64 chunk
                                let index_str = &path["/hilbert/".len()..];
                                if let Ok(index) = index_str.parse::<u64>() {
                                    let (cx, cy) =
                                        crate::tile_store::TileStore::hilbert_to_chunk(index);
                                    ((cx * 64).max(0) as u32, (cy * 64).max(0) as u32, 64, 64)
                                } else {
                                    (0, 0, 0, 0)
                                }
                            };

                            if w > 0 && h > 0 {
                                // Find a free spatial FD slot (0x7000 - 0x700F)
                                let mut fd = 0u32;
                                for i in 0..16 {
                                    let candidate = 0x7000 + i;
                                    if !self.spatial_files.contains_key(&candidate) {
                                        fd = candidate;
                                        break;
                                    }
                                }

                                if fd != 0 {
                                    self.spatial_files.insert(
                                        fd,
                                        SpatialFile {
                                            x,
                                            y,
                                            w,
                                            h,
                                            cursor: 0,
                                        },
                                    );
                                    self.regs[0] = fd;
                                } else {
                                    self.regs[0] = geos_errno(GEOS_ENFILE);
                                }
                            } else {
                                self.regs[0] = geos_errno(GEOS_EINVAL);
                            }
                        } else {
                            let pid = self.current_pid;
                            let fd = self.vfs.fopen(&self.ram, path_addr, mode, pid);
                            self.regs[0] = fd;
                        }
                    } else {
                        self.regs[0] = geos_errno(GEOS_EINVAL);
                    }
                }
            },

            // 55: READ fd_reg, buf_addr_reg, len_reg
            0x55 => {
                if let (Some(fd_reg), Some(buf_reg), Some(len_reg)) =
                    (self.fetch_reg(), self.fetch_reg(), self.fetch_reg())
                {
                    let fd = self.regs[fd_reg];
                    if (0x7000..0x7010).contains(&fd) {
                        let mut sf = if let Some(sf) = self.spatial_files.get(&fd) {
                            *sf
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF);
                            return true;
                        };
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        let mut count = 0usize;
                        #[cfg(feature = "gpu")]
                        if let Some(ref mut substrate) = self.active_substrate {
                            let pixels = pollster::block_on(substrate.get_substrate());
                            for i in 0..len {
                                let pixel_idx = sf.cursor + i as u32;
                                if pixel_idx >= sf.w * sf.h {
                                    break;
                                }
                                let lx = pixel_idx % sf.w;
                                let ly = pixel_idx / sf.w;
                                let gx = (sf.x + lx) as usize;
                                let gy = (sf.y + ly) as usize;
                                if gx < 256 && gy < 256 && (buf_addr + i) < self.ram.len() {
                                    self.ram[buf_addr + i] = pixels[gy * 256 + gx];
                                    count += 1;
                                }
                            }
                            sf.cursor += count as u32;
                            self.spatial_files.insert(fd, sf);
                        }
                        self.regs[0] = count as u32;
                    }
                    // Check if this is a pipe read fd (0x8000+idx)
                    else if (0x8000..0xC000).contains(&fd) {
                        let pipe_idx = (fd & 0x0FFF) as usize;
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        if pipe_idx < self.pipes.len() && self.pipes[pipe_idx].alive {
                            let mut count = 0usize;
                            for i in 0..len {
                                let addr = buf_addr + i;
                                if addr >= self.ram.len() {
                                    break;
                                }
                                if let Some(word) = self.pipes[pipe_idx].read_word() {
                                    self.ram[addr] = word;
                                    count += 1;
                                } else {
                                    break; // pipe empty
                                }
                            }
                            self.regs[0] = count as u32;
                        } else {
                            self.regs[0] = 0xFFFFFFFF; // bad pipe fd or pipe closed
                        }
                    } else {
                        let buf_addr = self.regs[buf_reg];
                        let len = self.regs[len_reg];
                        let pid = self.current_pid;
                        let n = self.vfs.fread(&mut self.ram, fd, buf_addr, len, pid);
                        self.regs[0] = n;
                    }
                }
            },

            // 56: WRITE fd_reg, buf_addr_reg, len_reg
            0x56 => {
                if let (Some(fd_reg), Some(buf_reg), Some(len_reg)) =
                    (self.fetch_reg(), self.fetch_reg(), self.fetch_reg())
                {
                    let fd = self.regs[fd_reg];
                    if (0x7000..0x7010).contains(&fd) {
                        let mut sf = if let Some(sf) = self.spatial_files.get(&fd) {
                            *sf
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF);
                            return true;
                        };
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        let mut count = 0usize;
                        #[cfg(feature = "gpu")]
                        if let Some(ref mut substrate) = self.active_substrate {
                            for i in 0..len {
                                let pixel_idx = sf.cursor + i as u32;
                                if pixel_idx >= sf.w * sf.h {
                                    break;
                                }
                                let lx = pixel_idx % sf.w;
                                let ly = pixel_idx / sf.w;
                                let gx = sf.x + lx;
                                let gy = sf.y + ly;
                                if gx < 256 && gy < 256 && (buf_addr + i) < self.ram.len() {
                                    substrate.set_pixel(gx, gy, self.ram[buf_addr + i]);
                                    count += 1;
                                }
                            }
                            sf.cursor += count as u32;
                            self.spatial_files.insert(fd, sf);
                        }
                        self.regs[0] = count as u32;
                    }
                    // Check if this is a pipe write fd (0xC000+idx)
                    else if (0xC000..DEVICE_FD_BASE).contains(&fd) {
                        let pipe_idx = (fd & 0x0FFF) as usize;
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        if pipe_idx < self.pipes.len() && self.pipes[pipe_idx].alive {
                            let mut count = 0usize;
                            for i in 0..len {
                                let addr = buf_addr + i;
                                if addr >= self.ram.len() {
                                    break;
                                }
                                if self.pipes[pipe_idx].write_word(self.ram[addr]) {
                                    count += 1;
                                } else {
                                    break; // pipe full
                                }
                            }
                            self.regs[0] = count as u32;
                            // Unblock any process blocked on read from this pipe
                            for proc in &mut self.processes {
                                if proc.state == ProcessState::Blocked && !proc.is_halted() {
                                    proc.state = ProcessState::Ready;
                                }
                            }
                        } else {
                            self.regs[0] = 0xFFFFFFFF; // bad pipe fd or pipe closed
                        }
                    } else {
                        let buf_addr = self.regs[buf_reg];
                        let len = self.regs[len_reg];
                        let pid = self.current_pid;
                        let n = self.vfs.fwrite(&self.ram, fd, buf_addr, len, pid);
                        self.regs[0] = n;
                    }
                }
            },

            // 57: CLOSE fd_reg
            0x57 => {
                if let Some(fd_reg) = self.fetch_reg() {
                    let fd = self.regs[fd_reg];
                    if (0x7000..0x7010).contains(&fd) {
                        if self.spatial_files.remove(&fd).is_some() {
                            self.regs[0] = 0;
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF);
                        }
                    }
                    // Check if this is a pipe fd (0x8000 read, 0xC000 write)
                    else if (0x8000..DEVICE_FD_BASE).contains(&fd) {
                        let pipe_idx = (fd & 0x0FFF) as usize;
                        if pipe_idx < self.pipes.len() {
                            // Mark pipe as dead (both read and write ends closed)
                            self.pipes[pipe_idx].alive = false;
                            self.regs[0] = 0;
                        } else {
                            self.regs[0] = 0xFFFFFFFF;
                        }
                    }
                    // Device fds (0xE000+) are always-open handles, close succeeds
                    else if fd >= DEVICE_FD_BASE
                        && fd < DEVICE_FD_BASE + DEVICE_NAMES.len() as u32
                    {
                        self.regs[0] = 0;
                    } else {
                        let pid = self.current_pid;
                        let n = self.vfs.fclose(fd, pid);
                        self.regs[0] = n;
                    }
                }
            },

            // 58: SEEK fd_reg, offset_reg, whence_reg
            0x58 => {
                if let (Some(fd_reg), Some(offset_reg), Some(whence_reg)) =
                    (self.fetch_reg(), self.fetch_reg(), self.fetch_reg())
                {
                    let fd = self.regs[fd_reg];
                    let offset = self.regs[offset_reg];
                    let whence = self.regs[whence_reg];
                    if (0x7000..0x7010).contains(&fd) {
                        let mut sf = if let Some(sf) = self.spatial_files.get(&fd) {
                            *sf
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF);
                            return true;
                        };
                        let size = sf.w * sf.h;
                        sf.cursor = match whence {
                            0 => offset,
                            1 => (sf.cursor as i32 + offset as i32) as u32,
                            2 => (size as i32 + offset as i32) as u32,
                            _ => sf.cursor,
                        }
                        .clamp(0, size);
                        self.spatial_files.insert(fd, sf);
                        self.regs[0] = sf.cursor;
                    } else {
                        let pid = self.current_pid;
                        let n = self.vfs.fseek(fd, offset, whence, pid);
                        self.regs[0] = n;
                    }
                }
            },

            // LS buf_addr_reg  -- list directory entries into RAM buffer
            // Returns entry count in r0
            0x59 => {
                let buf_reg = self.fetch() as usize;
                if buf_reg < NUM_REGS {
                    let buf_addr = self.regs[buf_reg];
                    let count = self.vfs.fls(&mut self.ram, buf_addr);
                    self.regs[0] = count;
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // YIELD -- cooperative yield, give up remaining time slice
            0x5A => {
                self.yielded = true;
            },

            // SLEEP ticks_reg -- sleep for N scheduler ticks
            0x5B => {
                let tr = self.fetch() as usize;
                if tr < NUM_REGS {
                    self.sleep_frames = self.regs[tr];
                }
            },

            // SETPRIORITY priority_reg -- set current process priority (0-3)
            0x5C => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    self.new_priority = self.regs[pr].min(3) as u8;
                }
            },

            // PIPE rd_read, rd_write -- create a unidirectional pipe
            // r0 = read_fd (0x8000+idx) or error code on error, r1 = write_fd (0xC000+idx)
            0x5D => {
                let rr = self.fetch() as usize;
                let rw = self.fetch() as usize;
                if rr < NUM_REGS && rw < NUM_REGS {
                    if self.pipes.len() < MAX_PIPES {
                        let pid = self.current_pid;
                        let idx = self.pipes.len() as u32;
                        self.pipes.push(Pipe::new(pid, pid));
                        self.regs[rr] = 0x8000 | idx;
                        self.regs[rw] = 0xC000 | idx;
                        self.regs[0] = 0; // success
                    } else {
                        self.regs[0] = geos_errno(GEOS_ENFILE); // too many pipes
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // MSGSND pid_reg -- send r1..r4 as a 4-word message to target PID
            // r0 = 0 on success, error code on error
            0x5E => {
                let pid_reg = self.fetch() as usize;
                if pid_reg < NUM_REGS {
                    let target_pid = self.regs[pid_reg];
                    let sender_pid = self.current_pid;
                    let data = [self.regs[1], self.regs[2], self.regs[3], self.regs[4]];
                    // Find target process and deliver message
                    let mut delivered = false;
                    for proc in &mut self.processes {
                        if proc.pid == target_pid && !proc.is_halted() {
                            if proc.msg_queue.len() < MAX_MESSAGES {
                                proc.msg_queue.push(Message::new(sender_pid, data));
                                delivered = true;
                                // If process is blocked waiting for a message, unblock it
                                if proc.state == ProcessState::Blocked {
                                    proc.state = ProcessState::Ready;
                                }
                            }
                            break;
                        }
                    }
                    if delivered {
                        self.regs[0] = 0;
                    } else {
                        self.regs[0] = geos_errno(GEOS_ESRCH); // no such process or queue full
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // MSGRCV -- receive a message (blocks if none pending)
            // On success: r0 = sender PID, r1..r4 = message data
            // If no message: process blocks (scheduler will retry)
            0x5F => {
                let pid = self.current_pid;
                // Check if this is a child process
                if pid > 0 {
                    if let Some(proc) = self.processes.iter_mut().find(|p| p.pid == pid) {
                        if let Some(msg) = proc.msg_queue.first().cloned() {
                            proc.msg_queue.remove(0);
                            self.regs[0] = msg.sender;
                            self.regs[1] = msg.data[0];
                            self.regs[2] = msg.data[1];
                            self.regs[3] = msg.data[2];
                            self.regs[4] = msg.data[3];
                        } else {
                            // No message: block this process
                            proc.state = ProcessState::Blocked;
                            // Rewind PC so MSGRCV retries after unblock
                            self.pc -= 1;
                        }
                    }
                } else {
                    // Main process: check msg queue on VM (non-blocking for simplicity)
                    self.regs[0] = geos_errno(GEOS_EINVAL); // main process has no msg queue
                }
            },

            _ => {
                // Unknown opcode
            },
        }
        true
    }
}
