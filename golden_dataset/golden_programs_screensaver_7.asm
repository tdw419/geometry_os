; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r15, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r2, NUM_STARS
    LDI r5, STARS_BASE
init_stars:
    RAND r6
    ANDI r6, 0xFF
    STORE r5, r6
    ADDI r5, 1
    RAND r6
    ANDI r6, 0xFF
    STORE r5, r6
    ADDI r5, 1
    SUBI r2, 1
    JNZ r2, init_stars

main_loop:
    IKEY r15
    JNZ r15, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r2, TICKS_PER_EFFECT
    DIV r21, r2
    LDI r2, NUM_EFFECTS
    MOD r21, r2

    ; Clear screen (black)
    LDI r2, 0
    FILL r2

    ; Dispatch
    CMPI r21, 0
    JZ r15, do_starfield
    CMPI r21, 1
    JZ r15, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r2, NUM_STARS
    LDI r5, STARS_BASE
star_loop:
    LOAD r6, r5        ; x
    ADDI r5, 1
    LOAD r8, r5        ; y
    ADDI r8, 1
    ANDI r8, 0xFF       ; wrap
    STORE r5, r8
    SUBI r5, 1

    ; Brightness via MIN/MAX
    LDI r0, 0x444444
    MAX r8, r0
    LDI r0, 0xCCCCCC
    MIN r8, r0

    PSET r6, r8, r8
    ADDI r5, 2
    SUBI r2, 1
    JNZ r2, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r2, r25
    ANDI r2, 0x7F
    ADDI r2, 10

    LDI r25, TICKS_ADDR
    LOAD r5, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r5, r26
    ANDI r5, 0x7F
    ADDI r5, 10

    ; CLAMP to stay on screen
    LDI r6, 10
    LDI r8, 200
    CLAMP r2, r6, r8
    CLAMP r5, r6, r8

    ; Green logo
    LDI r0, 0x00FF00
    LDI r13, 15
    LDI r16, 20
    RECTF r2, r5, r13, r16, r0

    ; Shadow
    LDI r0, 0x005500
    ADDI r2, 2
    ADDI r5, 2
    RECTF r2, r5, r13, r16, r0
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r2, r25        ; time
    LDI r5, 0           ; y
plasma_y:
    LDI r6, 0           ; x
plasma_x:
    ; Red channel
    MOV r8, r6
    ADD r8, r5
    ADD r8, r2
    ANDI r8, 0xFF
    SHLI r8, 16

    ; Green channel
    MOV r0, r6
    ADD r0, r5
    ADD r0, r2
    ADDI r0, 85
    ANDI r0, 0xFF
    LDI r13, 200
    MIN r0, r13
    SHLI r0, 8
    ADD r8, r0

    ; Blue channel
    MOV r0, r6
    ADD r0, r5
    ADD r0, r2
    ADDI r0, 170
    ANDI r0, 0xFF
    LDI r13, 200
    MIN r0, r13
    ADD r8, r0

    PSET r6, r5, r8

    ADDI r6, 4
    CMPI r6, 256
    JNZ r15, plasma_x

    ADDI r5, 4
    CMPI r5, 256
    JNZ r15, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r2, 0
    FILL r2
    FRAME
    HALT
