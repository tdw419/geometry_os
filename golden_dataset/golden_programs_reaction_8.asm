; DESCRIPTION: This GeOS assembly code implements a reaction time tester. It displays "Wait..." for a random delay and then changes to "PRESS!" where the player must press any key as quickly as possible. The reaction time is measured in frames and displayed, along with a rating based on performance. The player can retry by pressing 'R'.

; reaction.asm -- Reaction Time Tester for Geometry OS
;
; Proves: FRAME (timing), IKEY (keyboard input), TEXT (display),
;         RECTF (visual elements), RAND (random wait time).
;
; How to play:
;   Screen shows "Wait..." then after random delay shows "PRESS!"
;   Press any key as fast as you can
;   Shows your reaction time in frames
;   Press R to retry
;
; NOTE: No colons in comments (assembler pitfall)

#define STR_BUF    0x4000
#define SCRATCH    0x4100
#define PHASE      0x4200   ; 0=waiting, 1=ready, 2=result
#define WAIT_TIME  0x4204   ; random wait target (in frames)
#define TIMER      0x4208   ; frame counter
#define REACTION   0x420C   ; reaction time (frames)

; ── INIT ──────────────────────────────────────
start:
    LDI r14, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r13, 0
    STORE r20, r13

    ; Generate random wait time (30-120 frames)
    RAND r20
    LDI r21, 91
    MOD r20, r21
    LDI r21, 30
    ADD r20, r21
    LDI r21, WAIT_TIME
    STORE r21, r20

    ; Reset timer
    LDI r20, TIMER
    LDI r13, 0
    STORE r20, r13

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r1, 0x1A1A2E
    FILL r1

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r13, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r14, 52
    LDI r8, 110
    LDI r2, STR_BUF
    TEXT r14, r8, r2

    ; Draw waiting indicator (gray box)
    LDI r14, 88
    LDI r8, 140
    LDI r2, 80
    LDI r0, 20
    LDI r1, 0x555577
    RECTF r14, r8, r2, r0, r1

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r14, 1
    ADD r21, r14
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r13, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r13, 1
    STORE r20, r13
    LDI r20, TIMER
    LDI r13, 0
    STORE r20, r13
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r13, show_result

    ; Bright green background flash
    LDI r1, 0x003300
    FILL r1

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r14, 46
    LDI r8, 110
    LDI r2, STR_BUF
    TEXT r14, r8, r2

    ; Green action box
    LDI r14, 68
    LDI r8, 140
    LDI r2, 120
    LDI r0, 30
    LDI r1, 0x00FF00
    RECTF r14, r8, r2, r0, r1

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r14, 1
    ADD r21, r14
    STORE r20, r21

    ; Check for key press
    IKEY r12
    CMPI r12, 0
    JZ r13, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r13, 2
    STORE r20, r13
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r1, 0x0C0C1E
    FILL r1

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r14, 62
    LDI r8, 50
    LDI r2, STR_BUF
    TEXT r14, r8, r2

    ; Result box
    LDI r14, 38
    LDI r8, 80
    LDI r2, 180
    LDI r0, 80
    LDI r1, 0x333355
    RECTF r14, r8, r2, r0, r1

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r11, 100
    MOV r22, r20
    DIV r22, r11
    LDI r1, 48
    ADD r1, r22
    STORE r21, r1
    LDI r14, 1
    ADD r21, r14
    ; tens
    MOV r22, r20
    LDI r4, 100
    MUL r4, r22
    ; wait -- MUL modifies r22 in place. Let me redo.
    ; Actually DIV already modified r22. Let me reload.
    MOV r22, r20
    LDI r4, 100
    MUL r4, r22
    MOV r22, r20
    SUB r22, r4
    LDI r11, 10
    DIV r22, r11
    LDI r1, 48
    ADD r1, r22
    STORE r21, r1
    ADD r21, r14
    ; ones
    MOV r22, r20
    LDI r11, 10
    MOD r22, r11
    LDI r1, 48
    ADD r1, r22
    STORE r21, r1
    ADD r21, r14
    ; null terminator
    LDI r1, 0
    STORE r21, r1

    LDI r14, 82
    LDI r8, 105
    LDI r2, SCRATCH
    TEXT r14, r8, r2

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r14, 96
    LDI r8, 125
    LDI r2, STR_BUF
    TEXT r14, r8, r2

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r13, show_fast
    CMPI r20, 30
    BGE r13, show_good
    CMPI r20, 60
    BGE r13, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r14, 100
    LDI r8, 150
    LDI r2, STR_BUF
    TEXT r14, r8, r2
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r14, 88
    LDI r8, 150
    LDI r2, STR_BUF
    TEXT r14, r8, r2
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r14, 100
    LDI r8, 150
    LDI r2, STR_BUF
    TEXT r14, r8, r2
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r14, 106
    LDI r8, 150
    LDI r2, STR_BUF
    TEXT r14, r8, r2
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r14, 60
    LDI r8, 200
    LDI r2, STR_BUF
    TEXT r14, r8, r2

    ; Check for R key
    IKEY r12
    CMPI r12, 82
    JNZ r13, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
