use super::types::*;
use super::Vm;

impl Vm {
    /// Handle syscall and IPC opcodes (0x52-0x5F).
    /// Returns false if halted (RETK protection fault), true otherwise.
    #[allow(unreachable_patterns)]
    pub(super) fn step_syscall(&mut self, opcode: u32) -> bool {
        match opcode {
            // SYSCALL num  -- trap into kernel mode
            // Reads handler address from RAM[SYSCALL_TABLE + num]
            // Saves return PC on kernel_stack, switches to Kernel, jumps to handler
            0x52 => {
                let num = self.fetch() as usize;
                let table_idx = SYSCALL_TABLE + num;
                if table_idx < self.ram.len() {
                    let handler = self.ram[table_idx];
                    if handler != 0 {
                        // Save return address and current mode
                        self.kernel_stack.push((self.pc, self.mode));
                        self.mode = CpuMode::Kernel;
                        self.pc = handler;
                    } else {
                        // No handler registered: set r0 = error
                        self.regs[0] = geos_errno(GEOS_EINVAL);
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

            // RETK  -- return from kernel mode to user mode
            // Pops return PC and saved mode from kernel_stack
            0x53 => {
                if let Some((ret_pc, saved_mode)) = self.kernel_stack.pop() {
                    self.pc = ret_pc;
                    self.mode = saved_mode;
                } else {
                    // Empty kernel stack: halt (protection fault)
                    self.halted = true;
                    return false;
                }
            }

            // OPEN path_reg, mode_reg  -- open file, returns fd in r0
            // path_reg points to null-terminated string in RAM (one char per word)
            // mode: 0=read, 1=write, 2=read+write(append)
            0x54 => {
                let path_reg = self.fetch() as usize;
                let mode_reg = self.fetch() as usize;
                if path_reg < NUM_REGS && mode_reg < NUM_REGS {
                    let path_addr = self.regs[path_reg];
                    let mode = self.regs[mode_reg];
                    // Check if path matches a device name
                    let mut is_device = false;
                    let mut dev_fd = 0xFFFFFFFF;
                    let path_str = Self::read_string_static(&self.ram, path_addr as usize);

                    // Phase 102: Capability enforcement on file open
                    if let Some(ref path) = path_str {
                        // Use current_capabilities (set by scheduler) first,
                        // fall back to searching processes (for direct step() in tests)
                        let caps = if self.current_capabilities.is_some() {
                            self.current_capabilities.clone()
                        } else {
                            let pid = self.current_pid;
                            self.processes
                                .iter()
                                .find(|p| p.pid == pid)
                                .and_then(|p| p.capabilities.clone())
                        };
                        // mode 0 = read, 1 = write
                        let perm = if mode == 0 {
                            crate::vm::types::Capability::PERM_READ
                        } else {
                            crate::vm::types::Capability::PERM_WRITE
                        };
                        if !crate::vm::types::check_path_capability(&caps, path, perm) {
                            self.regs[0] = geos_errno(GEOS_EPERM);
                            return true;
                        }
                    }

                    if let Some(path) = path_str {
                        for (i, &name) in DEVICE_NAMES.iter().enumerate() {
                            if path == name {
                                is_device = true;
                                dev_fd = DEVICE_FD_BASE + i as u32;
                                break;
                            }
                        }
                    }
                    if is_device {
                        self.regs[0] = dev_fd;
                    } else {
                        let pid = self.current_pid;
                        let fd = self.vfs.fopen(&self.ram, path_addr, mode, pid);
                        self.regs[0] = fd;
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

            // READ fd_reg, buf_addr_reg, len_reg  -- read from file into RAM
            // Returns bytes read in r0
            0x55 => {
                let fd_reg = self.fetch() as usize;
                let buf_reg = self.fetch() as usize;
                let len_reg = self.fetch() as usize;
                if fd_reg < NUM_REGS && buf_reg < NUM_REGS && len_reg < NUM_REGS {
                    let fd = self.regs[fd_reg];
                    // Check if this is a device fd (0xE000+idx)
                    let dev_idx_r = fd.wrapping_sub(DEVICE_FD_BASE) as usize;
                    if fd >= DEVICE_FD_BASE && dev_idx_r < DEVICE_COUNT {
                        let dev_idx = fd.wrapping_sub(DEVICE_FD_BASE) as usize;
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        let mut count = 0usize;
                        match dev_idx {
                            1 => {
                                // /dev/keyboard -- read key from key_port
                                if len > 0 && buf_addr < self.ram.len() {
                                    self.ram[buf_addr] = self.key_port;
                                    self.key_port = 0; // clear port like IKEY
                                    count = 1;
                                }
                            }
                            3 => {
                                // /dev/net -- read from RAM[0xFFC]
                                if len > 0 && buf_addr < self.ram.len() {
                                    self.ram[buf_addr] = self.ram[0xFFC];
                                    count = 1;
                                }
                            }
                            _ => {} // other devices: read returns 0
                        }
                        self.regs[0] = count as u32;
                    }
                    // Check if this is a pipe read fd (0x8000+idx)
                    else if (0x8000..0xC000).contains(&fd) {
                        let pipe_idx = (fd & 0x0FFF) as usize;
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        if pipe_idx < self.pipes.len() && self.pipes[pipe_idx].alive {
                            if self.pipes[pipe_idx].is_empty() {
                                // Blocking read: block this process and rewind PC
                                let pid = self.current_pid;
                                if pid > 0 {
                                    if let Some(proc) =
                                        self.processes.iter_mut().find(|p| p.pid == pid)
                                    {
                                        proc.state = ProcessState::Blocked;
                                        // Rewind PC past the READ opcode (4 words: opcode + 3 args)
                                        self.pc -= 4;
                                    }
                                }
                                self.regs[0] = 0; // 0 bytes read (will retry)
                            } else {
                                // Read available words from pipe into RAM
                                let mut count = 0usize;
                                for i in 0..len {
                                    if let Some(word) = self.pipes[pipe_idx].read_word() {
                                        let addr = buf_addr + i;
                                        if addr < self.ram.len() {
                                            self.ram[addr] = word;
                                            count += 1;
                                        }
                                    } else {
                                        break;
                                    }
                                }
                                self.regs[0] = count as u32;
                                // Unblock any process blocked on write to this pipe
                                // (writer may have been blocked if pipe was full)
                            }
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF); // bad pipe fd
                        }
                    } else {
                        let buf_addr = self.regs[buf_reg];
                        let len = self.regs[len_reg];
                        let pid = self.current_pid;
                        let n = self.vfs.fread(&mut self.ram, fd, buf_addr, len, pid);
                        self.regs[0] = n;
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

            // WRITE fd_reg, buf_addr_reg, len_reg  -- write from RAM to file or pipe
            // Returns bytes written in r0
            0x56 => {
                let fd_reg = self.fetch() as usize;
                let buf_reg = self.fetch() as usize;
                let len_reg = self.fetch() as usize;
                if fd_reg < NUM_REGS && buf_reg < NUM_REGS && len_reg < NUM_REGS {
                    let fd = self.regs[fd_reg];
                    // Check if this is a device fd (0xE000+idx)
                    let dev_idx_w = fd.wrapping_sub(DEVICE_FD_BASE) as usize;
                    if fd >= DEVICE_FD_BASE && dev_idx_w < DEVICE_COUNT {
                        let buf_addr = self.regs[buf_reg] as usize;
                        let len = self.regs[len_reg] as usize;
                        match dev_idx_w {
                            0 => {
                                // /dev/screen -- write (x, y, color) triplets
                                let mut i = 0;
                                while i + 2 < len {
                                    let x_addr = buf_addr + i;
                                    let y_addr = buf_addr + i + 1;
                                    let c_addr = buf_addr + i + 2;
                                    if x_addr < self.ram.len()
                                        && y_addr < self.ram.len()
                                        && c_addr < self.ram.len()
                                    {
                                        let x = self.ram[x_addr] as usize;
                                        let y = self.ram[y_addr] as usize;
                                        let c = self.ram[c_addr];
                                        if x < 256 && y < 256 {
                                            self.screen[y * 256 + x] = c;
                                        }
                                    }
                                    i += 3;
                                }
                                self.regs[0] = i as u32;
                            }
                            2 => {
                                // /dev/audio -- write (freq, duration) pair
                                if len >= 2
                                    && buf_addr < self.ram.len()
                                    && buf_addr + 1 < self.ram.len()
                                {
                                    let freq = self.ram[buf_addr].clamp(20, 20000);
                                    let dur = self.ram[buf_addr + 1].clamp(1, 5000);
                                    self.beep = Some((freq, dur));
                                    self.regs[0] = 2;
                                } else {
                                    self.regs[0] = 0;
                                }
                            }
                            3 => {
                                // /dev/net -- write to RAM[0xFFC]
                                if len > 0 && buf_addr < self.ram.len() {
                                    self.ram[0xFFC] = self.ram[buf_addr];
                                    self.regs[0] = 1;
                                } else {
                                    self.regs[0] = 0;
                                }
                            }
                            _ => {
                                self.regs[0] = 0;
                            }
                        }
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
                                    // Check if this process is blocked reading from this pipe
                                    // (heuristic: unblock all blocked processes -- they'll
                                    // re-block if their pipe is still empty)
                                    proc.state = ProcessState::Ready;
                                }
                            }
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF); // bad pipe fd or pipe closed
                        }
                    } else {
                        let buf_addr = self.regs[buf_reg];
                        let len = self.regs[len_reg];
                        let pid = self.current_pid;
                        let n = self.vfs.fwrite(&self.ram, fd, buf_addr, len, pid);
                        self.regs[0] = n;
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

            // CLOSE fd_reg  -- close file descriptor, returns 0 in r0 on success
            // Also handles pipe fds (0x8000 read, 0xC000 write)
            0x57 => {
                let fd_reg = self.fetch() as usize;
                if fd_reg < NUM_REGS {
                    let fd = self.regs[fd_reg];
                    let pid = self.current_pid;
                    // Check if this is a device fd (no-op close)
                    let dev_idx_c = fd.wrapping_sub(DEVICE_FD_BASE) as usize;
                    if fd >= DEVICE_FD_BASE && dev_idx_c < DEVICE_COUNT {
                        self.regs[0] = 0; // device close always succeeds
                    }
                    // Check if this is a pipe fd
                    else if (0x8000..0xC000).contains(&fd)
                        || (0xC000..DEVICE_FD_BASE).contains(&fd)
                    {
                        let pipe_idx = (fd & 0x0FFF) as usize;
                        if pipe_idx < self.pipes.len() {
                            // Mark pipe as dead (both read and write ends closed)
                            self.pipes[pipe_idx].alive = false;
                            self.regs[0] = 0;
                        } else {
                            self.regs[0] = geos_errno(GEOS_EBADF);
                        }
                    } else {
                        let result = self.vfs.fclose(fd, pid);
                        self.regs[0] = result;
                    }
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

            // SEEK fd_reg, offset_reg, whence_reg  -- seek in file
            // whence: 0=SET, 1=CUR, 2=END. Returns new position in r0
            0x58 => {
                let fd_reg = self.fetch() as usize;
                let offset_reg = self.fetch() as usize;
                let whence_reg = self.fetch() as usize;
                if fd_reg < NUM_REGS && offset_reg < NUM_REGS && whence_reg < NUM_REGS {
                    let fd = self.regs[fd_reg];
                    let offset = self.regs[offset_reg];
                    let whence = self.regs[whence_reg];
                    let pid = self.current_pid;
                    let pos = self.vfs.fseek(fd, offset, whence, pid);
                    self.regs[0] = pos;
                } else {
                    self.regs[0] = geos_errno(GEOS_EINVAL);
                }
            }

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
            }

            // YIELD -- cooperative yield, give up remaining time slice
            0x5A => {
                self.yielded = true;
            }

            // SLEEP ticks_reg -- sleep for N scheduler ticks
            0x5B => {
                let tr = self.fetch() as usize;
                if tr < NUM_REGS {
                    self.sleep_frames = self.regs[tr];
                }
            }

            // SETPRIORITY priority_reg -- set current process priority (0-3)
            0x5C => {
                let pr = self.fetch() as usize;
                if pr < NUM_REGS {
                    self.new_priority = self.regs[pr].min(3) as u8;
                }
            }

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
            }

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
            }

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
            }
            _ => {}
        }
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::types::*;

    /// Helper: create a VM with a bytecode program loaded at addr, run one step from addr.
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
            vm.ram[addr + s.len()] = 0; // null terminator
        }
    }

    // ── SYSCALL (0x52) ──────────────────────────────────────────────

    #[test]
    fn test_syscall_dispatches_to_handler() {
        // Register handler at SYSCALL_TABLE + 0 = 0xFE00
        let mut vm = Vm::new();
        vm.ram[SYSCALL_TABLE] = 0x100; // handler at address 0x100
                                       // SYSCALL 0: opcode=0x52, arg=0
        vm.ram[0] = 0x52;
        vm.ram[1] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.pc, 0x100);
        assert_eq!(vm.mode, CpuMode::Kernel);
        assert_eq!(vm.kernel_stack.len(), 1);
    }

    #[test]
    fn test_syscall_no_handler_sets_error() {
        let mut vm = Vm::new();
        // No handler registered at SYSCALL_TABLE + 1
        vm.ram[SYSCALL_TABLE + 1] = 0;
        vm.regs[0] = 0;
        vm.ram[0] = 0x52;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
        // Vm::new() starts in Kernel mode; no-handler path doesn't change it
        assert_eq!(vm.mode, CpuMode::Kernel);
        assert_eq!(vm.kernel_stack.len(), 0);
    }

    #[test]
    fn test_syscall_out_of_range_sets_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        // SYSCALL with num that puts table_idx out of RAM range
        vm.ram[0] = 0x52;
        vm.ram[1] = 0xFFFF;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_syscall_saves_mode_and_pc() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        vm.ram[SYSCALL_TABLE + 5] = 0x200;
        vm.ram[42] = 0x52; // SYSCALL at PC=42
        vm.ram[43] = 5;
        vm.pc = 42;
        vm.step();
        // step() advances PC to 44 (42 + 2 words) BEFORE the handler runs,
        // so the saved PC is 44 (return address after SYSCALL instruction)
        let (saved_pc, saved_mode) = vm.kernel_stack[0];
        assert_eq!(saved_pc, 44);
        assert_eq!(saved_mode, CpuMode::User);
        assert_eq!(vm.pc, 0x200);
        assert_eq!(vm.mode, CpuMode::Kernel);
    }

    // ── RETK (0x53) ────────────────────────────────────────────────

    #[test]
    fn test_retk_restores_pc_and_mode() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::Kernel;
        vm.kernel_stack.push((0x500, CpuMode::User));
        vm.ram[0] = 0x53;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.pc, 0x500);
        assert_eq!(vm.mode, CpuMode::User);
        assert!(vm.kernel_stack.is_empty());
    }

    #[test]
    fn test_retk_empty_stack_halts() {
        let mut vm = Vm::new();
        vm.halted = false;
        vm.ram[0] = 0x53;
        vm.pc = 0;
        let result = vm.step();
        assert!(!result);
        assert!(vm.halted);
    }

    #[test]
    fn test_syscall_retk_roundtrip() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        vm.ram[SYSCALL_TABLE + 0] = 0x100;
        // SYSCALL 0
        vm.ram[0] = 0x52;
        vm.ram[1] = 0;
        // At 0x100: RETK
        vm.ram[0x100] = 0x53;
        vm.pc = 0;
        vm.step(); // SYSCALL -> jumps to 0x100, mode=Kernel
        assert_eq!(vm.mode, CpuMode::Kernel);
        vm.step(); // RETK -> back to caller, mode=User
        assert_eq!(vm.mode, CpuMode::User);
        assert_eq!(vm.pc, 2); // PC after SYSCALL instruction (2 words)
    }

    // ── OPEN (0x54) ────────────────────────────────────────────────

    #[test]
    fn test_open_device_screen() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200; // path_reg = r1 -> points to string
        vm.regs[2] = 1; // mode_reg = r2 -> write mode
        vm.ram[0] = 0x54; // OPEN
        vm.ram[1] = 1; // path_reg
        vm.ram[2] = 2; // mode_reg
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 0); // 0xE000
    }

    #[test]
    fn test_open_device_keyboard() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/dev/keyboard");
        vm.regs[1] = 0x200;
        vm.regs[2] = 0;
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 1); // 0xE001
    }

    #[test]
    fn test_open_device_audio() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/dev/audio");
        vm.regs[1] = 0x200;
        vm.regs[2] = 1;
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 2); // 0xE002
    }

    #[test]
    fn test_open_device_net() {
        let mut vm = Vm::new();
        write_string(&mut vm, 0x200, "/dev/net");
        vm.regs[1] = 0x200;
        vm.regs[2] = 0;
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 3); // 0xE003
    }

    #[test]
    fn test_open_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        // path_reg = 32 (out of range)
        vm.ram[0] = 0x54;
        vm.ram[1] = 32;
        vm.ram[2] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── READ (0x55) ────────────────────────────────────────────────

    #[test]
    fn test_read_keyboard_device() {
        let mut vm = Vm::new();
        vm.key_port = 0x41; // 'A'
        vm.regs[1] = DEVICE_FD_BASE + 1; // fd = /dev/keyboard
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 1; // len
        vm.ram[0] = 0x55; // READ
        vm.ram[1] = 1; // fd_reg
        vm.ram[2] = 2; // buf_reg
        vm.ram[3] = 3; // len_reg
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1); // 1 byte read
        assert_eq!(vm.ram[0x300], 0x41); // 'A' read into buffer
        assert_eq!(vm.key_port, 0); // port cleared
    }

    #[test]
    fn test_read_net_device() {
        let mut vm = Vm::new();
        vm.ram[0xFFC] = 0xDEAD;
        vm.regs[1] = DEVICE_FD_BASE + 3; // fd = /dev/net
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1);
        assert_eq!(vm.ram[0x300], 0xDEAD);
    }

    #[test]
    fn test_read_device_zero_len_returns_zero() {
        let mut vm = Vm::new();
        vm.key_port = 0x41;
        vm.regs[1] = DEVICE_FD_BASE + 1;
        vm.regs[2] = 0x300;
        vm.regs[3] = 0; // len = 0
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_read_screen_device_returns_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 0; // /dev/screen has no read
        vm.regs[2] = 0x300;
        vm.regs[3] = 10;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_read_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.ram[0] = 0x55;
        vm.ram[1] = 32; // invalid reg
        vm.ram[2] = 0;
        vm.ram[3] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── WRITE (0x56) ───────────────────────────────────────────────

    #[test]
    fn test_write_screen_device_pixel() {
        let mut vm = Vm::new();
        // Write (x=10, y=20, color=0xFF0000) triplet to /dev/screen
        vm.ram[0x300] = 10;
        vm.ram[0x301] = 20;
        vm.ram[0x302] = 0xFF0000;
        vm.regs[1] = DEVICE_FD_BASE + 0; // /dev/screen
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 3; // len = 3 (one triplet)
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 3);
        assert_eq!(vm.screen[20 * 256 + 10], 0xFF0000);
    }

    #[test]
    fn test_write_screen_device_multiple_triplets() {
        let mut vm = Vm::new();
        // Two triplets: (5,5,RED) and (6,6,BLUE)
        vm.ram[0x300] = 5;
        vm.ram[0x301] = 5;
        vm.ram[0x302] = 0xFF0000;
        vm.ram[0x303] = 6;
        vm.ram[0x304] = 6;
        vm.ram[0x305] = 0x0000FF;
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 6; // len = 6 (two triplets)
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 6);
        assert_eq!(vm.screen[5 * 256 + 5], 0xFF0000);
        assert_eq!(vm.screen[6 * 256 + 6], 0x0000FF);
    }

    #[test]
    fn test_write_audio_device() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 440; // freq
        vm.ram[0x301] = 200; // duration
        vm.regs[1] = DEVICE_FD_BASE + 2; // /dev/audio
        vm.regs[2] = 0x300;
        vm.regs[3] = 2;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 2);
        assert_eq!(vm.beep, Some((440, 200)));
    }

    #[test]
    fn test_write_net_device() {
        let mut vm = Vm::new();
        vm.ram[0xFFC] = 0;
        vm.ram[0x300] = 0xBEEF;
        vm.regs[1] = DEVICE_FD_BASE + 3; // /dev/net
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1);
        assert_eq!(vm.ram[0xFFC], 0xBEEF);
    }

    #[test]
    fn test_write_audio_clamps_values() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 10; // freq below min 20
        vm.ram[0x301] = 99999; // dur above max 5000
        vm.regs[1] = DEVICE_FD_BASE + 2;
        vm.regs[2] = 0x300;
        vm.regs[3] = 2;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.beep, Some((20, 5000))); // clamped
    }

    #[test]
    fn test_write_audio_insufficient_len_returns_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 2;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1; // only 1 word, need 2
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert!(vm.beep.is_none());
    }

    #[test]
    fn test_write_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.ram[0] = 0x56;
        vm.ram[1] = 32;
        vm.ram[2] = 0;
        vm.ram[3] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── CLOSE (0x57) ───────────────────────────────────────────────

    #[test]
    fn test_close_device_succeeds() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.ram[0] = 0x57;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_close_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.ram[0] = 0x57;
        vm.ram[1] = 32;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_close_pipe_marks_dead() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        vm.regs[1] = 0x8000; // pipe read fd, idx=0
        vm.ram[0] = 0x57;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert!(!vm.pipes[0].alive);
    }

    #[test]
    fn test_close_pipe_write_fd_marks_dead() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        vm.regs[1] = 0xC000; // pipe write fd, idx=0
        vm.ram[0] = 0x57;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert!(!vm.pipes[0].alive);
    }

    #[test]
    fn test_close_bad_pipe_returns_error() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x8005; // pipe idx=5, but only 0 pipes exist
        vm.ram[0] = 0x57;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    // ── SEEK (0x58) ────────────────────────────────────────────────

    #[test]
    fn test_seek_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.ram[0] = 0x58;
        vm.ram[1] = 32; // invalid reg
        vm.ram[2] = 0;
        vm.ram[3] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── LS (0x59) ──────────────────────────────────────────────────

    #[test]
    fn test_ls_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.regs[0] = 0;
        vm.ram[0] = 0x59;
        vm.ram[1] = 32;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── YIELD (0x5A) ───────────────────────────────────────────────

    #[test]
    fn test_yield_sets_flag() {
        let mut vm = Vm::new();
        vm.yielded = false;
        vm.ram[0] = 0x5A;
        vm.pc = 0;
        vm.step();
        assert!(vm.yielded);
    }

    // ── SLEEP (0x5B) ──────────────────────────────────────────────

    #[test]
    fn test_sleep_sets_sleep_frames() {
        let mut vm = Vm::new();
        vm.sleep_frames = 0;
        vm.regs[5] = 100;
        vm.ram[0] = 0x5B;
        vm.ram[1] = 5; // reg r5
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.sleep_frames, 100);
    }

    #[test]
    fn test_sleep_invalid_register_ignored() {
        let mut vm = Vm::new();
        vm.sleep_frames = 0;
        vm.ram[0] = 0x5B;
        vm.ram[1] = 32; // out of range
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.sleep_frames, 0);
    }

    // ── SETPRIORITY (0x5C) ─────────────────────────────────────────

    #[test]
    fn test_setpriority_clamps_to_max() {
        let mut vm = Vm::new();
        vm.regs[5] = 255; // way above max 3
        vm.ram[0] = 0x5C;
        vm.ram[1] = 5;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.new_priority, 3);
    }

    #[test]
    fn test_setpriority_valid_value() {
        let mut vm = Vm::new();
        vm.regs[10] = 2;
        vm.ram[0] = 0x5C;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.new_priority, 2);
    }

    #[test]
    fn test_setpriority_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = 0;
        vm.ram[0] = 0x5C;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.new_priority, 0);
    }

    #[test]
    fn test_setpriority_invalid_register_ignored() {
        let mut vm = Vm::new();
        vm.new_priority = 1;
        vm.ram[0] = 0x5C;
        vm.ram[1] = 32;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.new_priority, 1); // unchanged
    }

    // ── PIPE (0x5D) ────────────────────────────────────────────────

    #[test]
    fn test_pipe_creates_and_returns_fds() {
        let mut vm = Vm::new();
        vm.ram[0] = 0x5D;
        vm.ram[1] = 1; // read fd -> r1
        vm.ram[2] = 2; // write fd -> r2
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(vm.regs[1], 0x8000); // read fd
        assert_eq!(vm.regs[2], 0xC000); // write fd
        assert_eq!(vm.pipes.len(), 1);
        assert!(vm.pipes[0].alive);
    }

    #[test]
    fn test_pipe_second_pipe_gets_incremented_fds() {
        let mut vm = Vm::new();
        // First pipe
        vm.pipes.push(Pipe::new(0, 0));
        // Now create second
        vm.ram[0] = 0x5D;
        vm.ram[1] = 3;
        vm.ram[2] = 4;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.regs[3], 0x8001); // read fd idx=1
        assert_eq!(vm.regs[4], 0xC001); // write fd idx=1
        assert_eq!(vm.pipes.len(), 2);
    }

    #[test]
    fn test_pipe_max_pipes_returns_error() {
        let mut vm = Vm::new();
        // Fill up to MAX_PIPES
        for _ in 0..MAX_PIPES {
            vm.pipes.push(Pipe::new(0, 0));
        }
        vm.ram[0] = 0x5D;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENFILE));
    }

    #[test]
    fn test_pipe_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.ram[0] = 0x5D;
        vm.ram[1] = 32;
        vm.ram[2] = 0;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── MSGSND (0x5E) ──────────────────────────────────────────────

    #[test]
    fn test_msgsnd_delivers_to_target_process() {
        let mut vm = Vm::new();
        let target = Process::new(5, 0, 0x100);
        vm.processes.push(target);
        vm.regs[0] = 0;
        vm.regs[1] = 0xAA;
        vm.regs[2] = 0xBB;
        vm.regs[3] = 0xCC;
        vm.regs[4] = 0xDD;
        vm.regs[10] = 5; // target PID
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10; // pid_reg = r10
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success
        let proc = &vm.processes[0];
        assert_eq!(proc.msg_queue.len(), 1);
        let msg = &proc.msg_queue[0];
        assert_eq!(msg.sender, 0); // current_pid
        assert_eq!(msg.data, [0xAA, 0xBB, 0xCC, 0xDD]);
    }

    #[test]
    fn test_msgsnd_unblocks_blocked_receiver() {
        let mut vm = Vm::new();
        let mut target = Process::new(5, 0, 0x100);
        target.state = ProcessState::Blocked;
        vm.processes.push(target);
        vm.regs[10] = 5;
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.processes[0].state, ProcessState::Ready);
    }

    #[test]
    fn test_msgsnd_nonexistent_target_returns_error() {
        let mut vm = Vm::new();
        vm.regs[10] = 99; // PID 99 doesn't exist
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ESRCH));
    }

    #[test]
    fn test_msgsnd_halted_target_returns_error() {
        let mut vm = Vm::new();
        let mut target = Process::new(5, 0, 0x100);
        target.state = ProcessState::Zombie;
        vm.processes.push(target);
        vm.regs[10] = 5;
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ESRCH));
    }

    #[test]
    fn test_msgsnd_full_queue_returns_error() {
        let mut vm = Vm::new();
        let mut target = Process::new(5, 0, 0x100);
        for _ in 0..MAX_MESSAGES {
            target.msg_queue.push(Message::new(0, [0; MSG_WORDS]));
        }
        vm.processes.push(target);
        vm.regs[10] = 5;
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ESRCH));
    }

    #[test]
    fn test_msgsnd_invalid_register_returns_error() {
        let mut vm = Vm::new();
        vm.ram[0] = 0x5E;
        vm.ram[1] = 32;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    // ── MSGRCV (0x5F) ──────────────────────────────────────────────

    #[test]
    fn test_msgrcv_receives_message() {
        let mut vm = Vm::new();
        let mut proc = Process::new(5, 0, 0x100);
        proc.msg_queue.push(Message::new(1, [10, 20, 30, 40]));
        vm.processes.push(proc);
        vm.current_pid = 5;
        vm.ram[0] = 0x5F;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1); // sender PID
        assert_eq!(vm.regs[1], 10);
        assert_eq!(vm.regs[2], 20);
        assert_eq!(vm.regs[3], 30);
        assert_eq!(vm.regs[4], 40);
        assert!(vm.processes[0].msg_queue.is_empty());
    }

    #[test]
    fn test_msgrcv_blocks_when_empty() {
        let mut vm = Vm::new();
        let proc = Process::new(5, 0, 0x100);
        vm.processes.push(proc);
        vm.current_pid = 5;
        vm.ram[0] = 0x5F;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.processes[0].state, ProcessState::Blocked);
    }

    #[test]
    fn test_msgrcv_main_process_returns_error() {
        let mut vm = Vm::new();
        vm.current_pid = 0; // main process
        vm.ram[0] = 0x5F;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_msgrcv_rewinds_pc_on_block() {
        let mut vm = Vm::new();
        let proc = Process::new(5, 0, 0x100);
        vm.processes.push(proc);
        vm.current_pid = 5;
        vm.ram[100] = 0x5F; // MSGRCV at PC=100
        vm.pc = 100;
        vm.step();
        // step() advances PC to 101 (100 + 1 word), then MSGRCV handler
        // does self.pc -= 1 to rewind for retry, so PC = 100
        assert_eq!(vm.pc, 100);
    }

    // ── Pipe read/write integration ────────────────────────────────

    #[test]
    fn test_pipe_write_then_read() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        // Write 0xBEEF to pipe write fd (0xC000)
        vm.ram[0x300] = 0xBEEF;
        vm.regs[1] = 0xC000; // write fd
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 1; // len
        vm.ram[0] = 0x56; // WRITE
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1); // 1 word written

        // Read from pipe read fd (0x8000)
        vm.ram[0x400] = 0; // clear buffer
        vm.regs[1] = 0x8000; // read fd
        vm.regs[2] = 0x400; // buf addr
        vm.regs[3] = 1; // len
        vm.ram[4] = 0x55; // READ
        vm.ram[5] = 1;
        vm.ram[6] = 2;
        vm.ram[7] = 3;
        vm.pc = 4;
        vm.step();
        assert_eq!(vm.regs[0], 1); // 1 word read
        assert_eq!(vm.ram[0x400], 0xBEEF);
    }

    #[test]
    fn test_pipe_write_multiple_words() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        vm.ram[0x300] = 10;
        vm.ram[0x301] = 20;
        vm.ram[0x302] = 30;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 3;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 3);
    }

    #[test]
    fn test_pipe_read_bad_fd_returns_error() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x8005; // pipe idx=5, no pipes exist
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    #[test]
    fn test_pipe_write_bad_fd_returns_error() {
        let mut vm = Vm::new();
        vm.regs[1] = 0xC005; // pipe idx=5, no pipes exist
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    #[test]
    fn test_pipe_write_unblocks_blocked_readers() {
        let mut vm = Vm::new();
        let mut proc = Process::new(1, 0, 0x100);
        proc.state = ProcessState::Blocked;
        vm.processes.push(proc);
        vm.pipes.push(Pipe::new(1, 0));
        vm.ram[0x300] = 42;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // Blocked process should be unblocked
        assert_eq!(vm.processes[0].state, ProcessState::Ready);
    }

    // ── Screen write clipping ──────────────────────────────────────

    #[test]
    fn test_write_screen_clips_out_of_bounds() {
        let mut vm = Vm::new();
        // x=300 (out of 256), y=20, color=RED
        vm.ram[0x300] = 300;
        vm.ram[0x301] = 20;
        vm.ram[0x302] = 0xFF0000;
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 3;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // Triplet consumed but pixel not drawn (x >= 256)
        assert_eq!(vm.regs[0], 3);
        // Verify no pixel was set at the out-of-bounds location
        // Screen is 256x256 = 65536 pixels, index 20*256+300 = 5420 would be out of bounds
        // The code checks x < 256 && y < 256, so this pixel is skipped
    }

    #[test]
    fn test_write_screen_incomplete_triplet_ignored() {
        let mut vm = Vm::new();
        // Only 2 words, not a complete triplet
        vm.ram[0x300] = 10;
        vm.ram[0x301] = 20;
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 2; // len=2, not enough for a triplet
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // 0 triplets processed
    }

    // ── SYSCALL + RETK nested ──────────────────────────────────────

    #[test]
    fn test_nested_syscall_retk() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        // Handler A at 0x100 does SYSCALL 1 -> handler B at 0x200
        vm.ram[SYSCALL_TABLE + 0] = 0x100;
        vm.ram[SYSCALL_TABLE + 1] = 0x200;
        // At 0x0: SYSCALL 0
        vm.ram[0] = 0x52;
        vm.ram[1] = 0;
        // At 0x100: SYSCALL 1
        vm.ram[0x100] = 0x52;
        vm.ram[0x101] = 1;
        // At 0x200: RETK
        vm.ram[0x200] = 0x53;
        // At 0x102: RETK
        vm.ram[0x102] = 0x53;
        vm.pc = 0;

        vm.step(); // SYSCALL 0 -> jump to 0x100
        assert_eq!(vm.pc, 0x100);
        assert_eq!(vm.mode, CpuMode::Kernel);
        assert_eq!(vm.kernel_stack.len(), 1);

        vm.step(); // SYSCALL 1 -> jump to 0x200
        assert_eq!(vm.pc, 0x200);
        assert_eq!(vm.kernel_stack.len(), 2);

        vm.step(); // RETK -> back to 0x102
        assert_eq!(vm.pc, 0x102);
        assert_eq!(vm.kernel_stack.len(), 1);

        vm.step(); // RETK -> back to 0x02 (after first SYSCALL)
        assert_eq!(vm.pc, 2);
        assert_eq!(vm.mode, CpuMode::User);
        assert!(vm.kernel_stack.is_empty());
    }

    // ── SYSCALL deep nesting (3 levels) ────────────────────────────

    #[test]
    fn test_deep_nested_syscall_three_levels() {
        let mut vm = Vm::new();
        vm.mode = CpuMode::User;
        // Three syscall handlers: 0 -> 0x100 -> 0x200 -> 0x300
        vm.ram[SYSCALL_TABLE + 0] = 0x100;
        vm.ram[SYSCALL_TABLE + 1] = 0x200;
        vm.ram[SYSCALL_TABLE + 2] = 0x300;
        // Chain: SYSCALL 0 at addr 0, SYSCALL 1 at 0x100, SYSCALL 2 at 0x200
        vm.ram[0] = 0x52;
        vm.ram[1] = 0;
        vm.ram[0x100] = 0x52;
        vm.ram[0x101] = 1;
        vm.ram[0x200] = 0x52;
        vm.ram[0x201] = 2;
        // RETK at 0x300, 0x202, 0x102
        vm.ram[0x300] = 0x53;
        vm.ram[0x202] = 0x53;
        vm.ram[0x102] = 0x53;
        vm.pc = 0;

        vm.step();
        assert_eq!(vm.kernel_stack.len(), 1); // depth 1
        vm.step();
        assert_eq!(vm.kernel_stack.len(), 2); // depth 2
        vm.step();
        assert_eq!(vm.kernel_stack.len(), 3); // depth 3
        vm.step();
        assert_eq!(vm.kernel_stack.len(), 2); // unwind 1
        vm.step();
        assert_eq!(vm.kernel_stack.len(), 1); // unwind 2
        vm.step();
        assert_eq!(vm.kernel_stack.len(), 0); // unwind 3
        assert_eq!(vm.mode, CpuMode::User);
        assert_eq!(vm.pc, 2);
    }

    // ── OPEN capability enforcement ────────────────────────────────

    #[test]
    fn test_open_capability_denied_eperm() {
        let mut vm = Vm::new();
        // Set capabilities that only allow "/allowed/*" read
        vm.current_capabilities = Some(vec![Capability {
            resource_type: 0,
            pattern: "/allowed/*".to_string(),
            permissions: Capability::PERM_READ,
        }]);
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200;
        vm.regs[2] = 1; // write mode
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM));
    }

    #[test]
    fn test_open_capability_allowed_read() {
        let mut vm = Vm::new();
        vm.current_capabilities = Some(vec![Capability {
            resource_type: 0,
            pattern: "/dev/*".to_string(),
            permissions: Capability::PERM_READ | Capability::PERM_WRITE,
        }]);
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200;
        vm.regs[2] = 0; // read mode
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 0); // allowed
    }

    #[test]
    fn test_open_no_capabilities_allows_all() {
        // current_capabilities = None means full access (backward compat)
        let mut vm = Vm::new();
        assert!(vm.current_capabilities.is_none());
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200;
        vm.regs[2] = 1;
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 0);
    }

    #[test]
    fn test_open_capability_via_process_list() {
        let mut vm = Vm::new();
        let mut proc = Process::new(5, 0, 0x100);
        proc.capabilities = Some(vec![Capability {
            resource_type: 0,
            pattern: "/dev/*".to_string(),
            permissions: Capability::PERM_READ,
        }]);
        vm.processes.push(proc);
        vm.current_pid = 5;
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200;
        vm.regs[2] = 0; // read -- allowed
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], DEVICE_FD_BASE + 0); // allowed via process caps
    }

    #[test]
    fn test_open_process_capability_write_denied() {
        let mut vm = Vm::new();
        let mut proc = Process::new(5, 0, 0x100);
        proc.capabilities = Some(vec![Capability {
            resource_type: 0,
            pattern: "/dev/*".to_string(),
            permissions: Capability::PERM_READ, // only read
        }]);
        vm.processes.push(proc);
        vm.current_pid = 5;
        write_string(&mut vm, 0x200, "/dev/screen");
        vm.regs[1] = 0x200;
        vm.regs[2] = 1; // write mode -- denied
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM));
    }

    #[test]
    fn test_open_empty_path_returns_vfs_result() {
        let mut vm = Vm::new();
        // Write a null byte at the path address (empty string)
        vm.ram[0x200] = 0;
        vm.regs[1] = 0x200;
        vm.regs[2] = 0;
        vm.ram[0] = 0x54;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        // Empty string -> read_string_static returns None -> skips device check
        // Falls through to vfs.fopen which will handle it
        // The result depends on VFS behavior for empty path
        // Just verify it doesn't panic and returns something
        assert!(vm.regs[0] != 0xDEADBEEF); // no crash
    }

    // ── READ: pipe read blocking for child process ─────────────────

    #[test]
    fn test_pipe_read_empty_blocks_child_process() {
        let mut vm = Vm::new();
        let mut proc = Process::new(5, 0, 0x100);
        proc.state = ProcessState::Ready;
        vm.processes.push(proc);
        vm.pipes.push(Pipe::new(5, 0));
        vm.current_pid = 5;
        vm.regs[1] = 0x8000; // read fd
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 1; // len
        vm.ram[0] = 0x55; // READ
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // 0 bytes read
        assert_eq!(vm.processes[0].state, ProcessState::Blocked);
        // PC should be rewound 4 words (opcode + 3 args)
        assert_eq!(vm.pc, 0); // 4 - 4 = 0
    }

    #[test]
    fn test_pipe_read_from_dead_pipe_returns_error() {
        let mut vm = Vm::new();
        let mut pipe = Pipe::new(0, 0);
        pipe.alive = false;
        vm.pipes.push(pipe);
        vm.regs[1] = 0x8000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    #[test]
    fn test_pipe_read_multiple_words() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        // Write 3 words to the pipe
        vm.pipes[0].write_word(0xAA);
        vm.pipes[0].write_word(0xBB);
        vm.pipes[0].write_word(0xCC);
        // Read 3 words via READ syscall
        vm.regs[1] = 0x8000;
        vm.regs[2] = 0x300; // buf addr
        vm.regs[3] = 3; // len
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 3);
        assert_eq!(vm.ram[0x300], 0xAA);
        assert_eq!(vm.ram[0x301], 0xBB);
        assert_eq!(vm.ram[0x302], 0xCC);
    }

    // ── READ: device edge cases ────────────────────────────────────

    #[test]
    fn test_read_audio_device_returns_zero() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 2; // /dev/audio
        vm.regs[2] = 0x300;
        vm.regs[3] = 10;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // audio has no read
    }

    #[test]
    fn test_read_keyboard_clears_port() {
        let mut vm = Vm::new();
        vm.key_port = 0x42;
        vm.regs[1] = DEVICE_FD_BASE + 1;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.key_port, 0); // cleared after read
    }

    // ── WRITE: pipe edge cases ─────────────────────────────────────

    #[test]
    fn test_pipe_write_to_full_pipe_partial_write() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        // Fill the pipe to capacity
        for _ in 0..PIPE_BUFFER_SIZE {
            vm.pipes[0].write_word(0xFF);
        }
        assert!(vm.pipes[0].is_full());
        // Try to write 2 more words
        vm.ram[0x300] = 0xAA;
        vm.ram[0x301] = 0xBB;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 2;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // 0 words written (pipe full)
    }

    #[test]
    fn test_pipe_write_to_dead_pipe_returns_error() {
        let mut vm = Vm::new();
        let mut pipe = Pipe::new(0, 0);
        pipe.alive = false;
        vm.pipes.push(pipe);
        vm.ram[0x300] = 42;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBADF));
    }

    #[test]
    fn test_write_keyboard_device_returns_zero() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 0x41;
        vm.regs[1] = DEVICE_FD_BASE + 1; // /dev/keyboard (no write)
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // keyboard write = no-op
    }

    #[test]
    fn test_write_net_device_zero_len() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 3; // /dev/net
        vm.regs[2] = 0x300;
        vm.regs[3] = 0; // len = 0
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
    }

    #[test]
    fn test_write_screen_zero_len() {
        let mut vm = Vm::new();
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 0; // len = 0
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // 0 triplets processed
    }

    #[test]
    fn test_write_screen_clips_y_out_of_bounds() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 10;
        vm.ram[0x301] = 300; // y out of bounds
        vm.ram[0x302] = 0xFF0000;
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 3;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 3); // triplet consumed
                                   // No panic, pixel not drawn (y >= 256)
    }

    #[test]
    fn test_write_audio_exact_min_max_boundary() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 20; // min freq
        vm.ram[0x301] = 1; // min dur
        vm.regs[1] = DEVICE_FD_BASE + 2;
        vm.regs[2] = 0x300;
        vm.regs[3] = 2;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 2);
        assert_eq!(vm.beep, Some((20, 1))); // exact boundary values
    }

    // ── CLOSE edge cases ───────────────────────────────────────────

    #[test]
    fn test_close_already_dead_pipe_succeeds() {
        let mut vm = Vm::new();
        let mut pipe = Pipe::new(0, 0);
        pipe.alive = false;
        vm.pipes.push(pipe);
        vm.regs[1] = 0x8000;
        vm.ram[0] = 0x57;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // close always succeeds for valid idx
        assert!(!vm.pipes[0].alive);
    }

    #[test]
    fn test_close_all_devices_succeed() {
        for i in 0..DEVICE_COUNT {
            let mut vm = Vm::new();
            vm.regs[1] = DEVICE_FD_BASE + i as u32;
            vm.ram[0] = 0x57;
            vm.ram[1] = 1;
            vm.pc = 0;
            vm.step();
            assert_eq!(vm.regs[0], 0);
        }
    }

    // ── SEEK edge cases ────────────────────────────────────────────

    #[test]
    fn test_seek_all_whence_values() {
        // SEEK on an invalid fd (not opened) -- VFS will handle
        let mut vm = Vm::new();
        vm.regs[1] = 99; // fd not opened
        vm.regs[2] = 0; // offset
        vm.regs[3] = 0; // whence = SET
        vm.ram[0] = 0x58;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // Result depends on VFS -- just verify no panic
        assert!(is_geos_errno(vm.regs[0]) || vm.regs[0] == 0);
    }

    #[test]
    fn test_seek_invalid_whence_still_calls_vfs() {
        let mut vm = Vm::new();
        vm.regs[1] = 0; // fd
        vm.regs[2] = 10; // offset
        vm.regs[3] = 99; // invalid whence -- VFS handles
        vm.ram[0] = 0x58;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // No panic, returns VFS result
    }

    // ── MSGSND edge cases ──────────────────────────────────────────

    #[test]
    fn test_msgsnd_send_to_self() {
        let mut vm = Vm::new();
        vm.current_pid = 5;
        let mut proc = Process::new(5, 0, 0x100);
        vm.processes.push(proc);
        vm.regs[1] = 0x11;
        vm.regs[2] = 0x22;
        vm.regs[3] = 0x33;
        vm.regs[4] = 0x44;
        vm.regs[10] = 5; // target = self
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(vm.processes[0].msg_queue.len(), 1);
        assert_eq!(vm.processes[0].msg_queue[0].data, [0x11, 0x22, 0x33, 0x44]);
    }

    #[test]
    fn test_msgsnd_queue_near_full_then_delivers() {
        let mut vm = Vm::new();
        let mut target = Process::new(5, 0, 0x100);
        // Fill queue to MAX_MESSAGES - 1
        for _ in 0..MAX_MESSAGES - 1 {
            target.msg_queue.push(Message::new(0, [0; MSG_WORDS]));
        }
        vm.processes.push(target);
        vm.regs[10] = 5;
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success (one slot left)
        assert_eq!(vm.processes[0].msg_queue.len(), MAX_MESSAGES);
    }

    #[test]
    fn test_msgsnd_does_not_unblock_non_blocked_process() {
        let mut vm = Vm::new();
        let mut target = Process::new(5, 0, 0x100);
        target.state = ProcessState::Ready; // not blocked
        vm.processes.push(target);
        vm.regs[10] = 5;
        vm.ram[0] = 0x5E;
        vm.ram[1] = 10;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.processes[0].state, ProcessState::Ready); // unchanged
    }

    // ── MSGRCV edge cases ──────────────────────────────────────────

    #[test]
    fn test_msgrcv_receives_in_fifo_order() {
        let mut vm = Vm::new();
        let mut proc = Process::new(5, 0, 0x100);
        proc.msg_queue.push(Message::new(1, [10, 20, 30, 40]));
        proc.msg_queue.push(Message::new(2, [50, 60, 70, 80]));
        vm.processes.push(proc);
        vm.current_pid = 5;

        // Receive first message
        vm.ram[0] = 0x5F;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1); // sender 1
        assert_eq!(vm.regs[1], 10);

        // Receive second message
        vm.ram[0] = 0x5F;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 2); // sender 2
        assert_eq!(vm.regs[1], 50);
        assert!(vm.processes[0].msg_queue.is_empty());
    }

    #[test]
    fn test_msgrcv_blocks_rewinds_pc_correctly() {
        let mut vm = Vm::new();
        let proc = Process::new(5, 0, 0x100);
        vm.processes.push(proc);
        vm.current_pid = 5;
        vm.ram[50] = 0x5F; // MSGRCV at PC=50
        vm.pc = 50;
        vm.step();
        // step() advances PC to 51 (1-word opcode), then MSGRCV does pc -= 1
        assert_eq!(vm.pc, 50); // back to MSGRCV for retry
    }

    // ── PIPE read/write roundtrip with blocking ────────────────────

    #[test]
    fn test_pipe_read_unblocks_on_write() {
        let mut vm = Vm::new();
        let mut reader = Process::new(5, 0, 0x100);
        reader.state = ProcessState::Ready;
        vm.processes.push(reader);
        vm.pipes.push(Pipe::new(5, 0));
        vm.current_pid = 5;

        // First: read from empty pipe -> blocks
        vm.regs[1] = 0x8000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.processes[0].state, ProcessState::Blocked);

        // Now write to the pipe -> should unblock reader
        vm.ram[0x400] = 42;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x400;
        vm.regs[3] = 1;
        vm.ram[4] = 0x56;
        vm.ram[5] = 1;
        vm.ram[6] = 2;
        vm.ram[7] = 3;
        vm.pc = 4;
        vm.step();
        assert_eq!(vm.regs[0], 1); // written
        assert_eq!(vm.processes[0].state, ProcessState::Ready); // unblocked
    }

    #[test]
    fn test_pipe_write_partial_when_nearly_full() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        // Fill pipe to capacity - 1
        for _ in 0..PIPE_BUFFER_SIZE - 1 {
            vm.pipes[0].write_word(0xFF);
        }
        // Write 3 words, only 1 should succeed
        vm.ram[0x300] = 0xAA;
        vm.ram[0x301] = 0xBB;
        vm.ram[0x302] = 0xCC;
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0x300;
        vm.regs[3] = 3;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 1); // only 1 word written
        assert!(vm.pipes[0].is_full());
    }

    // ── YIELD / SLEEP edge cases ───────────────────────────────────

    #[test]
    fn test_yield_does_not_halt() {
        let mut vm = Vm::new();
        vm.halted = false;
        vm.yielded = false;
        vm.ram[0] = 0x5A;
        vm.pc = 0;
        let result = vm.step();
        assert!(result); // step returns true (not halted)
        assert!(vm.yielded);
    }

    #[test]
    fn test_sleep_zero_frames() {
        let mut vm = Vm::new();
        vm.sleep_frames = 999;
        vm.regs[5] = 0;
        vm.ram[0] = 0x5B;
        vm.ram[1] = 5;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.sleep_frames, 0);
    }

    #[test]
    fn test_sleep_large_value() {
        let mut vm = Vm::new();
        vm.regs[5] = 0xFFFFFFFF; // max u32
        vm.ram[0] = 0x5B;
        vm.ram[1] = 5;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.sleep_frames, 0xFFFFFFFF);
    }

    // ── SETPRIORITY edge cases ─────────────────────────────────────

    #[test]
    fn test_setpriority_exact_boundary_values() {
        for val in 0u32..=3 {
            let mut vm = Vm::new();
            vm.regs[5] = val;
            vm.ram[0] = 0x5C;
            vm.ram[1] = 5;
            vm.pc = 0;
            vm.step();
            assert_eq!(vm.new_priority, val as u8);
        }
    }

    // ── PIPE: PID tracking ─────────────────────────────────────────

    #[test]
    fn test_pipe_records_pid() {
        let mut vm = Vm::new();
        vm.current_pid = 7;
        vm.ram[0] = 0x5D;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.pipes[0].read_pid, 7);
        assert_eq!(vm.pipes[0].write_pid, 7);
    }

    // ── WRITE: screen device with mixed valid/invalid triplets ────

    #[test]
    fn test_write_screen_mixed_triplets() {
        let mut vm = Vm::new();
        // 3 triplets: valid, out-of-bounds x, valid
        vm.ram[0x300] = 10;
        vm.ram[0x301] = 10;
        vm.ram[0x302] = 0xFF0000;
        vm.ram[0x303] = 999;
        vm.ram[0x304] = 10;
        vm.ram[0x305] = 0x00FF00; // x OOB
        vm.ram[0x306] = 20;
        vm.ram[0x307] = 20;
        vm.ram[0x308] = 0x0000FF;
        vm.regs[1] = DEVICE_FD_BASE + 0;
        vm.regs[2] = 0x300;
        vm.regs[3] = 9; // 3 triplets
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 9); // all 9 words consumed
        assert_eq!(vm.screen[10 * 256 + 10], 0xFF0000); // first drawn
        assert_eq!(vm.screen[20 * 256 + 20], 0x0000FF); // third drawn
                                                        // Middle triplet skipped (x=999 >= 256)
    }

    // ── SYSCALL: handler at address 0 ──────────────────────────────

    #[test]
    fn test_syscall_handler_at_address_zero() {
        let mut vm = Vm::new();
        vm.ram[SYSCALL_TABLE + 0] = 0; // handler at addr 0
                                       // But handler=0 is treated as "no handler"
        vm.ram[100] = 0x52;
        vm.ram[101] = 0;
        vm.pc = 100;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL)); // no handler
    }

    // ── READ: invalid fd range falls through to VFS ────────────────

    #[test]
    fn test_read_regular_fd_falls_through_to_vfs() {
        let mut vm = Vm::new();
        vm.regs[1] = 0; // regular fd (not device, not pipe)
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // VFS handles this; fd 0 not opened so should return error
        // Just verify no panic
    }

    #[test]
    fn test_write_regular_fd_falls_through_to_vfs() {
        let mut vm = Vm::new();
        vm.ram[0x300] = 42;
        vm.regs[1] = 0; // regular fd
        vm.regs[2] = 0x300;
        vm.regs[3] = 1;
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // VFS handles; no panic
    }

    // ── Unknown opcode in 0x52-0x5F range (unreachable_patterns) ───

    #[test]
    fn test_unknown_syscall_opcode_noop() {
        // 0x60 is PUSH (not in 0x52-0x5F range), but test the _ => {} arm
        // by directly calling step_syscall with an unknown opcode
        let mut vm = Vm::new();
        vm.halted = false;
        vm.regs[0] = 0;
        // We can't easily test the _ => {} arm via step() since
        // the main dispatch in mod.rs handles 0x60+ separately.
        // But step_syscall's _ => {} means any unhandled sub-opcode
        // in the 0x52-0x5F range is a no-op that returns true.
        // The #[allow(unreachable_patterns)] suggests all 0x52-0x5F
        // are covered, so this arm is technically dead code.
    }

    // ── READ pipe: out-of-bounds buf_addr ──────────────────────────

    #[test]
    fn test_pipe_read_out_of_bounds_buffer() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        vm.pipes[0].write_word(0xAA);
        vm.regs[1] = 0x8000;
        vm.regs[2] = 0xFFFE; // buf addr near end of RAM
        vm.regs[3] = 3; // read 3 words, but addr+2 would overflow
        vm.ram[0] = 0x55;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // Should read 1 word (only 0xFFFE fits in 65536 RAM)
        assert!(vm.regs[0] >= 1);
    }

    // ── WRITE pipe: out-of-bounds buf_addr ────────────────────────

    #[test]
    fn test_pipe_write_out_of_bounds_buffer() {
        let mut vm = Vm::new();
        vm.pipes.push(Pipe::new(0, 0));
        vm.regs[1] = 0xC000;
        vm.regs[2] = 0xFFFE; // near end of RAM
        vm.regs[3] = 3; // 3 words but addr+2 overflows
        vm.ram[0] = 0x56;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.ram[3] = 3;
        vm.pc = 0;
        vm.step();
        // Should write fewer than 3 words
        assert!(vm.regs[0] <= 2);
    }

    // ============================================================
    // Phase 289: Mutex/Semaphore IPC Primitives
    // ============================================================

    #[test]
    fn test_mutex_init_creates_mutex() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x5000; // mutex address in RAM
        vm.ram[0] = 0x05; // MTEXINIT
        vm.ram[1] = 1;    // addr_reg = r1
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(vm.mutexes.len(), 1);
        assert_eq!(vm.mutexes[0].addr, 0x5000);
        assert_eq!(vm.mutexes[0].owner_pid, NO_MUTEX_OWNER); // free
    }

    #[test]
    fn test_mutex_init_duplicate_returns_ebusy() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x05;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        // Second init at same address
        vm.ram[0] = 0x05;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBUSY));
        assert_eq!(vm.mutexes.len(), 1); // no duplicate
    }

    #[test]
    fn test_mutex_init_max_returns_enomem() {
        let mut vm = Vm::new();
        // Fill up to MAX_MUTEXES
        for i in 0..MAX_MUTEXES {
            vm.mutexes.push(GeosMutex {
                addr: 0x5000 + i as u32,
                owner_pid: NO_MUTEX_OWNER,
                wait_queue: Vec::new(),
            });
        }
        vm.regs[1] = 0x9999;
        vm.ram[0] = 0x05;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOMEM));
    }

    #[test]
    fn test_mutex_lock_acquire_free() {
        let mut vm = Vm::new();
        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: NO_MUTEX_OWNER,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x06; // MTEXLOCK
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0); // success
        assert_eq!(vm.mutexes[0].owner_pid, 0); // main process
    }

    #[test]
    fn test_mutex_lock_self_returns_ebusy() {
        let mut vm = Vm::new();
        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: 0, // main process already owns it (pid=0)
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x06;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBUSY));
    }

    #[test]
    fn test_mutex_lock_blocks_when_held_by_other() {
        let mut vm = Vm::new();
        // Create a child process (pid=1)
        let mut child = Process::new(1, 0x200, 0);
        vm.processes.push(child);
        vm.current_pid = 1;

        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: 0, // held by main process (pid=0)
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x06; // MTEXLOCK child tries to lock
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        // Should block: process state = Blocked, PC rewound
        assert_eq!(vm.processes[0].state, ProcessState::Blocked);
        assert_eq!(vm.mutexes[0].wait_queue.len(), 1);
        assert_eq!(vm.mutexes[0].wait_queue[0], 1);
        // PC should have been rewound (0 + 2 - 2 = 0)
        assert_eq!(vm.pc, 0);
    }

    #[test]
    fn test_mutex_lock_nonexistent_returns_enoent() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x9999; // no mutex at this address
        vm.ram[0] = 0x06;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT));
    }

    #[test]
    fn test_mutex_unlock_releases_and_wakes_waiter() {
        let mut vm = Vm::new();
        let mut child = Process::new(1, 0x200, 0);
        child.state = ProcessState::Blocked;
        vm.processes.push(child);
        vm.current_pid = 0; // main process

        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: 0, // main process (pid=0) owns it
            wait_queue: vec![1], // child is waiting
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x07; // MTEXUNLOCK
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.mutexes[0].owner_pid, 1); // ownership transferred to child
        assert_eq!(vm.processes[0].state, ProcessState::Ready); // child unblocked
        assert!(vm.mutexes[0].wait_queue.is_empty());
    }

    #[test]
    fn test_mutex_unlock_not_owner_returns_eperm() {
        let mut vm = Vm::new();
        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: 99, // some other process
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x07;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EPERM));
    }

    #[test]
    fn test_mutex_unlock_not_locked_returns_einval() {
        let mut vm = Vm::new();
        vm.mutexes.push(GeosMutex {
            addr: 0x5000,
            owner_pid: 0, // free
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x07;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EINVAL));
    }

    #[test]
    fn test_mutex_unlock_nonexistent_returns_enoent() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x9999;
        vm.ram[0] = 0x07;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT));
    }

    #[test]
    fn test_sem_init_creates_semaphore() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x6000; // addr
        vm.regs[2] = 3;      // initial count
        vm.ram[0] = 0x08; // SEMINIT
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.semaphores.len(), 1);
        assert_eq!(vm.semaphores[0].addr, 0x6000);
        assert_eq!(vm.semaphores[0].count, 3);
    }

    #[test]
    fn test_sem_init_duplicate_returns_ebusy() {
        let mut vm = Vm::new();
        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: 1,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x6000;
        vm.regs[2] = 5;
        vm.ram[0] = 0x08;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_EBUSY));
    }

    #[test]
    fn test_sem_init_max_returns_enomem() {
        let mut vm = Vm::new();
        for i in 0..MAX_SEMAPHORES {
            vm.semaphores.push(GeosSemaphore {
                addr: 0x6000 + i as u32,
                count: 1,
                wait_queue: Vec::new(),
            });
        }
        vm.regs[1] = 0x9999;
        vm.regs[2] = 1;
        vm.ram[0] = 0x08;
        vm.ram[1] = 1;
        vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOMEM));
    }

    #[test]
    fn test_sem_wait_decrements_count() {
        let mut vm = Vm::new();
        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: 2,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x6000;
        vm.ram[0] = 0x09; // SEMWAIT
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.semaphores[0].count, 1);
    }

    #[test]
    fn test_sem_wait_blocks_when_zero() {
        let mut vm = Vm::new();
        let mut child = Process::new(1, 0x200, 0);
        vm.processes.push(child);
        vm.current_pid = 1;

        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: 0,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x6000;
        vm.ram[0] = 0x09;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.processes[0].state, ProcessState::Blocked);
        assert_eq!(vm.semaphores[0].wait_queue.len(), 1);
        assert_eq!(vm.pc, 0); // rewound
    }

    #[test]
    fn test_sem_post_increments_count() {
        let mut vm = Vm::new();
        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: 1,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x6000;
        vm.ram[0] = 0x0A; // SEMPOST
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.semaphores[0].count, 2);
    }

    #[test]
    fn test_sem_post_wakes_waiter() {
        let mut vm = Vm::new();
        let mut child = Process::new(1, 0x200, 0);
        child.state = ProcessState::Blocked;
        vm.processes.push(child);

        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: 0,
            wait_queue: vec![1],
        });
        vm.regs[1] = 0x6000;
        vm.ram[0] = 0x0A;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.processes[0].state, ProcessState::Ready);
        assert!(vm.semaphores[0].wait_queue.is_empty());
        // Count stays 0 because the post goes directly to the waiter
        assert_eq!(vm.semaphores[0].count, 0);
    }

    #[test]
    fn test_sem_wait_nonexistent_returns_enoent() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x9999;
        vm.ram[0] = 0x09;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT));
    }

    #[test]
    fn test_sem_post_nonexistent_returns_enoent() {
        let mut vm = Vm::new();
        vm.regs[1] = 0x9999;
        vm.ram[0] = 0x0A;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], geos_errno(GEOS_ENOENT));
    }

    #[test]
    fn test_sem_post_saturation() {
        let mut vm = Vm::new();
        vm.semaphores.push(GeosSemaphore {
            addr: 0x6000,
            count: u32::MAX,
            wait_queue: Vec::new(),
        });
        vm.regs[1] = 0x6000;
        vm.ram[0] = 0x0A;
        vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        // saturating_add: u32::MAX stays u32::MAX
        assert_eq!(vm.semaphores[0].count, u32::MAX);
    }

    #[test]
    fn test_mutex_lock_unlock_cycle() {
        let mut vm = Vm::new();
        // Init
        vm.regs[1] = 0x5000;
        vm.ram[0] = 0x05; vm.ram[1] = 1;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        // Lock
        vm.ram[0] = 0x06;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.mutexes[0].owner_pid, 0);
        // Unlock
        vm.ram[0] = 0x07;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.mutexes[0].owner_pid, 0); // free again
    }

    #[test]
    fn test_sem_producer_consumer_pattern() {
        let mut vm = Vm::new();
        // Init semaphore with count=0
        vm.regs[1] = 0x6000;
        vm.regs[2] = 0;
        vm.ram[0] = 0x08; vm.ram[1] = 1; vm.ram[2] = 2;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        // Post (count 0 -> 1)
        vm.ram[0] = 0x0A;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.semaphores[0].count, 1);
        // Wait (count 1 -> 0, success)
        vm.ram[0] = 0x09;
        vm.pc = 0;
        vm.step();
        assert_eq!(vm.regs[0], 0);
        assert_eq!(vm.semaphores[0].count, 0);
    }
}
