; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; wallpaper.asm -- Procedural Wallpaper Generator for Geometry OS
; Phase 77 demo: generates full-screen procedural wallpaper patterns
;
; Proves: Sine table, per-pixel rendering, FRAME animation, IKEY input,
;         DIV/MOD/AND/OR for color math, multiple pattern generators.
;
; Controls:
;   1-5 keys select pattern (1=gradient, 2=plasma, 3=diamonds,
;                             4=stripes, 5=noise)
;   Any other key exits
;
; RAM Layout:
;   0x2000  sine table (256 entries, parabolic cosine 128-255)
;   0x6800  current pattern ID (0-4)
;   0x6804  frame counter copy for animation
;
; NOTE: No colons in comments (assembler pitfall)

#define SINE     0x2000
#define PATTERN  0x6800
#define FRAMES   0x6804
#define TICKS    0xFFE

; =========================================
; INIT - Build sine lookup table
; =========================================
start:
    LDI r30, 0xFD00

    ; Init pattern to 0 (gradient)
    LDI r20, PATTERN
    LDI r21, 0
    STORE r20, r21

    ; Build 256-entry sine table at SINE
    ; Parabolic cosine: 255 - 127 * (i-128)^2 / 16384
    ; Range 128-255, never zero
    LDI r16, SINE         ; table base
    LDI r11, 256          ; count
    LDI r13, 1             ; increment
    LDI r7, 0            ; index

build_sine:
    LDI r18, 128
    CMP r7, r18
    BGE r3, above_128
    MOV r17, r18
    SUB r17, r7          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r7
    SUB r17, r18          ; delta = i - 128
do_square:
    MUL r17, r17          ; delta^2
    LDI r18, 127
    MUL r17, r18          ; 127 * delta^2
    LDI r18, 16384
    DIV r17, r18          ; / 16384
    LDI r18, 255
    SUB r18, r17          ; val = 255 - result
    MOV r19, r16
    ADD r19, r7
    STORE r19, r18
    ADD r7, r13
    CMP r7, r11
    BLT r3, build_sine

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    ; Read key
    IKEY r25
    JNZ r25, handle_key

    ; Update frame counter from TICKS
    LDI r20, TICKS
    LOAD r22, r20
    LDI r20, FRAMES
    STORE r20, r22

    ; Clear screen
    LDI r7, 0
    FILL r7

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r3, pat_gradient
    CMPI r23, 1
    JZ r3, pat_plasma
    CMPI r23, 2
    JZ r3, pat_diamonds
    CMPI r23, 3
    JZ r3, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r3, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r3, key_exit
    ; key 1-5: set pattern 0-4
    SUBI r25, 49
    LDI r20, PATTERN
    STORE r20, r25
    JMP main_loop
key_exit:
    HALT

; ── Pattern 0: Horizontal Gradient ────────────
; Smooth gradient cycling through hue by column
pat_gradient:
    LDI r1, 0             ; y = 0
    LDI r6, 1
    LDI r15, 256

gy_loop:
    LDI r8, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r12, r8
    LDI r14, SINE
    ADD r14, r12
    LOAD r2, r14           ; R = sine[x]
    ANDI r2, 0xFF

    MOV r12, r8
    ADDI r12, 85
    ANDI r12, 0xFF
    LDI r14, SINE
    ADD r14, r12
    LOAD r0, r14           ; G = sine[(x+85) & 0xFF]
    ANDI r0, 0xFF

    MOV r12, r8
    ADDI r12, 170
    ANDI r12, 0xFF
    LDI r14, SINE
    ADD r14, r12
    LOAD r10, r14           ; B = sine[(x+170) & 0xFF]
    ANDI r10, 0xFF

    ; Pack RGB
    SHLI r2, 16            ; R << 16
    SHLI r0, 8             ; G << 8
    OR r2, r0
    OR r2, r10              ; packed color

    PSET r8, r1, r2

    ADD r8, r6
    CMPI r8, 256
    BLT r3, gx_loop

    ADD r1, r6
    CMPI r1, 256
    BLT r3, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r1, 0             ; y
    LDI r6, 1
    LDI r15, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r4, r20
    SHRI r4, 2            ; slow animation

py_loop:
    LDI r8, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r12, r8
    ADD r12, r4
    ANDI r12, 0xFF
    LDI r14, SINE
    ADD r14, r12
    LOAD r2, r14
    ANDI r2, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r12, r1
    MOV r5, r4
    SHLI r5, 1
    ADD r12, r5
    ANDI r12, 0xFF
    LDI r14, SINE
    ADD r14, r12
    LOAD r0, r14
    ANDI r0, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r2, r0
    SHRI r2, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r14, SINE
    ADD r14, r2
    LOAD r10, r14
    ANDI r10, 0xFF
    SHLI r10, 16            ; R << 16

    ADDI r2, 85
    ANDI r2, 0xFF
    LDI r14, SINE
    ADD r14, r2
    LOAD r9, r14
    ANDI r9, 0xFF
    SHLI r9, 8             ; G << 8

    ADDI r2, 85
    ANDI r2, 0xFF
    LDI r14, SINE
    ADD r14, r2
    LOAD r13, r14
    ANDI r13, 0xFF

    OR r10, r9
    OR r10, r13              ; packed color
    PSET r8, r1, r10

    ADDI r8, 1
    CMPI r8, 256
    BLT r3, px_loop

    ADDI r1, 1
    CMPI r1, 256
    BLT r3, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r1, 0             ; y
    LDI r6, 1
    LDI r20, FRAMES
    LOAD r4, r20
    SHRI r4, 3

dy_loop:
    LDI r8, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r12, r8
    SUBI r12, 128
    MOV r14, r1
    SUBI r14, 128
    ADD r12, r14           ; dist = |x-128| + |y-128|
    ADD r12, r4           ; animated phase
    ANDI r12, 0xFF

    ; Color from sine table
    LDI r14, SINE
    ADD r14, r12
    LOAD r2, r14
    ANDI r2, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r2, 8             ; green channel
    ORI r2, 0x80           ; some blue
    SHLI r2, 8             ; shift to R position
    ORI r2, 0x4040         ; some G + B

    PSET r8, r1, r2

    ADDI r8, 1
    CMPI r8, 256
    BLT r3, dx_loop

    ADDI r1, 1
    CMPI r1, 256
    BLT r3, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r1, 0             ; y
    LDI r6, 1
    LDI r20, FRAMES
    LOAD r4, r20
    SHRI r4, 2

sy_loop:
    LDI r8, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r12, r8
    ADD r12, r1
    ADD r12, r4
    LDI r14, 16
    DIV r12, r14
    LDI r14, 4
    MOD r12, r14           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r12, 0
    JNZ r3, s1
    LDI r2, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r12, 1
    JNZ r3, s2
    LDI r2, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r12, 2
    JNZ r3, s3
    LDI r2, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r2, 0x533483       ; purple

s_draw:
    PSET r8, r1, r2

    ADDI r8, 1
    CMPI r8, 256
    BLT r3, sx_loop

    ADDI r1, 1
    CMPI r1, 256
    BLT r3, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r1, 0             ; y
    LDI r6, 1
    LDI r20, FRAMES
    LOAD r4, r20
    SHRI r4, 4            ; very slow drift

ny_loop:
    LDI r8, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r12, r8
    LDI r14, 31
    MUL r12, r14
    MOV r14, r1
    LDI r5, 17
    MUL r14, r5
    ADD r12, r14
    LDI r14, 7
    MOV r5, r4
    MUL r5, r14
    ADD r12, r5
    ANDI r12, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r14, 0x1F
    AND r12, r14
    ADDI r12, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r12, 4            ; multiply
    ANDI r12, 0xFF
    ADDI r12, 0x10
    ; Pack as RGB: mostly blue
    MOV r2, r12
    SHLI r2, 16            ; R
    MOV r0, r12
    SHRI r0, 1
    SHLI r0, 8             ; G (half)
    OR r2, r0
    OR r2, r12             ; B (full)
    ORI r2, 0x101020       ; minimum base

    PSET r8, r1, r2

    ADDI r8, 1
    CMPI r8, 256
    BLT r3, nx_loop

    ADDI r1, 1
    CMPI r1, 256
    BLT r3, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
