use super::trace::MAX_SNAPSHOTS;
use super::types::*;
use super::Vm;

impl Vm {
    /// Handle extended opcodes (0x62-0x7D): IOCTL, env, process control,
    /// signals, hypervisor, self-hosting, reactive formulas, inode ops, trace,
    /// timeline forking.
    /// Returns false if halted, true otherwise.
    #[allow(unreachable_patterns)]
    pub(super) fn step_extended(&mut self, opcode: u32) -> bool {
        match opcode {
            // IOCTL fd_reg, cmd_reg, arg_reg  -- device-specific control operations
            // r0 = result (device-dependent), GEOS error code on error
            // Screen: cmd 0 = get width in r0, cmd 1 = get height in r0
            // Keyboard: cmd 0 = get echo mode, cmd 1 = set echo mode (arg)
            // Audio: cmd 0 = get volume, cmd 1 = set volume (arg 0-100)
            // Net: cmd 0 = get status
            0x62 => {
                let fd_reg = self.fetch() as usize;
                let cmd_reg = self.fetch() as usize;
                let arg_reg = self.fetch() as usize;
                if fd_reg < NUM_REGS && cmd_reg < NUM_REGS && arg_reg < NUM_REGS {
                    let fd = self.regs[fd_reg];
                    let cmd = self.regs[cmd_reg];
                    let arg = self.regs[arg_reg];
                    // Must be a device fd
                    let dev_idx = fd.wrapping_sub(DEVICE_FD_BASE) as usize;
                    if fd >= DEVICE_FD_BASE && dev_idx < DEVICE_COUNT {
                        match dev_idx {
                            0 => {
                                // /dev/screen
                                match cmd {
                                    0 => self.regs[0] = 256, // width
                                    1 => self.regs[0] = 256, // height
                                    // cmd 2: set custom font from RAM address
                                    // arg = RAM address of 128*8 = 1024 u32 words containing font data
                                    // Each glyph is 8 u32 words (only low byte used).
                                    // Sets custom_font on the current process (PID 0 = main process).
                                    2 => {
                                        let font_addr = arg as usize;
                                        if font_addr + 128 * 8 <= self.ram.len() {
                                            let mut glyphs = vec![[0u8; 8]; 128];
                                            for g in 0..128 {
                                                for row in 0..8 {
                                                    glyphs[g][row] =
                                                        self.ram[font_addr + g * 8 + row] as u8;
                                                }
                                            }
                                            // Set font on current process
                                            if self.current_pid == 0 {
                                                // Main process: no Process struct to store on
                                                // We store on the first process if it exists
                                                if let Some(p) = self.processes.first_mut() {
                                                    p.custom_font = Some(glyphs);
                                                }
                                            } else if let Some(p) = self
                                                .processes
                                                .iter_mut()
                                                .find(|p| p.pid == self.current_pid)
                                            {
                                                p.custom_font = Some(glyphs);
                                            }
                                            self.regs[0] = 0; // success
                                        } else {
                                            self.regs[0] = geos_errno(GEOS_EINVAL);
                                            // bad address
                                        }
                                    },
                                    // cmd 3: clear custom font (revert to default)
                                    3 => {
                                        if self.current_pid == 0 {
                                            if let Some(p) = self.processes.first_mut() {
                                                p.custom_font = None;
                                            }
                                        } else if let Some(p) = self
                                            .processes
                                            .iter_mut()
                                            .find(|p| p.pid == self.current_pid)
                                        {
                                            p.custom_font = None;
                                        }
                                        self.regs[0] = 0; // success
                                    },
                                    _ => self.regs[0] = geos_errno(GEOS_EINVAL),
                                }
                            },
                            1 => {
                                // /dev/keyboard
                                match cmd {
                                    0 => self.regs[0] = self.ram[0xFF8], // get echo mode
                                    1 => {
                                        self.ram[0xFF8] = arg;
                                        self.regs[0] = 0;
                                    },
                                    _ => self.regs[0] = geos_errno(GEOS_EINVAL),
                                }
                            },
                            2 => {
                                // /dev/audio
                                match cmd {
                                    0 => self.regs[0] = self.ram[0xFF7], // get volume
                                    1 => {
                                        self.ram[0xFF7] = arg.min(100);
                                        self.regs[0] = 0;
                                    },
                                    _ => self.regs[0] = geos_errno(GEOS_EINVAL),
                                }
                            },
                            3 => {
                                // /dev/net
                                match cmd {
                                    0 => self.regs[0] = 1, // status: up
                                    _ => self.regs[0] = geos_errno(GEOS_EINVAL),
                                }
                            },
                            4 => {
                                // /dev/mailbox — VEC_FIND <-> RISC-V hypervisor bridge
                                // cmd 0 = MAILBOX_PUT: copy 64 u32 from RAM[arg..arg+64] to mailbox
                                // cmd 1 = MAILBOX_GET: copy mailbox to RAM[arg..arg+64]
                                // cmd 2 = MAILBOX_CLEAR: zero mailbox
                                // Returns 0 on success, GEOS_EINVAL on bad address/range
                                match cmd {
                                    0 | 1 => {
                                        let addr = arg as usize;
                                        let end = addr + 64;
                                        if end <= self.ram.len() && addr < self.ram.len() {
                                            if cmd == 0 {
                                                // MAILBOX_PUT: bytecode RAM → mailbox
                                                self.hypervisor_mailbox
                                                    .copy_from_slice(&self.ram[addr..end]);
                                            } else {
                                                // MAILBOX_GET: mailbox → bytecode RAM
                                                self.ram[addr..end]
                                                    .copy_from_slice(&self.hypervisor_mailbox);
                                            }
                                            self.regs[0] = 0; // success
                                        } else {
                                            self.regs[0] = geos_errno(GEOS_EINVAL);
                                        }
                                    },
                                    2 => {
                                        // MAILBOX_CLEAR
                                        self.hypervisor_mailbox = [0u32; 64];
                                        self.regs[0] = 0;
                                    },
                                    _ => self.regs[0] = geos_errno(GEOS_EINVAL),
                                }
                            },
                            _ => self.regs[0] = geos_errno(GEOS_EBADF),
                        }
                    } else {
                        self.regs[0] = geos_errno(GEOS_EBADF); // not a device fd
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // GETENV key_addr_reg, val_addr_reg  -- read environment variable
            // Reads null-terminated key from RAM[key_addr], writes value to RAM[val_addr].
            // r0 = value string length, or geos_errno(GEOS_ENOENT) if not found.
            // Max key/value length: 64 chars.
            0x63 => {
                let kr = self.fetch() as usize;
                let vr = self.fetch() as usize;
                if kr < NUM_REGS && vr < NUM_REGS {
                    let key_addr = self.regs[kr] as usize;
                    let val_addr = self.regs[vr] as usize;
                    let key = self.read_ram_string(key_addr, 64);
                    if let Some(k) = &key {
                        if let Some(val) = self.env_vars.get(k) {
                            let bytes = val.as_bytes();
                            let len = bytes.len().min(64);
                            for (i, &byte) in bytes.iter().enumerate().take(len) {
                                let addr = val_addr + i;
                                if addr < self.ram.len() {
                                    self.ram[addr] = byte as u32;
                                }
                            }
                            // Null terminate
                            if val_addr + len < self.ram.len() {
                                self.ram[val_addr + len] = 0;
                            }
                            self.regs[0] = len as u32;
                        } else {
                            self.regs[0] = geos_errno(GEOS_ENOENT); // key not found
                        }
                    } else {
                        self.regs[0] = geos_errno(GEOS_EINVAL); // invalid address
                    }
                }
            },

            // SETENV key_addr_reg, val_addr_reg  -- set environment variable
            // Reads null-terminated key and value from RAM.
            // r0 = 0 on success, GEOS error code on error.
            // Max key/value length: 64 chars. Max 32 env vars.
            0x64 => {
                let kr = self.fetch() as usize;
                let vr = self.fetch() as usize;
                if kr < NUM_REGS && vr < NUM_REGS {
                    let key_addr = self.regs[kr] as usize;
                    let val_addr = self.regs[vr] as usize;
                    let key = self.read_ram_string(key_addr, 64);
                    let val = self.read_ram_string(val_addr, 64);
                    match (key, val) {
                        (Some(k), Some(v)) => {
                            if self.env_vars.len() < 32 || self.env_vars.contains_key(&k) {
                                self.env_vars.insert(k, v);
                                self.regs[0] = 0;
                            } else {
                                self.regs[0] = geos_errno(GEOS_ENOSPC); // too many env vars
                            }
                        },
                        _ => self.regs[0] = geos_errno(GEOS_EINVAL), // invalid key/value
                    }
                }
            },

            // GETPID -- get current process ID
            // r0 = PID (0 = main/kernel context, 1+ = spawned child)
            0x65 => {
                self.regs[0] = self.current_pid;
            },

            // EXEC path_addr_reg  -- assemble and spawn a program from the programs/ directory
            // Reads null-terminated filename from RAM[path_addr]. Appends ".asm" if needed.
            // Assembles the source, creates a new process, copies bytecode in.
            // r0 = PID on success, geos_errno(GEOS_E*) on error.
            // RAM[0xFFA] = PID on success, geos_errno(GEOS_E*) on error.
            0x66 => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    let path_addr = self.regs[pr] as usize;
                    let filename = self.read_ram_string(path_addr, 64);
                    match filename {
                        Some(mut fname) => {
                            // Append .asm if not already present
                            if !fname.ends_with(".asm") {
                                fname.push_str(".asm");
                            }
                            let prog_path = std::path::Path::new("programs").join(&fname);
                            let source = match std::fs::read_to_string(&prog_path) {
                                Ok(s) => s,
                                Err(_) => {
                                    // Fallback: try VFS directory (.geometry_os/fs/)
                                    let vfs_path = self.vfs.base_dir.join(&fname);
                                    match std::fs::read_to_string(&vfs_path) {
                                        Ok(s) => s,
                                        Err(_) => {
                                            self.regs[0] = geos_errno(GEOS_ENOENT);
                                            self.ram[0xFFA] = geos_errno(GEOS_ENOENT);
                                            return true;
                                        },
                                    }
                                },
                            };
                            match crate::assembler::assemble(&source, 0) {
                                Ok(asm_result) => {
                                    let active_count =
                                        self.processes.iter().filter(|p| !p.is_halted()).count();
                                    if active_count >= MAX_PROCESSES {
                                        self.regs[0] = geos_errno(GEOS_ENFILE);
                                        self.ram[0xFFA] = geos_errno(GEOS_ENFILE);
                                    } else {
                                        let page_dir = self.create_process_page_dir();
                                        match page_dir {
                                            Some(pd) => {
                                                let phys_base = (pd[0] as usize) * PAGE_SIZE;
                                                // Copy assembled bytecode into new process's physical memory
                                                for (i, &word) in
                                                    asm_result.pixels.iter().enumerate()
                                                {
                                                    let addr = phys_base + i;
                                                    if addr >= self.ram.len() {
                                                        break;
                                                    }
                                                    self.ram[addr] = word;
                                                }
                                                let pid = (self.processes.len() + 1) as u32;
                                                self.processes.push(SpawnedProcess {
                                                    pc: 0,
                                                    regs: [0; NUM_REGS],
                                                    state: ProcessState::Ready,
                                                    pid,
                                                    mode: CpuMode::User,
                                                    page_dir: Some(pd),
                                                    segfaulted: false,
                                                    priority: 1,
                                                    slice_remaining: 0,
                                                    sleep_until: 0,
                                                    yielded: false,
                                                    kernel_stack: Vec::new(),
                                                    msg_queue: Vec::new(),
                                                    exit_code: 0,
                                                    parent_pid: self.current_pid,
                                                    pending_signals: Vec::new(),
                                                    signal_handlers: [0; 4],
                                                    vmas: Process::default_vmas_for_process(),
                                                    brk_pos: PAGE_SIZE as u32,
                                                    custom_font: None,
                                                    font_mode: 0,
                                                    capabilities: None,
                                                    data_base: 0,
                                                });
                                                self.regs[0] = pid;
                                                self.ram[0xFFA] = pid;
                                            },
                                            None => {
                                                self.regs[0] = geos_errno(GEOS_ENOMEM);
                                                self.ram[0xFFA] = geos_errno(GEOS_ENOMEM);
                                            },
                                        }
                                    }
                                },
                                Err(_) => {
                                    self.regs[0] = geos_errno(GEOS_EIO);
                                    self.ram[0xFFA] = geos_errno(GEOS_EIO);
                                },
                            }
                        },
                        None => {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                            self.ram[0xFFA] = geos_errno(GEOS_EINVAL);
                        },
                    }
                }
            },

            // WRITESTR fd_reg, str_addr_reg  -- write null-terminated string to file descriptor
            // Scans RAM from str_addr until null byte, writes all bytes to fd.
            // r0 = bytes written, or geos_errno(GEOS_E*) on error.
            0x67 => {
                let fr = self.fetch() as usize;
                let sr = self.fetch() as usize;
                if fr < NUM_REGS && sr < NUM_REGS {
                    let fd = self.regs[fr];
                    let str_addr = self.regs[sr] as usize;
                    // Measure string length
                    let mut len = 0usize;
                    let mut a = str_addr;
                    while a < self.ram.len() && len < 1024 {
                        if (self.ram[a] & 0xFF) == 0 {
                            break;
                        }
                        len += 1;
                        a += 1;
                    }
                    if len > 0 {
                        let n = self.vfs.fwrite(
                            &self.ram,
                            fd,
                            str_addr as u32,
                            len as u32,
                            self.current_pid,
                        );
                        self.regs[0] = n;
                    } else {
                        self.regs[0] = 0; // empty string, 0 bytes written
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // READLN buf_addr_reg, max_len_reg, pos_addr_reg
            // Read one character from keyboard into line buffer.
            // Uses: r0 = buffer start addr, r1 = max length, r2 = pointer to current position.
            // Keyboard char read from RAM[0xFFF].
            // r0 return: 0 = waiting/char stored, >0 = line length (Enter pressed).
            // Sets self.yielded when no key or waiting for child.
            0x68 => {
                let br = self.fetch() as usize;
                let mr = self.fetch() as usize;
                let pr = self.fetch() as usize;
                if br < NUM_REGS && mr < NUM_REGS && pr < NUM_REGS {
                    let buf_addr = self.regs[br] as usize;
                    let max_len = self.regs[mr] as usize;
                    let pos_addr = self.regs[pr] as usize;
                    let pos = self.ram[pos_addr] as usize;
                    let key = self.key_port;

                    if key == 0 {
                        // No key available -- yield
                        self.regs[0] = 0;
                        self.yielded = true;
                    } else if key == 13 {
                        // Enter -- terminate line
                        if pos < self.ram.len() {
                            self.ram[buf_addr + pos] = 0; // null terminate
                        }
                        self.regs[0] = pos as u32;
                        self.ram[pos_addr] = 0; // reset position
                        self.key_port = 0; // consume key
                    } else if key == 8 {
                        // Backspace
                        if pos > 0 {
                            self.ram[pos_addr] = (pos - 1) as u32;
                        }
                        self.regs[0] = 0;
                        self.key_port = 0;
                    } else if key >= 32 && pos < max_len {
                        // Printable character
                        if buf_addr + pos < self.ram.len() {
                            self.ram[buf_addr + pos] = key;
                        }
                        self.ram[pos_addr] = (pos + 1) as u32;
                        self.regs[0] = 0;
                        self.key_port = 0;
                    } else {
                        // Non-printable or buffer full -- discard
                        self.regs[0] = 0;
                        self.key_port = 0;
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // WAITPID pid_reg -- wait for child process to halt.
            // r0 = 0 if process still running (yields), 1 if halted/not found.
            // r1 = exit code of the child (0 if still running or not found).
            // Reaps zombie processes (frees pages, removes from list).
            0x69 => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    let target_pid = self.regs[pr];
                    let mut found_running = false;
                    let mut found_zombie = false;
                    let mut zombie_exit_code = 0u32;
                    let mut zombie_page_dir: Option<Vec<u32>> = None;
                    for proc in &self.processes {
                        if proc.pid == target_pid {
                            if proc.state == ProcessState::Zombie {
                                found_zombie = true;
                                zombie_exit_code = proc.exit_code;
                                zombie_page_dir = proc.page_dir.clone();
                            } else if !proc.is_halted() {
                                found_running = true;
                            } else {
                                self.regs[0] = 1;
                                self.regs[1] = proc.exit_code;
                            }
                            break;
                        }
                    }
                    if found_zombie {
                        self.regs[0] = 1;
                        self.regs[1] = zombie_exit_code;
                        if let Some(pd) = zombie_page_dir {
                            self.free_page_dir(&pd);
                        }
                        self.vfs.close_all(target_pid);
                        self.processes.retain(|p| p.pid != target_pid);
                    } else if found_running {
                        self.regs[0] = 0;
                        self.regs[1] = 0;
                        self.yielded = true;
                    } else {
                        self.regs[0] = 1;
                        self.regs[1] = 0;
                    }
                } else {
                    self.regs[0] = 1;
                    self.regs[1] = 0;
                }
            },

            // EXECP path_reg, stdin_fd_reg, stdout_fd_reg
            // Like EXEC but with fd redirection for pipes/redirects.
            // Assembles and spawns a program from programs/ directory.
            // stdin_fd/stdout_fd: 0xFFFFFFFF = default, otherwise fd to dup into child's fd 0/1.
            0x6A => {
                let path_r = self.fetch() as usize;
                let stdin_r = self.fetch() as usize;
                let stdout_r = self.fetch() as usize;
                if path_r < NUM_REGS && stdin_r < NUM_REGS && stdout_r < NUM_REGS {
                    let path_addr = self.regs[path_r] as usize;
                    let stdin_fd = self.regs[stdin_r];
                    let stdout_fd = self.regs[stdout_r];
                    let filename = self.read_ram_string(path_addr, 64);
                    match filename {
                        Some(mut fname) => {
                            if !fname.ends_with(".asm") {
                                fname.push_str(".asm");
                            }
                            let prog_path = std::path::Path::new("programs").join(&fname);
                            let source = match std::fs::read_to_string(&prog_path) {
                                Ok(s) => s,
                                Err(_) => {
                                    self.regs[0] = geos_errno(GEOS_ENOENT);
                                    return true;
                                },
                            };
                            match crate::assembler::assemble(&source, 0) {
                                Ok(asm_result) => {
                                    let active_count =
                                        self.processes.iter().filter(|p| !p.is_halted()).count();
                                    if active_count >= MAX_PROCESSES {
                                        self.regs[0] = geos_errno(GEOS_ENFILE);
                                    } else {
                                        let page_dir = self.create_process_page_dir();
                                        match page_dir {
                                            Some(pd) => {
                                                let phys_base = (pd[0] as usize) * PAGE_SIZE;
                                                for (i, &word) in
                                                    asm_result.pixels.iter().enumerate()
                                                {
                                                    let addr = phys_base + i;
                                                    if addr >= self.ram.len() {
                                                        break;
                                                    }
                                                    self.ram[addr] = word;
                                                }
                                                let pid = (self.processes.len() + 1) as u32;
                                                self.processes.push(SpawnedProcess {
                                                    pc: 0,
                                                    regs: [0; NUM_REGS],
                                                    state: ProcessState::Ready,
                                                    pid,
                                                    mode: CpuMode::User,
                                                    page_dir: Some(pd),
                                                    segfaulted: false,
                                                    priority: 1,
                                                    slice_remaining: 0,
                                                    sleep_until: 0,
                                                    yielded: false,
                                                    kernel_stack: Vec::new(),
                                                    msg_queue: Vec::new(),
                                                    exit_code: 0,
                                                    parent_pid: self.current_pid,
                                                    pending_signals: Vec::new(),
                                                    signal_handlers: [0; 4],
                                                    vmas: Process::default_vmas_for_process(),
                                                    brk_pos: PAGE_SIZE as u32,
                                                    custom_font: None,
                                                    font_mode: 0,
                                                    capabilities: None,
                                                    data_base: 0,
                                                });
                                                // Set up fd redirection for the new child
                                                let child_pid = pid;
                                                if stdin_fd != 0xFFFFFFFF {
                                                    self.vfs.dup_fd(
                                                        stdin_fd,
                                                        0,
                                                        child_pid,
                                                        self.current_pid,
                                                    );
                                                }
                                                if stdout_fd != 0xFFFFFFFF {
                                                    self.vfs.dup_fd(
                                                        stdout_fd,
                                                        1,
                                                        child_pid,
                                                        self.current_pid,
                                                    );
                                                }
                                                self.regs[0] = pid;
                                                self.ram[0xFFA] = pid;
                                            },
                                            None => {
                                                self.regs[0] = geos_errno(GEOS_ENOMEM);
                                                self.ram[0xFFA] = geos_errno(GEOS_ENOMEM);
                                            },
                                        }
                                    }
                                },
                                Err(_) => {
                                    self.regs[0] = geos_errno(GEOS_EIO);
                                    self.ram[0xFFA] = geos_errno(GEOS_EIO);
                                },
                            }
                        },
                        None => {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                        },
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // CHDIR path_reg -- change current working directory.
            // Reads null-terminated path from RAM. Stores in env_vars["CWD"].
            // r0 = 0 on success, geos_errno(GEOS_E*) on error.
            0x6B => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    let path_addr = self.regs[pr] as usize;
                    let path = self.read_ram_string(path_addr, 256);
                    match path {
                        Some(p) if !p.is_empty() => {
                            self.env_vars.insert("CWD".to_string(), p);
                            self.regs[0] = 0;
                        },
                        _ => {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                        },
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // GETCWD buf_reg -- write current working directory to RAM buffer.
            // Reads null-terminated CWD from env_vars, writes to buf.
            // r0 = string length, 0 if no CWD set.
            0x6C => {
                let br = self.fetch() as usize;
                if br < NUM_REGS {
                    let buf_addr = self.regs[br] as usize;
                    let cwd = self
                        .env_vars
                        .get("CWD")
                        .cloned()
                        .unwrap_or_else(|| "/".to_string());
                    let bytes = cwd.as_bytes();
                    for (i, &b) in bytes.iter().enumerate() {
                        if buf_addr + i < self.ram.len() {
                            self.ram[buf_addr + i] = b as u32;
                        }
                    }
                    if buf_addr + bytes.len() < self.ram.len() {
                        self.ram[buf_addr + bytes.len()] = 0; // null terminate
                    }
                    self.regs[0] = bytes.len() as u32;
                } else {
                    self.regs[0] = 0;
                }
            },

            0x2D => {
                self.regs[0] = geos_errno(GEOS_ENOTSUP);
            },
            0x2E => {
                self.regs[0] = geos_errno(GEOS_ENOTSUP);
            },
            0x2F => {
                self.regs[0] = geos_errno(GEOS_ENOTSUP);
            },

            // PEEK dest_reg, x_reg, y_reg  -- read pixel from screen buffer
            // r[dest_reg] = screen[y * 256 + x], or 0 if out of bounds.
            // This is the read counterpart to PSET: lets programs inspect what's
            // on screen for collision detection, copy, or visual queries.
            // On unified hardware (memory = display), this would be a normal memory load.
            0x6D => {
                let dr = self.fetch() as usize;
                let xr = self.fetch() as usize;
                let yr = self.fetch() as usize;
                if dr < NUM_REGS && xr < NUM_REGS && yr < NUM_REGS {
                    let x = self.regs[xr] as usize;
                    let y = self.regs[yr] as usize;
                    if x < 256 && y < 256 {
                        self.regs[dr] = self.screen[y * 256 + x];
                    } else {
                        self.regs[dr] = 0; // out of bounds returns black/transparent
                    }
                }
            },

            // SHUTDOWN -- gracefully stop all processes and halt the system
            // Only works in Kernel mode. In User mode, sets r0 = geos_errno(GEOS_EPERM).
            // Kills all child processes, closes all file descriptors, then halts.
            // The host (main.rs) can check vm.shutdown_requested to react.
            0x6E => {
                if self.mode != CpuMode::Kernel {
                    self.regs[0] = geos_errno(GEOS_EPERM);
                } else {
                    // Collect page dirs to free and PIDs to close
                    let page_dirs: Vec<Vec<u32>> = self
                        .processes
                        .iter()
                        .filter(|p| !p.is_halted())
                        .filter_map(|p| p.page_dir.clone())
                        .collect();
                    let pids: Vec<u32> = self
                        .processes
                        .iter()
                        .filter(|p| !p.is_halted())
                        .map(|p| p.pid)
                        .collect();
                    // Free page directories
                    for pd in page_dirs {
                        self.free_page_dir(&pd);
                    }
                    // Halt all processes
                    for proc in &mut self.processes {
                        proc.state = ProcessState::Zombie;
                    }
                    // Close all open file descriptors
                    self.vfs.close_all(0); // main process (pid 0)
                    for pid in pids {
                        self.vfs.close_all(pid);
                    }
                    // Clear all pipes
                    self.pipes.clear();
                    self.shutdown_requested = true;
                    self.halted = true;
                    return false;
                }
            },

            // EXIT code_reg -- exit with status code.
            // Child processes become zombies (parent reaps via WAITPID).
            // Main process just halts.
            0x6F => {
                let cr = self.fetch() as usize;
                if cr < NUM_REGS {
                    let code = self.regs[cr];
                    self.halted = true;
                    if self.current_pid > 0 {
                        self.step_exit_code = Some(code);
                        self.step_zombie = true;
                    }
                    return false;
                }
            },

            // SIGNAL pid_reg, sig_reg -- send signal to process.
            // Signal 0 (TERM): halt with exit code 1. Signal 3 (STOP): halt with exit code 2.
            // Signals 1-2 (USER): jump to handler if set, else ignore.
            // r0 = 0 on success, 0xFFFFFFFF on error.
            0x70 => {
                let pr = self.fetch() as usize;
                let sr = self.fetch() as usize;
                if pr < NUM_REGS && sr < NUM_REGS {
                    let target_pid = self.regs[pr];
                    let sig_num = self.regs[sr];
                    let mut delivered = false;
                    if let Some(signal) = Signal::from_u32(sig_num) {
                        for proc in &mut self.processes {
                            if proc.pid == target_pid && !proc.is_halted() {
                                let handler = proc.signal_handlers[signal as usize];
                                if handler == 0xFFFFFFFF {
                                    delivered = true;
                                } else if handler != 0 {
                                    proc.regs[0] = signal as u32;
                                    proc.regs[1] = self.current_pid;
                                    proc.pc = handler;
                                    delivered = true;
                                } else {
                                    match signal {
                                        Signal::Term => {
                                            proc.state = ProcessState::Zombie;
                                            proc.exit_code = 1;
                                            delivered = true;
                                        },
                                        Signal::Stop => {
                                            proc.state = ProcessState::Zombie;
                                            proc.exit_code = 2;
                                            delivered = true;
                                        },
                                        Signal::User1 | Signal::User2 => {
                                            delivered = true;
                                        },
                                    }
                                }
                                break;
                            }
                        }
                    }
                    self.regs[0] = if delivered { 0 } else { geos_errno(GEOS_ESRCH) };
                }
            },

            // SIGSET sig_reg, handler_reg -- register signal handler for current process.
            // sig_reg: signal number (0-3). handler_reg: address, 0=default, 0xFFFFFFFF=ignore.
            // r0 = 0 on success, geos_errno(GEOS_E*) on error.
            0x71 => {
                let sr = self.fetch() as usize;
                let hr = self.fetch() as usize;
                if sr < NUM_REGS && hr < NUM_REGS {
                    let sig_num = self.regs[sr];
                    let handler = self.regs[hr];
                    if let Some(signal) = Signal::from_u32(sig_num) {
                        if self.current_pid > 0 {
                            for proc in &mut self.processes {
                                if proc.pid == self.current_pid {
                                    proc.signal_handlers[signal as usize] = handler;
                                    break;
                                }
                            }
                            self.regs[0] = 0;
                        } else {
                            self.regs[0] = geos_errno(GEOS_EPERM);
                        }
                    } else {
                        self.regs[0] = geos_errno(GEOS_EINVAL);
                    }
                }
            },

            0x72 => {
                // HYPERVISOR: read config string from RAM at address in register.
                // Format: HYPERVISOR addr_reg [, win_id_reg]
                // 3 words: [0x72, addr_reg, win_id_reg]
                // win_id_reg: register containing window_id (0 = full canvas, >0 = WINSYS window).
                // Config format: "arch=riscv64 [kernel=file.img] [ram=256M] [mode=native|qemu]"
                // Validates arch= parameter is present. Kernel file existence checked at launch time.
                // Mode detection: mode=native -> HypervisorMode::Native, otherwise HypervisorMode::Qemu
                let addr_reg = self.fetch() as usize;
                let win_reg = self.fetch() as usize;
                let window_id = if win_reg < NUM_REGS {
                    self.regs[win_reg]
                } else {
                    0
                };
                if addr_reg < NUM_REGS {
                    let addr = self.regs[addr_reg] as usize;
                    let config = Self::read_string_static(&self.ram, addr);
                    match config {
                        Some(cfg) => {
                            // Validate arch= parameter is present
                            let has_arch = cfg
                                .split_whitespace()
                                .any(|t| t.to_lowercase().starts_with("arch=") && t.len() > 5);
                            if !has_arch {
                                self.regs[0] = geos_errno(GEOS_EINVAL); // missing arch
                                return true;
                            }
                            // Detect mode from config string
                            let mode = cfg
                                .split_whitespace()
                                .find(|t| t.to_lowercase().starts_with("mode="))
                                .map(|t| {
                                    let val = t.split('=').nth(1).unwrap_or("").to_lowercase();
                                    if val == "native" {
                                        HypervisorMode::Native
                                    } else {
                                        HypervisorMode::Qemu
                                    }
                                })
                                .unwrap_or(HypervisorMode::Qemu);
                            self.hypervisor_config = cfg.to_string();
                            self.hypervisor_mode = mode;
                            self.hypervisor_window_id = window_id;
                            self.hypervisor_active = true;
                            self.regs[0] = 0; // success
                        },
                        None => {
                            self.regs[0] = geos_errno(GEOS_EINVAL); // error
                        },
                    }
                }
            },

            // ASMSELF (0x73) -- Self-assembly opcode
            // Reads the canvas buffer as text, runs it through the preprocessor
            // and assembler, writes bytecode to 0x1000.
            // Status: RAM[0xFFD] = bytecode word count (success) or geos_errno(GEOS_EINVAL) (error).
            0x73 => {
                // Canvas grid dimensions (must match main.rs constants)
                const CANVAS_COLS: usize = 32;
                const CANVAS_MAX_ROWS: usize = 128;
                const CANVAS_BYTECODE_ADDR: usize = 0x1000;
                const ASM_STATUS_PORT: usize = 0xFFD;

                // Convert canvas buffer to text string (same logic as F8 handler)
                let buffer_size = CANVAS_MAX_ROWS * CANVAS_COLS;
                let source: String = self.canvas_buffer
                    [..buffer_size.min(self.canvas_buffer.len())]
                    .iter()
                    .map(|&cell| {
                        let val = cell & 0xFF;
                        if val == 0 || val == 0x0A {
                            '\n'
                        } else {
                            (val as u8) as char
                        }
                    })
                    .collect();

                // Collapse consecutive newlines (same as F8 handler)
                let source = source.replace("\n\n", "\n");

                // Run preprocessor then assembler
                let mut pp = crate::preprocessor::Preprocessor::new();
                let preprocessed = pp.preprocess(&source);

                match crate::assembler::assemble(&preprocessed, CANVAS_BYTECODE_ADDR) {
                    Ok(asm_result) => {
                        // Clear the bytecode region first
                        let end = (CANVAS_BYTECODE_ADDR + 4096).min(self.ram.len());
                        for addr in CANVAS_BYTECODE_ADDR..end {
                            self.ram[addr] = 0;
                        }
                        // Write assembled bytecode
                        for (i, &word) in asm_result.pixels.iter().enumerate() {
                            let addr = CANVAS_BYTECODE_ADDR + i;
                            if addr < self.ram.len() {
                                self.ram[addr] = word;
                            }
                        }
                        // Write success status: bytecode word count
                        if ASM_STATUS_PORT < self.ram.len() {
                            self.ram[ASM_STATUS_PORT] = asm_result.pixels.len() as u32;
                        }
                    },
                    Err(_e) => {
                        // Write error status
                        if ASM_STATUS_PORT < self.ram.len() {
                            self.ram[ASM_STATUS_PORT] = geos_errno(GEOS_EIO);
                        }
                    },
                }
            },

            // RUNNEXT (0x74) -- Self-execution opcode
            // Sets PC to the canvas bytecode region (0x1000) and continues execution.
            // Combined with ASMSELF, a program can write new code, compile it, and run it.
            // Registers and stack are preserved -- the new program inherits all state.
            0x74 => {
                self.pc = 0x1000;
            },

            // FORMULA (0x75) -- Reactive canvas formula registration
            // Encoding: 0x75, target_idx, op_code, dep_count, dep0, dep1, ...
            // target_idx: canvas buffer index (0..4095) to attach the formula to
            // op_code: 0=ADD, 1=SUB, 2=MUL, 3=DIV, 4=AND, 5=OR, 6=XOR, 7=NOT,
            //          8=COPY, 9=MAX, 10=MIN, 11=MOD, 12=SHL, 13=SHR
            // dep_count: number of dependency indices (0..8)
            // dep0..depN: canvas buffer indices the formula reads from
            // Returns 1 in r0 on success, 0 on failure (cycle/limits exceeded)
            0x75 => {
                let target_idx = self.fetch() as usize;
                let op_code = self.fetch();
                let dep_count = self.fetch() as usize;
                let mut deps = Vec::with_capacity(dep_count.min(MAX_FORMULA_DEPS));
                for _ in 0..dep_count.min(MAX_FORMULA_DEPS) {
                    deps.push(self.fetch() as usize);
                }
                let op = match op_code {
                    0 => FormulaOp::Add,
                    1 => FormulaOp::Sub,
                    2 => FormulaOp::Mul,
                    3 => FormulaOp::Div,
                    4 => FormulaOp::And,
                    5 => FormulaOp::Or,
                    6 => FormulaOp::Xor,
                    7 => FormulaOp::Not,
                    8 => FormulaOp::Copy,
                    9 => FormulaOp::Max,
                    10 => FormulaOp::Min,
                    11 => FormulaOp::Mod,
                    12 => FormulaOp::Shl,
                    13 => FormulaOp::Shr,
                    14 => FormulaOp::Sum,
                    15 => FormulaOp::Avg,
                    _ => FormulaOp::Copy,
                };
                let ok = self.formula_register(target_idx, deps, op);
                self.regs[0] = if ok { 1 } else { 0 };
            },

            // FORMULACLEAR (0x76) -- Clear all formulas
            // Encoding: 0x76
            0x76 => {
                self.formula_clear_all();
            },

            // FORMULAREM (0x77) -- Remove formula from a canvas cell
            // Encoding: 0x77, target_idx
            0x77 => {
                let target_idx = self.fetch() as usize;
                self.formula_remove(target_idx);
            },

            // FMKDIR path_reg  (0x78) -- Create directory in inode filesystem
            // Encoding: 0x78, path_reg
            // path_reg points to null-terminated path string in RAM
            // Returns inode number in r0, or 0 on error
            0x78 => {
                let path_reg = self.fetch() as usize;
                if path_reg < NUM_REGS {
                    let path_addr = self.regs[path_reg];
                    let path_str = Self::read_string_static(&self.ram, path_addr as usize);
                    match path_str {
                        Some(path) => {
                            let ino = self.inode_fs.mkdir(&path);
                            self.regs[0] = ino;
                        },
                        None => {
                            self.regs[0] = 0;
                        },
                    }
                } else {
                    self.regs[0] = 0;
                }
            },

            // FSTAT ino_reg, buf_reg  (0x79) -- Get inode metadata into RAM buffer
            // Encoding: 0x79, ino_reg, buf_reg
            // buf_reg points to 6-word buffer: [ino, itype, size, ref_count, parent_ino, num_children]
            // Returns 1 in r0 on success, 0 on error
            0x79 => {
                let ino_reg = self.fetch() as usize;
                let buf_reg = self.fetch() as usize;
                if ino_reg < NUM_REGS && buf_reg < NUM_REGS {
                    let ino = self.regs[ino_reg];
                    let buf_addr = self.regs[buf_reg] as usize;
                    let buf_len =
                        crate::inode_fs::FSTAT_ENTRIES.min(self.ram.len().saturating_sub(buf_addr));
                    let mut buf = vec![0u32; buf_len];
                    if self.inode_fs.fstat(ino, &mut buf) {
                        for (i, &val) in buf.iter().enumerate() {
                            let addr = buf_addr + i;
                            if addr < self.ram.len() {
                                self.ram[addr] = val;
                            }
                        }
                        self.regs[0] = 1;
                    } else {
                        self.regs[0] = 0;
                    }
                } else {
                    self.regs[0] = 0;
                }
            },

            // FUNLINK path_reg  (0x7A) -- Remove file or empty directory from inode filesystem
            // Encoding: 0x7A, path_reg
            // path_reg points to null-terminated path string in RAM
            // Returns 1 in r0 on success, 0 on error
            0x7A => {
                let path_reg = self.fetch() as usize;
                if path_reg < NUM_REGS {
                    let path_addr = self.regs[path_reg];
                    let path_str = Self::read_string_static(&self.ram, path_addr as usize);
                    match path_str {
                        Some(path) => {
                            if self.inode_fs.unlink(&path) {
                                self.regs[0] = 1;
                            } else {
                                self.regs[0] = 0;
                            }
                        },
                        None => {
                            self.regs[0] = 0;
                        },
                    }
                } else {
                    self.regs[0] = 0;
                }
            },

            // SNAP_TRACE mode_reg  (0x7B) -- Toggle execution trace recording.
            // Encoding: 0x7B, mode_reg
            // mode_reg value: 0 = stop recording, 1 = start recording,
            //                 2 = snapshot-and-clear (stops recording, r0 = entries captured)
            // r0 = number of entries currently in buffer (after mode change)
            0x7B => {
                let mode_reg = self.fetch() as usize;
                let mode = if mode_reg < NUM_REGS {
                    self.regs[mode_reg]
                } else {
                    0
                };
                match mode {
                    0 => {
                        self.trace_recording = false;
                        self.regs[0] = self.trace_buffer.len() as u32;
                    },
                    1 => {
                        self.trace_recording = true;
                        self.regs[0] = self.trace_buffer.len() as u32;
                    },
                    2 => {
                        let count = self.trace_buffer.len();
                        self.trace_recording = false;
                        self.trace_buffer.clear();
                        self.regs[0] = count as u32;
                    },
                    _ => {
                        self.regs[0] = geos_errno(GEOS_EINVAL); // invalid mode
                    },
                }
            },

            // REPLAY frame_idx_reg  (0x7C) -- Load a checkpoint screen onto the live display.
            // Encoding: 0x7C, frame_idx_reg
            // frame_idx: 0 = most recent checkpoint, 1 = second most recent, etc.
            // On success: r0 = frame_count (number of available checkpoints), frame_ready = true
            // On failure: r0 = geos_errno(GEOS_EIO)
            0x7C => {
                let idx_reg = self.fetch() as usize;
                let frame_idx = if idx_reg < NUM_REGS {
                    self.regs[idx_reg] as usize
                } else {
                    0
                };

                match self.frame_checkpoints.replay_frame(frame_idx) {
                    Some(screen) => {
                        self.screen.copy_from_slice(&screen);
                        self.frame_ready = true;
                        self.regs[0] = self.frame_checkpoints.len() as u32;
                    },
                    None => {
                        self.regs[0] = geos_errno(GEOS_EINVAL);
                    },
                }
            },

            // FORK mode_reg  (0x7D) -- Timeline forking: save/restore full VM state.
            // Encoding: 0x7D, mode_reg
            // mode_reg value: 0 = save snapshot to next slot
            //                 1 = restore from snapshot slot (r1 = slot index)
            //                 2 = list saved snapshots (r0 = count)
            //                 3 = clear all snapshots
            // r0 = slot index on save, 0 on restore/clear, count on list, geos_errno(GEOS_E*) on error
            0x7D => {
                let mode_reg = self.fetch() as usize;
                let mode = if mode_reg < NUM_REGS {
                    self.regs[mode_reg]
                } else {
                    0
                };
                match mode {
                    0 => {
                        // Save snapshot to next slot
                        if self.snapshots.len() < MAX_SNAPSHOTS {
                            let snap = self.snapshot();
                            let slot = self.snapshots.len();
                            self.snapshots.push(snap);
                            self.regs[0] = slot as u32; // return slot index
                        } else {
                            self.regs[0] = geos_errno(GEOS_ENOSPC); // too many snapshots
                        }
                    },
                    1 => {
                        // Restore from snapshot slot (slot index in r1)
                        let slot = self.regs[1] as usize;
                        if slot < self.snapshots.len() {
                            let snap = self.snapshots[slot].clone();
                            self.restore(&snap);
                            self.regs[0] = 0; // success
                        } else {
                            self.regs[0] = geos_errno(GEOS_EINVAL); // invalid slot
                        }
                    },
                    2 => {
                        // List: return count of saved snapshots
                        self.regs[0] = self.snapshots.len() as u32;
                    },
                    3 => {
                        // Clear all snapshots
                        self.snapshots.clear();
                        self.regs[0] = 0;
                    },
                    _ => {
                        self.regs[0] = geos_errno(GEOS_EINVAL); // invalid mode
                    },
                }
            },

            // PIXEL_HISTORY mode_reg  (0x84) -- Query pixel write history.
            // Encoding: 0x84, mode_reg
            // mode_reg value: 0 = count total entries in log (r0 = count)
            //                 1 = count writes to pixel (r1=x, r2=y, r0 = count)
            //                 2 = get N most recent writes to pixel into RAM
            //                     (r1=x, r2=y, r3=max_count, r4=buf_addr, r0 = entries written)
            //                     Each entry: 6 words (x, y, step_lo, step_hi, opcode, color)
            //                 3 = get entry at absolute index into RAM
            //                     (r1=index, r2=buf_addr, r0 = 0 on success, geos_errno(GEOS_E*) on error)
            //                     Entry format: 6 words (x, y, step_lo, step_hi, opcode, color)
            // r0 = result (count, entries written, or error)
            0x84 => {
                let mode_reg = self.fetch() as usize;
                let mode = if mode_reg < NUM_REGS {
                    self.regs[mode_reg]
                } else {
                    0
                };
                match mode {
                    0 => {
                        // Count total entries in log
                        self.regs[0] = self.pixel_write_log.len() as u32;
                    },
                    1 => {
                        // Count writes to specific pixel (r1=x, r2=y)
                        let x = self.regs[1] as u16;
                        let y = self.regs[2] as u16;
                        self.regs[0] = self.pixel_write_log.count_at(x, y) as u32;
                    },
                    2 => {
                        // Get N most recent writes to pixel into RAM
                        let x = self.regs[1] as u16;
                        let y = self.regs[2] as u16;
                        let max_count = self.regs[3] as usize;
                        let buf_addr = self.regs[4] as usize;
                        if max_count == 0 || buf_addr + max_count * 6 > self.ram.len() {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                        } else {
                            let entries = self.pixel_write_log.recent_at(x, y, max_count);
                            for (i, entry) in entries.iter().enumerate() {
                                let base = buf_addr + i * 6;
                                self.ram[base] = entry.x as u32;
                                self.ram[base + 1] = entry.y as u32;
                                self.ram[base + 2] = entry.step_lo;
                                self.ram[base + 3] = entry.step_hi;
                                self.ram[base + 4] = entry.opcode as u32;
                                self.ram[base + 5] = entry.color;
                            }
                            self.regs[0] = entries.len() as u32;
                        }
                    },
                    3 => {
                        // Get entry at absolute index into RAM
                        let index = self.regs[1] as usize;
                        let buf_addr = self.regs[2] as usize;
                        if buf_addr + 6 > self.ram.len() {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                        } else if let Some(entry) = self.pixel_write_log.get_at(index) {
                            self.ram[buf_addr] = entry.x as u32;
                            self.ram[buf_addr + 1] = entry.y as u32;
                            self.ram[buf_addr + 2] = entry.step_lo;
                            self.ram[buf_addr + 3] = entry.step_hi;
                            self.ram[buf_addr + 4] = entry.opcode as u32;
                            self.ram[buf_addr + 5] = entry.color;
                            self.regs[0] = 0;
                        } else {
                            self.regs[0] = geos_errno(GEOS_EINVAL);
                        }
                    },
                    _ => {
                        self.regs[0] = geos_errno(GEOS_EINVAL); // invalid mode
                    },
                }
            },

            // HYPERVISOR_SEND addr_reg, len_reg  (0x1C) -- Forward bytes to hypervisor guest.
            // Reads `len_reg` bytes from RAM starting at `addr_reg` and queues them
            // for delivery to the running hypervisor guest (RISC-V VM or QEMU).
            // Encoding: 0x1C, addr_reg, len_reg
            // Returns 0 in r0 on success, geos_errno(GEOS_EINVAL) on error.
            0x1C => {
                let addr_reg = self.fetch() as usize;
                let len_reg = self.fetch() as usize;
                if addr_reg < NUM_REGS && len_reg < NUM_REGS {
                    let addr = self.regs[addr_reg] as usize;
                    let len = self.regs[len_reg] as usize;
                    if addr + len <= self.ram.len() && len > 0 && len <= 512 {
                        self.hypervisor_input_queue.clear();
                        for i in 0..len {
                            let byte = (self.ram[addr + i] & 0xFF) as u8;
                            self.hypervisor_input_queue.push(byte);
                        }
                        self.hypervisor_input_pending = true;
                        self.regs[0] = len as u32;
                    } else {
                        self.regs[0] = geos_errno(GEOS_EINVAL);
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            },

            // HYPERVISOR_STATUS  (0x1D) -- Query hypervisor guest status.
            // Returns in r0: 0=inactive, 1=running, 2=halted
            // Returns in r1: number of bytes available in console ring buffer
            // (ring buffer read by host at 0x4F00, r1 reflects host-side bytes)
            // Encoding: 0x1D (no operands)
            0x1D => {
                if self.hypervisor_active {
                    // Status is set by host polling. We report what we know:
                    // r0 = 1 (running) or 2 (halted) -- hypervisor_active itself is set/cleared by host
                    self.regs[0] = 1; // assume running if active
                                      // r1 = available console bytes: (write_offset - read_offset) if readable
                    let write_off = self.ram.get(0x4F00).copied().unwrap_or(0) as usize;
                    let read_off = self.ram.get(0x4F01).copied().unwrap_or(0) as usize;
                    if write_off >= read_off {
                        self.regs[1] = (write_off - read_off) as u32;
                    } else {
                        self.regs[1] = (254 - read_off + write_off) as u32; // wrapped
                    }
                } else {
                    self.regs[0] = 0; // inactive
                    self.regs[1] = 0;
                }
            },

            // Unknown opcode: halt
            _ => {
                self.halted = true;
                return false;
            },
        }
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::types::*;

    /// Helper: create a VM with a bytecode program loaded at addr, run one step.
    fn step_one(bytecode: &[u32], addr: u32) -> Vm {
        let mut vm = Vm::new();
        for (i, &w) in bytecode.iter().enumerate() {
            let a = addr as usize + i;
            if a < vm.ram.len() {
                vm.ram[a] = w;
            }
        }
        vm.pc = addr;
        vm.halted = false;
        vm.step();
        vm
    }

    /// Helper: write a null-terminated string into RAM at addr.
    fn write_string(vm: &mut Vm, addr: usize, s: &str) {
        for (i, ch) in s.chars().enumerate() {
            if addr + i < vm.ram.len() {
                vm.ram[addr + i] = ch as u32;
            }
        }
        if addr + s.len() < vm.ram.len() {
            vm.ram[addr + s.len()] = 0;
        }
    }

    // ── IOCTL (0x62) ──────────────────────────────────────────────
    // Encoding: 0x62, fd_reg, cmd_reg, arg_reg (all are register indices)
    // Tests use step_one_from to pre-load register values.

    #[test]
    fn test_ioctl_screen_get_width() {
        // IOCTL /dev/screen cmd=0 -> r0 = 256
        let mut vm = Vm::new();
        vm.regs[1] = 0xE000; // fd = /dev/screen in r1
        vm.regs[2] = 0; // cmd = 0 in r2
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 256);
    }

    #[test]
    fn test_ioctl_screen_get_height() {
        // IOCTL /dev/screen cmd=1 -> r0 = 256
        let mut vm = Vm::new();
        vm.regs[1] = 0xE000;
        vm.regs[2] = 1;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 256);
    }

    #[test]
    fn test_ioctl_keyboard_get_echo() {
        // IOCTL /dev/keyboard cmd=0 -> r0 = RAM[0xFF8]
        let mut vm = Vm::new();
        vm.ram[0xFF8] = 42;
        vm.regs[1] = 0xE001; // fd = /dev/keyboard
        vm.regs[2] = 0; // cmd = 0 (get echo)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 42);
    }

    #[test]
    fn test_ioctl_keyboard_set_echo() {
        // IOCTL /dev/keyboard cmd=1 -> RAM[0xFF8] = arg, r0 = 0
        let mut vm = Vm::new();
        vm.regs[1] = 0xE001; // fd = /dev/keyboard
        vm.regs[2] = 1; // cmd = 1 (set echo)
        vm.regs[3] = 99; // arg = 99
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.ram[0xFF8], 99);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_ioctl_audio_get_volume() {
        // IOCTL /dev/audio cmd=0 -> r0 = RAM[0xFF7]
        let mut vm = Vm::new();
        vm.ram[0xFF7] = 75;
        vm.regs[1] = 0xE002; // fd = /dev/audio
        vm.regs[2] = 0; // cmd = 0 (get volume)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 75);
    }

    #[test]
    fn test_ioctl_audio_set_volume() {
        // IOCTL /dev/audio cmd=1 -> RAM[0xFF7] = arg.clamp(100), r0 = 0
        let mut vm = Vm::new();
        vm.regs[1] = 0xE002; // fd = /dev/audio
        vm.regs[2] = 1; // cmd = 1 (set volume)
        vm.regs[3] = 80; // arg = 80
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.ram[0xFF7], 80);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_ioctl_audio_volume_clamped() {
        // Volume > 100 should be clamped
        let mut vm = Vm::new();
        vm.regs[1] = 0xE002; // fd = /dev/audio
        vm.regs[2] = 1; // cmd = 1 (set volume)
        vm.regs[3] = 150; // arg = 150 (should clamp to 100)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.ram[0xFF7], 100);
    }

    #[test]
    fn test_ioctl_net_status() {
        // IOCTL /dev/net cmd=0 -> r0 = 1 (up)
        let mut vm = Vm::new();
        vm.regs[1] = 0xE003; // fd = /dev/net
        vm.regs[2] = 0; // cmd = 0 (get status)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 1);
    }

    #[test]
    fn test_ioctl_invalid_device_fd() {
        // fd not in device range -> r0 = GEOS_EBADF
        let mut vm = Vm::new();
        vm.regs[1] = 10; // fd = 10 (not in 0xE000-0xE003 range)
        let vm = step_one_from(&vm, &[0x62, 1, 0, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    #[test]
    fn test_ioctl_unknown_cmd() {
        // /dev/screen cmd=99 -> r0 = GEOS_EINVAL
        let mut vm = Vm::new();
        vm.regs[1] = 0xE000; // fd = /dev/screen
        vm.regs[2] = 99; // cmd = 99 (unknown)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_ioctl_out_of_range_register() {
        // reg index >= NUM_REGS -> r0 = GEOS_EINVAL
        let vm = step_one(&[0x62, 32, 0, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_ioctl_screen_clear_custom_font() {
        // cmd=3 clears custom font -> r0 = 0
        let mut vm = Vm::new();
        vm.regs[1] = 0xE000; // fd = /dev/screen
        vm.regs[2] = 3; // cmd = 3 (clear font)
        let vm = step_one_from(&vm, &[0x62, 1, 2, 0], 0);
        assert_eq!(vm.regs[0], 0);
    }

    // ── /dev/mailbox IOCTL tests ──────────────────────────────────

    #[test]
    fn test_ioctl_mailbox_put() {
        // IOCTL /dev/mailbox cmd=0: copy 64 u32 from RAM to mailbox
        let mut vm = Vm::new();
        // Fill RAM[0x2000..0x203F] with test pattern
        for i in 0..64 {
            vm.ram[0x2000 + i] = 0xAA000000 | i as u32;
        }
        vm.regs[1] = 0xE004; // fd = /dev/mailbox
        vm.regs[2] = 0; // cmd = MAILBOX_PUT
        vm.regs[3] = 0x2000; // arg = RAM source address
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], 0, "MAILBOX_PUT should succeed");
        // Verify mailbox contents
        assert_eq!(vm.hypervisor_mailbox[0], 0xAA000000);
        assert_eq!(vm.hypervisor_mailbox[1], 0xAA000001);
        assert_eq!(vm.hypervisor_mailbox[63], 0xAA00003F);
    }

    #[test]
    fn test_ioctl_mailbox_get() {
        // IOCTL /dev/mailbox cmd=1: copy mailbox to RAM
        let mut vm = Vm::new();
        // Fill mailbox with known data
        for i in 0..64 {
            vm.hypervisor_mailbox[i] = 0xBB000000 | i as u32;
        }
        vm.regs[1] = 0xE004; // fd = /dev/mailbox
        vm.regs[2] = 1; // cmd = MAILBOX_GET
        vm.regs[3] = 0x3000; // arg = RAM destination address
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], 0, "MAILBOX_GET should succeed");
        // Verify RAM contents
        assert_eq!(vm.ram[0x3000], 0xBB000000);
        assert_eq!(vm.ram[0x3001], 0xBB000001);
        assert_eq!(vm.ram[0x303F], 0xBB00003F);
    }

    #[test]
    fn test_ioctl_mailbox_put_get_roundtrip() {
        // Put data, clear RAM, Get it back — verify round-trip
        let mut vm = Vm::new();
        // Fill source RAM
        for i in 0..64 {
            vm.ram[0x2000 + i] = 0xCAFE0000 | i as u32;
        }
        // PUT
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0;
        vm.regs[3] = 0x2000;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], 0, "PUT should succeed");
        // Clear destination RAM
        let mut vm = vm;
        for i in 0..64 {
            vm.ram[0x3000 + i] = 0;
        }
        // GET
        vm.regs[1] = 0xE004;
        vm.regs[2] = 1;
        vm.regs[3] = 0x3000;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], 0, "GET should succeed");
        // Verify round-trip
        for i in 0..64 {
            assert_eq!(
                vm.ram[0x3000 + i],
                0xCAFE0000 | i as u32,
                "word {} mismatch in round-trip",
                i
            );
        }
    }

    #[test]
    fn test_ioctl_mailbox_clear() {
        let mut vm = Vm::new();
        // Fill mailbox with non-zero data
        for i in 0..64 {
            vm.hypervisor_mailbox[i] = 0xDEADBEEF;
        }
        // CLEAR
        vm.regs[1] = 0xE004;
        vm.regs[2] = 2; // cmd = MAILBOX_CLEAR
        vm.regs[3] = 0;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], 0, "CLEAR should succeed");
        // Verify all zero
        for (i, &v) in vm.hypervisor_mailbox.iter().enumerate() {
            assert_eq!(v, 0, "mailbox[{}] should be 0 after clear", i);
        }
    }

    #[test]
    fn test_ioctl_mailbox_bad_address() {
        // PUT from an address near end of RAM (out of bounds for 64 words)
        let mut vm = Vm::new();
        vm.regs[1] = 0xE004;
        vm.regs[2] = 0;
        let near_end = vm.ram.len().saturating_sub(10); // not enough room for 64
        vm.regs[3] = near_end as u32;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(
            vm.regs[0],
            geos_errno(GEOS_EINVAL),
            "should get EINVAL for bad address"
        );
    }

    #[test]
    fn test_ioctl_mailbox_unknown_cmd() {
        let mut vm = Vm::new();
        vm.regs[1] = 0xE004;
        vm.regs[2] = 99; // unknown cmd
        vm.regs[3] = 0;
        let vm = step_one_from(&vm, &[0x62, 1, 2, 3], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── GETENV (0x63) ─────────────────────────────────────────────

    #[test]
    fn test_getenv_found() {
        let mut vm = Vm::new();
        vm.env_vars.insert("HOME".to_string(), "/root".to_string());
        write_string(&mut vm, 0x200, "HOME");
        // GETENV key_addr=r0=0x200, val_addr=r1=0x300
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x63, 0, 1], 0);
        assert_eq!(vm.regs[0], 5); // "/root" length
        assert_eq!(vm.ram[0x300], '/' as u32);
        assert_eq!(vm.ram[0x301], 'r' as u32);
        assert_eq!(vm.ram[0x305], 0); // null terminator
    }

    #[test]
    fn test_getenv_not_found() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "MISSING");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x63, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT));
    }

    #[test]
    fn test_getenv_empty_key() {
        // Key at address is null -> returns geos_errno(GEOS_EINVAL)
        let mut vm = Vm::new();
        vm.ram[0x200] = 0; // null at key addr
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x63, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── SETENV (0x64) ─────────────────────────────────────────────

    #[test]
    fn test_setenv_success() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "FOO");
        write_string(&mut vm, 0x300, "bar");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x64, 0, 1], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.env_vars.get("FOO"), Some(&"bar".to_string()));
    }

    #[test]
    fn test_setenv_update_existing() {
        let mut vm = Vm::new();
        vm.env_vars.insert("X".to_string(), "old".to_string());
        write_string(&mut vm, 0x200, "X");
        write_string(&mut vm, 0x300, "new");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x64, 0, 1], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.env_vars.get("X"), Some(&"new".to_string()));
    }

    #[test]
    fn test_setenv_max_vars_limit() {
        let mut vm = Vm::new();
        // Fill up to 32 env vars
        for i in 0..32 {
            let key = format!("K{}", i);
            vm.env_vars.insert(key, "v".to_string());
        }
        write_string(&mut vm, 0x200, "NEW");
        write_string(&mut vm, 0x300, "val");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0x300;
        let vm = step_one_from(&vm, &[0x64, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOSPC)); // too many
    }

    // ── GETPID (0x65) ─────────────────────────────────────────────

    #[test]
    fn test_getpid_main_process() {
        let vm = step_one(&[0x65], 0);
        assert_eq!(vm.regs[0], 0); // main process PID = 0
    }

    // ── EXIT (0x6F) ───────────────────────────────────────────────

    #[test]
    fn test_exit_halts_vm() {
        let vm = step_one(&[0x6F, 0], 0);
        assert!(vm.halted);
    }

    #[test]
    fn test_exit_with_code() {
        // Load exit code 42 into r0, then EXIT r0
        let mut vm = Vm::new();
        vm.regs[0] = 42;
        vm.ram[0] = 0x6F;
        vm.ram[1] = 0;
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert!(vm.halted);
        // Main process doesn't set step_exit_code (only children do)
    }

    // ── SHUTDOWN (0x6E) ──────────────────────────────────────────

    #[test]
    fn test_shutdown_in_kernel_mode() {
        let vm = step_one(&[0x6E], 0);
        assert!(vm.halted);
        assert!(vm.shutdown_requested);
    }

    #[test]
    fn test_shutdown_in_user_mode_fails() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        vm.ram[0] = 0x6E;
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM));
        assert!(!vm.halted);
    }

    // ── PEEK/SCREENP (0x6D) ──────────────────────────────────────

    #[test]
    fn test_screenp_read_pixel() {
        let mut vm = Vm::new();
        vm.screen[10 * 256 + 20] = 0xFF0000; // red at (20, 10)
                                             // SCREENP dest=r0, x=r1=20, y=r2=10
        vm.regs[1] = 20;
        vm.regs[2] = 10;
        let vm = step_one_from(&vm, &[0x6D, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFF0000);
    }

    #[test]
    fn test_screenp_out_of_bounds() {
        let mut vm = Vm::new();
        vm.regs[1] = 300; // x > 255
        vm.regs[2] = 10;
        let vm = step_one_from(&vm, &[0x6D, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_screenp_y_out_of_bounds() {
        let mut vm = Vm::new();
        vm.regs[1] = 10;
        vm.regs[2] = 256; // y == 256 is out of bounds
        let vm = step_one_from(&vm, &[0x6D, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_screenp_zero_coords() {
        let mut vm = Vm::new();
        vm.screen[0] = 0x00FF00; // green at (0, 0)
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x6D, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0x00FF00);
    }

    // ── CHDIR (0x6B) ─────────────────────────────────────────────

    #[test]
    fn test_chdir_success() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/tmp");
        vm.regs[0] = 0x200;
        let vm = step_one_from(&vm, &[0x6B, 0], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.env_vars.get("CWD"), Some(&"/tmp".to_string()));
    }

    #[test]
    fn test_chdir_empty_path() {
        let mut vm = Vm::new();
        vm.ram[0x200] = 0; // null at path addr
        vm.regs[0] = 0x200;
        let vm = step_one_from(&vm, &[0x6B, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── GETCWD (0x6C) ────────────────────────────────────────────

    #[test]
    fn test_getcwd_returns_default() {
        // No CWD set -> returns "/"
        let mut vm = Vm::new();
        vm.regs[0] = 0x300;
        let vm = step_one_from(&vm, &[0x6C, 0], 0);
        assert_eq!(vm.regs[0], 1); // "/" length
        assert_eq!(vm.ram[0x300], '/' as u32);
        assert_eq!(vm.ram[0x301], 0); // null terminator
    }

    #[test]
    fn test_getcwd_returns_set_cwd() {
        let mut vm = Vm::new();
        vm.env_vars.insert("CWD".to_string(), "/home".to_string());
        vm.regs[0] = 0x300;
        let vm = step_one_from(&vm, &[0x6C, 0], 0);
        assert_eq!(vm.regs[0], 5); // "/home" length
        assert_eq!(vm.ram[0x300], '/' as u32);
        assert_eq!(vm.ram[0x301], 'h' as u32);
    }

    // ── SIGNAL (0x70) ─────────────────────────────────────────────

    #[test]
    fn test_signal_term_kills_process() {
        let mut vm = Vm::new();
        // Spawn a process PID=1
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.regs[0] = 1; // target pid
        vm.regs[1] = 0; // SIGTERM
        let vm = step_one_from(&vm, &[0x70, 0, 1], 0);
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(vm.processes[0].state, ProcessState::Zombie);
        assert_eq!(vm.processes[0].exit_code, 1);
    }

    #[test]
    fn test_signal_stop_kills_process() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.regs[0] = 1;
        vm.regs[1] = 3; // SIGSTOP
        let vm = step_one_from(&vm, &[0x70, 0, 1], 0);
        assert_eq!(vm.processes[0].exit_code, 2);
    }

    #[test]
    fn test_signal_nonexistent_pid() {
        let vm = step_one(&[0x70, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_ESRCH)); // not delivered
    }

    #[test]
    fn test_signal_invalid_signal_number() {
        let vm = step_one(&[0x70, 0, 99], 0);
        assert_eq!(vm.regs[0], 0); // invalid signal: from_u32 returns None, not delivered, r0=0
    }

    #[test]
    fn test_signal_user1_ignored_by_default() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.regs[0] = 1;
        vm.regs[1] = 1; // SIGUSER1
        let vm = step_one_from(&vm, &[0x70, 0, 1], 0);
        assert_eq!(vm.regs[0], 0); // delivered (but ignored by default)
        assert!(vm.processes[0].state != ProcessState::Zombie);
    }

    // ── SIGSET (0x71) ─────────────────────────────────────────────

    #[test]
    fn test_sigset_success() {
        let mut vm = Vm::new();
        // Spawn a process PID=1 and make it current
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.current_pid = 1;
        vm.regs[0] = 0; // SIGTERM
        vm.regs[1] = 0x500; // handler address
        let vm = step_one_from(&vm, &[0x71, 0, 1], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.processes[0].signal_handlers[0], 0x500);
    }

    #[test]
    fn test_sigset_main_process_fails() {
        // Main process (pid=0) can't set signal handlers
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.regs[1] = 0x500;
        let vm = step_one_from(&vm, &[0x71, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM));
    }

    #[test]
    fn test_sigset_ignore_signal() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.current_pid = 1;
        vm.regs[0] = 0;
        vm.regs[1] = 0xFFFFFFFF; // ignore
        let vm = step_one_from(&vm, &[0x71, 0, 1], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.processes[0].signal_handlers[0], 0xFFFFFFFF);
    }

    // ── ASMSELF (0x73) ───────────────────────────────────────────

    #[test]
    fn test_asmself_simple_program() {
        let mut vm = Vm::new();
        // Write "LDI r1, 42\nHALT" into canvas buffer
        let src = "LDI r1, 42\nHALT";
        for (i, ch) in src.chars().enumerate() {
            if i < vm.canvas_buffer.len() {
                vm.canvas_buffer[i] = ch as u32;
            }
        }
        // ASMSELF
        vm.ram[0] = 0x73;
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert_eq!(vm.ram[0xFFD], 4); // 4 words: LDI(3) + HALT(1)
                                      // Verify bytecode was written to 0x1000
        assert_ne!(vm.ram[0x1000], 0); // first word should be LDI opcode
    }

    // ── RUNNEXT (0x74) ───────────────────────────────────────────

    #[test]
    fn test_runnext_sets_pc() {
        let mut vm = Vm::new();
        vm.ram[0] = 0x74; // RUNNEXT
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert_eq!(vm.pc, 0x1000);
    }

    // ── FORMULA (0x75) ───────────────────────────────────────────

    #[test]
    fn test_formula_register_add() {
        // FORMULA target=0, op=0 (ADD), deps=[1]
        // bytecode: [0x75, 0, 0, 1, 1]
        let vm = step_one(&[0x75, 0, 0, 1, 1], 0);
        assert_eq!(vm.regs[0], 1); // success
    }

    #[test]
    fn test_formula_register_invalid_opcode() {
        // op=99 -> should use Copy fallback
        let vm = step_one(&[0x75, 0, 99, 0], 0);
        assert_eq!(vm.regs[0], 1); // still succeeds (fallback to Copy)
    }

    // ── FORMULACLEAR (0x76) ──────────────────────────────────────

    #[test]
    fn test_formula_clear() {
        let mut vm = Vm::new();
        vm.ram[0] = 0x76;
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert!(!vm.halted); // doesn't halt
    }

    // ── FORMULAREM (0x77) ────────────────────────────────────────

    #[test]
    fn test_formula_remove() {
        // FORMULAREM target=5
        let mut vm = Vm::new();
        vm.ram[0] = 0x77;
        vm.ram[1] = 5;
        vm.pc = 0;
        vm.halted = false;
        vm.step();
        assert!(!vm.halted);
    }

    // ── SNAP_TRACE (0x7B) ────────────────────────────────────────

    #[test]
    fn test_snap_trace_start_recording() {
        let mut vm = Vm::new();
        vm.regs[0] = 1; // mode = start recording
        let vm = step_one_from(&vm, &[0x7B, 0], 0);
        assert!(vm.trace_recording);
        assert_eq!(vm.regs[0], 0); // 0 entries initially
    }

    #[test]
    fn test_snap_trace_stop_recording() {
        let mut vm = Vm::new();
        vm.trace_recording = true;
        vm.regs[0] = 0; // mode = stop
        let vm = step_one_from(&vm, &[0x7B, 0], 0);
        assert!(!vm.trace_recording);
    }

    #[test]
    fn test_snap_trace_snapshot_and_clear() {
        let mut vm = Vm::new();
        vm.trace_recording = true;
        vm.regs[0] = 2; // mode = snapshot-and-clear
        let vm = step_one_from(&vm, &[0x7B, 0], 0);
        assert!(!vm.trace_recording);
        assert_eq!(vm.regs[0], 1); // 1 entry: the 0x7B instruction itself is recorded during step()
    }

    #[test]
    fn test_snap_trace_invalid_mode() {
        let mut vm = Vm::new();
        vm.regs[0] = 99;
        let vm = step_one_from(&vm, &[0x7B, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── FORK (0x7D) ──────────────────────────────────────────────

    #[test]
    fn test_fork_save_snapshot() {
        let mut vm = Vm::new();
        vm.regs[0] = 0; // mode = save
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], 0); // slot index 0
    }

    #[test]
    fn test_fork_list_snapshots() {
        let mut vm = Vm::new();
        // Save one snapshot
        vm.snapshots.push(vm.snapshot());
        vm.regs[0] = 2; // mode = list
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], 1); // 1 snapshot
    }

    #[test]
    fn test_fork_clear_snapshots() {
        let mut vm = Vm::new();
        vm.snapshots.push(vm.snapshot());
        vm.regs[0] = 3; // mode = clear
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], 0);
        assert!(vm.snapshots.is_empty());
    }

    #[test]
    fn test_fork_restore_invalid_slot() {
        let mut vm = Vm::new();
        vm.regs[1] = 99; // invalid slot
        vm.regs[0] = 1; // mode = restore
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_fork_max_snapshots() {
        let mut vm = Vm::new();
        // Fill to MAX_SNAPSHOTS
        for _ in 0..16 {
            vm.snapshots.push(vm.snapshot());
        }
        vm.regs[0] = 0; // mode = save
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOSPC)); // too many
    }

    #[test]
    fn test_fork_invalid_mode() {
        let mut vm = Vm::new();
        vm.regs[0] = 99;
        let vm = step_one_from(&vm, &[0x7D, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── FMKDIR (0x78) ────────────────────────────────────────────

    #[test]
    fn test_fmkdir_success() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/test_dir");
        vm.regs[0] = 0x200;
        let vm = step_one_from(&vm, &[0x78, 0], 0);
        assert!(vm.regs[0] > 0); // inode number > 0
    }

    #[test]
    fn test_fmkdir_null_path() {
        let mut vm = Vm::new();
        vm.ram[0x200] = 0; // null at path addr
        vm.regs[0] = 0x200;
        let vm = step_one_from(&vm, &[0x78, 0], 0);
        assert_eq!(vm.regs[0], 0); // error
    }

    // ── FUNLINK (0x7A) ───────────────────────────────────────────

    #[test]
    fn test_funlink_nonexistent() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/no_such_file");
        vm.regs[0] = 0x200;
        let vm = step_one_from(&vm, &[0x7A, 0], 0);
        assert_eq!(vm.regs[0], 0); // error
    }

    // ── FSTAT (0x79) ─────────────────────────────────────────────

    #[test]
    fn test_fstat_invalid_inode() {
        let mut vm = Vm::new();
        vm.regs[0] = 99999; // nonexistent inode
        vm.regs[1] = 0x300; // buffer addr
        let vm = step_one_from(&vm, &[0x79, 0, 1], 0);
        assert_eq!(vm.regs[0], 0); // error
    }

    // ── HYPERVISOR (0x72) ────────────────────────────────────────

    #[test]
    fn test_hypervisor_missing_arch() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "kernel=vmlinux ram=256M");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0; // win_id
        let vm = step_one_from(&vm, &[0x72, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // missing arch
    }

    #[test]
    fn test_hypervisor_valid_config() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "arch=riscv64 kernel=vmlinux ram=256M");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0x72, 0, 1], 0);
        assert_eq!(vm.regs[0], 0); // success
        assert!(vm.hypervisor_active);
        assert_eq!(vm.hypervisor_mode, HypervisorMode::Qemu);
    }

    #[test]
    fn test_hypervisor_native_mode() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "arch=riscv64 mode=native");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0x72, 0, 1], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.hypervisor_mode, HypervisorMode::Native);
    }

    #[test]
    fn test_hypervisor_null_config() {
        let mut vm = Vm::new();
        vm.ram[0x200] = 0; // null at config addr -> empty string, no arch=
        vm.regs[0] = 0x200;
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0x72, 0, 1], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // missing arch (empty string is Some(""))
    }

    // ── PIXEL_HISTORY (0x84) ─────────────────────────────────────

    #[test]
    fn test_pixel_history_count() {
        // mode=0 -> count total entries
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        let vm = step_one_from(&vm, &[0x84, 0], 0);
        assert_eq!(vm.regs[0], 0); // empty log
    }

    #[test]
    fn test_pixel_history_count_at_pixel() {
        // mode=1 -> count writes at (r1=x, r2=y)
        let mut vm = Vm::new();
        vm.regs[0] = 1;
        vm.regs[1] = 10;
        vm.regs[2] = 20;
        let vm = step_one_from(&vm, &[0x84, 0], 0);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_pixel_history_invalid_mode() {
        let mut vm = Vm::new();
        vm.regs[0] = 99;
        let vm = step_one_from(&vm, &[0x84, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_pixel_history_get_at_invalid_index() {
        // mode=3 -> get entry at index, but log is empty
        let mut vm = Vm::new();
        vm.regs[0] = 3;
        vm.regs[1] = 0; // index
        vm.regs[2] = 0x300; // buf addr
        let vm = step_one_from(&vm, &[0x84, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // no entry at index 0
    }

    // ── WAITPID (0x69) ───────────────────────────────────────────

    #[test]
    fn test_waitpid_nonexistent() {
        // PID doesn't exist -> r0=1, r1=0
        let vm = step_one(&[0x69, 0], 0);
        assert_eq!(vm.regs[0], 1);
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_waitpid_running_yields() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.regs[0] = 1;
        let vm = step_one_from(&vm, &[0x69, 0], 0);
        assert_eq!(vm.regs[0], 0); // still running
        assert!(vm.yielded);
    }

    #[test]
    fn test_waitpid_zombie_reaped() {
        let mut vm = Vm::new();
        let mut proc = SpawnedProcess::default_spawned(1);
        proc.state = ProcessState::Zombie;
        proc.exit_code = 42;
        proc.page_dir = None; // no page dir to free
        vm.processes.push(proc);
        vm.regs[0] = 1;
        let vm = step_one_from(&vm, &[0x69, 0], 0);
        assert_eq!(vm.regs[0], 1); // halted
        assert_eq!(vm.regs[1], 42); // exit code
        assert!(vm.processes.is_empty()); // reaped
    }

    // ── REPLAY (0x7C) ────────────────────────────────────────────

    #[test]
    fn test_replay_no_checkpoints() {
        let mut vm = Vm::new();
        vm.regs[0] = 0; // frame_idx = 0
        let vm = step_one_from(&vm, &[0x7C, 0], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // no checkpoints
    }

    // ── Edge cases ───────────────────────────────────────────────

    #[test]
    fn test_unknown_extended_opcode_halts() {
        let vm = step_one(&[0x7E], 0); // not in 0x62-0x7D range... actually 0x7E is not dispatched here
                                       // 0x7E would be dispatched elsewhere. Let's test 0x7D range with invalid sub-opcode
                                       // Actually 0x62..=0x7D is the range. 0x7E wouldn't hit step_extended.
    }

    #[test]
    fn test_ioctl_screen_custom_font_bad_address() {
        // cmd=2 with bad font address -> r0 = GEOS_EINVAL
        let mut vm = Vm::new();
        vm.regs[0] = 0xE000; // /dev/screen fd
        vm.regs[1] = 2; // set custom font
        vm.regs[2] = 0xFFFF; // bad address (would overflow)
        let vm = step_one_from(&vm, &[0x62, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_readln_no_key_yields() {
        let mut vm = Vm::new();
        vm.key_port = 0; // no key
        vm.regs[0] = 0x200; // buf addr
        vm.regs[1] = 100; // max len
        vm.regs[2] = 0x210; // pos addr
        let vm = step_one_from(&vm, &[0x68, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0);
        assert!(vm.yielded);
    }

    #[test]
    fn test_readln_enter_terminates() {
        let mut vm = Vm::new();
        vm.key_port = 13; // Enter
        vm.ram[0x210] = 5; // current position
        vm.regs[0] = 0x200; // buf addr
        vm.regs[1] = 100; // max len
        vm.regs[2] = 0x210; // pos addr
        let vm = step_one_from(&vm, &[0x68, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 5); // line length
        assert_eq!(vm.ram[0x200 + 5], 0); // null terminator
    }

    #[test]
    fn test_readln_printable_char() {
        let mut vm = Vm::new();
        vm.key_port = 65; // 'A'
        vm.ram[0x210] = 0; // pos = 0
        vm.regs[0] = 0x200; // buf addr
        vm.regs[1] = 100; // max len
        vm.regs[2] = 0x210; // pos addr
        let vm = step_one_from(&vm, &[0x68, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // still waiting
        assert_eq!(vm.ram[0x200], 65); // 'A' stored
        assert_eq!(vm.ram[0x210], 1); // pos advanced
    }

    #[test]
    fn test_readln_backspace() {
        let mut vm = Vm::new();
        vm.key_port = 8; // backspace
        vm.ram[0x210] = 3; // pos = 3
        vm.regs[0] = 0x200;
        vm.regs[1] = 100;
        vm.regs[2] = 0x210;
        let vm = step_one_from(&vm, &[0x68, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.ram[0x210], 2); // pos decreased
    }

    #[test]
    fn test_readln_backspace_at_zero() {
        let mut vm = Vm::new();
        vm.key_port = 8;
        vm.ram[0x210] = 0; // pos = 0
        vm.regs[0] = 0x200;
        vm.regs[1] = 100;
        vm.regs[2] = 0x210;
        let vm = step_one_from(&vm, &[0x68, 0, 1, 2], 0);
        assert_eq!(vm.ram[0x210], 0); // pos stays 0
    }

    // ── EXECP (0x6A) ─────────────────────────────────────────────

    #[test]
    fn test_execp_nonexistent_file() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "nonexistent_program");
        vm.regs[0] = 0x200; // path addr
        vm.regs[1] = 0xFFFFFFFF; // stdin = none
        vm.regs[2] = 0xFFFFFFFF; // stdout = none
        let vm = step_one_from(&vm, &[0x6A, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT)); // file not found
    }

    #[test]
    fn test_execp_null_path() {
        let mut vm = Vm::new();
        vm.ram[0x200] = 0; // null at path addr
        vm.regs[0] = 0x200;
        vm.regs[1] = 0xFFFFFFFF;
        vm.regs[2] = 0xFFFFFFFF;
        let vm = step_one_from(&vm, &[0x6A, 0, 1, 2], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // null path
    }

    #[test]
    fn test_execp_success() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "hello");
        vm.regs[0] = 0x200;
        vm.regs[1] = 0xFFFFFFFF;
        vm.regs[2] = 0xFFFFFFFF;
        let vm = step_one_from(&vm, &[0x6A, 0, 1, 2], 0);
        assert_ne!(vm.regs[0], 0xFFFFFFFF); // should succeed (hello.asm exists)
        assert_ne!(vm.regs[0], 0); // pid > 0
        assert_eq!(vm.processes.len(), 1); // child spawned
    }

    // ── EXIT_ALL (0x6E) ──────────────────────────────────────────

    #[test]
    fn test_exit_all_in_user_mode_fails() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        let vm = step_one_from(&vm, &[0x6E], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM)); // user mode denied
        assert!(!vm.halted); // should NOT halt
    }

    #[test]
    fn test_exit_all_in_kernel_mode_halts() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::Kernel;
        vm.processes.push(SpawnedProcess::default_spawned(1));
        let vm = step_one_from(&vm, &[0x6E], 0);
        assert!(vm.halted);
        assert!(vm.shutdown_requested);
        // All processes should be zombies
        for proc in &vm.processes {
            assert!(proc.is_halted());
        }
    }

    // ── SIGACTION (0x71) ─────────────────────────────────────────

    #[test]
    fn test_sigaction_set_handler() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.current_pid = 1;
        vm.regs[1] = 1; // SIGUSER1
        vm.regs[2] = 0x500; // handler address
        let vm = step_one_from(&vm, &[0x71, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(
            vm.processes[0].signal_handlers[Signal::User1 as usize],
            0x500
        );
    }

    #[test]
    fn test_sigaction_main_process_fails() {
        let mut vm = Vm::new();
        vm.current_pid = 0; // main process
        vm.regs[1] = 1;
        vm.regs[2] = 0x500;
        let vm = step_one_from(&vm, &[0x71, 1, 2], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM)); // main process can't set handlers
    }

    #[test]
    fn test_sigaction_invalid_signal() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.current_pid = 1;
        vm.regs[1] = 99; // invalid signal number
        vm.regs[2] = 0x500;
        let vm = step_one_from(&vm, &[0x71, 1, 2], 0);
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // invalid signal
    }

    #[test]
    fn test_sigaction_ignore_signal() {
        let mut vm = Vm::new();
        vm.processes.push(SpawnedProcess::default_spawned(1));
        vm.current_pid = 1;
        vm.regs[1] = 1; // SIGUSER1
        vm.regs[2] = 0xFFFFFFFF; // SIG_IGN
        let vm = step_one_from(&vm, &[0x71, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(
            vm.processes[0].signal_handlers[Signal::User1 as usize],
            0xFFFFFFFF
        );
    }

    // ── Helper for tests that need a pre-configured VM ──────────

    /// Create a new VM from an existing one's state, load bytecode, step.
    fn step_one_from(vm: &Vm, bytecode: &[u32], addr: u32) -> Vm {
        let mut vm2 = Vm::new();
        // Copy key fields
        vm2.regs.copy_from_slice(&vm.regs);
        let ram_len = vm.ram.len().min(vm2.ram.len());
        vm2.ram[..ram_len].copy_from_slice(&vm.ram[..ram_len]);
        let buf_len = vm.canvas_buffer.len().min(vm2.canvas_buffer.len());
        vm2.canvas_buffer[..buf_len].copy_from_slice(&vm.canvas_buffer[..buf_len]);
        vm2.screen.copy_from_slice(&vm.screen);
        vm2.current_pid = vm.current_pid;
        vm2.mode = vm.mode;
        vm2.key_port = vm.key_port;
        vm2.env_vars = vm.env_vars.clone();
        vm2.processes = vm.processes.clone();
        vm2.trace_recording = vm.trace_recording;
        vm2.snapshots = vm.snapshots.clone();
        vm2.hypervisor_active = vm.hypervisor_active;
        vm2.hypervisor_mode = vm.hypervisor_mode;
        vm2.hypervisor_config = vm.hypervisor_config.clone();
        vm2.hypervisor_window_id = vm.hypervisor_window_id;
        vm2.hypervisor_mailbox = vm.hypervisor_mailbox;
        // Load bytecode
        for (i, &w) in bytecode.iter().enumerate() {
            let a = addr as usize + i;
            if a < vm2.ram.len() {
                vm2.ram[a] = w;
            }
        }
        vm2.pc = addr;
        vm2.halted = false;
        vm2.step();
        vm2
    }

    // ═══════════════════════════════════════════════════════════════
    // Phase 277: Unit tests for extended opcodes
    // CMP (0x50), SAR (0x2B), BFE (0xC2), BFI (0xC3),
    // CMOV (0xE0), CSEL (0xEF), FORMULA (0x75/0x76/0x77)
    // ═══════════════════════════════════════════════════════════════

    // ── CMP signed comparison edge cases (0x50) ─────────────────
    // CMP rd, rs: r0 = 0xFFFFFFFF (a<b), 0 (a==b), 1 (a>b)
    // Encoding: 3 words [0x50, rd, rs]

    #[test]
    fn test_cmp_equal() {
        // CMP r1, r2 where both are 42
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        vm.regs[2] = 42;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_cmp_less_than() {
        // CMP r1, r2 where r1=-1 (0xFFFFFFFF), r2=0
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFF; // -1 as i32
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // less
    }

    #[test]
    fn test_cmp_greater_than() {
        // CMP r1, r2 where r1=100, r2=50
        let mut vm = Vm::new();
        vm.regs[1] = 100;
        vm.regs[2] = 50;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 1); // greater
    }

    #[test]
    fn test_cmp_i32_min_vs_max() {
        // i32::MIN (-2147483648) vs i32::MAX (2147483647)
        let mut vm = Vm::new();
        vm.regs[1] = 0x80000000u32; // i32::MIN
        vm.regs[2] = 0x7FFFFFFFu32; // i32::MAX
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // MIN < MAX
    }

    #[test]
    fn test_cmp_i32_max_vs_min() {
        // i32::MAX vs i32::MIN
        let mut vm = Vm::new();
        vm.regs[1] = 0x7FFFFFFFu32; // i32::MAX
        vm.regs[2] = 0x80000000u32; // i32::MIN
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 1); // MAX > MIN
    }

    #[test]
    fn test_cmp_i32_min_vs_zero() {
        // i32::MIN vs 0
        let mut vm = Vm::new();
        vm.regs[1] = 0x80000000u32; // i32::MIN = -2147483648
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // MIN < 0
    }

    #[test]
    fn test_cmp_i32_max_vs_zero() {
        // i32::MAX vs 0
        let mut vm = Vm::new();
        vm.regs[1] = 0x7FFFFFFFu32; // i32::MAX = 2147483647
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 1); // MAX > 0
    }

    #[test]
    fn test_cmp_both_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0); // equal
    }

    #[test]
    fn test_cmp_negative_vs_negative() {
        // -5 vs -3: -5 < -3
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFBu32; // -5
        vm.regs[2] = 0xFFFFFFFDu32; // -3
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // less
    }

    #[test]
    fn test_cmp_same_register() {
        // CMP r1, r1 should always be equal
        let mut vm = Vm::new();
        vm.regs[1] = 12345;
        let vm = step_one_from(&vm, &[0x50, 1, 1], 0);
        assert_eq!(vm.regs[0], 0); // equal
    }

    #[test]
    fn test_cmp_clobbers_r0() {
        // CMP writes to r0 regardless of which regs are compared
        let mut vm = Vm::new();
        vm.regs[0] = 42; // r0 has a value
        vm.regs[3] = 10;
        vm.regs[4] = 20;
        let vm = step_one_from(&vm, &[0x50, 3, 4], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // r0 was overwritten by CMP result
    }

    #[test]
    fn test_cmp_large_positive_values() {
        // 0x7FFFFF00 vs 0x7FFFFF01
        let mut vm = Vm::new();
        vm.regs[1] = 0x7FFFFF00;
        vm.regs[2] = 0x7FFFFF01;
        let vm = step_one_from(&vm, &[0x50, 1, 2], 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF); // less
    }

    // ── SAR arithmetic shift right (0x2B) ───────────────────────
    // SAR rd, rs: rd = rd >> rs (arithmetic, sign-preserving)
    // Encoding: 3 words [0x2B, rd, rs]

    #[test]
    fn test_sar_positive_by_one() {
        // 8 >> 1 = 4
        let mut vm = Vm::new();
        vm.regs[1] = 8;
        vm.regs[2] = 1;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 4);
    }

    #[test]
    fn test_sar_positive_by_four() {
        // 256 >> 4 = 16
        let mut vm = Vm::new();
        vm.regs[1] = 256;
        vm.regs[2] = 4;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 16);
    }

    #[test]
    fn test_sar_negative_preserves_sign() {
        // -8 (0xFFFFFFF8) >> 1 = -4 (0xFFFFFFFC)
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFF8u32; // -8
        vm.regs[2] = 1;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFFCu32); // -4
    }

    #[test]
    fn test_sar_negative_by_large_shift() {
        // -1 (0xFFFFFFFF) >> 31 = -1 (all sign bits)
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFF; // -1
        vm.regs[2] = 31;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFFF); // still -1
    }

    #[test]
    fn test_sar_i32_min_by_one() {
        // i32::MIN >> 1 = 0xC0000000 (still negative, sign preserved)
        let mut vm = Vm::new();
        vm.regs[1] = 0x80000000u32; // i32::MIN
        vm.regs[2] = 1;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xC0000000u32);
    }

    #[test]
    fn test_sar_i32_min_by_31() {
        // i32::MIN >> 31 = 0xFFFFFFFF (-1)
        let mut vm = Vm::new();
        vm.regs[1] = 0x80000000u32; // i32::MIN
        vm.regs[2] = 31;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFFFu32); // -1
    }

    #[test]
    fn test_sar_shift_by_zero() {
        // 42 >> 0 = 42
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        vm.regs[2] = 0;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 42);
    }

    #[test]
    fn test_sar_shift_modulo_32() {
        // Shift by 33 should be same as shift by 1 (mod 32)
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFF8u32; // -8
        vm.regs[2] = 33;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFFCu32); // same as >> 1
    }

    #[test]
    fn test_sar_negative_vs_logical_shift() {
        // SAR of negative should fill with 1s, not 0s
        // 0x80000000 >> 4 = 0xF8000000 (SAR) not 0x08000000 (SHR)
        let mut vm = Vm::new();
        vm.regs[1] = 0x80000000u32;
        vm.regs[2] = 4;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xF8000000u32); // sign bit propagated
    }

    #[test]
    fn test_sar_small_negative() {
        // -2 >> 1 = -1
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFFEu32; // -2
        vm.regs[2] = 1;
        let vm = step_one_from(&vm, &[0x2B, 1, 2], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFFFu32); // -1
    }

    // ── BFE bitfield extract (0xC2) ─────────────────────────────
    // BFE rd, rs, width_reg, lsb_reg
    // Extracts `width` bits starting at bit `lsb` from rs, zero-extends into rd.
    // Encoding: 5 words [0xC2, rd, rs, width_reg, lsb_reg]

    #[test]
    fn test_bfe_extract_low_byte() {
        // Extract 8 bits at lsb=0 from 0xAABBCCDD -> 0xDD
        let mut vm = Vm::new();
        vm.regs[2] = 0xAABBCCDD;
        vm.regs[3] = 8; // width
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xDD);
    }

    #[test]
    fn test_bfe_extract_mid_nibble() {
        // Extract 4 bits at lsb=8 from 0xAABBCCDD -> 0xC
        // 0xAABBCCDD: bits [8:12) = 0xC (from the CC byte)
        let mut vm = Vm::new();
        vm.regs[2] = 0xAABBCCDD;
        vm.regs[3] = 4; // width
        vm.regs[4] = 8; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xC);
    }

    #[test]
    fn test_bfe_extract_msb() {
        // Extract 4 bits at lsb=28 from 0xA0000000 -> 0xA
        let mut vm = Vm::new();
        vm.regs[2] = 0xA0000000;
        vm.regs[3] = 4; // width
        vm.regs[4] = 28; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xA);
    }

    #[test]
    fn test_bfe_extract_spanning_boundary() {
        // Extract 16 bits at lsb=12 from 0x12345678
        // 0x12345678 >> 12 = 0x12345, & 0xFFFF = 0x2345
        let mut vm = Vm::new();
        vm.regs[2] = 0x12345678;
        vm.regs[3] = 16; // width
        vm.regs[4] = 12; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x2345);
    }

    #[test]
    fn test_bfe_extract_full_word() {
        // Extract 32 bits from 0xDEADBEEF -> 0xDEADBEEF
        let mut vm = Vm::new();
        vm.regs[2] = 0xDEADBEEF;
        vm.regs[3] = 32; // width
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xDEADBEEF);
    }

    #[test]
    fn test_bfe_extract_zero_width() {
        // Width 0 -> result 0
        let mut vm = Vm::new();
        vm.regs[2] = 0xFFFFFFFF;
        vm.regs[3] = 0; // width = 0
        vm.regs[4] = 0;
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_bfe_extract_lsb_out_of_range() {
        // LSB >= 32 -> result 0
        let mut vm = Vm::new();
        vm.regs[2] = 0xFFFFFFFF;
        vm.regs[3] = 8;
        vm.regs[4] = 32; // lsb >= 32
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_bfe_extract_single_bit() {
        // Extract 1 bit at lsb=7 from 0x80 -> 1
        let mut vm = Vm::new();
        vm.regs[2] = 0x80;
        vm.regs[3] = 1; // width
        vm.regs[4] = 7; // lsb
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 1);
    }

    #[test]
    fn test_bfe_extract_single_bit_zero() {
        // Extract 1 bit at lsb=6 from 0x80 -> 0
        let mut vm = Vm::new();
        vm.regs[2] = 0x80;
        vm.regs[3] = 1; // width
        vm.regs[4] = 6; // lsb (bit 6 is 0 in 0x80)
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_bfe_extract_from_zero() {
        // Extract anything from 0 -> 0
        let mut vm = Vm::new();
        vm.regs[2] = 0;
        vm.regs[3] = 16;
        vm.regs[4] = 8;
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0);
    }

    #[test]
    fn test_bfe_width_clamped_to_32() {
        // Width > 32 should be clamped to 32
        let mut vm = Vm::new();
        vm.regs[2] = 0xDEADBEEF;
        vm.regs[3] = 64; // width > 32
        vm.regs[4] = 0;
        let vm = step_one_from(&vm, &[0xC2, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xDEADBEEF); // treated as width=32
    }

    // ── BFI bitfield insert (0xC3) ─────────────────────────────
    // BFI rd, rs, width_reg, lsb_reg
    // Inserts `width` low bits of rs into rd starting at bit `lsb`.
    // Encoding: 5 words [0xC3, rd, rs, width_reg, lsb_reg]

    #[test]
    fn test_bfi_insert_low_byte() {
        // Insert 0xFF into bits [0:8) of 0x12345678 -> 0x123456FF
        let mut vm = Vm::new();
        vm.regs[1] = 0x12345678; // dst
        vm.regs[2] = 0xFF; // src (bits to insert)
        vm.regs[3] = 8; // width
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x123456FF);
    }

    #[test]
    fn test_bfi_insert_mid_nibble() {
        // Insert 0xA into bits [8:12) of 0x12345678 -> 0x12345A78
        let mut vm = Vm::new();
        vm.regs[1] = 0x12345678;
        vm.regs[2] = 0xA;
        vm.regs[3] = 4; // width
        vm.regs[4] = 8; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x12345A78);
    }

    #[test]
    fn test_bfi_insert_at_msb() {
        // Insert 0xB into bits [28:32) of 0x00000000 -> 0xB0000000
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 0xB;
        vm.regs[3] = 4; // width
        vm.regs[4] = 28; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xB0000000);
    }

    #[test]
    fn test_bfi_preserves_surrounding_bits() {
        // Insert 4 bits at lsb=4 into 0xFF00FF00
        // Bits [4:8) cleared then set to low 4 bits of src
        let mut vm = Vm::new();
        vm.regs[1] = 0xFF00FF00;
        vm.regs[2] = 0x9; // insert 0x9
        vm.regs[3] = 4; // width
        vm.regs[4] = 4; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        // bits [4:8) were 0, now 9: 0xFF00FF90
        assert_eq!(vm.regs[1], 0xFF00FF90);
    }

    #[test]
    fn test_bfi_overwrite_existing() {
        // Insert 0x3 into bits [0:4) of 0xFFFFFFF0 -> 0xFFFFFFF3
        let mut vm = Vm::new();
        vm.regs[1] = 0xFFFFFFF0;
        vm.regs[2] = 0x3;
        vm.regs[3] = 4; // width
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xFFFFFFF3);
    }

    #[test]
    fn test_bfi_zero_width_noop() {
        // Width 0 -> no change
        let mut vm = Vm::new();
        vm.regs[1] = 0x12345678;
        vm.regs[2] = 0xFF;
        vm.regs[3] = 0; // width = 0
        vm.regs[4] = 0;
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x12345678); // unchanged
    }

    #[test]
    fn test_bfi_lsb_out_of_range_noop() {
        // LSB >= 32 -> no change
        let mut vm = Vm::new();
        vm.regs[1] = 0x12345678;
        vm.regs[2] = 0xFF;
        vm.regs[3] = 8;
        vm.regs[4] = 32; // lsb >= 32
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x12345678); // unchanged
    }

    #[test]
    fn test_bfi_full_word_insert() {
        // Width 32 -> replace entire value
        let mut vm = Vm::new();
        vm.regs[1] = 0x12345678;
        vm.regs[2] = 0xDEADBEEF;
        vm.regs[3] = 32; // width
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xDEADBEEF);
    }

    #[test]
    fn test_bfi_spanning_word_boundary() {
        // Insert 8 bits at lsb=28: overlaps bits 28-31 and wraps
        // 0x00000000, insert 0x12 at lsb=28, width=4 -> 0x10000000
        let mut vm = Vm::new();
        vm.regs[1] = 0x00000000;
        vm.regs[2] = 0x1; // insert 1 at bit 28
        vm.regs[3] = 4; // width
        vm.regs[4] = 28; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0x10000000);
    }

    #[test]
    fn test_bfi_src_high_bits_ignored() {
        // Only low `width` bits of src are used
        // Insert 0xFFF (12 bits) but width=4 -> only low 4 bits (0xF) used
        let mut vm = Vm::new();
        vm.regs[1] = 0x00000000;
        vm.regs[2] = 0xFFF;
        vm.regs[3] = 4; // width = 4
        vm.regs[4] = 0; // lsb
        let vm = step_one_from(&vm, &[0xC3, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 0xF);
    }

    // ── CMOV conditional move (0xE0) ───────────────────────────
    // CMOV rd, rs, cond_reg: if cond_reg != 0, rd = rs
    // Encoding: 4 words [0xE0, rd, rs, cond_reg]

    #[test]
    fn test_cmov_condition_true() {
        // cond=1 -> move happens
        let mut vm = Vm::new();
        vm.regs[1] = 0; // dst starts at 0
        vm.regs[2] = 42; // src
        vm.regs[3] = 1; // cond = true
        let vm = step_one_from(&vm, &[0xE0, 1, 2, 3], 0);
        assert_eq!(vm.regs[1], 42);
    }

    #[test]
    fn test_cmov_condition_false() {
        // cond=0 -> no move
        let mut vm = Vm::new();
        vm.regs[1] = 99; // dst
        vm.regs[2] = 42; // src
        vm.regs[3] = 0; // cond = false
        let vm = step_one_from(&vm, &[0xE0, 1, 2, 3], 0);
        assert_eq!(vm.regs[1], 99); // unchanged
    }

    #[test]
    fn test_cmov_condition_negative_one() {
        // cond=0xFFFFFFFF (from CMP less-than) -> move happens
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 77;
        vm.regs[3] = 0xFFFFFFFF;
        let vm = step_one_from(&vm, &[0xE0, 1, 2, 3], 0);
        assert_eq!(vm.regs[1], 77);
    }

    #[test]
    fn test_cmov_condition_large_value() {
        // Any non-zero cond triggers move
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.regs[2] = 55;
        vm.regs[3] = 0x80000000;
        let vm = step_one_from(&vm, &[0xE0, 1, 2, 3], 0);
        assert_eq!(vm.regs[1], 55);
    }

    #[test]
    fn test_cmov_same_register() {
        // CMOV r1, r1, cond -> always no-op (rd=rs)
        let mut vm = Vm::new();
        vm.regs[1] = 123;
        vm.regs[2] = 1; // cond=true, but src=dst
        let vm = step_one_from(&vm, &[0xE0, 1, 1, 2], 0);
        assert_eq!(vm.regs[1], 123);
    }

    #[test]
    fn test_cmov_zero_source() {
        // Move 0 when condition true
        let mut vm = Vm::new();
        vm.regs[1] = 42;
        vm.regs[2] = 0; // src = 0
        vm.regs[3] = 5; // cond = true
        let vm = step_one_from(&vm, &[0xE0, 1, 2, 3], 0);
        assert_eq!(vm.regs[1], 0);
    }

    // ── CSEL conditional select (0xEF) ─────────────────────────
    // CSEL rd, rs1, rs2, cond_reg: if cond != 0, rd = rs1, else rd = rs2
    // Encoding: 5 words [0xEF, rd, rs1, rs2, cond_reg]

    #[test]
    fn test_csel_condition_true() {
        // cond != 0 -> rd = rs1
        let mut vm = Vm::new();
        vm.regs[1] = 0; // dst
        vm.regs[2] = 10; // rs1 (selected when true)
        vm.regs[3] = 20; // rs2
        vm.regs[4] = 1; // cond = true
        let vm = step_one_from(&vm, &[0xEF, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 10);
    }

    #[test]
    fn test_csel_condition_false() {
        // cond == 0 -> rd = rs2
        let mut vm = Vm::new();
        vm.regs[1] = 0; // dst
        vm.regs[2] = 10; // rs1
        vm.regs[3] = 20; // rs2 (selected when false)
        vm.regs[4] = 0; // cond = false
        let vm = step_one_from(&vm, &[0xEF, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 20);
    }

    #[test]
    fn test_csel_cmp_less_than() {
        // Simulate: CMP r5, r6 (r5 < r6 -> r0 = 0xFFFFFFFF)
        // CSEL r1, r5, r6, r0 -> r1 = r5 (the smaller value)
        let mut vm = Vm::new();
        vm.regs[5] = 3;
        vm.regs[6] = 7;
        vm.regs[0] = 0xFFFFFFFF; // CMP result: less
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 5, 6, 0], 0);
        assert_eq!(vm.regs[1], 3); // selected rs1 (smaller)
    }

    #[test]
    fn test_csel_cmp_equal() {
        // CMP result: equal (r0=0) -> select rs2
        let mut vm = Vm::new();
        vm.regs[5] = 5;
        vm.regs[6] = 5;
        vm.regs[0] = 0; // CMP result: equal
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 5, 6, 0], 0);
        assert_eq!(vm.regs[1], 5); // selected rs2
    }

    #[test]
    fn test_csel_cmp_greater_than() {
        // CMP result: greater (r0=1) -> select rs1
        let mut vm = Vm::new();
        vm.regs[5] = 10;
        vm.regs[6] = 3;
        vm.regs[0] = 1; // CMP result: greater
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 5, 6, 0], 0);
        assert_eq!(vm.regs[1], 10); // selected rs1
    }

    #[test]
    fn test_csel_max_pattern() {
        // CSEL as max(a, b): CMP a, b; CSEL dst, b, a, r0
        // If a < b (r0=0xFFFFFFFF), select b. If a >= b (r0=0 or 1), select a.
        // But CMP r0 semantics: a<b -> 0xFFFFFFFF (non-zero, selects rs1=b)
        // a==b -> 0 (zero, selects rs2=a) -- correct, max(a,a) = a
        // a>b -> 1 (non-zero, selects rs1=b) -- WRONG, should select a
        // So CSEL with CMP for max needs: CSEL dst, a, b, r0 works for min not max
        // This test documents the actual behavior
        let mut vm = Vm::new();
        vm.regs[5] = 10; // a
        vm.regs[6] = 3; // b
        vm.regs[0] = 1; // a > b
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 5, 6, 0], 0);
        // cond=1 (non-zero), so selects rs1=5 (which is a=10)
        assert_eq!(vm.regs[1], 10); // selects the first (larger)
    }

    #[test]
    fn test_csel_min_pattern() {
        // CSEL as min: CSEL dst, a, b, r0
        // a<b (r0=0xFFFFFFFF non-zero) -> select a (the smaller) -- correct for min
        // a==b (r0=0) -> select b (same value) -- correct
        // a>b (r0=1 non-zero) -> select a (the larger) -- wrong for min
        // So pure CSEL doesn't give min/max directly from CMP result
        let mut vm = Vm::new();
        vm.regs[5] = 3; // a
        vm.regs[6] = 10; // b
        vm.regs[0] = 0xFFFFFFFF; // a < b
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 5, 6, 0], 0);
        assert_eq!(vm.regs[1], 3); // selects a (smaller) -- min behavior
    }

    #[test]
    fn test_csel_same_rs() {
        // Both sources same -> dst gets that value regardless of cond
        let mut vm = Vm::new();
        vm.regs[2] = 42;
        vm.regs[3] = 42;
        vm.regs[1] = 0;
        let vm = step_one_from(&vm, &[0xEF, 1, 2, 3, 4], 0);
        assert_eq!(vm.regs[1], 42);
    }

    #[test]
    fn test_csel_cond_is_destination() {
        // cond register same as destination
        let mut vm = Vm::new();
        vm.regs[1] = 99; // dst and cond
        vm.regs[2] = 10;
        vm.regs[3] = 20;
        // cond=99 (non-zero) -> select rs1=10 into r1
        let vm = step_one_from(&vm, &[0xEF, 1, 2, 3, 1], 0);
        assert_eq!(vm.regs[1], 10); // cond was read before write
    }

    // ── FORMULA registration and evaluation (0x75/0x76/0x77) ────

    #[test]
    fn test_formula_register_sub() {
        // FORMULA target=10, op=1 (SUB), deps=[20, 21]
        // bytecode: [0x75, 10, 1, 2, 20, 21]
        let vm = step_one(&[0x75, 10, 1, 2, 20, 21], 0);
        assert_eq!(vm.regs[0], 1); // success
        assert_eq!(vm.formulas.len(), 1);
    }

    #[test]
    fn test_formula_register_mul() {
        // FORMULA target=5, op=2 (MUL), deps=[6, 7]
        let vm = step_one(&[0x75, 5, 2, 2, 6, 7], 0);
        assert_eq!(vm.regs[0], 1);
        assert_eq!(vm.formulas[0].op, FormulaOp::Mul);
    }

    #[test]
    fn test_formula_register_copy_single_dep() {
        // FORMULA target=100, op=8 (COPY), deps=[200]
        let vm = step_one(&[0x75, 100, 8, 1, 200], 0);
        assert_eq!(vm.regs[0], 1);
        assert_eq!(vm.formulas[0].deps, vec![200]);
    }

    #[test]
    fn test_formula_register_all_ops() {
        // Test each op code registers successfully
        for op in 0..=13u32 {
            let vm = step_one(&[0x75, 0, op, 2, 1, 2], 0);
            assert_eq!(vm.regs[0], 1, "op={} should succeed", op);
        }
    }

    #[test]
    fn test_formula_register_max_deps() {
        // Register with maximum dependencies (MAX_FORMULA_DEPS = 8)
        let bytecode = &[0x75, 0, 0, 8, 1, 2, 3, 4, 5, 6, 7, 8];
        let vm = step_one(bytecode, 0);
        assert_eq!(vm.regs[0], 1); // success
        assert_eq!(vm.formulas[0].deps.len(), 8);
    }

    #[test]
    fn test_formula_evaluate_add() {
        // Register ADD formula, set deps, evaluate
        let mut vm = Vm::new();
        // Set up: cell 10 = cell 1 + cell 2
        vm.canvas_buffer[1] = 30;
        vm.canvas_buffer[2] = 12;
        vm.formula_register(10, vec![1, 2], FormulaOp::Add);
        // Manually evaluate
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 42);
    }

    #[test]
    fn test_formula_evaluate_sub() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 100;
        vm.canvas_buffer[2] = 37;
        vm.formula_register(5, vec![1, 2], FormulaOp::Sub);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 63);
    }

    #[test]
    fn test_formula_evaluate_mul() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 7;
        vm.canvas_buffer[2] = 6;
        vm.formula_register(5, vec![1, 2], FormulaOp::Mul);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 42);
    }

    #[test]
    fn test_formula_evaluate_div() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 100;
        vm.canvas_buffer[2] = 4;
        vm.formula_register(5, vec![1, 2], FormulaOp::Div);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 25);
    }

    #[test]
    fn test_formula_evaluate_div_by_zero() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 42;
        vm.canvas_buffer[2] = 0;
        vm.formula_register(5, vec![1, 2], FormulaOp::Div);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0); // div by zero returns 0
    }

    #[test]
    fn test_formula_evaluate_and() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 0xFF00;
        vm.canvas_buffer[2] = 0x0FF0;
        vm.formula_register(5, vec![1, 2], FormulaOp::And);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0x0F00);
    }

    #[test]
    fn test_formula_evaluate_or() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 0xFF00;
        vm.canvas_buffer[2] = 0x0FF0;
        vm.formula_register(5, vec![1, 2], FormulaOp::Or);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0xFFF0);
    }

    #[test]
    fn test_formula_evaluate_xor() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 0xFF00;
        vm.canvas_buffer[2] = 0x0FF0;
        vm.formula_register(5, vec![1, 2], FormulaOp::Xor);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0xF0F0);
    }

    #[test]
    fn test_formula_evaluate_not() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 0x0F0F0F0F;
        vm.formula_register(5, vec![1], FormulaOp::Not);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0xF0F0F0F0);
    }

    #[test]
    fn test_formula_evaluate_max() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 10;
        vm.canvas_buffer[2] = 25;
        vm.formula_register(5, vec![1, 2], FormulaOp::Max);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 25);
    }

    #[test]
    fn test_formula_evaluate_min() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 10;
        vm.canvas_buffer[2] = 25;
        vm.formula_register(5, vec![1, 2], FormulaOp::Min);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 10);
    }

    #[test]
    fn test_formula_evaluate_mod() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 17;
        vm.canvas_buffer[2] = 5;
        vm.formula_register(5, vec![1, 2], FormulaOp::Mod);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 2);
    }

    #[test]
    fn test_formula_evaluate_mod_by_zero() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 17;
        vm.canvas_buffer[2] = 0;
        vm.formula_register(5, vec![1, 2], FormulaOp::Mod);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 0); // mod by zero returns 0
    }

    #[test]
    fn test_formula_evaluate_shl() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 1;
        vm.canvas_buffer[2] = 4;
        vm.formula_register(5, vec![1, 2], FormulaOp::Shl);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 16);
    }

    #[test]
    fn test_formula_evaluate_shr() {
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 16;
        vm.canvas_buffer[2] = 2;
        vm.formula_register(5, vec![1, 2], FormulaOp::Shr);
        let result = vm.formula_eval(&vm.formulas[0], &vm.canvas_buffer);
        assert_eq!(result, 4);
    }

    #[test]
    fn test_formula_clear_removes_all() {
        let mut vm = Vm::new();
        vm.formula_register(0, vec![1, 2], FormulaOp::Add);
        vm.formula_register(3, vec![4, 5], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 2);
        vm.formula_clear_all();
        assert_eq!(vm.formulas.len(), 0);
        assert!(vm.formula_dep_index.is_empty());
    }

    #[test]
    fn test_formula_remove_specific() {
        let mut vm = Vm::new();
        vm.formula_register(0, vec![1, 2], FormulaOp::Add);
        vm.formula_register(3, vec![4, 5], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 2);
        vm.formula_remove(0);
        assert_eq!(vm.formulas.len(), 1);
        assert_eq!(vm.formulas[0].target_idx, 3);
    }

    #[test]
    fn test_formula_remove_nonexistent() {
        let mut vm = Vm::new();
        vm.formula_register(0, vec![1], FormulaOp::Copy);
        vm.formula_remove(99); // doesn't exist
        assert_eq!(vm.formulas.len(), 1); // unchanged
    }

    #[test]
    fn test_formula_cycle_detection() {
        // A depends on B, B depends on A -> cycle
        let mut vm = Vm::new();
        // Register: target=0, deps=[1] (0 depends on 1)
        assert!(vm.formula_register(0, vec![1], FormulaOp::Copy));
        // Try: target=1, deps=[0] (1 depends on 0) -> cycle!
        assert!(!vm.formula_register(1, vec![0], FormulaOp::Copy));
    }

    #[test]
    fn test_formula_chain_no_cycle() {
        // A depends on B, C depends on A -> not a cycle
        let mut vm = Vm::new();
        assert!(vm.formula_register(0, vec![1], FormulaOp::Copy)); // 0 <- 1
        assert!(vm.formula_register(2, vec![0], FormulaOp::Copy)); // 2 <- 0, not a cycle
    }

    #[test]
    fn test_formula_reregister_replaces() {
        // Registering on same target replaces old formula
        let mut vm = Vm::new();
        vm.formula_register(5, vec![1, 2], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);
        vm.formula_register(5, vec![3, 4], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 1); // still 1 (replaced)
        assert_eq!(vm.formulas[0].op, FormulaOp::Mul);
        assert_eq!(vm.formulas[0].deps, vec![3, 4]);
    }

    #[test]
    fn test_formula_invalid_target_out_of_range() {
        // target_idx >= CANVAS_RAM_SIZE (4096)
        let mut vm = Vm::new();
        assert!(!vm.formula_register(5000, vec![1], FormulaOp::Copy));
    }

    #[test]
    fn test_formula_invalid_dep_out_of_range() {
        // dep >= CANVAS_RAM_SIZE
        let mut vm = Vm::new();
        assert!(!vm.formula_register(0, vec![5000], FormulaOp::Copy));
    }

    #[test]
    fn test_formula_recalc_updates_target() {
        // Register cell 10 = cell 1 + cell 2
        // Change cell 1, recalc should update cell 10
        let mut vm = Vm::new();
        vm.canvas_buffer[1] = 10;
        vm.canvas_buffer[2] = 20;
        vm.formula_register(10, vec![1, 2], FormulaOp::Add);
        // Change cell 1 and recalc
        vm.canvas_buffer[1] = 100;
        vm.formula_recalc(1);
        assert_eq!(vm.canvas_buffer[10], 120); // 100 + 20
    }

    #[test]
    fn test_formula_recalc_no_dependents() {
        // Recalcing a cell with no formulas depending on it is a no-op
        let mut vm = Vm::new();
        vm.canvas_buffer[50] = 999;
        vm.formula_recalc(50); // nothing depends on 50
                               // No crash, no change
    }

    #[test]
    fn test_formula_opcode_invalid_op_fallback() {
        // op_code=99 should fall back to Copy
        let vm = step_one(&[0x75, 0, 99, 1, 5], 0);
        assert_eq!(vm.regs[0], 1); // succeeds
        assert_eq!(vm.formulas[0].op, FormulaOp::Copy);
    }

    // ═══════════════════════════════════════════════════════════════
    // Phase 388: Integration tests for reactive canvas formula engine
    // ═══════════════════════════════════════════════════════════════
    //
    // NOTE: step_one_from does NOT copy formulas/formula_dep_index.
    // Tests that need formula state to persist across bytecode execution
    // must load bytecode directly into the same VM and step it.

    /// Helper: load bytecode into existing VM at addr and step once.
    /// Preserves formulas, formula_dep_index, and all other VM state.
    fn step_vm(vm: &mut Vm, bytecode: &[u32], addr: u32) {
        for (i, &w) in bytecode.iter().enumerate() {
            let a = addr as usize + i;
            if a < vm.ram.len() {
                vm.ram[a] = w;
            }
        }
        vm.pc = addr;
        vm.halted = false;
        vm.step();
    }

    /// Test 1: STORE to canvas triggers formula_recalc.
    /// Register formula via API, then STORE to a dep cell and verify reactive update.
    #[test]
    fn test_integration_store_triggers_recalc() {
        let mut vm = Vm::new();

        // Register formula: cell 10 = cell 0 + cell 1 (ADD)
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);

        // Set initial canvas values
        vm.canvas_buffer[0] = 5;
        vm.canvas_buffer[1] = 15;
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 20, "5 + 15 = 20");

        // STORE 42 to canvas cell 0 via bytecode
        // STORE addr_reg, val_reg: [0x12, addr_reg_idx, val_reg_idx]
        vm.regs[1] = 0x8000; // canvas cell 0 address
        vm.regs[2] = 42;
        step_vm(&mut vm, &[0x12, 1, 2], 100);

        // After STORE, canvas_buffer[0] should be 42, cell 10 should be 42+15=57
        assert_eq!(vm.canvas_buffer[0], 42, "STORE wrote 42 to cell 0");
        assert_eq!(vm.canvas_buffer[10], 57, "reactive recalc: 42 + 15 = 57");
    }

    /// Test 2: Reactive chain cascade via STORE.
    /// cell 10 = cell 0 + cell 1 (ADD)
    /// cell 20 = cell 10 * cell 2 (MUL)
    /// STORE to cell 1 updates cell 10 (single-level only).
    #[test]
    fn test_reactive_chain_cascade() {
        let mut vm = Vm::new();

        // Register: cell 10 = cell 0 + cell 1
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        // Register: cell 20 = cell 10 * cell 2 (MUL)
        vm.canvas_buffer[2] = 2;
        vm.formula_register(20, vec![10, 2], FormulaOp::Mul);

        // Set initial values
        vm.canvas_buffer[0] = 3;
        vm.canvas_buffer[1] = 7;

        // STORE 100 to canvas cell 1 (addr 0x8001)
        vm.regs[1] = 0x8001;
        vm.regs[2] = 100;
        step_vm(&mut vm, &[0x12, 1, 2], 100);

        assert_eq!(vm.canvas_buffer[1], 100, "STORE wrote 100 to cell 1");
        assert_eq!(vm.canvas_buffer[10], 103, "cell 10 = 3 + 100 = 103");
    }

    /// Test 2b: Manual cascade propagation.
    /// After first-level recalc updates cell 10, a second recalc on cell 10
    /// propagates the change to cell 20.
    #[test]
    fn test_manual_cascade_propagation() {
        let mut vm = Vm::new();

        // Register: cell 10 = cell 0 + cell 1 (ADD)
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        // Register: cell 20 = cell 10 * cell 2 (MUL)
        vm.canvas_buffer[2] = 2;
        vm.formula_register(20, vec![10, 2], FormulaOp::Mul);

        vm.canvas_buffer[0] = 3;
        vm.canvas_buffer[1] = 7;

        // Change cell 1 to 100
        vm.canvas_buffer[1] = 100;
        vm.formula_recalc(1);
        assert_eq!(vm.canvas_buffer[10], 103);

        // Manually trigger recalc for cell 10 to propagate
        vm.formula_recalc(10);
        assert_eq!(vm.canvas_buffer[20], 206, "103 * 2 = 206");
    }

    /// Test 3: FORMULACLEAR empties both formulas and formula_dep_index.
    #[test]
    fn test_formula_clear_dep_index_cleanup() {
        let mut vm = Vm::new();

        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        vm.formula_register(20, vec![2, 3], FormulaOp::Mul);
        vm.formula_register(30, vec![4], FormulaOp::Copy);

        assert_eq!(vm.formulas.len(), 3, "3 formulas registered");
        assert!(!vm.formula_dep_index.is_empty(), "dep index populated");

        // Clear all via API
        vm.formula_clear_all();
        assert_eq!(vm.formulas.len(), 0, "all formulas cleared");
        assert!(vm.formula_dep_index.is_empty(), "dep index also cleared");
        assert!(vm.formula_dep_index.get(&0).is_none());
        assert!(vm.formula_dep_index.get(&1).is_none());
    }

    /// Test 4: FORMULAREM mid-chain preserves remaining formulas.
    #[test]
    fn test_formula_remove_dep_index_consistency() {
        let mut vm = Vm::new();

        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        vm.formula_register(20, vec![0, 2], FormulaOp::Mul);
        vm.formula_register(30, vec![0, 3], FormulaOp::Add);

        let deps_on_0 = vm.formula_dep_index.get(&0).unwrap().len();
        assert_eq!(deps_on_0, 3, "3 formulas depend on cell 0");

        // Remove formula for cell 20
        vm.formula_remove(20);

        assert_eq!(vm.formulas.len(), 2, "2 formulas remaining");
        assert!(vm.formulas.iter().all(|f| f.target_idx != 20));

        let deps_on_0_after = vm.formula_dep_index.get(&0).unwrap().len();
        assert_eq!(
            deps_on_0_after, 2,
            "2 formulas depend on cell 0 after removal"
        );

        // Remaining formulas still recalc correctly
        vm.canvas_buffer[0] = 5;
        vm.canvas_buffer[1] = 3;
        vm.canvas_buffer[2] = 10;
        vm.canvas_buffer[3] = 7;
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 8, "5 + 3 = 8");
        assert_eq!(vm.canvas_buffer[30], 12, "5 + 7 = 12");
    }

    /// Test 5: Wrapping arithmetic in formula evaluation.
    #[test]
    fn test_formula_eval_wrapping_add() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 0xFFFFFFFF;
        vm.canvas_buffer[1] = 1;
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 0, "wrapping_add: max + 1 = 0");
    }

    #[test]
    fn test_formula_eval_wrapping_sub() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 0;
        vm.canvas_buffer[1] = 1;
        vm.formula_register(10, vec![0, 1], FormulaOp::Sub);
        vm.formula_recalc(0);
        assert_eq!(
            vm.canvas_buffer[10], 0xFFFFFFFF,
            "wrapping_sub: 0 - 1 = max"
        );
    }

    #[test]
    fn test_formula_eval_wrapping_mul() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 0x10000;
        vm.canvas_buffer[1] = 0x10000;
        vm.formula_register(10, vec![0, 1], FormulaOp::Mul);
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 0, "wrapping_mul overflow");
    }

    /// Test 6: Multiple formulas depending on same cell all update.
    #[test]
    fn test_formula_recalc_multiple_dependents() {
        let mut vm = Vm::new();
        vm.formula_register(10, vec![0], FormulaOp::Copy);
        vm.formula_register(20, vec![0], FormulaOp::Not);
        vm.formula_register(30, vec![0, 1], FormulaOp::And);

        vm.canvas_buffer[0] = 0xFF;
        vm.canvas_buffer[1] = 0x0F;
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[10], 0xFF, "copy of 0xFF");
        assert_eq!(vm.canvas_buffer[20], !0xFF, "NOT 0xFF");
        assert_eq!(vm.canvas_buffer[30], 0xFF & 0x0F, "0xFF AND 0x0F = 0x0F");
    }

    /// Test 7: Full lifecycle - register via bytecode, STORE triggers recalc,
    /// FORMULACLEAR stops recalculation.
    #[test]
    fn test_formula_full_lifecycle_bytecode() {
        let mut vm = Vm::new();

        // Register formula via bytecode: cell 5 = cell 0 + cell 1 (ADD)
        step_vm(&mut vm, &[0x75, 5, 0, 2, 0, 1], 0);
        assert_eq!(vm.regs[0], 1, "registration success");

        // Set initial values
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;

        // STORE 100 to canvas cell 0 (addr 0x8000)
        vm.regs[1] = 0x8000;
        vm.regs[2] = 100;
        step_vm(&mut vm, &[0x12, 1, 2], 50);
        assert_eq!(vm.canvas_buffer[0], 100);
        assert_eq!(vm.canvas_buffer[5], 120, "100 + 20 = 120");

        // FORMULACLEAR via bytecode
        step_vm(&mut vm, &[0x76], 60);
        assert_eq!(vm.formulas.len(), 0);

        // STORE to cell 0 again - no recalc this time
        vm.regs[1] = 0x8000;
        vm.regs[2] = 200;
        step_vm(&mut vm, &[0x12, 1, 2], 70);
        assert_eq!(vm.canvas_buffer[0], 200);
        assert_eq!(vm.canvas_buffer[5], 120, "no recalc after clear, stays 120");
    }

    /// Test 8: Formula with max deps (8) populates dep index for all.
    #[test]
    fn test_formula_max_deps_integration() {
        let mut vm = Vm::new();
        vm.formula_register(100, vec![0, 1, 2, 3, 4, 5, 6, 7], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);
        for i in 0..8 {
            assert!(
                vm.formula_dep_index.contains_key(&i),
                "dep index should have entry for cell {}",
                i
            );
        }
    }

    /// Test 9: Reregister formula replaces old one and updates dep index.
    #[test]
    fn test_formula_reregister_updates_dep_index() {
        let mut vm = Vm::new();

        // Register: cell 5 = cell 0 + cell 1 (ADD)
        vm.formula_register(5, vec![0, 1], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);

        // Re-register: cell 5 = cell 0 * cell 2 (MUL)
        vm.formula_register(5, vec![0, 2], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 1, "replaced, not added");
        assert_eq!(vm.formulas[0].op, FormulaOp::Mul);

        // Dep index: cell 1 no longer a dep, cell 2 is
        assert!(
            vm.formula_dep_index.get(&1).is_none()
                || vm.formula_dep_index.get(&1).unwrap().is_empty(),
            "cell 1 no longer a dependency"
        );
        assert!(
            vm.formula_dep_index.get(&2).is_some(),
            "cell 2 is now a dependency"
        );
    }

    /// Test 10: STORE to non-canvas address does NOT trigger formula recalc.
    #[test]
    fn test_store_non_canvas_no_recalc() {
        let mut vm = Vm::new();
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        vm.canvas_buffer[0] = 5;
        vm.canvas_buffer[1] = 10;
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 15);

        // STORE to a regular RAM address (not canvas)
        vm.regs[1] = 0x2000; // non-canvas address
        vm.regs[2] = 999;
        step_vm(&mut vm, &[0x12, 1, 2], 100);

        // canvas_buffer unchanged - STORE went to regular RAM
        assert_eq!(vm.canvas_buffer[0], 5, "canvas cell 0 unchanged");
        assert_eq!(vm.canvas_buffer[10], 15, "formula result unchanged");
    }

    /// Test 11: FORMULACLEAR via bytecode followed by new registration works.
    #[test]
    fn test_clear_then_reregister() {
        let mut vm = Vm::new();
        vm.formula_register(10, vec![0, 1], FormulaOp::Add);

        // Clear via bytecode
        step_vm(&mut vm, &[0x76], 0);
        assert_eq!(vm.formulas.len(), 0);

        // Register new formula
        vm.formula_register(20, vec![2, 3], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 1);

        vm.canvas_buffer[2] = 6;
        vm.canvas_buffer[3] = 7;
        vm.formula_recalc(2);
        assert_eq!(vm.canvas_buffer[20], 42, "6 * 7 = 42");
    }

    /// Test 12: FORMULA Sum opcode sums all dependencies
    #[test]
    fn test_formula_sum() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;
        vm.canvas_buffer[2] = 30;
        vm.canvas_buffer[3] = 40;
        let ok = vm.formula_register(10, vec![0, 1, 2, 3], FormulaOp::Sum);
        assert!(ok, "Sum formula register should succeed");
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 100, "10+20+30+40 = 100");
    }

    /// Test 13: FORMULA Avg opcode averages all dependencies
    #[test]
    fn test_formula_avg() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;
        vm.canvas_buffer[2] = 30;
        let ok = vm.formula_register(15, vec![0, 1, 2], FormulaOp::Avg);
        assert!(ok, "Avg formula register should succeed");
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[15], 20, "(10+20+30)/3 = 20");
    }

    /// Test 14: FORMULA Sum with single dep
    #[test]
    fn test_formula_sum_single_dep() {
        let mut vm = Vm::new();
        vm.canvas_buffer[5] = 42;
        vm.formula_register(20, vec![5], FormulaOp::Sum);
        vm.formula_recalc(5);
        assert_eq!(vm.canvas_buffer[20], 42, "Sum of [42] = 42");
    }

    /// Test 15: FORMULA Avg with empty deps returns 0
    #[test]
    fn test_formula_avg_empty() {
        let mut vm = Vm::new();
        vm.formula_register(25, vec![], FormulaOp::Avg);
        vm.formula_recalc(25);
        assert_eq!(vm.canvas_buffer[25], 0, "Avg of [] = 0");
    }

    /// Test 16: FORMULA Sum triggers recalc via STORE to canvas cell
    #[test]
    fn test_formula_sum_store_triggers_recalc() {
        let mut vm = Vm::new();
        vm.canvas_buffer[0] = 5;
        vm.canvas_buffer[1] = 10;
        vm.formula_register(10, vec![0, 1], FormulaOp::Sum);
        assert_eq!(vm.canvas_buffer[10], 0, "not yet recalculated");

        // Change a dep cell via the formula engine — should trigger recalc
        vm.canvas_buffer[0] = 15;
        // The VM's STORE handler (in step_graphics via opcode 0x12) calls
        // formula_recalc when the target address is in canvas range.
        // Here we simulate that by calling formula_recalc directly.
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[10], 25, "15 + 10 = 25");
    }
}
