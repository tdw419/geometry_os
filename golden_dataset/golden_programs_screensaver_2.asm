; DESCRIPTION: Draws a colored object at the screen with fixed size.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r5, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r14, NUM_STARS
    LDI r13, STARS_BASE
init_stars:
    RAND r0
    ANDI r0, 0xFF
    STORE r13, r0
    ADDI r13, 1
    RAND r0
    ANDI r0, 0xFF
    STORE r13, r0
    ADDI r13, 1
    SUBI r14, 1
    JNZ r14, init_stars

main_loop:
    IKEY r5
    JNZ r5, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r14, TICKS_PER_EFFECT
    DIV r21, r14
    LDI r14, NUM_EFFECTS
    MOD r21, r14

    ; Clear screen (black)
    LDI r14, 0
    FILL r14

    ; Dispatch
    CMPI r21, 0
    JZ r5, do_starfield
    CMPI r21, 1
    JZ r5, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r14, NUM_STARS
    LDI r13, STARS_BASE
star_loop:
    LOAD r0, r13        ; x
    ADDI r13, 1
    LOAD r6, r13        ; y
    ADDI r6, 1
    ANDI r6, 0xFF       ; wrap
    STORE r13, r6
    SUBI r13, 1

    ; Brightness via MIN/MAX
    LDI r11, 0x444444
    MAX r6, r11
    LDI r11, 0xCCCCCC
    MIN r6, r11

    PSET r0, r6, r6
    ADDI r13, 2
    SUBI r14, 1
    JNZ r14, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r14, r25
    ANDI r14, 0x7F
    ADDI r14, 10

    LDI r25, TICKS_ADDR
    LOAD r13, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r13, r26
    ANDI r13, 0x7F
    ADDI r13, 10

    ; CLAMP to stay on screen
    LDI r0, 10
    LDI r6, 200
    CLAMP r14, r0, r6
    CLAMP r13, r0, r6

    ; Green logo
    LDI r11, 0x00FF00
    LDI r2, 15
    LDI r16, 20
    RECTF r14, r13, r2, r16, r11

    ; Shadow
    LDI r11, 0x005500
    ADDI r14, 2
    ADDI r13, 2
    RECTF r14, r13, r2, r16, r11
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r14, r25        ; time
    LDI r13, 0           ; y
plasma_y:
    LDI r0, 0           ; x
plasma_x:
    ; Red channel
    MOV r6, r0
    ADD r6, r13
    ADD r6, r14
    ANDI r6, 0xFF
    SHLI r6, 16

    ; Green channel
    MOV r11, r0
    ADD r11, r13
    ADD r11, r14
    ADDI r11, 85
    ANDI r11, 0xFF
    LDI r2, 200
    MIN r11, r2
    SHLI r11, 8
    ADD r6, r11

    ; Blue channel
    MOV r11, r0
    ADD r11, r13
    ADD r11, r14
    ADDI r11, 170
    ANDI r11, 0xFF
    LDI r2, 200
    MIN r11, r2
    ADD r6, r11

    PSET r0, r13, r6

    ADDI r0, 4
    CMPI r0, 256
    JNZ r5, plasma_x

    ADDI r13, 4
    CMPI r13, 256
    JNZ r5, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r14, 0
    FILL r14
    FRAME
    HALT
