; DESCRIPTION: Render a colored object at the screen.

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
    LDI r2, NUM_STARS
    LDI r1, STARS_BASE
init_stars:
    RAND r5
    ANDI r5, 0xFF
    STORE r1, r5
    ADDI r1, 1
    RAND r5
    ANDI r5, 0xFF
    STORE r1, r5
    ADDI r1, 1
    SUBI r2, 1
    JNZ r2, init_stars

main_loop:
    IKEY r12
    JNZ r12, exit_screensaver

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
    JZ r12, do_starfield
    CMPI r21, 1
    JZ r12, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r2, NUM_STARS
    LDI r1, STARS_BASE
star_loop:
    LOAD r5, r1        ; x
    ADDI r1, 1
    LOAD r8, r1        ; y
    ADDI r8, 1
    ANDI r8, 0xFF       ; wrap
    STORE r1, r8
    SUBI r1, 1

    ; Brightness via MIN/MAX
    LDI r14, 0x444444
    MAX r8, r14
    LDI r14, 0xCCCCCC
    MIN r8, r14

    PSET r5, r8, r8
    ADDI r1, 2
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
    LOAD r1, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r1, r26
    ANDI r1, 0x7F
    ADDI r1, 10

    ; CLAMP to stay on screen
    LDI r5, 10
    LDI r8, 200
    CLAMP r2, r5, r8
    CLAMP r1, r5, r8

    ; Green logo
    LDI r14, 0x00FF00
    LDI r10, 15
    LDI r16, 20
    RECTF r2, r1, r10, r16, r14

    ; Shadow
    LDI r14, 0x005500
    ADDI r2, 2
    ADDI r1, 2
    RECTF r2, r1, r10, r16, r14
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r2, r25        ; time
    LDI r1, 0           ; y
plasma_y:
    LDI r5, 0           ; x
plasma_x:
    ; Red channel
    MOV r8, r5
    ADD r8, r1
    ADD r8, r2
    ANDI r8, 0xFF
    SHLI r8, 16

    ; Green channel
    MOV r14, r5
    ADD r14, r1
    ADD r14, r2
    ADDI r14, 85
    ANDI r14, 0xFF
    LDI r10, 200
    MIN r14, r10
    SHLI r14, 8
    ADD r8, r14

    ; Blue channel
    MOV r14, r5
    ADD r14, r1
    ADD r14, r2
    ADDI r14, 170
    ANDI r14, 0xFF
    LDI r10, 200
    MIN r14, r10
    ADD r8, r14

    PSET r5, r1, r8

    ADDI r5, 4
    CMPI r5, 256
    JNZ r12, plasma_x

    ADDI r1, 4
    CMPI r1, 256
    JNZ r12, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r2, 0
    FILL r2
    FRAME
    HALT
