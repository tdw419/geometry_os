; DESCRIPTION: Display a object using color colored at the screen.

; screensaver.asm -- Multi-effect screensaver for Geometry OS
; Phase 64 demo: uses MIN/MAX/CLAMP opcodes
; Any key press exits. Effects cycle every ~10 seconds.

#define TICKS_PER_EFFECT 600
#define NUM_EFFECTS      3
#define NUM_STARS        40
#define TICKS_ADDR       0xFFE
#define STARS_BASE       0x1000

    LDI r6, 0

    ; Initialize stars: x,y pairs at STARS_BASE
    LDI r7, NUM_STARS
    LDI r10, STARS_BASE
init_stars:
    RAND r4
    ANDI r4, 0xFF
    STORE r10, r4
    ADDI r10, 1
    RAND r4
    ANDI r4, 0xFF
    STORE r10, r4
    ADDI r10, 1
    SUBI r7, 1
    JNZ r7, init_stars

main_loop:
    IKEY r6
    JNZ r6, exit_screensaver

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
    JZ r6, do_starfield
    CMPI r21, 1
    JZ r6, do_bounce
    JMP do_plasma

; ── Starfield ─────────────────────────────────
do_starfield:
    LDI r7, NUM_STARS
    LDI r10, STARS_BASE
star_loop:
    LOAD r4, r10        ; x
    ADDI r10, 1
    LOAD r12, r10        ; y
    ADDI r12, 1
    ANDI r12, 0xFF       ; wrap
    STORE r10, r12
    SUBI r10, 1

    ; Brightness via MIN/MAX
    LDI r9, 0x444444
    MAX r12, r9
    LDI r9, 0xCCCCCC
    MIN r12, r9

    PSET r4, r12, r12
    ADDI r10, 2
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
    LOAD r10, r25
    ; Slow y: divide by 3 via LDI + DIV
    LDI r26, 3
    DIV r10, r26
    ANDI r10, 0x7F
    ADDI r10, 10

    ; CLAMP to stay on screen
    LDI r4, 10
    LDI r12, 200
    CLAMP r7, r4, r12
    CLAMP r10, r4, r12

    ; Green logo
    LDI r9, 0x00FF00
    LDI r5, 15
    LDI r16, 20
    RECTF r7, r10, r5, r16, r9

    ; Shadow
    LDI r9, 0x005500
    ADDI r7, 2
    ADDI r10, 2
    RECTF r7, r10, r5, r16, r9
    JMP frame_end

; ── Plasma ────────────────────────────────────
do_plasma:
    LDI r25, TICKS_ADDR
    LOAD r7, r25        ; time
    LDI r10, 0           ; y
plasma_y:
    LDI r4, 0           ; x
plasma_x:
    ; Red channel
    MOV r12, r4
    ADD r12, r10
    ADD r12, r7
    ANDI r12, 0xFF
    SHLI r12, 16

    ; Green channel
    MOV r9, r4
    ADD r9, r10
    ADD r9, r7
    ADDI r9, 85
    ANDI r9, 0xFF
    LDI r5, 200
    MIN r9, r5
    SHLI r9, 8
    ADD r12, r9

    ; Blue channel
    MOV r9, r4
    ADD r9, r10
    ADD r9, r7
    ADDI r9, 170
    ANDI r9, 0xFF
    LDI r5, 200
    MIN r9, r5
    ADD r12, r9

    PSET r4, r10, r12

    ADDI r4, 4
    CMPI r4, 256
    JNZ r6, plasma_x

    ADDI r10, 4
    CMPI r10, 256
    JNZ r6, plasma_y
    JMP frame_end

frame_end:
    FRAME
    JMP main_loop

exit_screensaver:
    LDI r7, 0
    FILL r7
    FRAME
    HALT
