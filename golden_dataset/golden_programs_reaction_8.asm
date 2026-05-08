; DESCRIPTION: Display a object using color red at the screen.

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
    LDI r15, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r10, 0
    STORE r20, r10

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
    LDI r10, 0
    STORE r20, r10

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r3, 0x1A1A2E
    FILL r3

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r10, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r15, 52
    LDI r4, 110
    LDI r13, STR_BUF
    TEXT r15, r4, r13

    ; Draw waiting indicator (gray box)
    LDI r15, 88
    LDI r4, 140
    LDI r13, 80
    LDI r0, 20
    LDI r3, 0x555577
    RECTF r15, r4, r13, r0, r3

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r10, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r10, 1
    STORE r20, r10
    LDI r20, TIMER
    LDI r10, 0
    STORE r20, r10
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r10, show_result

    ; Bright green background flash
    LDI r3, 0x003300
    FILL r3

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r15, 46
    LDI r4, 110
    LDI r13, STR_BUF
    TEXT r15, r4, r13

    ; Green action box
    LDI r15, 68
    LDI r4, 140
    LDI r13, 120
    LDI r0, 30
    LDI r3, 0x00FF00
    RECTF r15, r4, r13, r0, r3

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r15, 1
    ADD r21, r15
    STORE r20, r21

    ; Check for key press
    IKEY r12
    CMPI r12, 0
    JZ r10, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r10, 2
    STORE r20, r10
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r3, 0x0C0C1E
    FILL r3

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r15, 62
    LDI r4, 50
    LDI r13, STR_BUF
    TEXT r15, r4, r13

    ; Result box
    LDI r15, 38
    LDI r4, 80
    LDI r13, 180
    LDI r0, 80
    LDI r3, 0x333355
    RECTF r15, r4, r13, r0, r3

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r11, 100
    MOV r22, r20
    DIV r22, r11
    LDI r3, 48
    ADD r3, r22
    STORE r21, r3
    LDI r15, 1
    ADD r21, r15
    ; tens
    MOV r22, r20
    LDI r9, 100
    MUL r9, r22
    ; wait -- MUL modifies r22 in place. Let me redo.
    ; Actually DIV already modified r22. Let me reload.
    MOV r22, r20
    LDI r9, 100
    MUL r9, r22
    MOV r22, r20
    SUB r22, r9
    LDI r11, 10
    DIV r22, r11
    LDI r3, 48
    ADD r3, r22
    STORE r21, r3
    ADD r21, r15
    ; ones
    MOV r22, r20
    LDI r11, 10
    MOD r22, r11
    LDI r3, 48
    ADD r3, r22
    STORE r21, r3
    ADD r21, r15
    ; null terminator
    LDI r3, 0
    STORE r21, r3

    LDI r15, 82
    LDI r4, 105
    LDI r13, SCRATCH
    TEXT r15, r4, r13

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r15, 96
    LDI r4, 125
    LDI r13, STR_BUF
    TEXT r15, r4, r13

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r10, show_fast
    CMPI r20, 30
    BGE r10, show_good
    CMPI r20, 60
    BGE r10, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r15, 100
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r15, r4, r13
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r15, 88
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r15, r4, r13
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r15, 100
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r15, r4, r13
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r15, 106
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r15, r4, r13
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r15, 60
    LDI r4, 200
    LDI r13, STR_BUF
    TEXT r15, r4, r13

    ; Check for R key
    IKEY r12
    CMPI r12, 82
    JNZ r10, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
