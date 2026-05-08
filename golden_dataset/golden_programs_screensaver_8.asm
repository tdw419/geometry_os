; DESCRIPTION: Geometry OS program to draw a colored object.

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
    LDI r12, NUM_STARS
    LDI r4, STARS_BASE
init_stars:
    RAND r6
    ANDI r6, 0xFF
    STORE r4, r6
    ADDI r4, 1
    RAND r6
    ANDI r6, 0xFF
    STORE r4, r6
    ADDI r4, 1
    SUBI r12, 1
    JNZ r12, init_stars

main_loop:
    IKEY r10
    JNZ r10, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r12, TICKS_PER_EFFECT
    DIV r21, r12
    LDI r12, NUM_EFFECTS
    MOD r21, r12

    ; Clear screen (black)
    LDI r12, 0
    FILL r12

    ; Dispatch
    CMPI r21, 0
    JZ r10, do_starfield
    CMPI r21, 1
    JZ r10, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r12, NUM_STARS
    LDI r4, STARS_BASE
star_loop:
    LOAD r6, r4        ; x
    ADDI r4, 1
    LOAD r15, r4        ; y
    ADDI r15, 1
    ANDI r15, 0xFF       ; wrap
    STORE r4, r15
    SUBI r4, 1

    ; Brightness via MIN/MAX
    LDI r14, 0x444444
    MAX r15, r14
    LDI r14, 0xCCCCCC
    MIN r15, r14

    PSET r6, r15, r15
    ADDI r4, 2
    SUBI r12, 1
    JNZ r12, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r12, r25
    ANDI r12, 0x7F
    ADDI r12, 10

    LDI r25, TICKS_ADDR
    LOAD r4, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r4, r26
    ANDI r4, 0x7F
    ADDI r4, 10

    ; CLAMP to stay on screen
    LDI r6, 10
    LDI r15, 200
    CLAMP r12, r6, r15
    CLAMP r4, r6, r15

    ; Green logo
    LDI r14, 0x00FF00
    LDI r0, 15
    LDI r16, 20
    RECTF r12, r4, r0, r16, r14

    ; Shadow
    LDI r14, 0x005500
    ADDI r12, 2
    ADDI r4, 2
    RECTF r12, r4, r0, r16, r14
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r12, r25        ; time
    LDI r4, 0           ; y
plasma_y:
    LDI r6, 0           ; x
plasma_x:
    ; Red channel
    MOV r15, r6
    ADD r15, r4
    ADD r15, r12
    ANDI r15, 0xFF
    SHLI r15, 16

    ; Green channel
    MOV r14, r6
    ADD r14, r4
    ADD r14, r12
    ADDI r14, 85
    ANDI r14, 0xFF
    LDI r0, 200
    MIN r14, r0
    SHLI r14, 8
    ADD r15, r14

    ; Blue channel
    MOV r14, r6
    ADD r14, r4
    ADD r14, r12
    ADDI r14, 170
    ANDI r14, 0xFF
    LDI r0, 200
    MIN r14, r0
    ADD r15, r14

    PSET r6, r4, r15

    ADDI r6, 4
    CMPI r6, 256
    JNZ r10, plasma_x

    ADDI r4, 4
    CMPI r4, 256
    JNZ r10, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r12, 0
    FILL r12
    FRAME
    HALT
