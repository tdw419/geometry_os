// ollama_linux_boot.rs -- Use Ollama LLM to diagnose Linux boot failures on GeOS RISC-V VM.
//
// Strategy:
//   1. Boot the Linux kernel in the RISC-V VM for N instructions
//   2. Capture: SBI ecall log, register state, PC trace, page table activity, fault info
//   3. Feed diagnostics to a local Ollama model
//   4. Ask it to identify what's failing and suggest fixes
//   5. Optionally iterate with more targeted diagnostics
//
// Usage:
//   cargo run --bin ollama_linux_boot
//   MODEL=qwen2.5-coder:14b cargo run --bin ollama_linux_boot
//   INSTRUCTIONS=100_000_000 cargo run --bin ollama_linux_boot

use geometry_os::riscv::RiscvVm;
use std::collections::HashMap;
use std::env;
use std::fs;
use std::io::{self, Write};

// ── Ollama client ──────────────────────────────────────────────────────────

fn ollama_chat(
    model: &str,
    system: &str,
    prompt: &str,
) -> Result<String, Box<dyn std::error::Error>> {
    let system_json = serde_json::to_string(system)?;
    let prompt_json = serde_json::to_string(prompt)?;

    let body = format!(
        r#"{{"model":"{}","system":{},"prompt":{},"stream":false}}"#,
        model, system_json, prompt_json
    );

    let mut child = std::process::Command::new("curl")
        .args([
            "-s",
            "-X",
            "POST",
            "http://localhost:11434/api/generate",
            "-H",
            "Content-Type: application/json",
            "-d",
            &body,
            "--max-time",
            "300",
        ])
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::null())
        .spawn()?;

    let output = child.wait_with_output()?;
    let resp: serde_json::Value = serde_json::from_slice(&output.stdout)?;

    Ok(resp["response"]
        .as_str()
        .unwrap_or("(no response)")
        .to_string())
}

// ── VM boot + diagnostics ──────────────────────────────────────────────────

struct BootDiagnostics {
    instructions: u64,
    final_pc: u32,
    final_priv: String,
    sbi_ecalls: Vec<(u32, u32, u32)>, // (a7, a6, a0)
    console_output: String,
    uart_output: String,
    registers: [u32; 32],
    pc_histogram: Vec<(u32, u64)>, // (pc_region, count) -- top 30 most-executed 4K regions
    last_100_pcs: Vec<(u64, u32)>, // (count, pc) for last 100 S-mode PCs
    fault_count: u64,
    sbi_shutdown: bool,
    kernel_entry: u32,
    dtb_addr: u64,
    timer_interrupts: u64, // count of MIP.MTIP transitions
    clint_mtime_final: u64,
    clint_mtimecmp_final: u64,
}

fn boot_and_diagnose(max_instructions: u64) -> Result<BootDiagnostics, Box<dyn std::error::Error>> {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = fs::read(kernel_path)?;
    let initrd_data = fs::read("initrd.cpio").ok();

    eprintln!("[ollama-boot] Kernel: {} bytes", kernel_data.len());
    if let Some(ref ir) = initrd_data {
        eprintln!("[ollama-boot] Initrd: {} bytes", ir.len());
    }
    eprintln!("[ollama-boot] Max instructions: {}", max_instructions);

    let bootargs = "earlycon=sbi keep_bootcon rdinit=/init nosmp loglevel=8";

    let (mut vm, result) = RiscvVm::boot_linux(
        &kernel_data,
        initrd_data.as_deref(),
        768,
        max_instructions,
        bootargs,
    )?;

    let final_priv = format!("{:?}", vm.cpu.privilege);
    let console_output = String::from_utf8_lossy(&vm.bus.sbi.console_output).to_string();
    let uart_output = String::from_utf8_lossy(&vm.bus.uart.tx_buf).to_string();

    // We don't have the PC trace from boot_linux (it runs in its own loop),
    // but we CAN sample the final state extensively
    // For PC histogram, we'd need to modify boot_linux -- instead, let's do a
    // quick single-step sample of the last 500 instructions to see what's executing
    let mut last_100_pcs = Vec::new();
    let mut sample_count = 0u64;
    let sample_limit = 500u64;
    let mut pc_hist: HashMap<u32, u64> = HashMap::new(); // 4K-aligned PC -> count

    eprintln!(
        "[ollama-boot] Sampling {} instructions from final state...",
        sample_limit
    );
    while sample_count < sample_limit {
        if vm.bus.sbi.shutdown_requested {
            break;
        }
        // Tick timer
        if sample_count % 1000 == 0 {
            vm.bus.tick_clint_n(100_000);
            vm.bus.sync_mip(&mut vm.cpu.csr.mip);
        }
        let _ = vm.step();
        let pc = vm.cpu.pc;
        let region = pc & !0xFFF; // 4K page
        *pc_hist.entry(region).or_insert(0) += 1;
        last_100_pcs.push((sample_count, pc));
        if last_100_pcs.len() > 100 {
            last_100_pcs.remove(0);
        }
        sample_count += 1;
    }

    // Sort histogram by count descending, take top 30
    let mut pc_histogram: Vec<(u32, u64)> = pc_hist.into_iter().collect();
    pc_histogram.sort_by(|a, b| b.1.cmp(&a.1));
    pc_histogram.truncate(30);

    Ok(BootDiagnostics {
        instructions: result.instructions,
        final_pc: vm.cpu.pc,
        final_priv,
        sbi_ecalls: vm.bus.sbi.ecall_log.clone(),
        console_output,
        uart_output,
        registers: vm.cpu.x,
        pc_histogram,
        last_100_pcs,
        fault_count: 0,
        sbi_shutdown: vm.bus.sbi.shutdown_requested,
        kernel_entry: result.entry,
        dtb_addr: result.dtb_addr,
        timer_interrupts: 0,
        clint_mtime_final: vm.bus.clint.mtime,
        clint_mtimecmp_final: vm.bus.clint.mtimecmp,
    })
}

// ── Build prompt for Ollama ────────────────────────────────────────────────

fn build_diagnostic_prompt(diag: &BootDiagnostics) -> String {
    let mut s = String::with_capacity(8192);

    s.push_str("## GeOS RISC-V Linux Boot Failure Diagnostic\n\n");
    s.push_str("I'm trying to boot Linux 6.14 (riscv32) on a custom RISC-V VM emulator (GeOS).\n");
    s.push_str("The VM implements:\n");
    s.push_str("- RV32IMA instruction set (no FPU)\n");
    s.push_str("- Sv32 MMU with preliminary page table\n");
    s.push_str(
        "- SBI v2.0 firmware emulation (base, timer, IPI, RFENCE, HSM, SRST, DBCN extensions)\n",
    );
    s.push_str("- CLINT timer (mtime/mtimecmp) -- ticks 100K every 1000 instructions\n");
    s.push_str("- UART (ns16550a) at 0x10000000\n");
    s.push_str("- Device tree blob (DTB) generation\n");
    s.push_str("- Kernel boot at VA 0xC0000000 (PA 0x80000000)\n");
    s.push_str("- EFI stub kernel (MZ header at entry, jumps to _start_kernel)\n");
    s.push_str("- nosmp (single hart)\n");
    s.push_str("- 768MB RAM (covers vmalloc identity mapping at PA 0xA0000000)\n\n");

    s.push_str("## CURRENT STATUS\n\n");
    s.push_str("The kernel boots past bootconsole disable and enters the main init sequence.\n");
    s.push_str("It reaches \"bootconsole [sbi0] disabled\" and continues in Supervisor mode.\n");
    s.push_str(
        "Console output stops there because the kernel switches from SBI DBCN to UART MMIO.\n",
    );
    s.push_str("With keep_bootcon, SBI console should stay alive alongside UART.\n\n");
    s.push_str(
        "The PC histogram shows timekeeping_advance, rbtree operations, mutex, setitimer, cpu_resume --\n",
    );
    s.push_str("this is the normal idle loop. The kernel is ALIVE and scheduling.\n\n");
    s.push_str("REMAINING QUESTIONS:\n");
    s.push_str(
        "1. Does kernel_init (PID 1) actually run? What does it print after bootconsole disable?\n",
    );
    s.push_str("2. Is the initrd being found and mounted? Does /init execute?\n");
    s.push_str(
        "3. Are there any kernel panics or oops that we can't see because console switched?\n",
    );
    s.push_str(
        "4. What is the SATP value 0xFFC81485 corruption about? ASID bits are being trashed.\n\n",
    );

    // Boot results
    s.push_str("## Boot Results\n");
    s.push_str(&format!("- Instructions executed: {}\n", diag.instructions));
    s.push_str(&format!("- Final PC: 0x{:08X}\n", diag.final_pc));
    s.push_str(&format!("- Final privilege: {}\n", diag.final_priv));
    s.push_str(&format!("- Kernel entry: 0x{:08X}\n", diag.kernel_entry));
    s.push_str(&format!("- DTB address: 0x{:08X}\n", diag.dtb_addr));
    s.push_str(&format!(
        "- SBI shutdown requested: {}\n",
        diag.sbi_shutdown
    ));
    s.push_str(&format!("- CLINT mtime: {}\n", diag.clint_mtime_final));
    s.push_str(&format!(
        "- CLINT mtimecmp: {}\n",
        diag.clint_mtimecmp_final
    ));

    // PC histogram
    if !diag.pc_histogram.is_empty() {
        s.push_str("\n## PC Histogram (top 30 4K pages by execution count in post-boot sample)\n");
        s.push_str("These show WHERE the CPU is spending its time in the idle loop:\n\n");
        for (page, count) in &diag.pc_histogram {
            s.push_str(&format!("  0x{:08X}: {} samples\n", page, count));
        }
    }

    // Last 100 PCs
    if !diag.last_100_pcs.is_empty() {
        s.push_str("\n## Last 100 Sampled PCs (execution trace)\n");
        for (i, (count, pc)) in diag.last_100_pcs.iter().enumerate() {
            if i % 10 == 0 {
                s.push('\n');
            }
            s.push_str(&format!("  [{:3}] @{:4} 0x{:08X}", i, count, pc));
        }
        s.push('\n');
    }

    // SBI ecall log
    s.push_str("\n## SBI Ecall Log\n");
    s.push_str(&format!("Total ecalls: {}\n", diag.sbi_ecalls.len()));

    // Show last 100 ecalls (the early ones are just probes)
    let start = if diag.sbi_ecalls.len() > 100 {
        diag.sbi_ecalls.len() - 100
    } else {
        0
    };
    let show_all = diag.sbi_ecalls.len() <= 200;
    let sstart = if show_all { 0 } else { start };

    if !show_all {
        s.push_str(&format!(
            "(showing last 100 of {} total)\n",
            diag.sbi_ecalls.len()
        ));
    }

    for (i, (a7, a6, a0)) in diag.sbi_ecalls.iter().enumerate() {
        if i < sstart {
            continue;
        }
        let ext_name = match a7 {
            0x10 => "SBI_BASE",
            0x54494D45 => "SBI_TIME",
            0x735049 => "SBI_IPI",
            0x52464E43 => "SBI_RFENCE",
            0x53525354 => "SBI_SRST",
            0x4442434E => "SBI_DBCN",
            0x48534D => "SBI_HSM",
            1 => "LEGACY_PUTCHAR",
            0x00 => "LEGACY_CONSOLE_PUTCHAR",
            _ => "UNKNOWN",
        };
        let func_name = match (*a7, *a6) {
            (0x10, 0) => "GET_SPEC_VERSION",
            (0x10, 1) => "GET_IMPL_ID",
            (0x10, 2) => "GET_IMPL_VERSION",
            (0x10, 3) => "PROBE_EXTENSION",
            (0x10, 4) => "GET_MVENDORID",
            (0x10, 5) => "GET_MARCHID",
            (0x10, 6) => "GET_MIMPID",
            (0x54494D45, 0) => "SET_TIMER",
            (0x54494D45, 1) => "STIMECMP_SET",
            (0x735049, 0) => "SEND_IPI",
            (0x52464E43, 0) => "REMOTE_FENCE_I",
            (0x52464E43, 1) => "REMOTE_SFENCE_VMA",
            (0x52464E43, 2) => "REMOTE_SFENCE_VMA_ASID",
            (0x52464E43, 3) => "REMOTE_HFENCE_GVMA",
            (0x52464E43, 4) => "REMOTE_HFENCE_GVMA_VMID",
            (0x52464E43, 5) => "REMOTE_HFENCE_VVMA",
            (0x52464E43, 6) => "REMOTE_HFENCE_VVMA_ASID",
            (0x4442434E, 0) => "DBCN_WRITE",
            (0x4442434E, 1) => "DBCN_READ",
            (0x4442434E, 2) => "DBCN_WRITE_BYTE",
            (0x53525354, 0) => "SRST_RESET",
            (0x48534D, 0) => "HSM_HART_START",
            (0x48534D, 1) => "HSM_HART_STOP",
            (0x48534D, 2) => "HSM_HART_STATUS",
            _ => "",
        };
        // Only show non-base-extension ecalls or first 20 total
        if i < 20 || *a7 != 0x10 {
            s.push_str(&format!(
                "  [{}] a7=0x{:08X}({}) a6=0x{:08X}({}) a0=0x{:08X}\n",
                i, a7, ext_name, a6, func_name, a0
            ));
        }
    }

    // Count ecall types
    let mut ecall_counts: HashMap<String, u64> = HashMap::new();
    for (a7, _a6, _a0) in &diag.sbi_ecalls {
        let name = match a7 {
            0x10 => "BASE",
            0x54494D45 => "TIME",
            0x735049 => "IPI",
            0x52464E43 => "RFENCE",
            0x53525354 => "SRST",
            0x4442434E => "DBCN",
            0x48534D => "HSM",
            1 => "PUTCHAR",
            _ => "OTHER",
        };
        *ecall_counts.entry(name.to_string()).or_insert(0) += 1;
    }
    s.push_str("\nEcall summary by extension:\n");
    let mut sorted: Vec<_> = ecall_counts.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1));
    for (name, count) in sorted {
        s.push_str(&format!("  {}: {}\n", name, count));
    }

    // Console output
    s.push_str("\n## Console Output\n");
    if diag.console_output.is_empty() {
        s.push_str("(NONE - no SBI console output produced)\n");
    } else {
        s.push_str(&format!(
            "({} bytes)\n```\n{}\n```\n",
            diag.console_output.len(),
            diag.console_output
        ));
    }

    // UART output
    s.push_str("\n## UART Output\n");
    if diag.uart_output.is_empty() {
        s.push_str("(NONE)\n");
    } else {
        s.push_str(&format!(
            "({} bytes)\n```\n{}\n```\n",
            diag.uart_output.len(),
            diag.uart_output
        ));
    }

    // Final register state
    s.push_str("\n## Final Register State\n");
    let reg_names = [
        "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1", "a0", "a1", "a2", "a3", "a4",
        "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4",
        "t5", "t6",
    ];
    for i in (0..32).step_by(4) {
        let mut line = String::new();
        for j in 0..4 {
            if i + j < 32 {
                line.push_str(&format!(
                    "{:>5}=0x{:08X}  ",
                    reg_names[i + j],
                    diag.registers[i + j]
                ));
            }
        }
        s.push_str(line.trim_end());
        s.push('\n');
    }

    // Key CSRs
    s.push_str("\n## Analysis Request\n");
    s.push_str("The kernel boots to \"Mountpoint-cache hash table entries\" then gets stuck.\n");
    s.push_str("It never reaches \"Freeing unused kernel memory\" from kernel_init().\n\n");
    s.push_str(
        "The idle thread runs the scheduler loop but kernel_init (PID 1) never gets CPU time.\n\n",
    );
    s.push_str("Key observations:\n");
    s.push_str("1. The PC cycles through scheduler/timer functions: __schedule, schedule, ktime_get, etc.\n");
    s.push_str("2. The CLINT timer ticks 100K every 1000 instructions\n");
    s.push_str("3. Timer interrupts fire (MIP.MTIP) and get handled\n");
    s.push_str("4. But the scheduler keeps choosing the idle task\n\n");
    s.push_str("Please analyze:\n");
    s.push_str(
        "1. WHY would the scheduler never schedule kernel_init? What conditions in the Linux\n",
    );
    s.push_str("   scheduler (CFS) could cause this?\n");
    s.push_str("2. Is the fork/clone for kernel_init likely succeeding? What if COW is broken?\n");
    s.push_str(
        "3. Could the timer interrupt delivery be incorrect? (M-mode timer trap -> S-mode\n",
    );
    s.push_str("   clockevent -> tick_sched_timer -> scheduler tick -> reschedule)\n");
    s.push_str(
        "4. What specific VM emulation bugs could cause the scheduler to never wake kernel_init?\n",
    );
    s.push_str("5. Is there a specific kernel function I should trap/breakpoint on to verify\n");
    s.push_str("   kernel_init was actually created?\n");
    s.push_str("6. Could this be a COW (copy-on-write) fork issue in the VM? The kernel uses\n");
    s.push_str("   fork(COW) to create kernel_init from rest_init.\n");
    s.push_str("7. Any kernel boot parameters that would help debug scheduler issues?\n");

    s
}

// ── Main ───────────────────────────────────────────────────────────────────

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let model = env::var("MODEL").unwrap_or_else(|_| "qwen2.5-coder:14b".to_string());
    let max_instructions: u64 = env::var("INSTRUCTIONS")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(100_000_000);

    eprintln!("[ollama-boot] Using model: {}", model);
    eprintln!("[ollama-boot] Booting Linux kernel...");

    // Step 1: Boot and collect diagnostics
    let diag = boot_and_diagnose(max_instructions)?;
    eprintln!(
        "[ollama-boot] Boot complete: {} instructions, PC=0x{:08X} ({})",
        diag.instructions, diag.final_pc, diag.final_priv
    );

    // Step 2: Build prompt
    let prompt = build_diagnostic_prompt(&diag);

    // Save full diagnostics to file for reference
    let diag_file = "/tmp/geos_linux_boot_diag.txt";
    fs::write(diag_file, &prompt)?;
    eprintln!("[ollama-boot] Full diagnostics saved to {}", diag_file);

    // Print summary
    println!("\n{}", "=".repeat(70));
    println!("LINUX BOOT DIAGNOSTIC SUMMARY");
    println!("{}", "=".repeat(70));
    println!("Instructions: {}", diag.instructions);
    println!("Final PC:     0x{:08X}", diag.final_pc);
    println!("Privilege:    {}", diag.final_priv);
    println!("Console out:  {} bytes", diag.console_output.len());
    println!("UART out:     {} bytes", diag.uart_output.len());
    println!("SBI ecalls:   {}", diag.sbi_ecalls.len());
    println!("CLINT mtime:  {}", diag.clint_mtime_final);
    println!("CLINT cmp:    {}", diag.clint_mtimecmp_final);
    println!("Shutdown:     {}", diag.sbi_shutdown);

    if !diag.pc_histogram.is_empty() {
        println!("\nTop 10 PC pages (idle loop hotspots):");
        for (page, count) in diag.pc_histogram.iter().take(10) {
            println!("  0x{:08X}: {} samples", page, count);
        }
    }

    println!("{}", "=".repeat(70));

    // Show console output
    if !diag.console_output.is_empty() {
        println!("\n--- CONSOLE OUTPUT ---");
        println!("{}", diag.console_output);
        println!("--- END CONSOLE ---\n");
    }

    // Step 3: Ask Ollama
    eprintln!("[ollama-boot] Querying Ollama model '{}'...", model);

    let system_prompt = r#"You are an expert in RISC-V Linux kernel internals, specifically:
- The Linux boot process (start_kernel -> rest_init -> kernel_init -> /init)
- The CFS scheduler (sched_init, schedule, pick_next_task, etc.)
- RISC-V timer interrupt handling (CLINT mtime/mtimecmp, MIP.MTIP, SBI timer, clockevents)
- SBI firmware interface (v2.0)
- fork/clone/COW semantics in the kernel
- VM emulation debugging

The user is booting Linux 6.14 (riscv32, nosmp) on a custom RISC-V VM. The kernel boots to
"Mountpoint-cache hash table entries" but gets stuck in the idle loop. kernel_init (PID 1)
never runs. The scheduler keeps choosing the idle task.

Analyze the diagnostics and provide:
1. Root cause analysis (most likely first) -- WHY the scheduler never schedules kernel_init
2. Whether the fork/clone for kernel_init succeeded
3. Whether timer interrupt delivery to S-mode is working correctly
4. Specific VM emulation bugs that could cause this
5. Concrete diagnostic steps (what to trap on, what to check)
6. Kernel config or boot parameter suggestions

Be specific about RISC-V and Linux internals. Reference exact functions, data structures, and code paths."#;

    let response = ollama_chat(&model, system_prompt, &prompt)?;

    println!("\n{}", "=".repeat(70));
    println!("OLLAMA ANALYSIS ({})", model);
    println!("{}", "=".repeat(70));
    println!("{}", response);
    println!("{}", "=".repeat(70));

    // Step 4: Follow-up - targeted questions about fork/clone and timer delivery
    eprintln!("\n[ollama-boot] Asking follow-up about fork/clone and timer delivery...");

    let followup = format!(
        "Based on the analysis, the kernel reaches the idle loop after 'Mountpoint-cache'.\n\
         The PC histogram shows it cycling through scheduler functions.\n\
         Total SBI ecalls: {} (breakdown: see above).\n\
         Console output ends at: '{}'\n\n\
         For the next iteration, I can:\n\
         1. Add a trap on the kernel_thread() call to verify fork/clone works\n\
         2. Check if the task_struct for PID 1 exists in kernel memory\n\
         3. Verify S-mode timer interrupt delivery (trap on riscv_timer_interrupt or clockevents)\n\
         4. Check the runqueue (cfs_rq) to see if kernel_init is on it\n\
         5. Try bootargs: init=/bin/sh or rdinit=/bin/sh\n\
         6. Add tracepoints for schedule(), pick_next_task(), check_preempt_wakeup()\n\n\
         What should I prioritize? Which specific addresses should I set breakpoints on?\n\
         What vmlinux symbols are most diagnostic?",
        diag.sbi_ecalls.len(),
        diag.console_output.lines().last().unwrap_or("(empty)"),
    );

    let followup_response = ollama_chat(&model, system_prompt, &followup)?;

    println!("\n{}", "=".repeat(70));
    println!("RECOMMENDED NEXT STEPS");
    println!("{}", "=".repeat(70));
    println!("{}", followup_response);

    Ok(())
}
