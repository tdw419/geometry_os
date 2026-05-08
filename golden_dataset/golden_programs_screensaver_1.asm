; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r10, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r11, NUM_STARS
    LDI r0, STARS_BASE
init_stars:
    RAND r12
    ANDI r12, 0xFF
    STORE r0, r12
    ADDI r0, 1
    RAND r12
    ANDI r12, 0xFF
    STORE r0, r12
    ADDI r0, 1
    SUBI r11, 1
    JNZ r11, init_stars

main_loop:
    IKEY r10
    JNZ r10, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r11, TICKS_PER_EFFECT
    DIV r21, r11
    LDI r11, NUM_EFFECTS
    MOD r21, r11

    ; Clear screen (black)
    LDI r11, 0
    FILL r11

    ; Dispatch
    CMPI r21, 0
    JZ r10, do_starfield
    CMPI r21, 1
    JZ r10, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r11, NUM_STARS
    LDI r0, STARS_BASE
star_loop:
    LOAD r12, r0        ; x
    ADDI r0, 1
    LOAD r6, r0        ; y
    ADDI r6, 1
    ANDI r6, 0xFF       ; wrap
    STORE r0, r6
    SUBI r0, 1

    ; Brightness via MIN/MAX
    LDI r4, 0x444444
    MAX r6, r4
    LDI r4, 0xCCCCCC
    MIN r6, r4

    PSET r12, r6, r6
    ADDI r0, 2
    SUBI r11, 1
    JNZ r11, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r11, r25
    ANDI r11, 0x7F
    ADDI r11, 10

    LDI r25, TICKS_ADDR
    LOAD r0, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r0, r26
    ANDI r0, 0x7F
    ADDI r0, 10

    ; CLAMP to stay on screen
    LDI r12, 10
    LDI r6, 200
    CLAMP r11, r12, r6
    CLAMP r0, r12, r6

    ; Green logo
    LDI r4, 0x00FF00
    LDI r2, 15
    LDI r16, 20
    RECTF r11, r0, r2, r16, r4

    ; Shadow
    LDI r4, 0x005500
    ADDI r11, 2
    ADDI r0, 2
    RECTF r11, r0, r2, r16, r4
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r11, r25        ; time
    LDI r0, 0           ; y
plasma_y:
    LDI r12, 0           ; x
plasma_x:
    ; Red channel
    MOV r6, r12
    ADD r6, r0
    ADD r6, r11
    ANDI r6, 0xFF
    SHLI r6, 16

    ; Green channel
    MOV r4, r12
    ADD r4, r0
    ADD r4, r11
    ADDI r4, 85
    ANDI r4, 0xFF
    LDI r2, 200
    MIN r4, r2
    SHLI r4, 8
    ADD r6, r4

    ; Blue channel
    MOV r4, r12
    ADD r4, r0
    ADD r4, r11
    ADDI r4, 170
    ANDI r4, 0xFF
    LDI r2, 200
    MIN r4, r2
    ADD r6, r4

    PSET r12, r0, r6

    ADDI r12, 4
    CMPI r12, 256
    JNZ r10, plasma_x

    ADDI r0, 4
    CMPI r0, 256
    JNZ r10, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r11, 0
    FILL r11
    FRAME
    HALT
