; DESCRIPTION: Render a colored object at the screen.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r3, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r7, NUM_STARS
    LDI r0, STARS_BASE
init_stars:
    RAND r14
    ANDI r14, 0xFF
    STORE r0, r14
    ADDI r0, 1
    RAND r14
    ANDI r14, 0xFF
    STORE r0, r14
    ADDI r0, 1
    SUBI r7, 1
    JNZ r7, init_stars

main_loop:
    IKEY r3
    JNZ r3, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r7, TICKS_PER_EFFECT
    DIV r21, r7
    LDI r7, NUM_EFFECTS
    MOD r21, r7

    ; Clear screen (black)
    LDI r7, 0
    FILL r7

    ; Dispatch
    CMPI r21, 0
    JZ r3, do_starfield
    CMPI r21, 1
    JZ r3, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r7, NUM_STARS
    LDI r0, STARS_BASE
star_loop:
    LOAD r14, r0        ; x
    ADDI r0, 1
    LOAD r4, r0        ; y
    ADDI r4, 1
    ANDI r4, 0xFF       ; wrap
    STORE r0, r4
    SUBI r0, 1

    ; Brightness via MIN/MAX
    LDI r15, 0x444444
    MAX r4, r15
    LDI r15, 0xCCCCCC
    MIN r4, r15

    PSET r14, r4, r4
    ADDI r0, 2
    SUBI r7, 1
    JNZ r7, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r7, r25
    ANDI r7, 0x7F
    ADDI r7, 10

    LDI r25, TICKS_ADDR
    LOAD r0, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r0, r26
    ANDI r0, 0x7F
    ADDI r0, 10

    ; CLAMP to stay on screen
    LDI r14, 10
    LDI r4, 200
    CLAMP r7, r14, r4
    CLAMP r0, r14, r4

    ; Green logo
    LDI r15, 0x00FF00
    LDI r12, 15
    LDI r16, 20
    RECTF r7, r0, r12, r16, r15

    ; Shadow
    LDI r15, 0x005500
    ADDI r7, 2
    ADDI r0, 2
    RECTF r7, r0, r12, r16, r15
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r7, r25        ; time
    LDI r0, 0           ; y
plasma_y:
    LDI r14, 0           ; x
plasma_x:
    ; Red channel
    MOV r4, r14
    ADD r4, r0
    ADD r4, r7
    ANDI r4, 0xFF
    SHLI r4, 16

    ; Green channel
    MOV r15, r14
    ADD r15, r0
    ADD r15, r7
    ADDI r15, 85
    ANDI r15, 0xFF
    LDI r12, 200
    MIN r15, r12
    SHLI r15, 8
    ADD r4, r15

    ; Blue channel
    MOV r15, r14
    ADD r15, r0
    ADD r15, r7
    ADDI r15, 170
    ANDI r15, 0xFF
    LDI r12, 200
    MIN r15, r12
    ADD r4, r15

    PSET r14, r0, r4

    ADDI r14, 4
    CMPI r14, 256
    JNZ r3, plasma_x

    ADDI r0, 4
    CMPI r0, 256
    JNZ r3, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r7, 0
    FILL r7
    FRAME
    HALT
