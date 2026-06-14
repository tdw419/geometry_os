; repair_agent.asm -- Autonomous Maintenance Routine (Phase 34.3)
;
; This program is the "hands" of the Area Vision System. The host-side
; AreaManager writes repair tasks to RAM at the Agent Table (0x7950+).
; This agent polls its entry, dispatches SUBSTRATE_PATCH commands to
; fix issues, and writes STATUS_DONE back to RAM for the host to read.
;
; Agent RAM layout (16 bytes per agent at 0x7950):
;   +0: target_x (i32)  +1: target_y (i32)
;   +2: status    (u32) +3: task_type (u32)
;   +4: home_x    (i32) +5: home_y    (i32)
;   +6: sector_w  (u32) +7: sector_h  (u32)
;
; Substrate MMIO:
;   0xE000: substrate_x (R/W)
;   0xE001: substrate_y (R/W)
;   0xE004: substrate_cmd   -- 0x09 = SUBSTRATE_PATCH
;   0xE005: substrate_arg1  -- color value for PATCH
;   0xE007: substrate_status -- poll until 2 (done)
;
; This agent handles its own slot based on PID (PID 1 handles Slot 0, etc.)

#define AGENT_BASE 0x7950
#define AGENT_SIZE 0x10
#define STATUS_REPAIRING 2
#define STATUS_DONE 3
#define TASK_PRUNE_NOISE 1
#define TASK_REPAIR_WIRE 2
#define TASK_REINFORCE 3
#define SUB_X 0xE000
#define SUB_Y 0xE001
#define SUB_CMD 0xE004
#define SUB_ARG1 0xE005
#define SUB_STATUS 0xE007
#define CMD_PATCH 9

:main
    ; Determine agent slot: (PID - 1) % 8
    GETPID r0
    MOV r1, r0
    LDI r2, 1
    SUB r1, r2              ; r1 = PID - 1
    LDI r2, 7
    AND r1, r2              ; r1 = slot index (0-7)
    
    ; Compute RAM entry: AGENT_BASE + slot * AGENT_SIZE
    LDI r2, AGENT_SIZE
    MUL r1, r2
    LDI r2, AGENT_BASE
    ADD r1, r2              ; r1 = base of my RAM entry

:poll
    ; Compute status field address: r1 + 2
    LDI r10, 2
    ADD r10, r1             ; r10 = entry base + 2
    LOAD r5, r10            ; r5 = RAM[status field] = current status

    ; If status != REPAIRING, keep polling
    CMPI r5, STATUS_REPAIRING
    JNZ r0, :poll

    ; --- We have a repair task. Load task parameters. ---
    LOAD r6, r1             ; r6 = target_x (offset 0)

    LDI r10, 1
    ADD r10, r1             ; r10 = AGENT_BASE + 1
    LOAD r7, r10            ; r7 = target_y (offset 1)

    LDI r10, 3
    ADD r10, r1             ; r10 = AGENT_BASE + 3
    LOAD r8, r10            ; r8 = task_type (offset 3)

    ; --- Dispatch based on task_type ---
    CMPI r8, TASK_PRUNE_NOISE
    JZ r0, :prune

    CMPI r8, TASK_REPAIR_WIRE
    JZ r0, :fix_wire

    CMPI r8, TASK_REINFORCE
    JZ r0, :reinforce

    ; Unknown task -- skip and mark done
    JMP :mark_done

:prune
    ; Erase the noise pixel (set to 0 = empty)
    LDI r9, 0
    JMP :do_patch

:fix_wire
    ; Restore wire: TAX_WIRE(14) << 28 | DIR_RIGHT(0) << 24 | 0x00FF00
    ; = 0xE000FF00
    LDI r9, 0xE000FF00
    JMP :do_patch

:reinforce
    ; Reinforce with signal: TAX_SIGNAL(12) << 28 | DIR_RIGHT(0) << 24 | 0xFFFF00
    ; = 0xC000FFFF
    LDI r9, 0xC000FFFF

:do_patch
    ; Set substrate_x = target_x
    LDI r29, SUB_X
    STORE r29, r6

    ; Set substrate_y = target_y
    LDI r29, SUB_Y
    STORE r29, r7

    ; Set substrate_arg1 = color value
    LDI r29, SUB_ARG1
    STORE r29, r9

    ; Fire SUBSTRATE_PATCH (cmd 9)
    LDI r29, SUB_CMD
    LDI r10, CMD_PATCH
    STORE r29, r10

    ; Poll substrate_status until done (2)
:wait_patch
    LDI r29, SUB_STATUS
    LOAD r11, r29
    CMPI r11, 2
    JNZ r11, :wait_patch

:mark_done
    ; Write STATUS_DONE back to RAM so host can see it
    LDI r10, 2
    ADD r10, r1             ; r10 = AGENT_BASE + 2 (status field)
    LDI r12, STATUS_DONE
    STORE r10, r12

    ; Back to polling for next task
    JMP :poll
