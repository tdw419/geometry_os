// assembler/system_ops.rs -- System/OS instruction match arms
//
// SYSCALL, RETK, file I/O (OPEN, READ, WRITE, CLOSE, SEEK, LS),
// scheduling (YIELD, SLEEP, SETPRIORITY), IPC (PIPE, MSGSND, MSGRCV),
// IOCTL, env (GETENV, SETENV), process control (GETPID, EXEC, WRITESTR,
// READLN, WAITPID, EXECP, CHDIR, GETCWD, SPAWN, KILL),
// signals (SHUTDOWN, EXIT, SIGNAL, SIGSET), HYPERVISOR, ASM, ASMSELF, RUNNEXT

use super::{parse_imm, parse_reg};

type Constants<'a> = &'a std::collections::HashMap<String, u32>;

pub(super) fn try_parse(
    opcode: &str,
    tokens: &[&str],
    bytecode: &mut Vec<u32>,
    constants: Constants,
) -> Result<Option<()>, String> {
    match opcode {
        "ASM" => {
            if tokens.len() < 3 {
                return Err("ASM requires 2 arguments: ASM src_addr_reg, dest_addr_reg".to_string());
            }
            bytecode.push(0x4B);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "SPAWN" => {
            if tokens.len() < 2 {
                return Err("SPAWN requires 1 argument: SPAWN addr_reg".to_string());
            }
            bytecode.push(0x4D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "KILL" => {
            if tokens.len() < 2 {
                return Err("KILL requires 1 argument: KILL pid_reg".to_string());
            }
            bytecode.push(0x4E);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SYSCALL" => {
            if tokens.len() < 2 {
                return Err("SYSCALL requires 1 argument: SYSCALL num".to_string());
            }
            bytecode.push(0x52);
            bytecode.push(parse_imm(tokens[1], constants)?);
            Ok(Some(()))
        }

        "RETK" => {
            bytecode.push(0x53);
            Ok(Some(()))
        }

        "OPEN" => {
            if tokens.len() < 3 {
                return Err("OPEN requires 2 arguments: OPEN path_reg, mode_reg".to_string());
            }
            bytecode.push(0x54);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "READ" => {
            if tokens.len() < 4 {
                return Err("READ requires 3 arguments: READ fd_reg, buf_reg, len_reg".to_string());
            }
            bytecode.push(0x55);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "WRITE" => {
            if tokens.len() < 4 {
                return Err(
                    "WRITE requires 3 arguments: WRITE fd_reg, buf_reg, len_reg".to_string()
                );
            }
            bytecode.push(0x56);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "CLOSE" => {
            if tokens.len() < 2 {
                return Err("CLOSE requires 1 argument: CLOSE fd_reg".to_string());
            }
            bytecode.push(0x57);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SEEK" => {
            if tokens.len() < 4 {
                return Err(
                    "SEEK requires 3 arguments: SEEK fd_reg, offset_reg, whence_reg".to_string(),
                );
            }
            bytecode.push(0x58);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "LS" => {
            if tokens.len() < 2 {
                return Err("LS requires 1 argument: LS buf_reg".to_string());
            }
            bytecode.push(0x59);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "YIELD" => {
            bytecode.push(0x5A);
            Ok(Some(()))
        }

        "SLEEP" => {
            if tokens.len() < 2 {
                return Err("SLEEP requires 1 argument: SLEEP ticks_reg".to_string());
            }
            bytecode.push(0x5B);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SETPRIORITY" => {
            if tokens.len() < 2 {
                return Err("SETPRIORITY requires 1 argument: SETPRIORITY priority_reg".to_string());
            }
            bytecode.push(0x5C);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "PIPE" => {
            if tokens.len() < 3 {
                return Err("PIPE requires 2 arguments: PIPE read_fd_reg, write_fd_reg".to_string());
            }
            bytecode.push(0x5D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "MSGSND" => {
            if tokens.len() < 2 {
                return Err("MSGSND requires 1 argument: MSGSND pid_reg".to_string());
            }
            bytecode.push(0x5E);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MSGRCV" => {
            bytecode.push(0x5F);
            Ok(Some(()))
        }

        // Phase 289: IPC synchronization primitives
        "MTEXINIT" => {
            if tokens.len() < 2 {
                return Err("MTEXINIT requires 1 argument: MTEXINIT addr_reg".to_string());
            }
            bytecode.push(0x05);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MTEXLOCK" => {
            if tokens.len() < 2 {
                return Err("MTEXLOCK requires 1 argument: MTEXLOCK addr_reg".to_string());
            }
            bytecode.push(0x06);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MTEXUNLOCK" => {
            if tokens.len() < 2 {
                return Err("MTEXUNLOCK requires 1 argument: MTEXUNLOCK addr_reg".to_string());
            }
            bytecode.push(0x07);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SEMINIT" => {
            if tokens.len() < 3 {
                return Err("SEMINIT requires 2 arguments: SEMINIT addr_reg, count_reg".to_string());
            }
            bytecode.push(0x08);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "SEMWAIT" => {
            if tokens.len() < 2 {
                return Err("SEMWAIT requires 1 argument: SEMWAIT addr_reg".to_string());
            }
            bytecode.push(0x09);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SEMPOST" => {
            if tokens.len() < 2 {
                return Err("SEMPOST requires 1 argument: SEMPOST addr_reg".to_string());
            }
            bytecode.push(0x0A);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "IOCTL" => {
            if tokens.len() < 4 {
                return Err(
                    "IOCTL requires 3 arguments: IOCTL fd_reg, cmd_reg, arg_reg".to_string()
                );
            }
            bytecode.push(0x62);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "GETENV" => {
            if tokens.len() < 3 {
                return Err(
                    "GETENV requires 2 arguments: GETENV key_addr_reg, val_addr_reg".to_string(),
                );
            }
            bytecode.push(0x63);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "SETENV" => {
            if tokens.len() < 3 {
                return Err(
                    "SETENV requires 2 arguments: SETENV key_addr_reg, val_addr_reg".to_string(),
                );
            }
            bytecode.push(0x64);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "GETPID" => {
            bytecode.push(0x65);
            Ok(Some(()))
        }
        "PROCLS" => {
            if tokens.len() != 2 {
                return Err("PROCLS requires 1 argument: PROCLS buf_reg".to_string());
            }
            bytecode.push(0x9B);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "EXEC" => {
            if tokens.len() != 2 {
                return Err("EXEC requires 1 argument: EXEC path_addr_reg".to_string());
            }
            bytecode.push(0x66);
            let r = parse_reg(tokens[1])?;
            bytecode.push(r as u32);
            Ok(Some(()))
        }

        "WRITESTR" => {
            if tokens.len() != 3 {
                return Err(
                    "WRITESTR requires 2 arguments: WRITESTR fd_reg, str_addr_reg".to_string(),
                );
            }
            bytecode.push(0x67);
            let r1 = parse_reg(tokens[1])?;
            let r2 = parse_reg(tokens[2])?;
            bytecode.push(r1 as u32);
            bytecode.push(r2 as u32);
            Ok(Some(()))
        }

        "READLN" => {
            if tokens.len() != 4 {
                return Err(
                    "READLN requires 3 arguments: READLN buf_reg, max_len_reg, pos_reg".to_string(),
                );
            }
            bytecode.push(0x68);
            let r1 = parse_reg(tokens[1])?;
            let r2 = parse_reg(tokens[2])?;
            let r3 = parse_reg(tokens[3])?;
            bytecode.push(r1 as u32);
            bytecode.push(r2 as u32);
            bytecode.push(r3 as u32);
            Ok(Some(()))
        }

        "WAITPID" => {
            if tokens.len() != 2 {
                return Err("WAITPID requires 1 argument: WAITPID pid_reg".to_string());
            }
            bytecode.push(0x69);
            let r = parse_reg(tokens[1])?;
            bytecode.push(r as u32);
            Ok(Some(()))
        }

        "EXECP" => {
            if tokens.len() != 4 {
                return Err(
                    "EXECP requires 3 arguments: EXECP path_reg, stdin_fd_reg, stdout_fd_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x6A);
            let r1 = parse_reg(tokens[1])?;
            let r2 = parse_reg(tokens[2])?;
            let r3 = parse_reg(tokens[3])?;
            bytecode.push(r1 as u32);
            bytecode.push(r2 as u32);
            bytecode.push(r3 as u32);
            Ok(Some(()))
        }

        "CHDIR" => {
            if tokens.len() != 2 {
                return Err("CHDIR requires 1 argument: CHDIR path_reg".to_string());
            }
            bytecode.push(0x6B);
            let r = parse_reg(tokens[1])?;
            bytecode.push(r as u32);
            Ok(Some(()))
        }

        "GETCWD" => {
            if tokens.len() != 2 {
                return Err("GETCWD requires 1 argument: GETCWD buf_reg".to_string());
            }
            bytecode.push(0x6C);
            let r = parse_reg(tokens[1])?;
            bytecode.push(r as u32);
            Ok(Some(()))
        }

        "SHUTDOWN" => {
            bytecode.push(0x6E);
            Ok(Some(()))
        }

        "EXIT" => {
            if tokens.len() < 2 {
                return Err("EXIT requires 1 argument: EXIT code_reg".to_string());
            }
            bytecode.push(0x6F);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SIGNAL" => {
            if tokens.len() < 3 {
                return Err("SIGNAL requires 2 arguments: SIGNAL pid_reg sig_reg".to_string());
            }
            bytecode.push(0x70);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "SIGSET" => {
            if tokens.len() < 3 {
                return Err("SIGSET requires 2 arguments: SIGSET sig_reg handler_reg".to_string());
            }
            bytecode.push(0x71);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "HYPERVISOR" => {
            if tokens.len() < 2 {
                return Err(
                    "HYPERVISOR requires 1-2 arguments: HYPERVISOR addr_reg [, win_id_reg]"
                        .to_string(),
                );
            }
            bytecode.push(0x72);
            bytecode.push(parse_reg(tokens[1])? as u32);
            // Optional window_id register (default r0 = no window = full canvas)
            if tokens.len() >= 3 {
                bytecode.push(parse_reg(tokens[2])? as u32);
            } else {
                bytecode.push(0); // r0 = window_id 0 = full canvas
            }
            Ok(Some(()))
        }

        "ASMSELF" => {
            bytecode.push(0x73);
            Ok(Some(()))
        }

        "RUNNEXT" => {
            bytecode.push(0x74);
            Ok(Some(()))
        }

        "SNAP_TRACE" => {
            if tokens.len() < 2 {
                return Err("SNAP_TRACE requires 1 argument: SNAP_TRACE mode_reg".to_string());
            }
            bytecode.push(0x7B);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "REPLAY" => {
            if tokens.len() < 2 {
                return Err("REPLAY requires 1 argument: REPLAY frame_idx_reg".to_string());
            }
            bytecode.push(0x7C);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "FORK" => {
            if tokens.len() < 2 {
                return Err("FORK requires 1 argument: FORK mode_reg".to_string());
            }
            bytecode.push(0x7D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "ABS" => {
            if tokens.len() < 2 {
                return Err("ABS requires 1 argument: ABS rd".to_string());
            }
            bytecode.push(0x87);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "MIN" => {
            if tokens.len() < 3 {
                return Err("MIN requires 2 arguments: MIN rd, rs".to_string());
            }
            bytecode.push(0x89);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "MAX" => {
            if tokens.len() < 3 {
                return Err("MAX requires 2 arguments: MAX rd, rs".to_string());
            }
            bytecode.push(0x8A);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "CLAMP" => {
            if tokens.len() < 4 {
                return Err("CLAMP requires 3 arguments: CLAMP rd, min_reg, max_reg".to_string());
            }
            bytecode.push(0x8B);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // Bit manipulation opcodes: BITSET (0x8D), BITCLR (0x8E),
        // BITTEST (0x8F), NOT (0x90).
        // Short aliases (BSET, BCLR, BTST, BNOT) use the newer opcodes
        // (0xE1, 0xF0, 0xF1, 0xCF) defined later in this match.
        "BITSET" => {
            if tokens.len() < 3 {
                return Err("BITSET requires 2 arguments: BITSET rd, bit_reg".to_string());
            }
            bytecode.push(0x8D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "BITCLR" => {
            if tokens.len() < 3 {
                return Err("BITCLR requires 2 arguments: BITCLR rd, bit_reg".to_string());
            }
            bytecode.push(0x8E);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "BITTEST" => {
            if tokens.len() < 3 {
                return Err("BITTEST requires 2 arguments: BITTEST rd, bit_reg".to_string());
            }
            bytecode.push(0x8F);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "NOT" => {
            if tokens.len() < 2 {
                return Err("NOT requires 1 argument: NOT rd".to_string());
            }
            bytecode.push(0x90);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "INV" => {
            bytecode.push(0x91);
            Ok(Some(()))
        }

        "MATVEC" => {
            if tokens.len() < 6 {
                return Err("MATVEC requires 5 arguments: MATVEC r_weight, r_input, r_output, r_rows, r_cols".to_string());
            }
            bytecode.push(0x92);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        "RELU" => {
            if tokens.len() < 2 {
                return Err("RELU requires 1 argument: RELU rd".to_string());
            }
            bytecode.push(0x93);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "WINSYS" => {
            if tokens.len() < 2 {
                return Err("WINSYS requires 1 argument: WINSYS op_reg".to_string());
            }
            bytecode.push(0x94);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "WPIXEL" => {
            if tokens.len() < 5 {
                return Err(
                    "WPIXEL requires 4 arguments: WPIXEL win_id_reg, x_reg, y_reg, color_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x95);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "WREAD" => {
            if tokens.len() < 5 {
                return Err(
                    "WREAD requires 4 arguments: WREAD win_id_reg, x_reg, y_reg, dest_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x96);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        "SCRSHOT" => {
            if tokens.len() < 2 {
                return Err("SCRSHOT requires 1 argument: SCRSHOT path_addr_reg".to_string());
            }
            bytecode.push(0x98);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "BYTEPACK" => {
            if tokens.len() < 4 {
                return Err(
                    "BYTEPACK requires 3 arguments: BYTEPACK src_addr_reg, len_reg, path_addr_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xAE);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "SAVEPNG" => {
            if tokens.len() < 2 {
                return Err("SAVEPNG requires 1 argument: SAVEPNG path_addr_reg".to_string());
            }
            bytecode.push(0xAF);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "LLM" => {
            if tokens.len() != 4 {
                return Err(
                    "LLM requires 3 arguments: LLM prompt_addr_reg, response_addr_reg, max_len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x9C);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "HTPARSE" => {
            if tokens.len() != 4 {
                return Err(
                    "HTPARSE requires 3 arguments: HTPARSE src_reg, dest_reg, max_lines_reg"
                        .to_string(),
                );
            }
            bytecode.push(0x9D);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "HITCLR" => {
            bytecode.push(0x9E);
            Ok(Some(()))
        }

        // ── Phase 87: Multi-Hypervisor Opcodes ──
        "VM_SPAWN" => {
            // VM_SPAWN config_reg, window_reg
            // 3 words: [0x9F, config_reg, window_reg]
            if tokens.len() < 3 {
                return Err(
                    "VM_SPAWN requires 2 arguments: VM_SPAWN config_reg, window_reg".to_string(),
                );
            }
            bytecode.push(0x9F);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "VM_KILL" => {
            // VM_KILL id_reg
            // 2 words: [0xA0, id_reg]
            if tokens.len() < 2 {
                return Err("VM_KILL requires 1 argument: VM_KILL id_reg".to_string());
            }
            bytecode.push(0xA0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "VM_STATUS" => {
            // VM_STATUS id_reg
            // 2 words: [0xA1, id_reg]
            if tokens.len() < 2 {
                return Err("VM_STATUS requires 1 argument: VM_STATUS id_reg".to_string());
            }
            bytecode.push(0xA1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "VM_PAUSE" => {
            // VM_PAUSE id_reg
            // 2 words: [0xA2, id_reg]
            if tokens.len() < 2 {
                return Err("VM_PAUSE requires 1 argument: VM_PAUSE id_reg".to_string());
            }
            bytecode.push(0xA2);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "VM_RESUME" => {
            // VM_RESUME id_reg
            // 2 words: [0xA3, id_reg]
            if tokens.len() < 2 {
                return Err("VM_RESUME requires 1 argument: VM_RESUME id_reg".to_string());
            }
            bytecode.push(0xA3);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "VM_SET_BUDGET" => {
            // VM_SET_BUDGET id_reg, budget_reg
            // 3 words: [0xA4, id_reg, budget_reg]
            if tokens.len() < 3 {
                return Err(
                    "VM_SET_BUDGET requires 2 arguments: VM_SET_BUDGET id_reg, budget_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xA4);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "VM_LIST" => {
            // VM_LIST addr_reg
            // 2 words: [0xA5, addr_reg]
            if tokens.len() < 2 {
                return Err("VM_LIST requires 1 argument: VM_LIST addr_reg".to_string());
            }
            bytecode.push(0xA5);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // ── Phase 89: AI Agent Input ──
        "AI_INJECT" => {
            // AI_INJECT op_reg
            // 2 words: [0xA6, op_reg]
            // op_reg contains the operation number:
            //   0 = inject key (keycode in r[op_reg+1], shift in r[op_reg+2])
            //   1 = inject mouse move (x in r[op_reg+1], y in r[op_reg+2])
            //   2 = inject mouse click (x in r[op_reg+1], y in r[op_reg+2], button in r[op_reg+3])
            //   3 = inject text string (addr in r[op_reg+1], null-terminated, pushes each char)
            if tokens.len() < 2 {
                return Err("AI_INJECT requires 1 argument: AI_INJECT op_reg".to_string());
            }
            bytecode.push(0xA6);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // ── Phase 102: Permissions and Capability System ──
        "SPAWNC" => {
            // SPAWNC addr_reg, caps_reg
            // 3 words: [0xA7, addr_reg, caps_reg]
            // Spawns a new process at the address in addr_reg with capabilities
            // specified by the capability list at caps_reg in RAM.
            if tokens.len() < 3 {
                return Err("SPAWNC requires 2 arguments: SPAWNC addr_reg, caps_reg".to_string());
            }
            bytecode.push(0xA7);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // ── Phase 88: AI Vision Bridge ──
        "AI_AGENT" => {
            // AI_AGENT op_reg
            // 2 words: [0xB0, op_reg]
            // op_reg contains the operation number:
            //   0 = screenshot to VFS (path addr in r[op_reg+1])
            //   1 = canvas checksum -> r0
            //   2 = canvas diff (prev screen addr in r[op_reg+1]) -> r0
            //   3 = vision API call (prompt_addr in r[op_reg+1], response_addr in r[op_reg+2], max_len in r[op_reg+3])
            //   4 = specialized perception (mode in r[op_reg+1])
            //   5 = screen analysis / fitness (mode in r[op_reg+1])
            if tokens.len() < 2 {
                return Err("AI_AGENT requires 1 argument: AI_AGENT op_reg".to_string());
            }
            bytecode.push(0xB0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "SCREENA" => {
            // SCREENA mode_reg -- screen analysis / fitness evaluation
            // Always uses AI_AGENT sub-op 5. mode_reg should hold the analysis mode:
            //   0=nonzero count, 1=unique colors, 2=h-symmetry, 3=v-symmetry,
            //   4=entropy, 5=center_x, 6=center_y, 7=combined fitness
            // The VM reads: op = 5 (hardcoded), mode = regs[mode_reg]
            // Actually encodes as: LDI r28, 5 + AI_AGENT r28 + reads r[mode_reg]
            // But since assembler can't emit multi-instruction sequences,
            // we use a dedicated encoding: [0xB0, 0xFF, mode_reg]
            // where 0xFF signals "sub-op 5, mode from the NEXT register"
            if tokens.len() < 2 {
                return Err("SCREENA requires 1 argument: SCREENA mode_reg".to_string());
            }
            // Emit: 0xB0, 0xFF (signals sub-op 5 + mode_from_next), mode_reg
            bytecode.push(0xB0);
            bytecode.push(0xFF); // sentinel: sub-op 5, mode from next word
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // ── Phase 92: Pixel Boot ──
        "LOADPNG" => {
            // LOADPNG path_reg, dest_addr_reg
            // 3 words: [0xB1, path_reg, dest_addr_reg]
            // Reads PNG file path from RAM at path_reg, decodes pixelpack seeds,
            // writes bytecode to RAM at dest_addr_reg. Returns byte count in r0.
            if tokens.len() < 3 {
                return Err(
                    "LOADPNG requires 2 arguments: LOADPNG path_reg, dest_addr_reg".to_string(),
                );
            }
            bytecode.push(0xB1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "LOADSRCIMG" => {
            // LOADSRCIMG path_reg
            // 2 words: [0xB2, path_reg]
            // Reads PNG file path from RAM at path_reg, decodes pixelpack seeds as source text,
            // writes to canvas buffer, assembles to bytecode at 0x1000. Returns word count in r0.
            if tokens.len() < 2 {
                return Err("LOADSRCIMG requires 1 argument: LOADSRCIMG path_reg".to_string());
            }
            bytecode.push(0xB2);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "ASM_RAM" => {
            // ASM_RAM src_addr_reg
            // 2 words: [0xB3, src_addr_reg]
            // Reads null-terminated assembly source from RAM at src_addr_reg,
            // assembles to bytecode at 0x1000. Auto-strips ```asm fences.
            // Status: RAM[0xFFD] = word count (success) or 0xFFFFFFFF (error).
            if tokens.len() < 2 {
                return Err("ASM_RAM requires 1 argument: ASM_RAM src_addr_reg".to_string());
            }
            bytecode.push(0xB3);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // ── Phase 123: Alpine Linux Live Tile Opcodes ──
        "VM_LIVE_SPAWN" => {
            // VM_LIVE_SPAWN config_reg, window_reg
            // 3 words: [0xB4, config_reg, window_reg]
            if tokens.len() < 3 {
                return Err(
                    "VM_LIVE_SPAWN requires 2 arguments: VM_LIVE_SPAWN config_reg, window_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xB4);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "VM_LIVE_STEP" => {
            // VM_LIVE_STEP (no args)
            // 1 word: [0xB5]
            bytecode.push(0xB5);
            Ok(Some(()))
        }

        "VM_LIVE_KILL" => {
            // VM_LIVE_KILL (no args)
            // 1 word: [0xB6]
            bytecode.push(0xB6);
            Ok(Some(()))
        }

        "HERMES" => {
            // HERMES prompt_addr_reg, response_addr_reg, max_len_reg (0xA8)
            // Call the Hermes Agent CLI with a prompt, write response to RAM.
            if tokens.len() != 4 {
                return Err(
                    "HERMES requires 3 arguments: HERMES prompt_addr_reg, response_addr_reg, max_len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xA8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "PTYOPEN" => {
            // PTYOPEN cmd_addr_reg, handle_reg (0xA9)
            // Spawn a host shell (or the command at cmd_addr) inside a pty.
            // Slot index written to handle_reg; r0 = PTY_OK or error code.
            if tokens.len() != 3 {
                return Err(
                    "PTYOPEN requires 2 arguments: PTYOPEN cmd_addr_reg, handle_reg".to_string(),
                );
            }
            bytecode.push(0xA9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        "PTYWRITE" => {
            // PTYWRITE handle_reg, buf_reg, len_reg (0xAA)
            if tokens.len() != 4 {
                return Err(
                    "PTYWRITE requires 3 arguments: PTYWRITE handle_reg, buf_reg, len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xAA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "PTYREAD" => {
            // PTYREAD handle_reg, buf_reg, max_len_reg (0xAB)
            // Drains pending bytes; r0 = bytes drained or 0xFFFFFFFF on close.
            if tokens.len() != 4 {
                return Err(
                    "PTYREAD requires 3 arguments: PTYREAD handle_reg, buf_reg, max_len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xAB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "PTYCLOSE" => {
            // PTYCLOSE handle_reg (0xAC)
            if tokens.len() != 2 {
                return Err("PTYCLOSE requires 1 argument: PTYCLOSE handle_reg".to_string());
            }
            bytecode.push(0xAC);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "PTYSIZE" => {
            // PTYSIZE handle_reg, rows_reg, cols_reg (0xAD)
            if tokens.len() != 4 {
                return Err(
                    "PTYSIZE requires 3 arguments: PTYSIZE handle_reg, rows_reg, cols_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xAD);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "UNLINK" => {
            if tokens.len() < 2 {
                return Err("UNLINK requires 1 argument: UNLINK name_reg".to_string());
            }
            bytecode.push(0xB7);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        "FCOPY" => {
            if tokens.len() < 3 {
                return Err(
                    "FCOPY requires 2 arguments: FCOPY src_name_reg, dst_name_reg".to_string(),
                );
            }
            bytecode.push(0xB8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // ── Phase 137: Host Filesystem Bridge ─────────────────────────────
        "FSOPEN" => {
            if tokens.len() < 3 {
                return Err("FSOPEN requires 2 arguments: FSOPEN path_reg, mode_reg".to_string());
            }
            bytecode.push(0xB9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }
        "FSCLOSE" => {
            if tokens.len() < 2 {
                return Err("FSCLOSE requires 1 argument: FSCLOSE handle_reg".to_string());
            }
            bytecode.push(0xBA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }
        "FSREAD" => {
            if tokens.len() < 4 {
                return Err(
                    "FSREAD requires 3 arguments: FSREAD handle_reg, buf_reg, len_reg".to_string(),
                );
            }
            bytecode.push(0xBB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }
        "FSWRITE" => {
            if tokens.len() < 4 {
                return Err(
                    "FSWRITE requires 3 arguments: FSWRITE handle_reg, buf_reg, len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xBC);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }
        "FSLS" => {
            if tokens.len() < 4 {
                return Err(
                    "FSLS requires 3 arguments: FSLS path_reg, buf_reg, max_len_reg".to_string(),
                );
            }
            bytecode.push(0xBD);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "NPROC" => {
            bytecode.push(0xBE);
            Ok(Some(()))
        }

        "PROCINFO" => {
            if tokens.len() < 3 {
                return Err(
                    "PROCINFO requires 2 arguments: PROCINFO pid_reg, field_reg".to_string()
                );
            }
            bytecode.push(0xBF);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Spatial instruction patching -- self-modifying code primitives
        "PATCH" => {
            if tokens.len() < 4 {
                return Err(
                    "PATCH requires 3 arguments: PATCH addr_reg, val_reg, mask_reg".to_string(),
                );
            }
            bytecode.push(0xD2);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "PATCHW" => {
            if tokens.len() < 3 {
                return Err("PATCHW requires 2 arguments: PATCHW addr_reg, val_reg".to_string());
            }
            bytecode.push(0xD3);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // PCM audio streaming
        "AUDIO_PLAY" => {
            if tokens.len() < 4 {
                return Err(
                    "AUDIO_PLAY requires 3 arguments: AUDIO_PLAY addr_reg, len_reg, rate_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xD4);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        "AUDIO_STOP" => {
            bytecode.push(0xD5);
            Ok(Some(()))
        }

        "AUDIO_STATUS" => {
            if tokens.len() < 2 {
                return Err("AUDIO_STATUS requires 1 argument: AUDIO_STATUS reg".to_string());
            }
            bytecode.push(0xD6);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // Capability management
        "SETCAPS" => {
            if tokens.len() != 2 {
                return Err("SETCAPS requires 1 argument: SETCAPS path_addr_reg".to_string());
            }
            bytecode.push(0xC0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // VFS file stat
        "VSTAT" => {
            if tokens.len() != 2 {
                return Err("VSTAT requires 1 argument: VSTAT name_addr_reg".to_string());
            }
            bytecode.push(0xC1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // Matrix multiply: MATMUL r_dst, r_a, r_b, r_m, r_n, r_k (0xDE)
        // Multiplies MxK matrix A by KxN matrix B, stores MxN result at dst.
        // All values in fixed-point 16.16 format (same as MATVEC).
        "MATMUL" => {
            if tokens.len() < 7 {
                return Err(
                    "MATMUL requires 6 arguments: MATMUL r_dst, r_a, r_b, r_m, r_n, r_k"
                        .to_string(),
                );
            }
            bytecode.push(0xDE);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            bytecode.push(parse_reg(tokens[6])? as u32);
            Ok(Some(()))
        }

        // Bit field extract: BFE rd, rs, width_reg, lsb_reg (0xC2)
        // Extracts `width` bits starting at bit `lsb` from rs, zero-extends into rd.
        "BFE" => {
            if tokens.len() < 5 {
                return Err("BFE requires 4 arguments: BFE rd, rs, width_reg, lsb_reg".to_string());
            }
            bytecode.push(0xC2);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        // Bit field insert: BFI rd, rs, width_reg, lsb_reg (0xC3)
        // Inserts `width` low bits of rs into rd starting at bit `lsb`.
        "BFI" => {
            if tokens.len() < 5 {
                return Err("BFI requires 4 arguments: BFI rd, rs, width_reg, lsb_reg".to_string());
            }
            bytecode.push(0xC3);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        // Set clip rectangle: CLIPSET x_reg, y_reg, w_reg, h_reg (0xC4)
        // Constrains all drawing ops to the given rectangle. Use CLIPCLR to remove.
        "CLIPSET" => {
            if tokens.len() < 5 {
                return Err(
                    "CLIPSET requires 4 arguments: CLIPSET x_reg, y_reg, w_reg, h_reg".to_string(),
                );
            }
            bytecode.push(0xC4);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        // Clear clip rectangle: CLIPCLR (0xC5)
        // Restores full 256x256 drawing area.
        "CLIPCLR" => {
            bytecode.push(0xC5);
            Ok(Some(()))
        }

        // Performance profiling: PROFILE mode_reg, data_reg (0xC6, 3 words)
        // mode=0 MARK: toggle region start/stop (data_reg=region_id 0-15)
        // mode=1 READ: get accumulated count (data_reg=region_id) -> r0
        // mode=2 RESET: clear all regions
        // mode=3 DUMP: write non-zero entries to RAM (data_reg=base addr) -> r0=count
        "PROFILE" => {
            if tokens.len() < 3 {
                return Err("PROFILE requires 2 arguments: PROFILE mode_reg, data_reg".to_string());
            }
            bytecode.push(0xC6);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Conditional move: CMOV rd, rs, cond_reg (0xE0)
        // If cond_reg != 0, copy rs into rd. Otherwise rd unchanged.
        "CMOV" => {
            if tokens.len() < 4 {
                return Err("CMOV requires 3 arguments: CMOV rd, rs, cond_reg".to_string());
            }
            bytecode.push(0xE0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // Conditional select: CSEL rd, rs1, rs2, cond_reg (0xEF)
        // If cond_reg != 0, rd = rs1. Otherwise rd = rs2.
        "CSEL" => {
            if tokens.len() < 5 {
                return Err("CSEL requires 4 arguments: CSEL rd, rs1, rs2, cond_reg".to_string());
            }
            bytecode.push(0xEF);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        // Bitwise NOT: BNOT rd (0xCF)
        // rd = !rd (all bits flipped)
        "BNOT" => {
            if tokens.len() < 2 {
                return Err("BNOT requires 1 argument: BNOT rd".to_string());
            }
            bytecode.push(0xCF);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // Set bit: BSET rd, bit_reg (0xE1)
        // rd = rd | (1 << (bit_reg & 31))
        "BSET" => {
            if tokens.len() < 3 {
                return Err("BSET requires 2 arguments: BSET rd, bit_reg".to_string());
            }
            bytecode.push(0xE1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Clear bit: BCLR rd, bit_reg (0xF0)
        // rd = rd & !(1 << (bit_reg & 31))
        "BCLR" => {
            if tokens.len() < 3 {
                return Err("BCLR requires 2 arguments: BCLR rd, bit_reg".to_string());
            }
            bytecode.push(0xF0);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Test bit: BTST rd, bit_reg (0xF1)
        // Tests bit N of rd. Sets r0 = 1 if set, r0 = 0 if clear. rd unchanged.
        "BTST" => {
            if tokens.len() < 3 {
                return Err("BTST requires 2 arguments: BTST rd, bit_reg".to_string());
            }
            bytecode.push(0xF1);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Copy screen region to clipboard: CLIP_COPY x_reg, y_reg, w_reg, h_reg (0xD7)
        // Stores [width, height, pixels...] in clipboard buffer.
        "CLIP_COPY" => {
            if tokens.len() < 5 {
                return Err(
                    "CLIP_COPY requires 4 arguments: CLIP_COPY x_reg, y_reg, w_reg, h_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xD7);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            Ok(Some(()))
        }

        // Paste clipboard buffer to screen: CLIP_PASTE x_reg, y_reg (0xD8)
        "CLIP_PASTE" => {
            if tokens.len() < 3 {
                return Err("CLIP_PASTE requires 2 arguments: CLIP_PASTE x_reg, y_reg".to_string());
            }
            bytecode.push(0xD8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // Text clipboard operations: CLIP_TEXT mode_reg, addr_reg, len_reg (0xDD)
        // Mode 0: store text from RAM to clipboard; Mode 1: paste text to RAM; Mode 2: get length
        "CLIP_TEXT" => {
            if tokens.len() < 4 {
                return Err(
                    "CLIP_TEXT requires 3 arguments: CLIP_TEXT mode_reg, addr_reg, len_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xDD);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // Clipboard history management: CLIP_HISTORY mode_reg, slot_reg (0xDF)
        // Mode 0: push current; Mode 1: get count; Mode 2: restore slot; Mode 3: clear
        "CLIP_HISTORY" => {
            if tokens.len() < 3 {
                return Err(
                    "CLIP_HISTORY requires 2 arguments: CLIP_HISTORY mode_reg, slot_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xDF);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // ── Infinite Tile Map (0xFF) ──────────────────────────
        // MAP_SET x_reg, y_reg, color_reg  (mode 0)
        "MAP_SET" => {
            if tokens.len() < 4 {
                return Err(
                    "MAP_SET requires 3 arguments: MAP_SET x_reg, y_reg, color_reg".to_string(),
                );
            }
            bytecode.push(0xFF);
            bytecode.push(0); // mode
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // MAP_GET x_reg, y_reg  -> r0  (mode 1)
        "MAP_GET" => {
            if tokens.len() < 3 {
                return Err("MAP_GET requires 2 arguments: MAP_GET x_reg, y_reg".to_string());
            }
            bytecode.push(0xFF);
            bytecode.push(1); // mode
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // MAP_FILL x_reg, y_reg, w_reg, h_reg, color_reg  (mode 2)
        "MAP_FILL" => {
            if tokens.len() < 6 {
                return Err(
                    "MAP_FILL requires 5 arguments: MAP_FILL x_reg, y_reg, w_reg, h_reg, color_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xFF);
            bytecode.push(2); // mode
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        // MAP_SAVE sx_reg, sy_reg, dx_reg, dy_reg, w_reg, h_reg  (mode 3)
        "MAP_SAVE" => {
            if tokens.len() < 7 {
                return Err(
                    "MAP_SAVE requires 6 arguments: MAP_SAVE sx_reg, sy_reg, dx_reg, dy_reg, w_reg, h_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xFF);
            bytecode.push(3); // mode
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            bytecode.push(parse_reg(tokens[6])? as u32);
            Ok(Some(()))
        }

        // MAP_LOAD mx_reg, my_reg, dx_reg, dy_reg, w_reg, h_reg  (mode 4)
        "MAP_LOAD" => {
            if tokens.len() < 7 {
                return Err(
                    "MAP_LOAD requires 6 arguments: MAP_LOAD mx_reg, my_reg, dx_reg, dy_reg, w_reg, h_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xFF);
            bytecode.push(4); // mode
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            bytecode.push(parse_reg(tokens[6])? as u32);
            Ok(Some(()))
        }

        // MAP_FLUSH  (mode 5) -- flush dirty chunks to disk
        "MAP_FLUSH" => {
            bytecode.push(0xFF);
            bytecode.push(5); // mode
            Ok(Some(()))
        }

        // MAP_STATS  (mode 6) -- r0 = chunk count, r1 = total writes
        "MAP_STATS" => {
            bytecode.push(0xFF);
            bytecode.push(6); // mode
            Ok(Some(()))
        }

        // Load sprite data from VFS file: SPRITE_LOAD fn_addr_reg, dest_reg, max_reg (0xD9)
        "SPRITE_LOAD" => {
            if tokens.len() < 4 {
                return Err(
                    "SPRITE_LOAD requires 3 arguments: SPRITE_LOAD fn_addr_reg, dest_addr_reg, max_pixels_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xD9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // Compute sprite frame address: SPRITE_FRAME base_reg, fw_reg, fh_reg, idx_reg, dest_reg (0xDA)
        "SPRITE_FRAME" => {
            if tokens.len() < 6 {
                return Err(
                    "SPRITE_FRAME requires 5 arguments: SPRITE_FRAME base_reg, fw_reg, fh_reg, idx_reg, dest_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xDA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            bytecode.push(parse_reg(tokens[4])? as u32);
            bytecode.push(parse_reg(tokens[5])? as u32);
            Ok(Some(()))
        }

        // Phase 269: Hash Table Opcodes
        // HASHINIT table_id, buckets_reg (0xE2, 3 words)
        "HASHINIT" => {
            if tokens.len() < 3 {
                return Err(
                    "HASHINIT requires 2 arguments: HASHINIT table_id, buckets_reg".to_string(),
                );
            }
            bytecode.push(0xE2);
            bytecode.push(parse_imm(tokens[1], constants)?);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // HASHSET table_id, key_reg, val_reg (0xE3, 4 words)
        "HASHSET" => {
            if tokens.len() < 4 {
                return Err(
                    "HASHSET requires 3 arguments: HASHSET table_id, key_reg, val_reg".to_string(),
                );
            }
            bytecode.push(0xE3);
            bytecode.push(parse_imm(tokens[1], constants)?);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // HASHGET table_id, key_reg, dst_reg (0xE4, 4 words)
        "HASHGET" => {
            if tokens.len() < 4 {
                return Err(
                    "HASHGET requires 3 arguments: HASHGET table_id, key_reg, dst_reg".to_string(),
                );
            }
            bytecode.push(0xE4);
            bytecode.push(parse_imm(tokens[1], constants)?);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // TMR_GET dest_reg (0xE8, 2 words)
        "TMR_GET" => {
            if tokens.len() < 2 {
                return Err("TMR_GET requires 1 argument: TMR_GET dest_reg".to_string());
            }
            bytecode.push(0xE8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // TMR_WAIT ms_reg (0xE9, 2 words)
        "TMR_WAIT" => {
            if tokens.len() < 2 {
                return Err("TMR_WAIT requires 1 argument: TMR_WAIT ms_reg".to_string());
            }
            bytecode.push(0xE9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // ALARM_SET ms_reg, addr_reg, value_reg (0xEA, 4 words)
        "ALARM_SET" => {
            if tokens.len() < 4 {
                return Err(
                    "ALARM_SET requires 3 arguments: ALARM_SET ms_reg, addr_reg, value_reg"
                        .to_string(),
                );
            }
            bytecode.push(0xEA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            bytecode.push(parse_reg(tokens[3])? as u32);
            Ok(Some(()))
        }

        // ALARM_CLR slot_reg (0xEB, 2 words)
        "ALARM_CLR" => {
            if tokens.len() < 2 {
                return Err("ALARM_CLR requires 1 argument: ALARM_CLR slot_reg".to_string());
            }
            bytecode.push(0xEB);
            bytecode.push(parse_reg(tokens[1])? as u32);
            Ok(Some(()))
        }

        // STRLEN dest_reg, addr_reg  (0xF7) -- Count bytes until null terminator
        // Scans RAM at addr, returns length in dest. Max scan: 4096 bytes.
        "STRLEN" => {
            if tokens.len() < 3 {
                return Err("STRLEN requires 2 arguments: STRLEN dest_reg, addr_reg".to_string());
            }
            bytecode.push(0xF7);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // STRCMP addr1_reg, addr2_reg  (0xF8) -- Lexicographic string comparison
        // Result in r0: -1 (s1 < s2), 0 (equal), 1 (s1 > s2). Uses CMP convention.
        "STRCMP" => {
            if tokens.len() < 3 {
                return Err("STRCMP requires 2 arguments: STRCMP addr1_reg, addr2_reg".to_string());
            }
            bytecode.push(0xF8);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // STRCPY dest_reg, src_reg  (0xF9) -- Copy null-terminated string
        // Copies from RAM[src] to RAM[dest], including null terminator.
        "STRCPY" => {
            if tokens.len() < 3 {
                return Err("STRCPY requires 2 arguments: STRCPY dest_reg, src_reg".to_string());
            }
            bytecode.push(0xF9);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        // STRCAT dest_reg, src_reg  (0xFA) -- Append string to destination
        // Finds null in dest, appends src (including null) at that position.
        "STRCAT" => {
            if tokens.len() < 3 {
                return Err("STRCAT requires 2 arguments: STRCAT dest_reg, src_reg".to_string());
            }
            bytecode.push(0xFA);
            bytecode.push(parse_reg(tokens[1])? as u32);
            bytecode.push(parse_reg(tokens[2])? as u32);
            Ok(Some(()))
        }

        _ => Ok(None),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::collections::HashMap;

    fn constants() -> HashMap<String, u32> {
        HashMap::new()
    }

    fn parse_one(opcode: &str, args: &str) -> Vec<u32> {
        let full = format!("{opcode} {args}");
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        try_parse(opcode, &tokens, &mut bytecode, &constants()).unwrap();
        bytecode
    }

    fn parse_one_err(opcode: &str, args: &str) -> String {
        let full = format!("{opcode} {args}");
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        try_parse(opcode, &tokens, &mut bytecode, &constants()).unwrap_err()
    }

    // ── ASM (0x4B) ──────────────────────────────────────────
    #[test]
    fn test_asm_basic() {
        let bc = parse_one("ASM", "r1, r2");
        assert_eq!(bc, vec![0x4B, 1, 2]);
    }

    #[test]
    fn test_asm_too_few() {
        let err = parse_one_err("ASM", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── SPAWN (0x4D) ────────────────────────────────────────
    #[test]
    fn test_spawn_basic() {
        let bc = parse_one("SPAWN", "r5");
        assert_eq!(bc, vec![0x4D, 5]);
    }

    #[test]
    fn test_spawn_too_few() {
        let err = parse_one_err("SPAWN", "");
        assert!(err.contains("1 argument"));
    }

    // ── KILL (0x4E) ─────────────────────────────────────────
    #[test]
    fn test_kill_basic() {
        let bc = parse_one("KILL", "r10");
        assert_eq!(bc, vec![0x4E, 10]);
    }

    #[test]
    fn test_kill_too_few() {
        let err = parse_one_err("KILL", "");
        assert!(err.contains("1 argument"));
    }

    // ── SYSCALL (0x52) ──────────────────────────────────────
    #[test]
    fn test_syscall_basic() {
        let bc = parse_one("SYSCALL", "42");
        assert_eq!(bc, vec![0x52, 42]);
    }

    #[test]
    fn test_syscall_hex() {
        let bc = parse_one("SYSCALL", "0xFF");
        assert_eq!(bc, vec![0x52, 0xFF]);
    }

    #[test]
    fn test_syscall_too_few() {
        let err = parse_one_err("SYSCALL", "");
        assert!(err.contains("1 argument"));
    }

    // ── RETK (0x53) ─────────────────────────────────────────
    #[test]
    fn test_retk_no_args() {
        let bc = parse_one("RETK", "");
        assert_eq!(bc, vec![0x53]);
    }

    // ── OPEN (0x54) ─────────────────────────────────────────
    #[test]
    fn test_open_basic() {
        let bc = parse_one("OPEN", "r1, r2");
        assert_eq!(bc, vec![0x54, 1, 2]);
    }

    #[test]
    fn test_open_too_few() {
        let err = parse_one_err("OPEN", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── READ (0x55) ─────────────────────────────────────────
    #[test]
    fn test_read_basic() {
        let bc = parse_one("READ", "r1, r2, r3");
        assert_eq!(bc, vec![0x55, 1, 2, 3]);
    }

    #[test]
    fn test_read_too_few() {
        let err = parse_one_err("READ", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── WRITE (0x56) ────────────────────────────────────────
    #[test]
    fn test_write_basic() {
        let bc = parse_one("WRITE", "r4, r5, r6");
        assert_eq!(bc, vec![0x56, 4, 5, 6]);
    }

    #[test]
    fn test_write_too_few() {
        let err = parse_one_err("WRITE", "r4, r5");
        assert!(err.contains("3 arguments"));
    }

    // ── CLOSE (0x57) ────────────────────────────────────────
    #[test]
    fn test_close_basic() {
        let bc = parse_one("CLOSE", "r3");
        assert_eq!(bc, vec![0x57, 3]);
    }

    #[test]
    fn test_close_too_few() {
        let err = parse_one_err("CLOSE", "");
        assert!(err.contains("1 argument"));
    }

    // ── SEEK (0x58) ─────────────────────────────────────────
    #[test]
    fn test_seek_basic() {
        let bc = parse_one("SEEK", "r1, r2, r3");
        assert_eq!(bc, vec![0x58, 1, 2, 3]);
    }

    #[test]
    fn test_seek_too_few() {
        let err = parse_one_err("SEEK", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── LS (0x59) ───────────────────────────────────────────
    #[test]
    fn test_ls_basic() {
        let bc = parse_one("LS", "r5");
        assert_eq!(bc, vec![0x59, 5]);
    }

    #[test]
    fn test_ls_too_few() {
        let err = parse_one_err("LS", "");
        assert!(err.contains("1 argument"));
    }

    // ── YIELD (0x5A) ────────────────────────────────────────
    #[test]
    fn test_yield_no_args() {
        let bc = parse_one("YIELD", "");
        assert_eq!(bc, vec![0x5A]);
    }

    // ── SLEEP (0x5B) ────────────────────────────────────────
    #[test]
    fn test_sleep_basic() {
        let bc = parse_one("SLEEP", "r10");
        assert_eq!(bc, vec![0x5B, 10]);
    }

    #[test]
    fn test_sleep_too_few() {
        let err = parse_one_err("SLEEP", "");
        assert!(err.contains("1 argument"));
    }

    // ── SETPRIORITY (0x5C) ──────────────────────────────────
    #[test]
    fn test_setpriority_basic() {
        let bc = parse_one("SETPRIORITY", "r7");
        assert_eq!(bc, vec![0x5C, 7]);
    }

    #[test]
    fn test_setpriority_too_few() {
        let err = parse_one_err("SETPRIORITY", "");
        assert!(err.contains("1 argument"));
    }

    // ── PIPE (0x5D) ─────────────────────────────────────────
    #[test]
    fn test_pipe_basic() {
        let bc = parse_one("PIPE", "r3, r4");
        assert_eq!(bc, vec![0x5D, 3, 4]);
    }

    #[test]
    fn test_pipe_too_few() {
        let err = parse_one_err("PIPE", "r3");
        assert!(err.contains("2 arguments"));
    }

    // ── MSGSND (0x5E) ───────────────────────────────────────
    #[test]
    fn test_msgsnd_basic() {
        let bc = parse_one("MSGSND", "r8");
        assert_eq!(bc, vec![0x5E, 8]);
    }

    #[test]
    fn test_msgsnd_too_few() {
        let err = parse_one_err("MSGSND", "");
        assert!(err.contains("1 argument"));
    }

    // ── MSGRCV (0x5F) ───────────────────────────────────────
    #[test]
    fn test_msgrcv_no_args() {
        let bc = parse_one("MSGRCV", "");
        assert_eq!(bc, vec![0x5F]);
    }

    // ── GETPID (0x65) ───────────────────────────────────────
    #[test]
    fn test_getpid_no_args() {
        let bc = parse_one("GETPID", "");
        assert_eq!(bc, vec![0x65]);
    }

    // ── EXEC (0x66) ─────────────────────────────────────────
    #[test]
    fn test_exec_basic() {
        let bc = parse_one("EXEC", "r1");
        assert_eq!(bc, vec![0x66, 1]);
    }

    #[test]
    fn test_exec_too_few() {
        let err = parse_one_err("EXEC", "");
        assert!(err.contains("1 argument"));
    }

    // ── WAITPID (0x69) ──────────────────────────────────────
    #[test]
    fn test_waitpid_basic() {
        let bc = parse_one("WAITPID", "r5");
        assert_eq!(bc, vec![0x69, 5]);
    }

    #[test]
    fn test_waitpid_too_few() {
        let err = parse_one_err("WAITPID", "");
        assert!(err.contains("1 argument"));
    }

    // ── EXECP (0x6A) ────────────────────────────────────────
    #[test]
    fn test_execp_basic() {
        let bc = parse_one("EXECP", "r1, r2, r3");
        assert_eq!(bc, vec![0x6A, 1, 2, 3]);
    }

    #[test]
    fn test_execp_too_few() {
        let err = parse_one_err("EXECP", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── CHDIR (0x6B) ────────────────────────────────────────
    #[test]
    fn test_chdir_basic() {
        let bc = parse_one("CHDIR", "r5");
        assert_eq!(bc, vec![0x6B, 5]);
    }

    #[test]
    fn test_chdir_too_few() {
        let err = parse_one_err("CHDIR", "");
        assert!(err.contains("1 argument"));
    }

    // ── GETCWD (0x6C) ───────────────────────────────────────
    #[test]
    fn test_getcwd_basic() {
        let bc = parse_one("GETCWD", "r5");
        assert_eq!(bc, vec![0x6C, 5]);
    }

    #[test]
    fn test_getcwd_too_few() {
        let err = parse_one_err("GETCWD", "");
        assert!(err.contains("1 argument"));
    }

    // ── SHUTDOWN (0x6E) ─────────────────────────────────────
    #[test]
    fn test_shutdown_no_args() {
        let bc = parse_one("SHUTDOWN", "");
        assert_eq!(bc, vec![0x6E]);
    }

    // ── EXIT (0x6F) ─────────────────────────────────────────
    #[test]
    fn test_exit_basic() {
        let bc = parse_one("EXIT", "r0");
        assert_eq!(bc, vec![0x6F, 0]);
    }

    #[test]
    fn test_exit_too_few() {
        let err = parse_one_err("EXIT", "");
        assert!(err.contains("1 argument"));
    }

    // ── SIGNAL (0x70) ───────────────────────────────────────
    #[test]
    fn test_signal_basic() {
        let bc = parse_one("SIGNAL", "r3, r4");
        assert_eq!(bc, vec![0x70, 3, 4]);
    }

    #[test]
    fn test_signal_too_few() {
        let err = parse_one_err("SIGNAL", "r3");
        assert!(err.contains("2 arguments"));
    }

    // ── SIGSET (0x71) ───────────────────────────────────────
    #[test]
    fn test_sigset_basic() {
        let bc = parse_one("SIGSET", "r2, r5");
        assert_eq!(bc, vec![0x71, 2, 5]);
    }

    #[test]
    fn test_sigset_too_few() {
        let err = parse_one_err("SIGSET", "r2");
        assert!(err.contains("2 arguments"));
    }

    // ── HYPERVISOR (0x72) ───────────────────────────────────
    #[test]
    fn test_hypervisor_one_arg() {
        let bc = parse_one("HYPERVISOR", "r1");
        // Optional second arg defaults to r0
        assert_eq!(bc, vec![0x72, 1, 0]);
    }

    #[test]
    fn test_hypervisor_two_args() {
        let bc = parse_one("HYPERVISOR", "r1, r2");
        assert_eq!(bc, vec![0x72, 1, 2]);
    }

    #[test]
    fn test_hypervisor_too_few() {
        let err = parse_one_err("HYPERVISOR", "");
        assert!(err.contains("1-2 arguments"));
    }

    // ── ASMSELF (0x73) ──────────────────────────────────────
    #[test]
    fn test_asmself_no_args() {
        let bc = parse_one("ASMSELF", "");
        assert_eq!(bc, vec![0x73]);
    }

    // ── RUNNEXT (0x74) ──────────────────────────────────────
    #[test]
    fn test_runnext_no_args() {
        let bc = parse_one("RUNNEXT", "");
        assert_eq!(bc, vec![0x74]);
    }

    // ── IOCTL (0x62) ────────────────────────────────────────
    #[test]
    fn test_ioctl_basic() {
        let bc = parse_one("IOCTL", "r1, r2, r3");
        assert_eq!(bc, vec![0x62, 1, 2, 3]);
    }

    #[test]
    fn test_ioctl_too_few() {
        let err = parse_one_err("IOCTL", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── PROFILE (0xC6) ──────────────────────────────────────
    #[test]
    fn test_profile_basic() {
        let bc = parse_one("PROFILE", "r1, r2");
        assert_eq!(bc, vec![0xC6, 1, 2]);
    }

    #[test]
    fn test_profile_too_few() {
        let err = parse_one_err("PROFILE", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── ABS (0x87) ──────────────────────────────────────────
    #[test]
    fn test_abs_basic() {
        let bc = parse_one("ABS", "r5");
        assert_eq!(bc, vec![0x87, 5]);
    }

    #[test]
    fn test_abs_too_few() {
        let err = parse_one_err("ABS", "");
        assert!(err.contains("1 argument"));
    }

    // ── MIN (0x89) ──────────────────────────────────────────
    #[test]
    fn test_min_basic() {
        let bc = parse_one("MIN", "r1, r2");
        assert_eq!(bc, vec![0x89, 1, 2]);
    }

    #[test]
    fn test_min_too_few() {
        let err = parse_one_err("MIN", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── MAX (0x8A) ──────────────────────────────────────────
    #[test]
    fn test_max_basic() {
        let bc = parse_one("MAX", "r3, r4");
        assert_eq!(bc, vec![0x8A, 3, 4]);
    }

    #[test]
    fn test_max_too_few() {
        let err = parse_one_err("MAX", "r3");
        assert!(err.contains("2 arguments"));
    }

    // ── CLAMP (0x8B) ───────────────────────────────────────
    #[test]
    fn test_clamp_basic() {
        let bc = parse_one("CLAMP", "r1, r2, r3");
        assert_eq!(bc, vec![0x8B, 1, 2, 3]);
    }

    #[test]
    fn test_clamp_too_few() {
        let err = parse_one_err("CLAMP", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── BITSET (0x8D) ──────────────────────────────────────
    #[test]
    fn test_bitset_basic() {
        let bc = parse_one("BITSET", "r1, r5");
        assert_eq!(bc, vec![0x8D, 1, 5]);
    }

    #[test]
    fn test_bitset_too_few() {
        let err = parse_one_err("BITSET", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── BITCLR (0x8E) ──────────────────────────────────────
    #[test]
    fn test_bitclr_basic() {
        let bc = parse_one("BITCLR", "r2, r7");
        assert_eq!(bc, vec![0x8E, 2, 7]);
    }

    #[test]
    fn test_bitclr_too_few() {
        let err = parse_one_err("BITCLR", "r2");
        assert!(err.contains("2 arguments"));
    }

    // ── BITTEST (0x8F) ─────────────────────────────────────
    #[test]
    fn test_bittest_basic() {
        let bc = parse_one("BITTEST", "r3, r0");
        assert_eq!(bc, vec![0x8F, 3, 0]);
    }

    #[test]
    fn test_bittest_too_few() {
        let err = parse_one_err("BITTEST", "r3");
        assert!(err.contains("2 arguments"));
    }

    // ── NOT (0x90) ──────────────────────────────────────────
    #[test]
    fn test_not_basic() {
        let bc = parse_one("NOT", "r10");
        assert_eq!(bc, vec![0x90, 10]);
    }

    #[test]
    fn test_not_too_few() {
        let err = parse_one_err("NOT", "");
        assert!(err.contains("1 argument"));
    }

    // ── INV (0x91) ──────────────────────────────────────────
    #[test]
    fn test_inv_no_args() {
        let bc = parse_one("INV", "");
        assert_eq!(bc, vec![0x91]);
    }

    // ── MATVEC (0x92) ───────────────────────────────────────
    #[test]
    fn test_matvec_basic() {
        let bc = parse_one("MATVEC", "r1, r2, r3, r4, r5");
        assert_eq!(bc, vec![0x92, 1, 2, 3, 4, 5]);
    }

    #[test]
    fn test_matvec_too_few() {
        let err = parse_one_err("MATVEC", "r1, r2, r3, r4");
        assert!(err.contains("5 arguments"));
    }

    // ── RELU (0x93) ─────────────────────────────────────────
    #[test]
    fn test_relu_basic() {
        let bc = parse_one("RELU", "r8");
        assert_eq!(bc, vec![0x93, 8]);
    }

    #[test]
    fn test_relu_too_few() {
        let err = parse_one_err("RELU", "");
        assert!(err.contains("1 argument"));
    }

    // ── MATMUL (0xDE) ──────────────────────────────────────
    #[test]
    fn test_matmul_basic() {
        let bc = parse_one("MATMUL", "r1, r2, r3, r4, r5, r6");
        assert_eq!(bc, vec![0xDE, 1, 2, 3, 4, 5, 6]);
    }

    #[test]
    fn test_matmul_too_few() {
        let err = parse_one_err("MATMUL", "r1, r2, r3, r4, r5");
        assert!(err.contains("6 arguments"));
    }

    // ── BFE (0xC2) ──────────────────────────────────────────
    #[test]
    fn test_bfe_basic() {
        let bc = parse_one("BFE", "r1, r2, r3, r4");
        assert_eq!(bc, vec![0xC2, 1, 2, 3, 4]);
    }

    #[test]
    fn test_bfe_too_few() {
        let err = parse_one_err("BFE", "r1, r2, r3");
        assert!(err.contains("4 arguments"));
    }

    // ── BFI (0xC3) ──────────────────────────────────────────
    #[test]
    fn test_bfi_basic() {
        let bc = parse_one("BFI", "r5, r6, r7, r8");
        assert_eq!(bc, vec![0xC3, 5, 6, 7, 8]);
    }

    #[test]
    fn test_bfi_too_few() {
        let err = parse_one_err("BFI", "r5, r6, r7");
        assert!(err.contains("4 arguments"));
    }

    // ── CLIPSET (0xC4) ──────────────────────────────────────
    #[test]
    fn test_clipset_basic() {
        let bc = parse_one("CLIPSET", "r1, r2, r3, r4");
        assert_eq!(bc, vec![0xC4, 1, 2, 3, 4]);
    }

    #[test]
    fn test_clipset_too_few() {
        let err = parse_one_err("CLIPSET", "r1, r2, r3");
        assert!(err.contains("4 arguments"));
    }

    // ── CLIPCLR (0xC5) ──────────────────────────────────────
    #[test]
    fn test_clipclr_no_args() {
        let bc = parse_one("CLIPCLR", "");
        assert_eq!(bc, vec![0xC5]);
    }

    // ── CMOV (0xE0) ─────────────────────────────────────────
    #[test]
    fn test_cmov_basic() {
        let bc = parse_one("CMOV", "r1, r2, r3");
        assert_eq!(bc, vec![0xE0, 1, 2, 3]);
    }

    #[test]
    fn test_cmov_too_few() {
        let err = parse_one_err("CMOV", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── CSEL (0xEF) ─────────────────────────────────────────
    #[test]
    fn test_csel_basic() {
        let bc = parse_one("CSEL", "r1, r2, r3, r4");
        assert_eq!(bc, vec![0xEF, 1, 2, 3, 4]);
    }

    #[test]
    fn test_csel_too_few() {
        let err = parse_one_err("CSEL", "r1, r2, r3");
        assert!(err.contains("4 arguments"));
    }

    // ── BNOT (0xCF) ─────────────────────────────────────────
    #[test]
    fn test_bnot_basic() {
        let bc = parse_one("BNOT", "r15");
        assert_eq!(bc, vec![0xCF, 15]);
    }

    #[test]
    fn test_bnot_too_few() {
        let err = parse_one_err("BNOT", "");
        assert!(err.contains("1 argument"));
    }

    // ── BSET (0xE1) ─────────────────────────────────────────
    #[test]
    fn test_bset_basic() {
        let bc = parse_one("BSET", "r1, r5");
        assert_eq!(bc, vec![0xE1, 1, 5]);
    }

    #[test]
    fn test_bset_too_few() {
        let err = parse_one_err("BSET", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── BCLR (0xF0) ─────────────────────────────────────────
    #[test]
    fn test_bclr_basic() {
        let bc = parse_one("BCLR", "r3, r7");
        assert_eq!(bc, vec![0xF0, 3, 7]);
    }

    #[test]
    fn test_bclr_too_few() {
        let err = parse_one_err("BCLR", "r3");
        assert!(err.contains("2 arguments"));
    }

    // ── BTST (0xF1) ─────────────────────────────────────────
    #[test]
    fn test_btst_basic() {
        let bc = parse_one("BTST", "r4, r0");
        assert_eq!(bc, vec![0xF1, 4, 0]);
    }

    #[test]
    fn test_btst_too_few() {
        let err = parse_one_err("BTST", "r4");
        assert!(err.contains("2 arguments"));
    }

    // ── AI_INJECT (0xA6) ────────────────────────────────────
    #[test]
    fn test_ai_inject_basic() {
        let bc = parse_one("AI_INJECT", "r10");
        assert_eq!(bc, vec![0xA6, 10]);
    }

    #[test]
    fn test_ai_inject_too_few() {
        let err = parse_one_err("AI_INJECT", "");
        assert!(err.contains("1 argument"));
    }

    // ── AI_AGENT (0xB0) ─────────────────────────────────────
    #[test]
    fn test_ai_agent_basic() {
        let bc = parse_one("AI_AGENT", "r5");
        assert_eq!(bc, vec![0xB0, 5]);
    }

    #[test]
    fn test_ai_agent_too_few() {
        let err = parse_one_err("AI_AGENT", "");
        assert!(err.contains("1 argument"));
    }

    // ── SCREENA (0xB0 sentinel) ─────────────────────────────
    #[test]
    fn test_screena_basic() {
        let bc = parse_one("SCREENA", "r3");
        assert_eq!(bc, vec![0xB0, 0xFF, 3]);
    }

    #[test]
    fn test_screena_too_few() {
        let err = parse_one_err("SCREENA", "");
        assert!(err.contains("1 argument"));
    }

    // ── AUDIO_PLAY (0xD4) ───────────────────────────────────
    #[test]
    fn test_audio_play_basic() {
        let bc = parse_one("AUDIO_PLAY", "r1, r2, r3");
        assert_eq!(bc, vec![0xD4, 1, 2, 3]);
    }

    #[test]
    fn test_audio_play_too_few() {
        let err = parse_one_err("AUDIO_PLAY", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── AUDIO_STOP (0xD5) ───────────────────────────────────
    #[test]
    fn test_audio_stop_no_args() {
        let bc = parse_one("AUDIO_STOP", "");
        assert_eq!(bc, vec![0xD5]);
    }

    // ── AUDIO_STATUS (0xD6) ─────────────────────────────────
    #[test]
    fn test_audio_status_basic() {
        let bc = parse_one("AUDIO_STATUS", "r7");
        assert_eq!(bc, vec![0xD6, 7]);
    }

    #[test]
    fn test_audio_status_too_few() {
        let err = parse_one_err("AUDIO_STATUS", "");
        assert!(err.contains("1 argument"));
    }

    // ── WRITESTR (0x67) ─────────────────────────────────────
    #[test]
    fn test_writestr_basic() {
        let bc = parse_one("WRITESTR", "r1, r2");
        assert_eq!(bc, vec![0x67, 1, 2]);
    }

    #[test]
    fn test_writestr_too_few() {
        let err = parse_one_err("WRITESTR", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── READLN (0x68) ───────────────────────────────────────
    #[test]
    fn test_readln_basic() {
        let bc = parse_one("READLN", "r1, r2, r3");
        assert_eq!(bc, vec![0x68, 1, 2, 3]);
    }

    #[test]
    fn test_readln_too_few() {
        let err = parse_one_err("READLN", "r1, r2");
        assert!(err.contains("3 arguments"));
    }

    // ── MTEXINIT (0x05) ─────────────────────────────────────
    #[test]
    fn test_mtexist_basic() {
        let bc = parse_one("MTEXINIT", "r10");
        assert_eq!(bc, vec![0x05, 10]);
    }

    #[test]
    fn test_mtexist_too_few() {
        let err = parse_one_err("MTEXINIT", "");
        assert!(err.contains("1 argument"));
    }

    // ── SEMINIT (0x08) ──────────────────────────────────────
    #[test]
    fn test_seminit_basic() {
        let bc = parse_one("SEMINIT", "r1, r2");
        assert_eq!(bc, vec![0x08, 1, 2]);
    }

    #[test]
    fn test_seminit_too_few() {
        let err = parse_one_err("SEMINIT", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── HASHINIT (0xE2) ─────────────────────────────────────
    #[test]
    fn test_hashinit_basic() {
        let bc = parse_one("HASHINIT", "0, r5");
        assert_eq!(bc, vec![0xE2, 0, 5]);
    }

    #[test]
    fn test_hashinit_too_few() {
        let err = parse_one_err("HASHINIT", "0");
        assert!(err.contains("2 arguments"));
    }

    // ── HASHSET (0xE3) ──────────────────────────────────────
    #[test]
    fn test_hashset_basic() {
        let bc = parse_one("HASHSET", "1, r3, r4");
        assert_eq!(bc, vec![0xE3, 1, 3, 4]);
    }

    // ── HASHGET (0xE4) ──────────────────────────────────────
    #[test]
    fn test_hashget_basic() {
        let bc = parse_one("HASHGET", "2, r5, r6");
        assert_eq!(bc, vec![0xE4, 2, 5, 6]);
    }

    // ── STRLEN (0xF7) ───────────────────────────────────────
    #[test]
    fn test_strlen_basic() {
        let bc = parse_one("STRLEN", "r1, r2");
        assert_eq!(bc, vec![0xF7, 1, 2]);
    }

    #[test]
    fn test_strlen_too_few() {
        let err = parse_one_err("STRLEN", "r1");
        assert!(err.contains("2 arguments"));
    }

    // ── STRCMP (0xF8) ───────────────────────────────────────
    #[test]
    fn test_strcmp_basic() {
        let bc = parse_one("STRCMP", "r3, r4");
        assert_eq!(bc, vec![0xF8, 3, 4]);
    }

    // ── STRCPY (0xF9) ───────────────────────────────────────
    #[test]
    fn test_strcpy_basic() {
        let bc = parse_one("STRCPY", "r5, r6");
        assert_eq!(bc, vec![0xF9, 5, 6]);
    }

    // ── STRCAT (0xFA) ───────────────────────────────────────
    #[test]
    fn test_strcat_basic() {
        let bc = parse_one("STRCAT", "r7, r8");
        assert_eq!(bc, vec![0xFA, 7, 8]);
    }

    // ── High register boundary (r31) ────────────────────────
    #[test]
    fn test_spawn_r31() {
        let bc = parse_one("SPAWN", "r31");
        assert_eq!(bc, vec![0x4D, 31]);
    }

    #[test]
    fn test_read_high_regs() {
        let bc = parse_one("READ", "r30, r29, r28");
        assert_eq!(bc, vec![0x55, 30, 29, 28]);
    }

    // ── Unknown opcode returns None ─────────────────────────
    #[test]
    fn test_unknown_opcode_returns_none() {
        let full = "ZZZTOP r1";
        let tokens: Vec<&str> = full
            .split(|c: char| c.is_whitespace() || c == ',')
            .filter(|s| !s.is_empty())
            .collect();
        let mut bytecode = Vec::new();
        let result = try_parse("ZZZTOP", &tokens, &mut bytecode, &constants()).unwrap();
        assert!(result.is_none());
        assert!(bytecode.is_empty());
    }
}
