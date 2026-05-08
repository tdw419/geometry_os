; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r4, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r1, NUM_STARS
    LDI r15, STARS_BASE
init_stars:
    RAND r12
    ANDI r12, 0xFF
    STORE r15, r12
    ADDI r15, 1
    RAND r12
    ANDI r12, 0xFF
    STORE r15, r12
    ADDI r15, 1
    SUBI r1, 1
    JNZ r1, init_stars

main_loop:
    IKEY r4
    JNZ r4, exit_screensaver

    ; Current effect = (ticks / TICKS_PER_EFFECT) % NUM_EFFECTS
    LDI r25, TICKS_ADDR
    LOAD r21, r25
    LDI r1, TICKS_PER_EFFECT
    DIV r21, r1
    LDI r1, NUM_EFFECTS
    MOD r21, r1

    ; Clear screen (black)
    LDI r1, 0
    FILL r1

    ; Dispatch
    CMPI r21, 0
    JZ r4, do_starfield
    CMPI r21, 1
    JZ r4, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r1, NUM_STARS
    LDI r15, STARS_BASE
star_loop:
    LOAD r12, r15        ; x
    ADDI r15, 1
    LOAD r14, r15        ; y
    ADDI r14, 1
    ANDI r14, 0xFF       ; wrap
    STORE r15, r14
    SUBI r15, 1

    ; Brightness via MIN/MAX
    LDI r10, 0x444444
    MAX r14, r10
    LDI r10, 0xCCCCCC
    MIN r14, r10

    PSET r12, r14, r14
    ADDI r15, 2
    SUBI r1, 1
    JNZ r1, star_loop
    JMP frame_end

; ── Bouncing logo ─────────────────────────────
do_bounce:
    LDI r25, TICKS_ADDR
    LOAD r1, r25
    ANDI r1, 0x7F
    ADDI r1, 10

    LDI r25, TICKS_ADDR
    LOAD r15, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r15, r26
    ANDI r15, 0x7F
    ADDI r15, 10

    ; CLAMP to stay on screen
    LDI r12, 10
    LDI r14, 200
    CLAMP r1, r12, r14
    CLAMP r15, r12, r14

    ; Green logo
    LDI r10, 0x00FF00
    LDI r3, 15
    LDI r16, 20
    RECTF r1, r15, r3, r16, r10

    ; Shadow
    LDI r10, 0x005500
    ADDI r1, 2
    ADDI r15, 2
    RECTF r1, r15, r3, r16, r10
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r1, r25        ; time
    LDI r15, 0           ; y
plasma_y:
    LDI r12, 0           ; x
plasma_x:
    ; Red channel
    MOV r14, r12
    ADD r14, r15
    ADD r14, r1
    ANDI r14, 0xFF
    SHLI r14, 16

    ; Green channel
    MOV r10, r12
    ADD r10, r15
    ADD r10, r1
    ADDI r10, 85
    ANDI r10, 0xFF
    LDI r3, 200
    MIN r10, r3
    SHLI r10, 8
    ADD r14, r10

    ; Blue channel
    MOV r10, r12
    ADD r10, r15
    ADD r10, r1
    ADDI r10, 170
    ANDI r10, 0xFF
    LDI r3, 200
    MIN r10, r3
    ADD r14, r10

    PSET r12, r15, r14

    ADDI r12, 4
    CMPI r12, 256
    JNZ r4, plasma_x

    ADDI r15, 4
    CMPI r15, 256
    JNZ r4, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r1, 0
    FILL r1
    FRAME
    HALT
