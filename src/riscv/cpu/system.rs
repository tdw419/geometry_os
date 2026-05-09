// riscv/cpu/system.rs -- System instruction execution
//
// Handles ECALL, EBREAK, FENCE, NOP, MRET, SRET, SFENCE.VMA,
// CSR operations (CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI),
// and Invalid (illegal instruction trap).

use super::super::bus::Bus;
use super::super::csr;
use super::super::decode::Operation;
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
                if self.privilege == Privilege::User {
                    let nr = self.x[17];
                    let name = super::super::syscall::syscall_name(nr);
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

                    // Phase 201: Intercept socket syscalls for bare-metal guests.
                    // Linux syscall numbers: 196=socket, 201=connect, 204=sendto,
                    // 205=recvfrom, 208=shutdown, 57=close.
                    // Handle simple syscalls (no bus access needed in closure) inline.
                    // Complex syscalls (connect/sendto with read_word closure) are
                    // handled via separate methods that take &mut Bus.
                    let sa0 = self.x[10];
                    let sa1 = self.x[11];
                    let sa2 = self.x[12];
                    let sa3 = self.x[13];
                    let sa4 = self.x[14];
                    let sa5 = self.x[15];

                    let handled = match nr {
                        196 => {
                            // socket(domain, type, protocol) -> fd
                            let ret = bus.guest_sockets.sys_socket(sa0, sa1, sa2);
                            self.x[10] = ret as u32;
                            true
                        }
                        201 => {
                            // connect(fd, addr_ptr, addr_len) -> 0 or -errno
                            let ret = bus.intercept_connect(sa0 as i32, sa1, sa2);
                            self.x[10] = ret as u32;
                            true
                        }
                        204 => {
                            // sendto(fd, buf_ptr, len, flags, addr_ptr, addr_len)
                            let ret = bus.intercept_sendto(sa0 as i32, sa1, sa2, sa3, sa4, sa5);
                            self.x[10] = ret as u32;
                            true
                        }
                        205 => {
                            // recvfrom(fd, buf_ptr, len, flags, addr_ptr, addr_len_ptr)
                            let ret = bus.intercept_recvfrom(sa0 as i32, sa1, sa2, sa3);
                            self.x[10] = ret as u32;
                            true
                        }
                        208 => {
                            // shutdown(fd, how) -> 0 or -errno
                            let ret = bus.guest_sockets.sys_shutdown(sa0 as i32, sa1);
                            self.x[10] = ret as u32;
                            true
                        }
                        57 => {
                            // close(fd) -- only intercept if fd is a socket
                            let ret = bus.guest_sockets.sys_close(sa0 as i32);
                            if ret == 0 {
                                self.x[10] = 0;
                                true
                            } else {
                                false // not a socket fd, let caller handle
                            }
                        }
                        _ => false,
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
                    );

                    // Debug: log ECALLs (skip TIMER to avoid spam)
                    if self.ecall_count < 100 && a7 != 0x54494D45 && a7 != 0 {
                        eprintln!(
                            "[sbi] ECALL #{} at PC=0x{:08X} a7=0x{:08X} a6=0x{:X} a0=0x{:X} -> {}",
                            self.ecall_count, self.pc, a7, a6, a0,
                            if sbi_result.is_some() { "handled" } else { "trap" }
                        );
                    }

                    if let Some((ret_a0, ret_a1)) = sbi_result {
                        self.x[10] = ret_a0;
                        self.x[11] = ret_a1;

                        // Handle DBCN pending write: read from guest memory
                        if let Some((phys_addr, num_bytes)) = bus.sbi.dbcn_pending_write.take() {
                            for i in 0..num_bytes {
                                if let Ok(b) = bus.read_byte(phys_addr + i as u64) {
                                    if b != 0 {
                                        bus.uart.write_byte(0, b);
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
                                    }
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
                                            }
                                            Err(_) => super::super::sbi::SBI_ERR_FAILURE as u32,
                                        };
                                        bus.sbi.net_sockets[sid] = Some(stream);
                                        self.x[10] = result;
                                    }
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
                let trap_priv = self.csr.trap_target_priv(cause, self.privilege);
                let vector = self.csr.trap_vector(trap_priv);
                self.csr
                    .trap_enter(trap_priv, self.privilege, self.pc, cause);
                self.privilege = trap_priv;
                self.pc = vector;
                StepResult::Ok
            }
            Operation::Ebreak => {
                self.pc = next_pc;
                StepResult::Ebreak
            }
            Operation::Fence => {
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Nop => {
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Mret => {
                let restored = self.csr.trap_return(Privilege::Machine);
                self.pc = self.csr.mepc;
                self.privilege = restored;
                StepResult::Ok
            }
            Operation::Sret => {
                let restored = self.csr.trap_return(Privilege::Supervisor);
                self.pc = self.csr.sepc;
                self.privilege = restored;

                // Phase 41: capture syscall return value.
                if restored == Privilege::User {
                    if let Some(idx) = bus.pending_syscall_idx.take() {
                        if let Some(event) = bus.syscall_log.get_mut(idx) {
                            event.ret = Some(self.x[10]);
                        }
                    }
                }

                StepResult::Ok
            }
            Operation::SfenceVma { rs1, rs2 } => {
                if rs1 == 0 && rs2 == 0 {
                    self.tlb.flush_all();
                } else if rs1 == 0 {
                    let asid = self.get_reg(rs2) as u16;
                    self.tlb.flush_asid(asid);
                } else if rs2 == 0 {
                    let vpn = mmu::va_to_vpn(self.get_reg(rs1));
                    self.tlb.flush_va(vpn);
                } else {
                    let vpn = mmu::va_to_vpn(self.get_reg(rs1));
                    let asid = self.get_reg(rs2) as u16;
                    self.tlb.flush_va_asid(vpn, asid);
                }
                self.pc = next_pc;
                StepResult::Ok
            }

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
            }
            Operation::Csrrs { rd, rs1, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = self.get_reg(rs1);
                if mask != 0 {
                    self.write_csr(csr, old | mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Csrrc { rd, rs1, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = self.get_reg(rs1);
                if mask != 0 {
                    self.write_csr(csr, old & !mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Csrrwi { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                self.write_csr(csr, uimm as u32, bus);
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Csrrsi { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = uimm as u32;
                if mask != 0 {
                    self.write_csr(csr, old | mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            }
            Operation::Csrrci { rd, uimm, csr } => {
                let old = self.read_csr_with_time(csr, bus);
                let mask = uimm as u32;
                if mask != 0 {
                    self.write_csr(csr, old & !mask, bus);
                }
                self.set_reg(rd, old);
                self.pc = next_pc;
                StepResult::Ok
            }

            // ---- Invalid / Illegal instruction ----
            Operation::Invalid(_) => {
                self.deliver_trap(csr::CAUSE_ILLEGAL_INSTRUCTION, self.pc);
                StepResult::Ok
            }

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
