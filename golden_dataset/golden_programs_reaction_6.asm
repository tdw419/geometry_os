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
    LDI r12, 1
    LDI r30, 0xFD00

    ; Set phase to waiting
    LDI r20, PHASE
    LDI r9, 0
    STORE r20, r9

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
    LDI r9, 0
    STORE r20, r9

; ── MAIN LOOP ──────────────────────────────────
main_loop:
    ; Dark background
    LDI r11, 0x1A1A2E
    FILL r11

    LDI r20, PHASE
    LOAD r20, r20

    ; Phase 0 -- waiting for random delay
    CMPI r20, 0
    JNZ r9, check_ready

    ; Show "Wait..." message
    LDI r20, STR_BUF
    STRO r20, "Wait for it..."
    LDI r12, 52
    LDI r15, 110
    LDI r2, STR_BUF
    TEXT r12, r15, r2

    ; Draw waiting indicator (gray box)
    LDI r12, 88
    LDI r15, 140
    LDI r2, 80
    LDI r7, 20
    LDI r11, 0x555577
    RECTF r12, r15, r2, r7, r11

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r12, 1
    ADD r21, r12
    STORE r20, r21

    ; Check if wait time elapsed
    LDI r20, TIMER
    LOAD r20, r20
    LDI r21, WAIT_TIME
    LOAD r21, r21
    CMP r20, r21
    BLT r9, do_frame

    ; Switch to ready phase
    LDI r20, PHASE
    LDI r9, 1
    STORE r20, r9
    LDI r20, TIMER
    LDI r9, 0
    STORE r20, r9
    JMP do_frame

check_ready:
    ; Phase 1 -- show "PRESS!" and measure reaction
    CMPI r20, 1
    JNZ r9, show_result

    ; Bright green background flash
    LDI r11, 0x003300
    FILL r11

    ; Big "PRESS!" text
    LDI r20, STR_BUF
    STRO r20, "PRESS ANY KEY!"
    LDI r12, 46
    LDI r15, 110
    LDI r2, STR_BUF
    TEXT r12, r15, r2

    ; Green action box
    LDI r12, 68
    LDI r15, 140
    LDI r2, 120
    LDI r7, 30
    LDI r11, 0x00FF00
    RECTF r12, r15, r2, r7, r11

    ; Increment timer
    LDI r20, TIMER
    LOAD r21, r20
    LDI r12, 1
    ADD r21, r12
    STORE r20, r21

    ; Check for key press
    IKEY r0
    CMPI r0, 0
    JZ r9, do_frame

    ; Key pressed! Record reaction time
    LDI r20, REACTION
    LDI r21, TIMER
    LOAD r21, r21
    STORE r20, r21

    ; Switch to result phase
    LDI r20, PHASE
    LDI r9, 2
    STORE r20, r9
    JMP do_frame

show_result:
    ; Phase 2 -- show result
    LDI r11, 0x0C0C1E
    FILL r11

    ; Title
    LDI r20, STR_BUF
    STRO r20, "Reaction Time"
    LDI r12, 62
    LDI r15, 50
    LDI r2, STR_BUF
    TEXT r12, r15, r2

    ; Result box
    LDI r12, 38
    LDI r15, 80
    LDI r2, 180
    LDI r7, 80
    LDI r11, 0x333355
    RECTF r12, r15, r2, r7, r11

    ; Show reaction time
    LDI r20, REACTION
    LOAD r20, r20
    ; Convert to 3-digit ASCII
    LDI r21, SCRATCH
    LDI r6, 100
    MOV r22, r20
    DIV r22, r6
    LDI r11, 48
    ADD r11, r22
    STORE r21, r11
    LDI r12, 1
    ADD r21, r12
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
    LDI r6, 10
    DIV r22, r6
    LDI r11, 48
    ADD r11, r22
    STORE r21, r11
    ADD r21, r12
    ; ones
    MOV r22, r20
    LDI r6, 10
    MOD r22, r6
    LDI r11, 48
    ADD r11, r22
    STORE r21, r11
    ADD r21, r12
    ; null terminator
    LDI r11, 0
    STORE r21, r11

    LDI r12, 82
    LDI r15, 105
    LDI r2, SCRATCH
    TEXT r12, r15, r2

    ; "frames" label
    LDI r20, STR_BUF
    STRO r20, "frames"
    LDI r12, 96
    LDI r15, 125
    LDI r2, STR_BUF
    TEXT r12, r15, r2

    ; Rating
    LDI r20, REACTION
    LOAD r20, r20
    CMPI r20, 10
    BGE r9, show_fast
    CMPI r20, 30
    BGE r9, show_good
    CMPI r20, 60
    BGE r9, show_ok
    LDI r20, STR_BUF
    STRO r20, "SLOW"
    LDI r12, 100
    LDI r15, 150
    LDI r2, STR_BUF
    TEXT r12, r15, r2
    JMP show_rating_done
show_fast:
    LDI r20, STR_BUF
    STRO r20, "AMAZING!"
    LDI r12, 88
    LDI r15, 150
    LDI r2, STR_BUF
    TEXT r12, r15, r2
    JMP show_rating_done
show_good:
    LDI r20, STR_BUF
    STRO r20, "GOOD"
    LDI r12, 100
    LDI r15, 150
    LDI r2, STR_BUF
    TEXT r12, r15, r2
    JMP show_rating_done
show_ok:
    LDI r20, STR_BUF
    STRO r20, "OK"
    LDI r12, 106
    LDI r15, 150
    LDI r2, STR_BUF
    TEXT r12, r15, r2
show_rating_done:

    ; "Press R to retry" instruction
    LDI r20, STR_BUF
    STRO r20, "Press R to retry"
    LDI r12, 60
    LDI r15, 200
    LDI r2, STR_BUF
    TEXT r12, r15, r2

    ; Check for R key
    IKEY r0
    CMPI r0, 82
    JNZ r9, do_frame

    ; Restart
    JMP start

do_frame:
    FRAME
    JMP main_loop

    HALT
