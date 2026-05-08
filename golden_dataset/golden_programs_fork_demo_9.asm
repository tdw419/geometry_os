; DESCRIPTION: Draw line: pos=the screen, color=red, size=fixed size.

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
    LDI r1, 0
.draw_blue:
    LDI r10, 200
    CMP r1, r10
    BGE r13, .blue_done
    LDI r4, 0
.draw_blue_x:
    LDI r8, 256
    CMP r4, r8
    BGE r13, .blue_next
    MOV r5, r1
    SHLI r5, 16
    ORI r5, 0xFF000000
    PSET r4, r1, r5
    ADDI r4, 1
    JMP .draw_blue_x
.blue_next:
    ADDI r1, 1
    JMP .draw_blue
.blue_done:

    ; --- Save snapshot ---
    ; This is the FORK POINT. After restore, execution resumes here.
    LDI r3, 0             ; mode = save
    FORK r3
    ; r13 = slot index
    ; After restore from this snapshot, PC = right here.

    ; --- Which timeline? Check snapshot count ---
    LDI r3, 2             ; mode = list count
    FORK r3
    ; Timeline 1: count = 1 (just saved our first snapshot)
    ; Timeline 2: count = 1 (snapshot from timeline 1 survived restore)
    ; ... damn, both return 1.
    ;
    ; Actually wait: on timeline 2, we re-save (the save above runs again),
    ; so count becomes 2! Then list returns 2.
    ; No wait: the save pushes another snapshot. But the snapshot from
    ; timeline 1 is still there. So count goes to 2 on timeline 2.
    ; That's how we distinguish!

    LDI r8, 2
    CMP r13, r8
    JZ r13, timeline2      ; count >= 2: we're on timeline 2

    ; --- TIMELINE 1: Draw red, wait, restore ---

    ; Draw red on bottom (200..255)
    LDI r5, 0xFFFF0000
    LDI r1, 200
.draw_red:
    LDI r10, 256
    CMP r1, r10
    BGE r13, .red_done
    LDI r4, 0
.draw_red_x:
    LDI r8, 256
    CMP r4, r8
    BGE r13, .red_next
    PSET r4, r1, r5
    ADDI r4, 1
    JMP .draw_red_x
.red_next:
    ADDI r1, 1
    JMP .draw_red
.red_done:

    ; Wait 30 frames to show the red
    LDI r8, 30
    CALL wait_frames

    ; Restore snapshot (blue-only state)
    ; After restore: PC = right after the save. Count is still 1 (from T1).
    ; Save runs again -> count becomes 2. List returns 2 -> timeline 2.
    LDI r3, 1             ; mode = restore
    LDI r4, 0             ; slot 0
    FORK r3

    HALT                   ; unreachable

timeline2:
    ; --- TIMELINE 2: Draw green on bottom ---
    LDI r5, 0xFF00FF00
    LDI r1, 200
.draw_green:
    LDI r10, 256
    CMP r1, r10
    BGE r13, .green_done
    LDI r4, 0
.draw_green_x:
    LDI r8, 256
    CMP r4, r8
    BGE r13, .green_next
    PSET r4, r1, r5
    ADDI r4, 1
    JMP .draw_green_x
.green_next:
    ADDI r1, 1
    JMP .draw_green
.green_done:

    ; Show alternate timeline
    LDI r8, 60
    CALL wait_frames
    HALT

; --- Subroutines ---

; wait_frames: wait for r8 FRAME opcodes
wait_frames:
    PUSH r8
.wait_loop:
    FRAME
    SUBI r8, 1
    JZ r8, .wait_done
    JMP .wait_loop
.wait_done:
    POP r8
    RET
