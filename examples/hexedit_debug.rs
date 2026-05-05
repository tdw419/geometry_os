// Minimal debug: boot hexedit and check PC progression
use geometry_os::riscv::bridge::UartBridge;
use geometry_os::riscv::RiscvVm;

fn main() {
    let elf_path = "examples/riscv-hello/hexedit.elf";
    let elf_data = std::fs::read(elf_path).expect("read elf");

    let mut vm = RiscvVm::new(1024 * 1024);
    let mut bridge = UartBridge::new();

    let boot = vm.boot_guest(&elf_data, 1, 500_000).expect("boot");
    eprintln!("After boot: pc=0x{:08X}, steps={}", vm.cpu.pc, boot.instructions);

    // Check if any pixels were written
    let nz = vm.bus.framebuf.pixels.iter().filter(|&&p| p != 0).count();
    eprintln!("FB non-zero: {}/{}", nz, vm.bus.framebuf.pixels.len());

    // Sample pixels
    for &(x, y) in &[(5, 5), (128, 128), (0, 0)] {
        let px = vm.bus.framebuf.pixels[y * 256 + x];
        eprintln!("  pixel({},{}) = 0x{:08X}", x, y, px);
    }

    // Step a few more times and check PC
    use geometry_os::riscv::cpu::StepResult;
    for i in 0..100 {
        let r = vm.step();
        if i < 5 || i > 95 {
            eprintln!("  step {}: pc=0x{:08X} result={:?}", i, vm.cpu.pc, r);
        }
    }

    // Check pixels again
    let px2 = vm.bus.framebuf.pixels[5 * 256 + 5];
    eprintln!("After 100 more steps: pixel(5,5) = 0x{:08X}", px2);

    // Read a few bytes of memory at 0x80000000 to verify code is loaded
    for i in 0..4 {
        let w = vm.bus.read_word(0x80000000 + i as u64 * 4).unwrap_or(0);
        let addr = 0x8000_0000u64 + (i as u64) * 4;
        eprintln!("  RAM[0x{:08X}] = 0x{:08X}", addr as u32, w);
    }
}
