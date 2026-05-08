; DESCRIPTION: Draws a colored object at the screen with fixed size.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r9, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r4, NUM_STARS
    LDI r0, STARS_BASE
init_stars:
    RAND r7
    ANDI r7, 0xFF
    STORE r0, r7
    ADDI r0, 1
    RAND r7
    ANDI r7, 0xFF
    STORE r0, r7
    ADDI r0, 1
    SUBI r4, 1
    JNZ r4, init_stars

main_loop:
    IKEY r9
    JNZ r9, exit_screensaver

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
    JZ r9, do_starfield
    CMPI r21, 1
    JZ r9, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r4, NUM_STARS
    LDI r0, STARS_BASE
star_loop:
    LOAD r7, r0        ; x
    ADDI r0, 1
    LOAD r8, r0        ; y
    ADDI r8, 1
    ANDI r8, 0xFF       ; wrap
    STORE r0, r8
    SUBI r0, 1

    ; Brightness via MIN/MAX
    LDI r14, 0x444444
    MAX r8, r14
    LDI r14, 0xCCCCCC
    MIN r8, r14

    PSET r7, r8, r8
    ADDI r0, 2
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
    LOAD r0, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r0, r26
    ANDI r0, 0x7F
    ADDI r0, 10

    ; CLAMP to stay on screen
    LDI r7, 10
    LDI r8, 200
    CLAMP r4, r7, r8
    CLAMP r0, r7, r8

    ; Green logo
    LDI r14, 0x00FF00
    LDI r5, 15
    LDI r16, 20
    RECTF r4, r0, r5, r16, r14

    ; Shadow
    LDI r14, 0x005500
    ADDI r4, 2
    ADDI r0, 2
    RECTF r4, r0, r5, r16, r14
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r4, r25        ; time
    LDI r0, 0           ; y
plasma_y:
    LDI r7, 0           ; x
plasma_x:
    ; Red channel
    MOV r8, r7
    ADD r8, r0
    ADD r8, r4
    ANDI r8, 0xFF
    SHLI r8, 16

    ; Green channel
    MOV r14, r7
    ADD r14, r0
    ADD r14, r4
    ADDI r14, 85
    ANDI r14, 0xFF
    LDI r5, 200
    MIN r14, r5
    SHLI r14, 8
    ADD r8, r14

    ; Blue channel
    MOV r14, r7
    ADD r14, r0
    ADD r14, r4
    ADDI r14, 170
    ANDI r14, 0xFF
    LDI r5, 200
    MIN r14, r5
    ADD r8, r14

    PSET r7, r0, r8

    ADDI r7, 4
    CMPI r7, 256
    JNZ r9, plasma_x

    ADDI r0, 4
    CMPI r0, 256
    JNZ r9, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r4, 0
    FILL r4
    FRAME
    HALT
