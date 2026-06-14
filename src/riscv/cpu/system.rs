// riscv/cpu/system.rs -- System instruction execution
//
// Handles ECALL, EBREAK, FENCE, NOP, MRET, SRET, SFENCE.VMA,
// CSR operations (CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI),
// and Invalid (illegal instruction trap).

use super::super::bus::Bus;
use super::super::csr;
use super::super::decode::Operation;
use super::super::linux;
use super::super::mmu;
use super::{Privilege, RiscvCpu, StepResult};

impl RiscvCpu {
    /// Execute a system instruction.
    pub(super) fn execute_system(
        &mut self,
        op: Operation,
        bus: &mut Bus,
        next_pc: u32,
    ) -> StepResult {
        match op {
            Operation::Ecall => {
                self.ecall_count += 1;
                let cause = match self.privilege {
                    Privilege::User => csr::CAUSE_ECALL_U,
                    Privilege::Supervisor => csr::CAUSE_ECALL_S,
                    Privilege::Machine => csr::CAUSE_ECALL_M,
                };

                // Phase 41: Intercept User-mode ECALL as Linux syscall.
                // Only intercept if medeleg does NOT delegate ECALL_U to S-mode.
                // When medeleg[8] is set, the trap must go to stvec per RISC-V spec.
                let medeleg_ecall_u = (self.csr.medeleg >> 8) & 1 == 1;
                if self.privilege == Privilege::User && !medeleg_ecall_u {
                    let nr = self.x[17];
                    let name = super::super::syscall::syscall_name(nr);
                    eprintln!("[linux-user] ECALL_U: medeleg[8]=0 (not delegated), treating as Linux syscall {} ({}) at PC={:08X}", 
                        nr, name, self.pc);
                    eprintln!("[linux-user] Syscall: {} ({}) args=[{:08X}, {:08X}, {:08X}, {:08X}, {:08X}, {:08X}]", 
                        name, nr, self.x[10], self.x[11], self.x[12], self.x[13], self.x[14], self.x[15]);

                    // Try pixel-native spatial implementation first
                    if bus.pixel_native_enabled {
                        if let Some(result) = crate::riscv::pixel_native::dispatch_syscall_pixel_native(self, bus, nr) {
                            self.x[10] = result;
                            self.pc = next_pc;
                            return StepResult::Ok;
                        }
                    }
                    let event = super::super::syscall::SyscallEvent {
                        nr,
                        name,
                        args: [
                            self.x[10], self.x[11], self.x[12], self.x[13], self.x[14], self.x[15],
                        ],
                        ret: None,
                        pc: self.pc,
                    };
                    let idx = bus.syscall_log.len();
                    bus.syscall_log.push(event);
                    bus.pending_syscall_idx = Some(idx);

                    let sa0 = self.x[10];
                    let sa1 = self.x[11];
                    let sa2 = self.x[12];
                    let sa3 = self.x[13];
                    let sa4 = self.x[14];
                    let sa5 = self.x[15];

                    let handled = match nr {
                        // ---- File I/O ----
                        56 => {
                            // openat(dirfd, pathname, flags, mode)
                            let ret = linux::sys_openat(
                                sa0 as i32, sa1 as u64, sa2 as i32, sa3 as u32, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        57 => {
                            // close(fd) -- try socket first, then linux file fd
                            let sock_ret = bus.guest_sockets.sys_close(sa0 as i32);
                            if sock_ret == 0 {
                                self.x[10] = 0;
                                true
                            } else {
                                let ret = linux::sys_close_flush(sa0 as i32, bus);
                                self.x[10] = ret as u32;
                                true
                            }
                        },
                        62 => {
                            // lseek(fd, offset, whence)
                            let ret = linux::sys_lseek(sa0 as i32, sa1 as i64, sa2 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        63 => {
                            // read(fd, buf, count)
                            let ret = linux::sys_read(sa0 as i32, sa1 as u64, sa2 as usize, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        61 => {
                            // getdents64(fd, dirp, count)
                            let ret =
                                linux::sys_getdents64(sa0 as i32, sa1 as u64, sa2 as usize, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        17 => {
                            // getcwd(buf, size)
                            let ret = linux::sys_getcwd(sa0 as u64, sa1 as usize, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        64 => {
                            // write(fd, buf, count)
                            let ret = linux::sys_write(sa0 as i32, sa1 as u64, sa2 as usize, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        65 => {
                            // readv(fd, iov, iovcnt)
                            let ret = linux::sys_readv(sa0 as i32, sa1 as u64, sa2 as u32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        66 => {
                            // writev(fd, iov, iovcnt)
                            let ret = linux::sys_writev(sa0 as i32, sa1 as u64, sa2 as u32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        67 => {
                            // pread64(fd, buf, count, offset)
                            let ret = linux::sys_pread64(
                                sa0 as i32,
                                sa1 as u64,
                                sa2 as usize,
                                sa3 as u64,
                                bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        48 => {
                            // faccessat(dirfd, pathname, mode, flags)
                            let ret = linux::sys_faccessat(
                                sa0 as i32, sa1 as u64, sa2 as i32, sa3 as i32, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        78 => {
                            // readlinkat(dirfd, pathname, buf, bufsiz)
                            let ret = linux::sys_readlinkat(
                                sa0 as i32,
                                sa1 as u64,
                                sa2 as u64,
                                sa3 as usize,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        79 => {
                            // fstatat(dirfd, pathname, statbuf, flags)
                            let ret = linux::sys_fstatat(
                                sa0 as i32, sa1 as u64, sa2 as u64, sa3 as i32, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        44 => {
                            // fstat(fd, statbuf)
                            let ret = linux::sys_fstat(sa0 as i32, sa1 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        25 => {
                            // fcntl(fd, cmd, arg)
                            let ret = linux::sys_fcntl(sa0 as i32, sa1 as i32, sa2);
                            self.x[10] = ret as u32;
                            true
                        },
                        80 => {
                            // fstat(fd, statbuf) -- RISC-V __NR_fstat = 80
                            let ret = linux::sys_fstat(sa0 as i32, sa1 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        114 => {
                            // clock_getres(clockid, res)
                            let ret = linux::sys_clock_getres(sa0 as i32, sa1 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        144 => {
                            // setgid(gid)
                            let ret = linux::sys_setgid(sa0 as i32);
                            self.x[10] = ret as u32;
                            true
                        },
                        146 => {
                            // setuid(uid)
                            let ret = linux::sys_setuid(sa0 as i32);
                            self.x[10] = ret as u32;
                            true
                        },
                        199 => {
                            // socketpair(domain, type, protocol, sv) -- no networking
                            self.x[10] = (-97i32) as u32; // -EAFNOSUPPORT
                            true
                        },

                        // ---- Process info ----
                        // 160: uname(buf)
                        160 => {
                            let ret = linux::sys_uname(sa0 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        // 163: getrlimit(resource, rlim)
                        163 => {
                            // Stub: return success with large limits
                            self.x[10] = 0;
                            true
                        },
                        // 164: setrlimit(resource, rlim)
                        164 => {
                            // Stub: always succeed
                            self.x[10] = 0;
                            true
                        },
                        // 166: umask(mask)
                        166 => {
                            self.x[10] = 0o022; // return old mask
                            true
                        },
                        // 169: gettimeofday(tv, tz)
                        169 => {
                            // Stub: return 0
                            self.x[10] = 0;
                            true
                        },
                        // 172: getpid()
                        172 => {
                            self.x[10] = linux::sys_getpid() as u32;
                            true
                        },
                        // 173: getppid()
                        173 => {
                            self.x[10] = linux::sys_getppid() as u32;
                            true
                        },
                        // 174: getuid()
                        174 => {
                            self.x[10] = linux::sys_getuid() as u32;
                            true
                        },
                        // 175: geteuid()
                        175 => {
                            self.x[10] = linux::sys_geteuid() as u32;
                            true
                        },
                        // 176: getgid()
                        176 => {
                            self.x[10] = linux::sys_getgid() as u32;
                            true
                        },
                        // 177: getegid()
                        177 => {
                            self.x[10] = linux::sys_getegid() as u32;
                            true
                        },
                        // 178: gettid()
                        178 => {
                            self.x[10] = linux::sys_gettid() as u32;
                            true
                        },
                        // 179: sysinfo(info)
                        179 => {
                            let ret = linux::sys_sysinfo(sa0 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        96 => {
                            // set_tid_address(tidptr)
                            self.x[10] = linux::sys_set_tid_address(sa0 as u64) as u32;
                            true
                        },

                        // ---- Lifecycle ----
                        93 => {
                            // exit(code)
                            linux::sys_exit(sa0 as i32, bus);
                            true
                        },
                        94 => {
                            // exit_group(code) -- same as exit for unithreaded
                            linux::sys_exit(sa0 as i32, bus);
                            true
                        },
                        95 => {
                            // waitid(idtype, id, info, options)
                            let ret =
                                linux::sys_waitid(sa0 as i32, sa1 as i32, sa2 as u64, sa3 as i32);
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Memory ----
                        214 => {
                            // brk(addr)
                            let ret = linux::sys_brk(sa0 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        222 => {
                            // mmap(addr, length, prot, flags, fd, offset)
                            let ret = linux::sys_mmap(
                                sa0 as u64, sa1 as u64, sa2 as i32, sa3 as i32, sa4 as i32,
                                sa5 as u64, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        215 => {
                            // munmap(addr, length)
                            let ret = linux::sys_munmap(sa0 as u64, sa1 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        // 226: mprotect(addr, len, prot)
                        226 => {
                            let ret = linux::sys_mprotect(sa0 as u64, sa1 as u64, sa2 as i32);
                            self.x[10] = ret as u32;
                            true
                        },
                        // 233: madvise(addr, length, advice)
                        233 => {
                            // Stub: always succeed
                            self.x[10] = 0;
                            true
                        },

                        // ---- Time ----
                        113 => {
                            // clock_gettime(clockid, tp)
                            let ret = linux::sys_clock_gettime(sa0 as i32, sa1 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        115 => {
                            // clock_nanosleep(clockid, flags, req, rem)
                            let ret = linux::sys_clock_nanosleep(
                                sa0 as i32, sa1 as i32, sa2 as u64, sa3 as u64,
                            );
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Signals (stubs) ----
                        134 => {
                            // rt_sigaction(signum, act, oldact, sigsetsize)
                            let ret = linux::sys_rt_sigaction(
                                sa0 as i32, sa1 as u64, sa2 as u64, sa3 as u32,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        135 => {
                            // rt_sigprocmask(how, set, oldset, sigsetsize)
                            let ret = linux::sys_rt_sigprocmask(
                                sa0 as i32, sa1 as u64, sa2 as u64, sa3 as u32,
                            );
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Misc ----
                        278 => {
                            // getrandom(buf, count, flags)
                            let ret =
                                linux::sys_getrandom(sa0 as u64, sa1 as usize, sa2 as u32, bus);
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Busybox support ----
                        23 => {
                            // dup(oldfd)
                            let ret = linux::sys_dup(sa0 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        24 => {
                            // dup2(oldfd, newfd)
                            let ret = linux::sys_dup2(sa0 as i32, sa1 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        29 => {
                            // ioctl(fd, cmd, arg)
                            let ret = linux::sys_ioctl(sa0 as i32, sa1, sa2);
                            self.x[10] = ret as u32;
                            true
                        },
                        183 => {
                            // mq_timedreceive(mqdes, msg_ptr, msg_len, msg_prio, abs_timeout)
                            // Stub: return success (0) as we don't support message queues yet.
                            self.x[10] = 0;
                            true
                        },
                        49 => {
                            // chdir(path)
                            let ret = linux::sys_chdir(sa0 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        59 => {
                            // pipe2(fds, flags)
                            let ret = linux::sys_pipe2(sa0 as u64, sa1 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        73 => {
                            // poll(fds, nfds, timeout)
                            let ret = linux::sys_poll(sa0 as u64, sa1, sa2 as i32);
                            self.x[10] = ret as u32;
                            true
                        },
                        101 => {
                            // nanosleep(req, rem)
                            let ret = linux::sys_nanosleep(sa0 as u64, sa1 as u64);
                            self.x[10] = ret as u32;
                            true
                        },
                        124 => {
                            // sched_yield()
                            let ret = linux::sys_sched_yield();
                            self.x[10] = ret as u32;
                            true
                        },
                        98 => {
                            // futex(uaddr, op, val, timeout, uaddr2, val3)
                            let ret = linux::sys_futex(
                                sa0 as u64, sa1 as i32, sa2, sa3 as u64, sa4 as u64, sa5,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        220 => {
                            // clone(flags, stack, ptid, ctid, tls)
                            // Note: NR_clone is 220 in asm-generic
                            let ret = linux::sys_clone(
                                sa0, sa1 as u64, sa2 as u64, sa3 as u64, sa4 as u64,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        260 => {
                            // wait4(pid, status, options, rusage)
                            let ret =
                                linux::sys_wait4(sa0 as i32, sa1 as u64, sa2 as i32, sa3 as u64);
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Networking (socket syscalls) ----
                        // Syscall numbers from asm-generic/unistd.h:
                        // 198=socket, 200=bind, 203=connect, 206=sendto,
                        // 207=recvfrom, 210=shutdown
                        198 => {
                            // socket(domain, type, protocol) -> fd
                            let ret = bus.guest_sockets.sys_socket(sa0, sa1, sa2);
                            self.x[10] = ret as u32;
                            true
                        },
                        203 => {
                            // connect(fd, addr_ptr, addr_len)
                            let ret = bus.intercept_connect(sa0 as i32, sa1, sa2);
                            self.x[10] = ret as u32;
                            true
                        },
                        206 => {
                            // sendto(fd, buf_ptr, len, flags, addr_ptr, addr_len)
                            let ret = bus.intercept_sendto(sa0 as i32, sa1, sa2, sa3, sa4, sa5);
                            self.x[10] = ret as u32;
                            true
                        },
                        207 => {
                            // recvfrom(fd, buf_ptr, len, flags, addr_ptr, addr_len_ptr)
                            let ret = bus.intercept_recvfrom(sa0 as i32, sa1, sa2, sa3);
                            self.x[10] = ret as u32;
                            true
                        },
                        210 => {
                            // shutdown(fd, how)
                            let ret = bus.guest_sockets.sys_shutdown(sa0 as i32, sa1);
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Filesystem: unlinkat, mkdirat, renameat ----
                        35 => {
                            // unlinkat(dirfd, pathname, flags)
                            let ret = linux::sys_unlinkat(sa0 as i32, sa1 as u64, sa2 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        39 => {
                            // mkdirat(dirfd, pathname, mode)
                            let ret = linux::sys_mkdirat(sa0 as i32, sa1 as u64, sa2 as u32, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        38 => {
                            // renameat(olddirfd, oldpath, newdirfd, newpath)
                            let ret = linux::sys_renameat(
                                sa0 as i32, sa1 as u64, sa2 as i32, sa3 as u64, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },

                        // ---- Process/signal stubs ----
                        129 => {
                            // kill(pid, sig)
                            let ret = linux::sys_kill(sa0 as i32, sa1 as i32);
                            self.x[10] = ret as u32;
                            true
                        },
                        132 => {
                            // sigaltstack(ss, old_ss)
                            let ret = linux::sys_sigaltstack(sa0 as u64, sa1 as u64);
                            self.x[10] = ret as u32;
                            true
                        },
                        221 => {
                            // execve(pathname, argv, envp)
                            let ret = linux::sys_execve(sa0 as u64, sa1 as u64, sa2 as u64, bus);
                            self.x[10] = ret as u32;
                            true
                        },
                        261 => {
                            // prlimit64(pid, resource, new_limit, old_limit)
                            let ret = linux::sys_prlimit64(
                                sa0 as i32, sa1 as i32, sa2 as u64, sa3 as u64, bus,
                            );
                            self.x[10] = ret as u32;
                            true
                        },
                        279 => {
                            // memfd_create(name, flags)
                            let ret = linux::sys_memfd_create(sa0 as u64, sa1 as i32, bus);
                            self.x[10] = ret as u32;
                            true
                        },

                        // Unimplemented user-mode syscall: return -ENOSYS
                        _ => {
                            let nr = self.x[17];
                            eprintln!(
                                "[linux-user] Unhandled syscall {} ({}) at PC={:08X}, returning -ENOSYS",
                                nr, crate::riscv::syscall::syscall_name(nr), self.pc
                            );
                            self.x[10] = (-38i32) as u32; // -ENOSYS
                            true
                        },
                    };

                    if handled {
                        self.pc = next_pc;
                        return StepResult::Ok;
                    }
                }

                // SBI interception: when an ECALL from S-mode or M-mode would
                // trap, check if it's an SBI call (a7 = SBI extension ID).
                if self.privilege == Privilege::Supervisor || self.privilege == Privilege::Machine {
                    let a7 = self.x[17];
                    let a6 = self.x[16];
                    let a0 = self.x[10];
                    let a1 = self.x[11];
                    let a2 = self.x[12];
                    let a3 = self.x[13];
                    let a4 = self.x[14];
                    let a5 = self.x[15];

                    let sbi_result = bus.sbi.handle_ecall(
                        a7,
                        a6,
                        a0,
                        a1,
                        a2,
                        a3,
                        a4,
                        a5,
                        &mut bus.uart,
                        &mut bus.clint,
                        &mut bus.mem,
                        &mut bus.virtio_blk,
                    );

                    // Debug: log ECALLs to file
                    let result_str = if sbi_result.is_some() {
                        "handled"
                    } else {
                        "trap"
                    };
                    {
                        let msg = format!(
                            "[sbi-debug] ECALL #{} at PC=0x{:08X} eid=0x{:08X} fid=0x{:X} a0=0x{:X} -> {}\n",
                            self.ecall_count, self.pc, a7, a6, a0, result_str
                        );
                        if let Ok(mut f) = std::fs::OpenOptions::new()
                            .create(true)
                            .append(true)
                            .open("/tmp/geos_trap_debug.log")
                        {
                            use std::io::Write;
                            let _ = f.write_all(msg.as_bytes());
                        }
                    }

                    if let Some((ret_a0, ret_a1)) = sbi_result {
                        self.x[10] = ret_a0;
                        self.x[11] = ret_a1;

                        // Handle DBCN pending write: read from guest memory
                        if let Some((mut phys_addr, num_bytes)) = bus.sbi.dbcn_pending_write.take()
                        {
                            // If address is in kernel virtual range, translate to physical.
                            // On RV32 Linux: PA = VA - PAGE_OFFSET + ram_base
                            // PAGE_OFFSET = 0xC0000000, ram_base = 0x80000000 (standard)
                            if phys_addr >= 0xC000_0000 {
                                phys_addr = phys_addr - 0xC000_0000 + bus.mem.ram_base;
                            }
                            for i in 0..num_bytes {
                                if let Ok(b) = bus.read_byte(phys_addr + i as u64) {
                                    if b != 0 {
                                        eprintln!("[dbcn] byte: 0x{:02X} ('{}')", b, b as char);
                                        bus.sbi.console_output.push(b);
                                    }
                                }
                            }
                        }

                        // Phase 244: Handle NET pending send/recv
                        if let Some(op) = bus.sbi.net_pending.take() {
                            use std::io::{Read, Write};
                            let sid = op.socket_id as usize;
                            // Take socket out to avoid double-borrow on bus
                            let socket = bus.sbi.net_sockets[sid].take();
                            if let Some(mut stream) = socket {
                                match op.kind {
                                    super::super::sbi::NetOpKind::Send => {
                                        // Read from guest memory, send over TCP
                                        let mut buf = vec![0u8; op.len];
                                        for i in 0..op.len {
                                            if let Ok(b) = bus.read_byte(op.buf_addr + i as u64) {
                                                buf[i] = b;
                                            }
                                        }
                                        let result = match stream.write_all(&buf) {
                                            Ok(()) => op.len as u32,
                                            Err(_) => super::super::sbi::SBI_ERR_FAILURE as u32,
                                        };
                                        bus.sbi.net_sockets[sid] = Some(stream);
                                        self.x[10] = result;
                                    },
                                    super::super::sbi::NetOpKind::Recv => {
                                        // Recv from TCP, write to guest memory
                                        let mut buf = vec![0u8; op.len.min(4096)];
                                        let result = match stream.read(&mut buf) {
                                            Ok(n) => {
                                                for i in 0..n {
                                                    let _ = bus
                                                        .write_byte(op.buf_addr + i as u64, buf[i]);
                                                }
                                                n as u32
                                            },
                                            Err(_) => super::super::sbi::SBI_ERR_FAILURE as u32,
                                        };
                                        bus.sbi.net_sockets[sid] = Some(stream);
                                        self.x[10] = result;
                                    },
                                }
                            } else {
                                self.x[10] = super::super::sbi::SBI_ERR_INVALID_PARAM as u32;
                            }
                        }

                        // Phase 256: Handle SHM pending write (guest -> shm)
                        if let Some((shm_id, offset, src_addr, len)) =
                            bus.sbi.shm_pending_write.take()
                        {
                            // Find region index first to avoid borrow conflicts
                            let region_idx =
                                bus.sbi.shm_regions.iter().position(|r| r.id == shm_id);
                            if let Some(idx) = region_idx {
                                let region_size = bus.sbi.shm_regions[idx].data.len();
                                let offset = offset as usize;
                                // Read from guest memory into a temporary buffer
                                let mut buf =
                                    vec![0u8; len.min(region_size.saturating_sub(offset))];
                                for i in 0..buf.len() {
                                    if let Ok(b) = bus.read_byte(src_addr + i as u64) {
                                        buf[i] = b;
                                    }
                                }
                                // Now write into the region
                                for (i, &b) in buf.iter().enumerate() {
                                    bus.sbi.shm_regions[idx].data[offset + i] = b;
                                }
                            }
                        }

                        // Phase 256: Handle SHM pending read (shm -> guest)
                        if let Some((shm_id, offset, dst_addr, len)) =
                            bus.sbi.shm_pending_read.take()
                        {
                            let region_idx =
                                bus.sbi.shm_regions.iter().position(|r| r.id == shm_id);
                            if let Some(idx) = region_idx {
                                let region_size = bus.sbi.shm_regions[idx].data.len();
                                let offset = offset as usize;
                                let copy_len = len.min(region_size.saturating_sub(offset));
                                // Copy from region into a temporary buffer
                                let buf: Vec<u8> = bus.sbi.shm_regions[idx].data
                                    [offset..offset + copy_len]
                                    .to_vec();
                                // Write to guest memory
                                for (i, &b) in buf.iter().enumerate() {
                                    let _ = bus.write_byte(dst_addr + i as u64, b);
                                }
                            }
                        }

                        // GEO_VFS_READ pending request handling.
                        // DEPRECATED: The ecall now returns NOT_SUPPORTED, so this
                        // branch is dead code. Retained for safety during transition.
                        #[allow(deprecated)]
                        if let Some(req) = bus.sbi.geo_vfs_read_pending.take() {
                            #[allow(deprecated)]
                            let result_bytes = self.fulfill_geo_vfs_read(bus, &req);
                            // Overwrite a0 with the result (bytes read or error)
                            self.x[10] = result_bytes;
                        }

                        self.pc = next_pc;

                        if bus.sbi.shutdown_requested {
                            return StepResult::Shutdown;
                        }
                        if bus.sbi.yield_requested {
                            bus.sbi.yield_requested = false;
                            return StepResult::Yielded;
                        }
                        return StepResult::Ok;
                    }
                }

                // Not an SBI call -- deliver as a normal trap.
                if self.privilege == Privilege::User && cause == csr::CAUSE_ECALL_U {
                    let syscall_num = self.x[17];
                    // Special case: exit syscall (93 Linux, 99 xv6) should halt
                    if syscall_num == 93 || syscall_num == 99 {
                        let exit_status = self.x[10];
                        eprintln!("[hypervisor] Process exited with status {}", exit_status);
                        self.pc = next_pc;
                        return StepResult::Shutdown;
                    }
                    if bus.pixel_native_enabled {
                        if let Some(result) = crate::riscv::pixel_native::dispatch_syscall_pixel_native(self, bus, syscall_num) {
                            self.x[10] = result;
                            self.pc = next_pc;
                            return StepResult::Ok;
                        }
                    }
                    eprintln!(
                        "[xv6-syscall-trace] ECALL_U delegated to S-mode: syscall_num={}, a0=0x{:08X}, a1=0x{:08X}, a2=0x{:08X}, a3=0x{:08X}, a4=0x{:08X}, a5=0x{:08X}, PC=0x{:08X}",
                        self.x[17], self.x[10], self.x[11], self.x[12], self.x[13], self.x[14], self.x[15], self.pc
                    );
                }
                let trap_priv = self.csr.trap_target_priv(cause, self.privilege);
                let vector = self.csr.trap_vector(trap_priv);
                // Log S→M traps to diagnose boot failures (append to file since stderr may be lost)
                if self.privilege == Privilege::Supervisor && trap_priv == Privilege::Machine {
                    let mtval = self.csr.read(csr::MTVAL);
                    let msg = format!(
                        "[trap-debug] S->M trap: cause=0x{:08X} PC=0x{:08X} mtval=0x{:08X} vec=0x{:08X}\n",
                        cause, self.pc, mtval, vector
                    );
                    if let Ok(mut f) = std::fs::OpenOptions::new()
                        .create(true)
                        .append(true)
                        .open("/tmp/geos_trap_debug.log")
                    {
                        use std::io::Write;
                        let _ = f.write_all(msg.as_bytes());
                    }
                }
                self.csr
                    .trap_enter(trap_priv, self.privilege, self.pc, cause);
                self.privilege = trap_priv;
                self.pc = vector;
                StepResult::Ok
            },
            Operation::Ebreak => {
                if self.privilege == Privilege::Supervisor {
                    let cause = csr::CAUSE_BREAKPOINT;
                    let trap_priv = self.csr.trap_target_priv(cause, self.privilege);
                    let vector = self.csr.trap_vector(trap_priv);
                    eprintln!(
                        "[trap-debug] EBREAK at PC=0x{:08X} -> trap to 0x{:08X} (priv={:?})",
                        self.pc, vector, trap_priv
                    );
                    self.csr
                        .trap_enter(trap_priv, self.privilege, self.pc, cause);
                    self.privilege = trap_priv;
                    self.pc = vector;
                    StepResult::Ok
                } else {
                    eprintln!(
                        "[trap-debug] EBREAK at PC=0x{:08X} in M-mode -> halt",
                        self.pc
                    );
                    self.pc = next_pc;
                    StepResult::Ebreak
                }
            },
            Operation::Fence => {
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Nop => {
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Mret => {
                let restored = self.csr.trap_return(Privilege::Machine);
                // Debug tracing suppressed — floods stderr in normal use
                self.pc = self.csr.mepc;
                self.privilege = restored;
                StepResult::Ok
            },
            Operation::Sret => {
                let restored = self.csr.trap_return(Privilege::Supervisor);
                // Debug tracing suppressed — floods stderr (700+ lines per command)
                self.pc = self.csr.sepc;
                self.privilege = restored;

                // Phase 41: capture syscall return value.
                if restored == Privilege::User {
                    eprintln!(
                        "[xv6-syscall-trace] SRET to U-mode: a0=0x{:08X} (syscall ret value), PC=0x{:08X}",
                        self.x[10], self.pc
                    );
                    if let Some(idx) = bus.pending_syscall_idx.take() {
                        if let Some(event) = bus.syscall_log.get_mut(idx) {
                            event.ret = Some(self.x[10]);
                        }
                    }
                }

                StepResult::Ok
            },
            Operation::SfenceVma { rs1, rs2 } => {
                if rs1 == 0 && rs2 == 0 {
                    self.tlb.flush_all();
                } else if rs1 == 0 {
                    let asid = self.get_reg(rs2) as u32;
                    self.tlb.flush_asid(asid);
                } else if rs2 == 0 {
                    let vpn = mmu::va_to_vpn(self.get_reg(rs1));
                    self.tlb.flush_va(vpn, 0); // flush by VPN across all ASIDs
                } else {
                    let vpn = mmu::va_to_vpn(self.get_reg(rs1));
                    let asid = self.get_reg(rs2) as u32;
                    self.tlb.flush_va_asid(vpn, asid);
                }
                self.pc = next_pc;
                StepResult::Ok
            },

            // ---- CSR ----
            // Note: TIME/TIMEH CSRs (0xC01/0xC81) are intercepted here because
            // they map to CLINT mtime hardware, not to the CSR bank. The csr.read()
            // function has no access to the bus/CLINT, so we handle them here.
            Operation::Csrrw { rd, rs1, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let new_val = self.get_reg(rs1);
                self.write_csr(csr, new_val, bus);
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Csrrs { rd, rs1, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = self.get_reg(rs1);
                if mask != 0 {
                    self.write_csr(csr, old | mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Csrrc { rd, rs1, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = self.get_reg(rs1);
                if mask != 0 {
                    self.write_csr(csr, old & !mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Csrrwi { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                self.write_csr(csr, uimm as u32, bus);
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Csrrsi { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = uimm as u32;
                if mask != 0 {
                    self.write_csr(csr, old | mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },
            Operation::Csrrci { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = uimm as u32;
                if mask != 0 {
                    self.write_csr(csr, old & !mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            },

            // ---- Invalid / Illegal instruction ----
            Operation::Invalid(_) => {
                self.deliver_trap(csr::CAUSE_ILLEGAL_INSTRUCTION, self.pc);
                StepResult::Ok
            },

            _ => unreachable!("execute_system called with non-system op"),
        }
    }

    /// Fulfill a pending GEO_VFS_READ request from the SBI layer.
    ///
    /// DEPRECATED: GEO_VFS_READ is replaced by the Pixel VFS Surface at 0x7000_0000.
    /// This function is dead code -- the ecall returns NOT_SUPPORTED.
    /// Retained for reference during transition period.
    #[allow(deprecated)]
    #[deprecated(note = "Use Pixel VFS Surface")]
    pub(super) fn fulfill_geo_vfs_read(
        &self,
        bus: &mut Bus,
        req: &super::super::sbi::GeoVfsReadReq,
    ) -> u32 {
        use super::super::sbi::{SBI_ERR_FAILURE, SBI_ERR_INVALID_PARAM};

        // Read filename from guest memory
        let name_len = req.name_len as usize;
        if name_len == 0 || name_len > 256 {
            return SBI_ERR_INVALID_PARAM as u32;
        }
        let mut name_bytes = vec![0u8; name_len];
        for i in 0..name_len {
            match bus.read_byte(req.name_addr + i as u64) {
                Ok(b) => name_bytes[i] = b,
                Err(_) => return SBI_ERR_FAILURE as u32,
            }
        }
        let name = match std::str::from_utf8(&name_bytes) {
            Ok(s) => s,
            Err(_) => return SBI_ERR_INVALID_PARAM as u32,
        };

        // Look up file in host VFS
        let data = match crate::vfs::read_file_by_name(name) {
            Some(d) => d,
            None => return SBI_ERR_FAILURE as u32,
        };

        // Copy up to buf_len bytes into guest memory
        let copy_len = (data.len() as u32).min(req.buf_len) as usize;
        for i in 0..copy_len {
            if bus.write_byte(req.buf_addr + i as u64, data[i]).is_err() {
                return i as u32; // partial write
            }
        }
        copy_len as u32
    }
}
