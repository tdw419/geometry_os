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
    LDI r1, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r2, 0
    STORE r20, r2

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
    LDI r2, 0
    STORE r20, r2

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r6, 0x1A1A2E
    FILL r6

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r2, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r1, 52
    LDI r13, 110
    LDI r14, STR_BUF
    TEXT r1, r13, r14

    ; Draw waiting indicator (gray box)
    LDI r1, 88
    LDI r13, 140
    LDI r14, 80
    LDI r4, 20
    LDI r6, 0x555577
    RECTF r1, r13, r14, r4, r6

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r1, 1
    ADD r21, r1
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r2, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r2, 1
    STORE r20, r2
    LDI r20, TIMER
    LDI r2, 0
    STORE r20, r2
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r2, show_result

    ; Bright green background flash
    LDI r6, 0x003300
    FILL r6

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r1, 46
    LDI r13, 110
    LDI r14, STR_BUF
    TEXT r1, r13, r14

    ; Green action box
    LDI r1, 68
    LDI r13, 140
    LDI r14, 120
    LDI r4, 30
    LDI r6, 0x00FF00
    RECTF r1, r13, r14, r4, r6

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r1, 1
    ADD r21, r1
    STORE r20, r21

    ; Check for key press
    IKEY r11
    CMPI r11, 0
    JZ r2, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r2, 2
    STORE r20, r2
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r6, 0x0C0C1E
    FILL r6

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r1, 62
    LDI r13, 50
    LDI r14, STR_BUF
    TEXT r1, r13, r14

    ; Result box
    LDI r1, 38
    LDI r13, 80
    LDI r14, 180
    LDI r4, 80
    LDI r6, 0x333355
    RECTF r1, r13, r14, r4, r6

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r10, 100
    MOV r22, r20
    DIV r22, r10
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    LDI r1, 1
    ADD r21, r1
    ; tens
    MOV r22, r20
    LDI r3, 100
    MUL r3, r22
    ; wait -- MUL modifies r22 in place. Let me redo.
    ; Actually DIV already modified r22. Let me reload.
    MOV r22, r20
    LDI r3, 100
    MUL r3, r22
    MOV r22, r20
    SUB r22, r3
    LDI r10, 10
    DIV r22, r10
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    ADD r21, r1
    ; ones
    MOV r22, r20
    LDI r10, 10
    MOD r22, r10
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    ADD r21, r1
    ; null terminator
    LDI r6, 0
    STORE r21, r6

    LDI r1, 82
    LDI r13, 105
    LDI r14, SCRATCH
    TEXT r1, r13, r14

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r1, 96
    LDI r13, 125
    LDI r14, STR_BUF
    TEXT r1, r13, r14

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r2, show_fast
    CMPI r20, 30
    BGE r2, show_good
    CMPI r20, 60
    BGE r2, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r1, 100
    LDI r13, 150
    LDI r14, STR_BUF
    TEXT r1, r13, r14
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r1, 88
    LDI r13, 150
    LDI r14, STR_BUF
    TEXT r1, r13, r14
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r1, 100
    LDI r13, 150
    LDI r14, STR_BUF
    TEXT r1, r13, r14
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r1, 106
    LDI r13, 150
    LDI r14, STR_BUF
    TEXT r1, r13, r14
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r1, 60
    LDI r13, 200
    LDI r14, STR_BUF
    TEXT r1, r13, r14

    ; Check for R key
    IKEY r11
    CMPI r11, 82
    JNZ r2, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
