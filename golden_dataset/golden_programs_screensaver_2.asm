; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r3, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r4, NUM_STARS
    LDI r5, STARS_BASE
init_stars:
    RAND r1
    ANDI r1, 0xFF
    STORE r5, r1
    ADDI r5, 1
    RAND r1
    ANDI r1, 0xFF
    STORE r5, r1
    ADDI r5, 1
    SUBI r4, 1
    JNZ r4, init_stars

main_loop:
    IKEY r3
    JNZ r3, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r4, TICKS_PER_EFFECT
    DIV r21, r4
    LDI r4, NUM_EFFECTS
    MOD r21, r4

    ; Clear screen (black)
    LDI r4, 0
    FILL r4

    ; Dispatch
    CMPI r21, 0
    JZ r3, do_starfield
    CMPI r21, 1
    JZ r3, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r4, NUM_STARS
    LDI r5, STARS_BASE
star_loop:
    LOAD r1, r5        ; x
    ADDI r5, 1
    LOAD r2, r5        ; y
    ADDI r2, 1
    ANDI r2, 0xFF       ; wrap
    STORE r5, r2
    SUBI r5, 1

    ; Brightness via MIN/MAX
    LDI r14, 0x444444
    MAX r2, r14
    LDI r14, 0xCCCCCC
    MIN r2, r14

    PSET r1, r2, r2
    ADDI r5, 2
    SUBI r4, 1
    JNZ r4, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r4, r25
    ANDI r4, 0x7F
    ADDI r4, 10

    LDI r25, TICKS_ADDR
    LOAD r5, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r5, r26
    ANDI r5, 0x7F
    ADDI r5, 10

    ; CLAMP to stay on screen
    LDI r1, 10
    LDI r2, 200
    CLAMP r4, r1, r2
    CLAMP r5, r1, r2

    ; Green logo
    LDI r14, 0x00FF00
    LDI r7, 15
    LDI r16, 20
    RECTF r4, r5, r7, r16, r14

    ; Shadow
    LDI r14, 0x005500
    ADDI r4, 2
    ADDI r5, 2
    RECTF r4, r5, r7, r16, r14
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r4, r25        ; time
    LDI r5, 0           ; y
plasma_y:
    LDI r1, 0           ; x
plasma_x:
    ; Red channel
    MOV r2, r1
    ADD r2, r5
    ADD r2, r4
    ANDI r2, 0xFF
    SHLI r2, 16

    ; Green channel
    MOV r14, r1
    ADD r14, r5
    ADD r14, r4
    ADDI r14, 85
    ANDI r14, 0xFF
    LDI r7, 200
    MIN r14, r7
    SHLI r14, 8
    ADD r2, r14

    ; Blue channel
    MOV r14, r1
    ADD r14, r5
    ADD r14, r4
    ADDI r14, 170
    ANDI r14, 0xFF
    LDI r7, 200
    MIN r14, r7
    ADD r2, r14

    PSET r1, r5, r2

    ADDI r1, 4
    CMPI r1, 256
    JNZ r3, plasma_x

    ADDI r5, 4
    CMPI r5, 256
    JNZ r3, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r4, 0
    FILL r4
    FRAME
    HALT
