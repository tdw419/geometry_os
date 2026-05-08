; DESCRIPTION: This GeOS assembly code demonstrates timeline forking by drawing a blue gradient on the top rows of the screen. After saving a snapshot, it checks the snapshot count to distinguish between two timelines: one that draws red and restores to the original state, and another that draws green and halts. The snapshots vector survives across forks, allowing the program to track which timeline is executing.

; fork_demo.asm -- Phase 38d: Timeline Forking Demo
;
; Visual proof of timeline forking. After FORK restore, all RAM and
; registers are rewound, but the snapshots Vec survives.
;
; Structure:
;   draw_blue (always)
;   save snapshot (always -- but after restore, count will be >0)
;   check timeline and branch
;     timeline 1: draw red, wait, restore -> jumps back here
;     timeline 2: draw green, wait, halt

    ; --- Draw blue gradient on top rows (0..199) ---
    LDI r8, 0
.draw_blue:
    LDI r4, 200
    CMP r8, r4
    BGE r2, .blue_done
    LDI r5, 0
.draw_blue_x:
    LDI r12, 256
    CMP r5, r12
    BGE r2, .blue_next
    MOV r10, r8
    SHLI r10, 16
    ORI r10, 0xFF000000
    PSET r5, r8, r10
    ADDI r5, 1
    JMP .draw_blue_x
.blue_next:
    ADDI r8, 1
    JMP .draw_blue
.blue_done:

    ; --- Save snapshot ---
    ; This is the FORK POINT. After restore, execution resumes here.
    LDI r11, 0             ; mode = save
    FORK r11
    ; r2 = slot index
    ; After restore from this snapshot, PC = right here.

    ; --- Which timeline? Check snapshot count ---
    LDI r11, 2             ; mode = list count
    FORK r11
    ; Timeline 1: count = 1 (just saved our first snapshot)
    ; Timeline 2: count = 1 (snapshot from timeline 1 survived restore)
    ; ... damn, both return 1.
    ;
    ; Actually wait: on timeline 2, we re-save (the save above runs again),
    ; so count becomes 2! Then list returns 2.
    ; No wait: the save pushes another snapshot. But the snapshot from
    ; timeline 1 is still there. So count goes to 2 on timeline 2.
    ; That's how we distinguish!

    LDI r12, 2
    CMP r2, r12
    JZ r2, timeline2      ; count >= 2: we're on timeline 2

    ; --- TIMELINE 1: Draw red, wait, restore ---

    ; Draw red on bottom (200..255)
    LDI r10, 0xFFFF0000
    LDI r8, 200
.draw_red:
    LDI r4, 256
    CMP r8, r4
    BGE r2, .red_done
    LDI r5, 0
.draw_red_x:
    LDI r12, 256
    CMP r5, r12
    BGE r2, .red_next
    PSET r5, r8, r10
    ADDI r5, 1
    JMP .draw_red_x
.red_next:
    ADDI r8, 1
    JMP .draw_red
.red_done:

    ; Wait 30 frames to show the red
    LDI r12, 30
    CALL wait_frames

    ; Restore snapshot (blue-only state)
    ; After restore: PC = right after the save. Count is still 1 (from T1).
    ; Save runs again -> count becomes 2. List returns 2 -> timeline 2.
    LDI r11, 1             ; mode = restore
    LDI r5, 0             ; slot 0
    FORK r11

    HALT                   ; unreachable

timeline2:
    ; --- TIMELINE 2: Draw green on bottom ---
    LDI r10, 0xFF00FF00
    LDI r8, 200
.draw_green:
    LDI r4, 256
    CMP r8, r4
    BGE r2, .green_done
    LDI r5, 0
.draw_green_x:
    LDI r12, 256
    CMP r5, r12
    BGE r2, .green_next
    PSET r5, r8, r10
    ADDI r5, 1
    JMP .draw_green_x
.green_next:
    ADDI r8, 1
    JMP .draw_green
.green_done:

    ; Show alternate timeline
    LDI r12, 60
    CALL wait_frames
    HALT

; --- Subroutines ---

; wait_frames: wait for r12 FRAME opcodes
wait_frames:
    PUSH r12
.wait_loop:
    FRAME
    SUBI r12, 1
    JZ r12, .wait_done
    JMP .wait_loop
.wait_done:
    POP r12
    RET
