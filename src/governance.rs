// Governance Gate -- Seven Laws enforcement for every mutation
//
// "Every decision honors the Creator."
//
// No program executes without passing this gate. Every mutation, every loaded
// program, every spawn passes through governance. This is non-negotiable.
//
// Static analysis checks:
//   1. No STORE targeting system memory (MSGQ, EVENTQ, FONT, SCREEN control)
//   2. No PSET outside the 256x256 screen sandbox
//   3. No runaway SPAWN chains (finite spawn depth)
//   4. Program size within bounds
//   5. No SEND targeting non-existent VMs
//   6. Must contain at least one HALT

use crate::assembler::{self, op};
use crate::{MAX_VMS, SCREEN_SIZE, MSGQ_BASE, EVENTQ_BASE};
use crate::font_atlas::FONT_BASE;
use crate::substrate::ALLOC_END;

/// Result of a governance check.
#[derive(Debug, Clone)]
pub struct GovernanceResult {
    /// True if the program is approved for execution.
    pub approved: bool,
    /// Human-readable summary.
    pub reason: String,
    /// Individual violations found.
    pub violations: Vec<Violation>,
}

/// A single governance violation.
#[derive(Debug, Clone)]
pub struct Violation {
    /// Pixel index where the violation was found.
    pub pixel_index: usize,
    /// Opcode of the offending instruction.
    pub opcode: u8,
    /// Description of the violation.
    pub description: String,
    /// Severity: "critical" = blocks execution, "warning" = logged but allowed.
    pub severity: String,
}

/// Maximum allowed program size in pixels (256K = 1MB).
pub const MAX_PROGRAM_SIZE: usize = 262_144;

/// Maximum allowed SPAWN instructions in a single program.
/// Prevents exponential fork bombs.
pub const MAX_SPAWN_COUNT: usize = 4;

/// Extract the opcode from a glyph pixel.
#[inline]
fn extract_opcode(pixel: u32) -> u8 {
    (pixel & 0xFF) as u8
}

/// Extract p1 from a glyph pixel.
#[inline]
fn extract_p1(pixel: u32) -> u8 {
    ((pixel >> 16) & 0xFF) as u8
}

/// Extract p2 from a glyph pixel.
#[inline]
fn extract_p2(pixel: u32) -> u8 {
    ((pixel >> 24) & 0xFF) as u8
}

/// Check if an address falls in a protected system region.
fn is_system_address(addr: u32) -> bool {
    // Message queue region
    if addr >= MSGQ_BASE && addr < EVENTQ_BASE {
        return true;
    }
    // Event queue region
    if addr >= EVENTQ_BASE && addr < FONT_BASE {
        return true;
    }
    // Font atlas region
    if addr >= FONT_BASE && addr < FONT_BASE + 1024 {
        return true;
    }
    // Beyond allocatable region = system territory
    if addr >= ALLOC_END {
        return true;
    }
    false
}

/// Run governance gate on a pixel program.
///
/// This performs static analysis WITHOUT executing the program.
/// It scans the pixel stream for known-dangerous patterns.
///
/// The gate is non-negotiable: it cannot be disabled.
pub fn check(pixels: &[u32]) -> GovernanceResult {
    let mut violations: Vec<Violation> = Vec::new();

    // ── Rule 0: Program size within bounds ──
    if pixels.is_empty() {
        violations.push(Violation {
            pixel_index: 0,
            opcode: 0,
            description: "Program is empty".into(),
            severity: "critical".into(),
        });
        return make_result(violations);
    }

    if pixels.len() > MAX_PROGRAM_SIZE {
        violations.push(Violation {
            pixel_index: 0,
            opcode: 0,
            description: format!(
                "Program size {} exceeds maximum {}",
                pixels.len(),
                MAX_PROGRAM_SIZE
            ),
            severity: "critical".into(),
        });
        return make_result(violations);
    }

    // ── Rule 1: Must contain at least one HALT ──
    let has_halt = pixels.iter().any(|&p| extract_opcode(p) == op::HALT);
    if !has_halt {
        violations.push(Violation {
            pixel_index: 0,
            opcode: 0,
            description: "Program has no HALT instruction (will run forever)".into(),
            severity: "critical".into(),
        });
    }

    // ── Single-pass static analysis ──
    let mut spawn_count: usize = 0;
    let mut i: usize = 0;

    while i < pixels.len() {
        let pixel = pixels[i];
        let opcode = extract_opcode(pixel);
        let p1 = extract_p1(pixel);
        let p2 = extract_p2(pixel);

        match opcode {
            // ── STORE: check if target address might be system memory ──
            // STORE uses register-indirect addressing, so we can't know the
            // exact address statically. But we CAN check if a STORE immediately
            // follows an LDI that loads a system address into the target register.
            op::STORE => {
                // We log a warning for all STORE instructions since the target
                // address is determined at runtime. The VM itself enforces bounds.
                // Static analysis catches obvious patterns:
                //   LDI rX, <system_addr>; STORE rX, ...
                if i >= 2 {
                    let prev_opcode = extract_opcode(pixels[i - 2]);
                    let prev_p1 = extract_p1(pixels[i - 2]); // register loaded
                    if prev_opcode == op::LDI && prev_p1 == p1 {
                        // Previous instruction loaded into the same register that
                        // STORE uses as address. Check the data word.
                        if i >= 1 {
                            let loaded_value = pixels[i - 1]; // LDI data word
                            if is_system_address(loaded_value) {
                                violations.push(Violation {
                                    pixel_index: i,
                                    opcode,
                                    description: format!(
                                        "STORE targets system region (r{} = 0x{:08X})",
                                        p1, loaded_value
                                    ),
                                    severity: "critical".into(),
                                });
                            }
                        }
                    }
                }
            }

            // ── PSET: check for out-of-bounds screen coordinates ──
            // PSET p1=x_reg, p2=y_reg. Scan backwards for LDI loading these regs.
            op::PSET => {
                let mut x_val = None;
                let mut y_val = None;
                let lookback = 10.min(i);
                for j in (0..lookback).step_by(2) {
                    if i < 2 + j { break; }
                    let idx = i - 2 - j;
                    let prev_op = extract_opcode(pixels[idx]);
                    let prev_p1 = extract_p1(pixels[idx]);
                    if prev_op == op::LDI && idx + 1 < pixels.len() {
                        if prev_p1 == p1 && x_val.is_none() {
                            x_val = Some(pixels[idx + 1]);
                        }
                        if prev_p1 == p2 && y_val.is_none() {
                            y_val = Some(pixels[idx + 1]);
                        }
                    }
                }
                if let (Some(xv), Some(yv)) = (x_val, y_val) {
                    if xv >= SCREEN_SIZE as u32 || yv >= SCREEN_SIZE as u32 {
                        violations.push(Violation {
                            pixel_index: i,
                            opcode,
                            description: format!(
                                "PSET coordinates ({}, {}) outside screen (0..{})",
                                xv, yv, SCREEN_SIZE
                            ),
                            severity: "critical".into(),
                        });
                    }
                }
            }

            // ── SPAWN: limit spawn count to prevent fork bombs ──
            op::SPAWN => {
                spawn_count += 1;
                if spawn_count > MAX_SPAWN_COUNT {
                    violations.push(Violation {
                        pixel_index: i,
                        opcode,
                        description: format!(
                            "Too many SPAWN instructions ({}/{}): potential fork bomb",
                            spawn_count, MAX_SPAWN_COUNT
                        ),
                        severity: "critical".into(),
                    });
                }
            }

            // ── SEND: check target VM ID ──
            // SEND r_target_vm, r_data_addr [length]
            // Static check: if preceded by LDI into the target_vm register
            op::SEND => {
                if i >= 2 {
                    let prev_op = extract_opcode(pixels[i - 2]);
                    let prev_p1 = extract_p1(pixels[i - 2]);
                    if prev_op == op::LDI && prev_p1 == p1 {
                        let target_vm = pixels[i - 1];
                        if target_vm >= MAX_VMS {
                            violations.push(Violation {
                                pixel_index: i,
                                opcode,
                                description: format!(
                                    "SEND targets non-existent VM {} (max: {})",
                                    target_vm, MAX_VMS
                                ),
                                severity: "critical".into(),
                            });
                        }
                    }
                }
            }

            // ── JMP/BRANCH: check for obvious infinite loops ──
            // JMP with offset 0 is an infinite loop at that instruction.
            op::JMP => {
                if i + 1 < pixels.len() {
                    let offset = pixels[i + 1] as i32;
                    // offset = 0 means jump to self = infinite loop
                    // But this might be intentional (spin-wait for events).
                    // We log as warning only.
                    if offset == 0 {
                        violations.push(Violation {
                            pixel_index: i,
                            opcode,
                            description: "JMP with offset 0: infinite loop at this instruction".into(),
                            severity: "warning".into(),
                        });
                    }
                }
            }

            _ => {}
        }

        // Advance past LDI data words
        if opcode == op::LDI || opcode == op::JMP || opcode == op::BRANCH || opcode == op::SEND {
            i += 2; // instruction + data word
        } else {
            i += 1;
        }
    }

    make_result(violations)
}

fn make_result(violations: Vec<Violation>) -> GovernanceResult {
    let has_critical = violations.iter().any(|v| v.severity == "critical");
    let reason = if violations.is_empty() {
        "Program passes governance: no violations detected.".into()
    } else if has_critical {
        format!(
            "REJECTED: {} critical violations, {} warnings",
            violations.iter().filter(|v| v.severity == "critical").count(),
            violations.iter().filter(|v| v.severity == "warning").count()
        )
    } else {
        format!(
            "APPROVED with warnings: {} warnings (no critical violations)",
            violations.len()
        )
    };

    GovernanceResult {
        approved: !has_critical,
        reason,
        violations,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler::Program;

    #[test]
    fn benign_program_passes() {
        let mut p = Program::new();
        p.ldi(0, 42);
        p.add(0, 0);
        p.halt();

        let result = check(&p.pixels);
        assert!(result.approved, "Benign program should pass: {}", result.reason);
        assert!(result.violations.is_empty(), "Should have zero violations");
    }

    #[test]
    fn empty_program_rejected() {
        let result = check(&[]);
        assert!(!result.approved, "Empty program should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("empty")));
    }

    #[test]
    fn no_halt_rejected() {
        let mut p = Program::new();
        p.ldi(0, 1);
        p.add(0, 0);
        // No HALT

        let result = check(&p.pixels);
        assert!(!result.approved, "Program without HALT should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("HALT")));
    }

    #[test]
    fn store_to_system_region_rejected() {
        let mut p = Program::new();
        p.ldi(0, MSGQ_BASE); // r0 = MSGQ_BASE (system region)
        p.store(0, 1);       // STORE [r0], r1  -- writes to MSGQ_BASE
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "STORE to system region should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("system region")));
    }

    #[test]
    fn store_to_font_atlas_rejected() {
        let mut p = Program::new();
        p.ldi(0, FONT_BASE); // r0 = FONT_BASE
        p.store(0, 1);       // writes to font atlas
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "STORE to font atlas should be rejected");
    }

    #[test]
    fn store_to_eventq_rejected() {
        let mut p = Program::new();
        p.ldi(0, EVENTQ_BASE);
        p.store(0, 1);
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "STORE to event queue should be rejected");
    }

    #[test]
    fn store_to_user_memory_approved() {
        let mut p = Program::new();
        p.ldi(0, 0x00010000); // r0 = allocatable region (after bootstrap)
        p.store(0, 1);        // writes to user memory
        p.halt();

        let result = check(&p.pixels);
        assert!(result.approved, "STORE to user memory should be approved: {}", result.reason);
    }

    #[test]
    fn spawn_fork_bomb_rejected() {
        let mut p = Program::new();
        for _ in 0..(MAX_SPAWN_COUNT + 1) {
            p.instruction(op::SPAWN, 0, 0, 1);
        }
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "Too many SPAWNs should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("fork bomb")));
    }

    #[test]
    fn send_to_nonexistent_vm_rejected() {
        let mut p = Program::new();
        p.ldi(0, MAX_VMS + 5); // r0 = VM 13 (doesn't exist, max=8)
        p.instruction(op::SEND, 0, 0, 1); // SEND r0, r1
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "SEND to non-existent VM should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("non-existent VM")));
    }

    #[test]
    fn send_to_valid_vm_approved() {
        let mut p = Program::new();
        p.ldi(0, 3); // r0 = VM 3 (valid, 0..7)
        p.instruction(op::SEND, 0, 0, 1); // SEND r0, r1
        p.halt();

        let result = check(&p.pixels);
        assert!(result.approved, "SEND to valid VM should be approved: {}", result.reason);
    }

    #[test]
    fn self_replicator_passes() {
        let program = assembler::self_replicator();
        let result = check(&program.pixels);
        assert!(result.approved, "Self-replicator should pass governance: {}", result.reason);
    }

    #[test]
    fn oversized_program_rejected() {
        let pixels: Vec<u32> = vec![0u32; MAX_PROGRAM_SIZE + 1];
        let result = check(&pixels);
        assert!(!result.approved, "Oversized program should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("exceeds maximum")));
    }

    #[test]
    fn jmp_self_is_warning() {
        let mut p = Program::new();
        p.instruction(op::JMP, 0, 0, 0);
        p.pixels.push(0); // offset 0 = jump to self
        p.halt();

        let result = check(&p.pixels);
        // Should be approved (only warning, not critical)
        assert!(result.approved, "JMP-self should be warning, not rejection: {}", result.reason);
        assert!(result.violations.iter().any(|v| v.severity == "warning" && v.description.contains("infinite loop")));
    }

    #[test]
    fn violations_include_pixel_index() {
        let mut p = Program::new();
        p.ldi(0, 0);         // addr 0-1
        p.ldi(1, MSGQ_BASE); // addr 2-3
        p.store(1, 0);       // addr 4: STORE to MSGQ_BASE
        p.halt();             // addr 5

        let result = check(&p.pixels);
        assert!(!result.approved);
        let v = result.violations.iter().find(|v| v.description.contains("system region")).unwrap();
        assert_eq!(v.pixel_index, 4, "Violation should be at pixel index 4");
        assert_eq!(v.opcode, op::STORE);
    }

    #[test]
    fn pset_outside_screen_rejected() {
        let mut p = Program::new();
        p.ldi(0, 300);   // r0 = x = 300 (screen is 256x256)
        p.ldi(1, 100);   // r1 = y = 100
        p.ldi(2, 0xFF);  // r2 = color
        p.instruction(op::PSET, 0, 0, 1); // PSET r0, r1, r2
        p.halt();

        let result = check(&p.pixels);
        assert!(!result.approved, "PSET outside screen should be rejected");
        assert!(result.violations.iter().any(|v| v.description.contains("outside screen")));
    }

    #[test]
    fn pset_inside_screen_approved() {
        let mut p = Program::new();
        p.ldi(0, 100);   // r0 = x = 100
        p.ldi(1, 200);   // r1 = y = 200
        p.ldi(2, 0xFF);  // r2 = color
        p.instruction(op::PSET, 0, 0, 1); // PSET r0, r1, r2
        p.halt();

        let result = check(&p.pixels);
        assert!(result.approved, "PSET inside screen should be approved: {}", result.reason);
    }

    // ── SoftwareVm governance integration tests ──

    #[test]
    fn test_software_vm_load_program_governed_approves_clean() {
        let mut svm = crate::software_vm::SoftwareVm::new();
        let prog = vec![crate::assembler::glyph(13, 0, 0, 0)]; // HALT
        let result = svm.load_program_governed(0, &prog);
        assert!(result.approved, "clean HALT program should pass governance");
        // Verify program was actually loaded by reading back
        assert_eq!(svm.peek(0), crate::assembler::glyph(13, 0, 0, 0));
    }

    #[test]
    fn test_software_vm_load_program_governed_rejects_bad() {
        let mut svm = crate::software_vm::SoftwareVm::new();
        // Create a program with invalid opcode in first instruction
        let bad_prog = vec![crate::assembler::glyph(0xFF, 0, 0, 0)];
        let result = svm.load_program_governed(0, &bad_prog);
        assert!(!result.approved, "invalid opcode should fail governance");
        // Verify program was NOT loaded (RAM should still be 0 at that address)
        assert_eq!(svm.peek(0), 0, "rejected program should not be in RAM");
    }

    #[test]
    fn test_software_vm_run_program_governed_approves() {
        let mut p = crate::assembler::Program::new();
        p.ldi(0, 42);
        p.halt();
        let result = crate::software_vm::SoftwareVm::run_program_governed(&p.pixels, 0);
        assert!(result.is_some(), "clean program should pass governed run");
        let (vm_state, gov_result) = result.unwrap();
        assert!(gov_result.approved);
        assert_eq!(vm_state.regs[0], 42, "governed program should execute correctly");
    }

    #[test]
    fn test_software_vm_run_program_governed_rejects() {
        let bad_prog = vec![crate::assembler::glyph(0xFF, 0, 0, 0)]; // invalid opcode
        let result = crate::software_vm::SoftwareVm::run_program_governed(&bad_prog, 0);
        assert!(result.is_none(), "invalid program should be rejected by governance");
    }

    #[test]
    fn test_software_vm_run_program_governed_preserves_semantics() {
        // Run the same program both ways and verify identical results
        let mut p = crate::assembler::Program::new();
        p.ldi(0, 100);
        p.ldi(1, 37);
        p.sub(0, 1); // r0 = 63
        p.halt();

        let ungoverned = crate::software_vm::SoftwareVm::run_program(&p.pixels, 0);
        let governed = crate::software_vm::SoftwareVm::run_program_governed(&p.pixels, 0);

        assert!(governed.is_some());
        let (gov_vm, _) = governed.unwrap();
        assert_eq!(gov_vm.regs[0], ungoverned.regs[0], "governed and ungoverned should produce same result");
        assert_eq!(gov_vm.regs[0], 63);
    }
}
