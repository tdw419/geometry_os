; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r0, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r11, NUM_STARS
    LDI r1, STARS_BASE
init_stars:
    RAND r13
    ANDI r13, 0xFF
    STORE r1, r13
    ADDI r1, 1
    RAND r13
    ANDI r13, 0xFF
    STORE r1, r13
    ADDI r1, 1
    SUBI r11, 1
    JNZ r11, init_stars

main_loop:
    IKEY r0
    JNZ r0, exit_screensaver

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
    JZ r0, do_starfield
    CMPI r21, 1
    JZ r0, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r11, NUM_STARS
    LDI r1, STARS_BASE
star_loop:
    LOAD r13, r1        ; x
    ADDI r1, 1
    LOAD r12, r1        ; y
    ADDI r12, 1
    ANDI r12, 0xFF       ; wrap
    STORE r1, r12
    SUBI r1, 1

    ; Brightness via MIN/MAX
    LDI r3, 0x444444
    MAX r12, r3
    LDI r3, 0xCCCCCC
    MIN r12, r3

    PSET r13, r12, r12
    ADDI r1, 2
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
    LOAD r1, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r1, r26
    ANDI r1, 0x7F
    ADDI r1, 10

    ; CLAMP to stay on screen
    LDI r13, 10
    LDI r12, 200
    CLAMP r11, r13, r12
    CLAMP r1, r13, r12

    ; Green logo
    LDI r3, 0x00FF00
    LDI r15, 15
    LDI r16, 20
    RECTF r11, r1, r15, r16, r3

    ; Shadow
    LDI r3, 0x005500
    ADDI r11, 2
    ADDI r1, 2
    RECTF r11, r1, r15, r16, r3
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r11, r25        ; time
    LDI r1, 0           ; y
plasma_y:
    LDI r13, 0           ; x
plasma_x:
    ; Red channel
    MOV r12, r13
    ADD r12, r1
    ADD r12, r11
    ANDI r12, 0xFF
    SHLI r12, 16

    ; Green channel
    MOV r3, r13
    ADD r3, r1
    ADD r3, r11
    ADDI r3, 85
    ANDI r3, 0xFF
    LDI r15, 200
    MIN r3, r15
    SHLI r3, 8
    ADD r12, r3

    ; Blue channel
    MOV r3, r13
    ADD r3, r1
    ADD r3, r11
    ADDI r3, 170
    ANDI r3, 0xFF
    LDI r15, 200
    MIN r3, r15
    ADD r12, r3

    PSET r13, r1, r12

    ADDI r13, 4
    CMPI r13, 256
    JNZ r0, plasma_x

    ADDI r1, 4
    CMPI r1, 256
    JNZ r0, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r11, 0
    FILL r11
    FRAME
    HALT
