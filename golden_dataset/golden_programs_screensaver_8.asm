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
    LDI r0, NUM_STARS
    LDI r7, STARS_BASE
init_stars:
    RAND r9
    ANDI r9, 0xFF
    STORE r7, r9
    ADDI r7, 1
    RAND r9
    ANDI r9, 0xFF
    STORE r7, r9
    ADDI r7, 1
    SUBI r0, 1
    JNZ r0, init_stars

main_loop:
    IKEY r8
    JNZ r8, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r0, TICKS_PER_EFFECT
    DIV r21, r0
    LDI r0, NUM_EFFECTS
    MOD r21, r0

    ; Clear screen (black)
    LDI r0, 0
    FILL r0

    ; Dispatch
    CMPI r21, 0
    JZ r8, do_starfield
    CMPI r21, 1
    JZ r8, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r0, NUM_STARS
    LDI r7, STARS_BASE
star_loop:
    LOAD r9, r7        ; x
    ADDI r7, 1
    LOAD r2, r7        ; y
    ADDI r2, 1
    ANDI r2, 0xFF       ; wrap
    STORE r7, r2
    SUBI r7, 1

    ; Brightness via MIN/MAX
    LDI r11, 0x444444
    MAX r2, r11
    LDI r11, 0xCCCCCC
    MIN r2, r11

    PSET r9, r2, r2
    ADDI r7, 2
    SUBI r0, 1
    JNZ r0, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r0, r25
    ANDI r0, 0x7F
    ADDI r0, 10

    LDI r25, TICKS_ADDR
    LOAD r7, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r7, r26
    ANDI r7, 0x7F
    ADDI r7, 10

    ; CLAMP to stay on screen
    LDI r9, 10
    LDI r2, 200
    CLAMP r0, r9, r2
    CLAMP r7, r9, r2

    ; Green logo
    LDI r11, 0x00FF00
    LDI r14, 15
    LDI r16, 20
    RECTF r0, r7, r14, r16, r11

    ; Shadow
    LDI r11, 0x005500
    ADDI r0, 2
    ADDI r7, 2
    RECTF r0, r7, r14, r16, r11
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r0, r25        ; time
    LDI r7, 0           ; y
plasma_y:
    LDI r9, 0           ; x
plasma_x:
    ; Red channel
    MOV r2, r9
    ADD r2, r7
    ADD r2, r0
    ANDI r2, 0xFF
    SHLI r2, 16

    ; Green channel
    MOV r11, r9
    ADD r11, r7
    ADD r11, r0
    ADDI r11, 85
    ANDI r11, 0xFF
    LDI r14, 200
    MIN r11, r14
    SHLI r11, 8
    ADD r2, r11

    ; Blue channel
    MOV r11, r9
    ADD r11, r7
    ADD r11, r0
    ADDI r11, 170
    ANDI r11, 0xFF
    LDI r14, 200
    MIN r11, r14
    ADD r2, r11

    PSET r9, r7, r2

    ADDI r9, 4
    CMPI r9, 256
    JNZ r8, plasma_x

    ADDI r7, 4
    CMPI r7, 256
    JNZ r8, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r0, 0
    FILL r0
    FRAME
    HALT
