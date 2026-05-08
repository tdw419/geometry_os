; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r1, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r10, NUM_STARS
    LDI r3, STARS_BASE
init_stars:
    RAND r13
    ANDI r13, 0xFF
    STORE r3, r13
    ADDI r3, 1
    RAND r13
    ANDI r13, 0xFF
    STORE r3, r13
    ADDI r3, 1
    SUBI r10, 1
    JNZ r10, init_stars

main_loop:
    IKEY r1
    JNZ r1, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r10, TICKS_PER_EFFECT
    DIV r21, r10
    LDI r10, NUM_EFFECTS
    MOD r21, r10

    ; Clear screen (black)
    LDI r10, 0
    FILL r10

    ; Dispatch
    CMPI r21, 0
    JZ r1, do_starfield
    CMPI r21, 1
    JZ r1, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r10, NUM_STARS
    LDI r3, STARS_BASE
star_loop:
    LOAD r13, r3        ; x
    ADDI r3, 1
    LOAD r5, r3        ; y
    ADDI r5, 1
    ANDI r5, 0xFF       ; wrap
    STORE r3, r5
    SUBI r3, 1

    ; Brightness via MIN/MAX
    LDI r8, 0x444444
    MAX r5, r8
    LDI r8, 0xCCCCCC
    MIN r5, r8

    PSET r13, r5, r5
    ADDI r3, 2
    SUBI r10, 1
    JNZ r10, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r10, r25
    ANDI r10, 0x7F
    ADDI r10, 10

    LDI r25, TICKS_ADDR
    LOAD r3, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r3, r26
    ANDI r3, 0x7F
    ADDI r3, 10

    ; CLAMP to stay on screen
    LDI r13, 10
    LDI r5, 200
    CLAMP r10, r13, r5
    CLAMP r3, r13, r5

    ; Green logo
    LDI r8, 0x00FF00
    LDI r15, 15
    LDI r16, 20
    RECTF r10, r3, r15, r16, r8

    ; Shadow
    LDI r8, 0x005500
    ADDI r10, 2
    ADDI r3, 2
    RECTF r10, r3, r15, r16, r8
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r10, r25        ; time
    LDI r3, 0           ; y
plasma_y:
    LDI r13, 0           ; x
plasma_x:
    ; Red channel
    MOV r5, r13
    ADD r5, r3
    ADD r5, r10
    ANDI r5, 0xFF
    SHLI r5, 16

    ; Green channel
    MOV r8, r13
    ADD r8, r3
    ADD r8, r10
    ADDI r8, 85
    ANDI r8, 0xFF
    LDI r15, 200
    MIN r8, r15
    SHLI r8, 8
    ADD r5, r8

    ; Blue channel
    MOV r8, r13
    ADD r8, r3
    ADD r8, r10
    ADDI r8, 170
    ANDI r8, 0xFF
    LDI r15, 200
    MIN r8, r15
    ADD r5, r8

    PSET r13, r3, r5

    ADDI r13, 4
    CMPI r13, 256
    JNZ r1, plasma_x

    ADDI r3, 4
    CMPI r3, 256
    JNZ r1, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r10, 0
    FILL r10
    FRAME
    HALT
