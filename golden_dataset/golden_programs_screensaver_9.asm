; DESCRIPTION: This GeOS assembly code implements a multi-effect screensaver with three visual modes: a starfield, a bouncing logo, and a plasma effect. The effects cycle every ~10 seconds, and the screensaver exits upon any key press.

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
    LDI r14, NUM_STARS
    LDI r15, STARS_BASE
init_stars:
    RAND r9
    ANDI r9, 0xFF
    STORE r15, r9
    ADDI r15, 1
    RAND r9
    ANDI r9, 0xFF
    STORE r15, r9
    ADDI r15, 1
    SUBI r14, 1
    JNZ r14, init_stars

main_loop:
    IKEY r0
    JNZ r0, exit_screensaver

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
    JZ r0, do_starfield
    CMPI r21, 1
    JZ r0, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r14, NUM_STARS
    LDI r15, STARS_BASE
star_loop:
    LOAD r9, r15        ; x
    ADDI r15, 1
    LOAD r10, r15        ; y
    ADDI r10, 1
    ANDI r10, 0xFF       ; wrap
    STORE r15, r10
    SUBI r15, 1

    ; Brightness via MIN/MAX
    LDI r1, 0x444444
    MAX r10, r1
    LDI r1, 0xCCCCCC
    MIN r10, r1

    PSET r9, r10, r10
    ADDI r15, 2
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
    LOAD r15, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r15, r26
    ANDI r15, 0x7F
    ADDI r15, 10

    ; CLAMP to stay on screen
    LDI r9, 10
    LDI r10, 200
    CLAMP r14, r9, r10
    CLAMP r15, r9, r10

    ; Green logo
    LDI r1, 0x00FF00
    LDI r3, 15
    LDI r16, 20
    RECTF r14, r15, r3, r16, r1

    ; Shadow
    LDI r1, 0x005500
    ADDI r14, 2
    ADDI r15, 2
    RECTF r14, r15, r3, r16, r1
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r14, r25        ; time
    LDI r15, 0           ; y
plasma_y:
    LDI r9, 0           ; x
plasma_x:
    ; Red channel
    MOV r10, r9
    ADD r10, r15
    ADD r10, r14
    ANDI r10, 0xFF
    SHLI r10, 16

    ; Green channel
    MOV r1, r9
    ADD r1, r15
    ADD r1, r14
    ADDI r1, 85
    ANDI r1, 0xFF
    LDI r3, 200
    MIN r1, r3
    SHLI r1, 8
    ADD r10, r1

    ; Blue channel
    MOV r1, r9
    ADD r1, r15
    ADD r1, r14
    ADDI r1, 170
    ANDI r1, 0xFF
    LDI r3, 200
    MIN r1, r3
    ADD r10, r1

    PSET r9, r15, r10

    ADDI r9, 4
    CMPI r9, 256
    JNZ r0, plasma_x

    ADDI r15, 4
    CMPI r15, 256
    JNZ r0, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r14, 0
    FILL r14
    FRAME
    HALT
