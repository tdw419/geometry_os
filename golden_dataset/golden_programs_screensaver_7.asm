; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r4, NUM_STARS
    LDI r1, STARS_BASE
init_stars:
    RAND r14
    ANDI r14, 0xFF
    STORE r1, r14
    ADDI r1, 1
    RAND r14
    ANDI r14, 0xFF
    STORE r1, r14
    ADDI r1, 1
    SUBI r4, 1
    JNZ r4, init_stars

main_loop:
    IKEY r0
    JNZ r0, exit_screensaver

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
    JZ r0, do_starfield
    CMPI r21, 1
    JZ r0, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r4, NUM_STARS
    LDI r1, STARS_BASE
star_loop:
    LOAD r14, r1        ; x
    ADDI r1, 1
    LOAD r5, r1        ; y
    ADDI r5, 1
    ANDI r5, 0xFF       ; wrap
    STORE r1, r5
    SUBI r1, 1

    ; Brightness via MIN/MAX
    LDI r9, 0x444444
    MAX r5, r9
    LDI r9, 0xCCCCCC
    MIN r5, r9

    PSET r14, r5, r5
    ADDI r1, 2
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
    LOAD r1, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r1, r26
    ANDI r1, 0x7F
    ADDI r1, 10

    ; CLAMP to stay on screen
    LDI r14, 10
    LDI r5, 200
    CLAMP r4, r14, r5
    CLAMP r1, r14, r5

    ; Green logo
    LDI r9, 0x00FF00
    LDI r7, 15
    LDI r16, 20
    RECTF r4, r1, r7, r16, r9

    ; Shadow
    LDI r9, 0x005500
    ADDI r4, 2
    ADDI r1, 2
    RECTF r4, r1, r7, r16, r9
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r4, r25        ; time
    LDI r1, 0           ; y
plasma_y:
    LDI r14, 0           ; x
plasma_x:
    ; Red channel
    MOV r5, r14
    ADD r5, r1
    ADD r5, r4
    ANDI r5, 0xFF
    SHLI r5, 16

    ; Green channel
    MOV r9, r14
    ADD r9, r1
    ADD r9, r4
    ADDI r9, 85
    ANDI r9, 0xFF
    LDI r7, 200
    MIN r9, r7
    SHLI r9, 8
    ADD r5, r9

    ; Blue channel
    MOV r9, r14
    ADD r9, r1
    ADD r9, r4
    ADDI r9, 170
    ANDI r9, 0xFF
    LDI r7, 200
    MIN r9, r7
    ADD r5, r9

    PSET r14, r1, r5

    ADDI r14, 4
    CMPI r14, 256
    JNZ r0, plasma_x

    ADDI r1, 4
    CMPI r1, 256
    JNZ r0, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r4, 0
    FILL r4
    FRAME
    HALT
