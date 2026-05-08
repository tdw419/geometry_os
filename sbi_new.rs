    /// Process an SBI call (ECALL in Machine or Supervisor mode).
    ///
    /// This is a convenience wrapper that extracts arguments from the VM registers.
    pub fn handle_ecall(&mut self, vm: &mut super::RiscvVm) -> Option<(u32, u32)> {
        let a7 = vm.cpu.x[17];
        let a6 = vm.cpu.x[16];
        let a0 = vm.cpu.x[10];
        let a1 = vm.cpu.x[11];
        let a2 = vm.cpu.x[12];
        let a3 = vm.cpu.x[13];
        let a4 = vm.cpu.x[14];
        let a5 = vm.cpu.x[15];
        
        self.handle_extension_call(
            a7, a6, a0, a1, a2, a3, a4, a5,
            &mut vm.bus.uart,
            &mut vm.bus.clint,
        )
    }

    /// Process an SBI extension call.
    #[allow(clippy::too_many_arguments)]
    pub fn handle_extension_call(
        &mut self,
        a7: u32,
        a6: u32,
        a0: u32,
        a1: u32,
        a2: u32,
        a3: u32,
        _a4: u32,
        _a5: u32,
        uart: &mut Uart,
        clint: &mut super::clint::Clint,
    ) -> Option<(u32, u32)> {
        // Log ECALL arguments for debugging (before they're modified)
        if a7 != SBI_SET_TIMER {
            eprintln!("[sbi] call a7=0x{:08X} a6=0x{:X} a0=0x{:X} a1=0x{:X}", a7, a6, a0, a1);
        }
        self.ecall_log.push((a7, a6, a0));
        match a7 {
