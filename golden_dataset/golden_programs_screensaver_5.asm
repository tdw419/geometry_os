; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r8, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r15, NUM_STARS
    LDI r14, STARS_BASE
init_stars:
    RAND r5
    ANDI r5, 0xFF
    STORE r14, r5
    ADDI r14, 1
    RAND r5
    ANDI r5, 0xFF
    STORE r14, r5
    ADDI r14, 1
    SUBI r15, 1
    JNZ r15, init_stars

main_loop:
    IKEY r8
    JNZ r8, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r15, TICKS_PER_EFFECT
    DIV r21, r15
    LDI r15, NUM_EFFECTS
    MOD r21, r15

    ; Clear screen (black)
    LDI r15, 0
    FILL r15

    ; Dispatch
    CMPI r21, 0
    JZ r8, do_starfield
    CMPI r21, 1
    JZ r8, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r15, NUM_STARS
    LDI r14, STARS_BASE
star_loop:
    LOAD r5, r14        ; x
    ADDI r14, 1
    LOAD r11, r14        ; y
    ADDI r11, 1
    ANDI r11, 0xFF       ; wrap
    STORE r14, r11
    SUBI r14, 1

    ; Brightness via MIN/MAX
    LDI r7, 0x444444
    MAX r11, r7
    LDI r7, 0xCCCCCC
    MIN r11, r7

    PSET r5, r11, r11
    ADDI r14, 2
    SUBI r15, 1
    JNZ r15, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r15, r25
    ANDI r15, 0x7F
    ADDI r15, 10

    LDI r25, TICKS_ADDR
    LOAD r14, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r14, r26
    ANDI r14, 0x7F
    ADDI r14, 10

    ; CLAMP to stay on screen
    LDI r5, 10
    LDI r11, 200
    CLAMP r15, r5, r11
    CLAMP r14, r5, r11

    ; Green logo
    LDI r7, 0x00FF00
    LDI r1, 15
    LDI r16, 20
    RECTF r15, r14, r1, r16, r7

    ; Shadow
    LDI r7, 0x005500
    ADDI r15, 2
    ADDI r14, 2
    RECTF r15, r14, r1, r16, r7
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r15, r25        ; time
    LDI r14, 0           ; y
plasma_y:
    LDI r5, 0           ; x
plasma_x:
    ; Red channel
    MOV r11, r5
    ADD r11, r14
    ADD r11, r15
    ANDI r11, 0xFF
    SHLI r11, 16

    ; Green channel
    MOV r7, r5
    ADD r7, r14
    ADD r7, r15
    ADDI r7, 85
    ANDI r7, 0xFF
    LDI r1, 200
    MIN r7, r1
    SHLI r7, 8
    ADD r11, r7

    ; Blue channel
    MOV r7, r5
    ADD r7, r14
    ADD r7, r15
    ADDI r7, 170
    ANDI r7, 0xFF
    LDI r1, 200
    MIN r7, r1
    ADD r11, r7

    PSET r5, r14, r11

    ADDI r5, 4
    CMPI r5, 256
    JNZ r8, plasma_x

    ADDI r14, 4
    CMPI r14, 256
    JNZ r8, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r15, 0
    FILL r15
    FRAME
    HALT
