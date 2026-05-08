; DESCRIPTION: A colored object centered at the screen with fixed size.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r12, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r6, NUM_STARS
    LDI r4, STARS_BASE
init_stars:
    RAND r14
    ANDI r14, 0xFF
    STORE r4, r14
    ADDI r4, 1
    RAND r14
    ANDI r14, 0xFF
    STORE r4, r14
    ADDI r4, 1
    SUBI r6, 1
    JNZ r6, init_stars

main_loop:
    IKEY r12
    JNZ r12, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r6, TICKS_PER_EFFECT
    DIV r21, r6
    LDI r6, NUM_EFFECTS
    MOD r21, r6

    ; Clear screen (black)
    LDI r6, 0
    FILL r6

    ; Dispatch
    CMPI r21, 0
    JZ r12, do_starfield
    CMPI r21, 1
    JZ r12, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r6, NUM_STARS
    LDI r4, STARS_BASE
star_loop:
    LOAD r14, r4        ; x
    ADDI r4, 1
    LOAD r5, r4        ; y
    ADDI r5, 1
    ANDI r5, 0xFF       ; wrap
    STORE r4, r5
    SUBI r4, 1

    ; Brightness via MIN/MAX
    LDI r8, 0x444444
    MAX r5, r8
    LDI r8, 0xCCCCCC
    MIN r5, r8

    PSET r14, r5, r5
    ADDI r4, 2
    SUBI r6, 1
    JNZ r6, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r6, r25
    ANDI r6, 0x7F
    ADDI r6, 10

    LDI r25, TICKS_ADDR
    LOAD r4, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r4, r26
    ANDI r4, 0x7F
    ADDI r4, 10

    ; CLAMP to stay on screen
    LDI r14, 10
    LDI r5, 200
    CLAMP r6, r14, r5
    CLAMP r4, r14, r5

    ; Green logo
    LDI r8, 0x00FF00
    LDI r3, 15
    LDI r16, 20
    RECTF r6, r4, r3, r16, r8

    ; Shadow
    LDI r8, 0x005500
    ADDI r6, 2
    ADDI r4, 2
    RECTF r6, r4, r3, r16, r8
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r6, r25        ; time
    LDI r4, 0           ; y
plasma_y:
    LDI r14, 0           ; x
plasma_x:
    ; Red channel
    MOV r5, r14
    ADD r5, r4
    ADD r5, r6
    ANDI r5, 0xFF
    SHLI r5, 16

    ; Green channel
    MOV r8, r14
    ADD r8, r4
    ADD r8, r6
    ADDI r8, 85
    ANDI r8, 0xFF
    LDI r3, 200
    MIN r8, r3
    SHLI r8, 8
    ADD r5, r8

    ; Blue channel
    MOV r8, r14
    ADD r8, r4
    ADD r8, r6
    ADDI r8, 170
    ANDI r8, 0xFF
    LDI r3, 200
    MIN r8, r3
    ADD r5, r8

    PSET r14, r4, r5

    ADDI r14, 4
    CMPI r14, 256
    JNZ r12, plasma_x

    ADDI r4, 4
    CMPI r4, 256
    JNZ r12, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r6, 0
    FILL r6
    FRAME
    HALT
