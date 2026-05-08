; DESCRIPTION: A red object centered at the screen with fixed size.

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
    LDI r7, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r5, 0
    STORE r20, r5

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
    LDI r5, 0
    STORE r20, r5

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r12, 0x1A1A2E
    FILL r12

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r5, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r7, 52
    LDI r4, 110
    LDI r13, STR_BUF
    TEXT r7, r4, r13

    ; Draw waiting indicator (gray box)
    LDI r7, 88
    LDI r4, 140
    LDI r13, 80
    LDI r10, 20
    LDI r12, 0x555577
    RECTF r7, r4, r13, r10, r12

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r7, 1
    ADD r21, r7
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r5, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r5, 1
    STORE r20, r5
    LDI r20, TIMER
    LDI r5, 0
    STORE r20, r5
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r5, show_result

    ; Bright green background flash
    LDI r12, 0x003300
    FILL r12

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r7, 46
    LDI r4, 110
    LDI r13, STR_BUF
    TEXT r7, r4, r13

    ; Green action box
    LDI r7, 68
    LDI r4, 140
    LDI r13, 120
    LDI r10, 30
    LDI r12, 0x00FF00
    RECTF r7, r4, r13, r10, r12

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r7, 1
    ADD r21, r7
    STORE r20, r21

    ; Check for key press
    IKEY r11
    CMPI r11, 0
    JZ r5, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r5, 2
    STORE r20, r5
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r12, 0x0C0C1E
    FILL r12

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r7, 62
    LDI r4, 50
    LDI r13, STR_BUF
    TEXT r7, r4, r13

    ; Result box
    LDI r7, 38
    LDI r4, 80
    LDI r13, 180
    LDI r10, 80
    LDI r12, 0x333355
    RECTF r7, r4, r13, r10, r12

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r6, 100
    MOV r22, r20
    DIV r22, r6
    LDI r12, 48
    ADD r12, r22
    STORE r21, r12
    LDI r7, 1
    ADD r21, r7
    ; tens
    MOV r22, r20
    LDI r2, 100
    MUL r2, r22
    ; wait -- MUL modifies r22 in place. Let me redo.
    ; Actually DIV already modified r22. Let me reload.
    MOV r22, r20
    LDI r2, 100
    MUL r2, r22
    MOV r22, r20
    SUB r22, r2
    LDI r6, 10
    DIV r22, r6
    LDI r12, 48
    ADD r12, r22
    STORE r21, r12
    ADD r21, r7
    ; ones
    MOV r22, r20
    LDI r6, 10
    MOD r22, r6
    LDI r12, 48
    ADD r12, r22
    STORE r21, r12
    ADD r21, r7
    ; null terminator
    LDI r12, 0
    STORE r21, r12

    LDI r7, 82
    LDI r4, 105
    LDI r13, SCRATCH
    TEXT r7, r4, r13

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r7, 96
    LDI r4, 125
    LDI r13, STR_BUF
    TEXT r7, r4, r13

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r5, show_fast
    CMPI r20, 30
    BGE r5, show_good
    CMPI r20, 60
    BGE r5, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r7, 100
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r7, r4, r13
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r7, 88
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r7, r4, r13
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r7, 100
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r7, r4, r13
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r7, 106
    LDI r4, 150
    LDI r13, STR_BUF
    TEXT r7, r4, r13
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r7, 60
    LDI r4, 200
    LDI r13, STR_BUF
    TEXT r7, r4, r13

    ; Check for R key
    IKEY r11
    CMPI r11, 82
    JNZ r5, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
