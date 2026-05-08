; DESCRIPTION: Geometry OS program to draw a red object.

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
    LDI r10, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r11, 0
    STORE r20, r11

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
    LDI r11, 0
    STORE r20, r11

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r6, 0x1A1A2E
    FILL r6

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r11, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r10, 52
    LDI r5, 110
    LDI r3, STR_BUF
    TEXT r10, r5, r3

    ; Draw waiting indicator (gray box)
    LDI r10, 88
    LDI r5, 140
    LDI r3, 80
    LDI r7, 20
    LDI r6, 0x555577
    RECTF r10, r5, r3, r7, r6

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r10, 1
    ADD r21, r10
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r11, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r11, 1
    STORE r20, r11
    LDI r20, TIMER
    LDI r11, 0
    STORE r20, r11
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r11, show_result

    ; Bright green background flash
    LDI r6, 0x003300
    FILL r6

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r10, 46
    LDI r5, 110
    LDI r3, STR_BUF
    TEXT r10, r5, r3

    ; Green action box
    LDI r10, 68
    LDI r5, 140
    LDI r3, 120
    LDI r7, 30
    LDI r6, 0x00FF00
    RECTF r10, r5, r3, r7, r6

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r10, 1
    ADD r21, r10
    STORE r20, r21

    ; Check for key press
    IKEY r13
    CMPI r13, 0
    JZ r11, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r11, 2
    STORE r20, r11
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r6, 0x0C0C1E
    FILL r6

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r10, 62
    LDI r5, 50
    LDI r3, STR_BUF
    TEXT r10, r5, r3

    ; Result box
    LDI r10, 38
    LDI r5, 80
    LDI r3, 180
    LDI r7, 80
    LDI r6, 0x333355
    RECTF r10, r5, r3, r7, r6

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r4, 100
    MOV r22, r20
    DIV r22, r4
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    LDI r10, 1
    ADD r21, r10
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
    LDI r4, 10
    DIV r22, r4
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    ADD r21, r10
    ; ones
    MOV r22, r20
    LDI r4, 10
    MOD r22, r4
    LDI r6, 48
    ADD r6, r22
    STORE r21, r6
    ADD r21, r10
    ; null terminator
    LDI r6, 0
    STORE r21, r6

    LDI r10, 82
    LDI r5, 105
    LDI r3, SCRATCH
    TEXT r10, r5, r3

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r10, 96
    LDI r5, 125
    LDI r3, STR_BUF
    TEXT r10, r5, r3

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r11, show_fast
    CMPI r20, 30
    BGE r11, show_good
    CMPI r20, 60
    BGE r11, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r10, 100
    LDI r5, 150
    LDI r3, STR_BUF
    TEXT r10, r5, r3
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r10, 88
    LDI r5, 150
    LDI r3, STR_BUF
    TEXT r10, r5, r3
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r10, 100
    LDI r5, 150
    LDI r3, STR_BUF
    TEXT r10, r5, r3
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r10, 106
    LDI r5, 150
    LDI r3, STR_BUF
    TEXT r10, r5, r3
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r10, 60
    LDI r5, 200
    LDI r3, STR_BUF
    TEXT r10, r5, r3

    ; Check for R key
    IKEY r13
    CMPI r13, 82
    JNZ r11, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
