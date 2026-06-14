#[cfg(test)]
mod tests {
    use crate::vm::types::*;
    use crate::vm::Vm;
    use pyo3::prelude::*;

    #[test]
    fn test_eval_python_expression() {
        let mut vm = Vm::new();
        let script = "2 + 2\0";
        let script_addr = 0x2000;
        let result_addr = 0x3000;

        // Write script to RAM
        for (i, b) in script.as_bytes().iter().enumerate() {
            vm.ram[script_addr + i] = *b as u32;
        }

        vm.regs[1] = script_addr as u32;
        vm.regs[2] = result_addr as u32;
        vm.pc = 0x1000;
        vm.ram[0x1000] = 0xF7; // EVAL
        vm.ram[0x1001] = 1; // sar = r1
        vm.ram[0x1002] = 2; // rbr = r2

        vm.step();

        assert_eq!(vm.regs[0], 0); // success

        // Read result
        let mut result = String::new();
        let mut addr = result_addr;
        while vm.ram[addr] != 0 {
            result.push((vm.ram[addr] as u8) as char);
            addr += 1;
        }

        assert_eq!(result, "4");
    }

    #[test]
    fn test_eval_python_error() {
        let mut mut_vm = Vm::new();
        let script = "1 / 0\0";
        let script_addr = 0x2000;
        let result_addr = 0x3000;

        for (i, b) in script.as_bytes().iter().enumerate() {
            mut_vm.ram[script_addr + i] = *b as u32;
        }

        mut_vm.regs[1] = script_addr as u32;
        mut_vm.regs[2] = result_addr as u32;
        mut_vm.pc = 0x1000;
        mut_vm.ram[0x1000] = 0xF7;
        mut_vm.ram[0x1001] = 1;
        mut_vm.ram[0x1002] = 2;

        mut_vm.step();

        assert_ne!(mut_vm.regs[0], 0); // error

        let mut result = String::new();
        let mut addr = result_addr;
        while mut_vm.ram[addr] != 0 {
            result.push((mut_vm.ram[addr] as u8) as char);
            addr += 1;
        }

        assert!(result.contains("ZeroDivisionError"));
    }
}
