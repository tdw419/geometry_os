; DESCRIPTION: This GeOS assembly code implements a procedural wallpaper generator capable of producing various full-screen patterns including gradients, plasma effects, diamonds, stripes, and noise. It uses a sine table for color calculations, supports frame animation through input handling, and allows pattern selection via key presses. The code manages RAM layout for storing the sine table, current pattern ID, and frame counter, ensuring efficient rendering and user interaction within the Geometry OS environment.

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
    LDI r6, 256          ; count
    LDI r3, 1             ; increment
    LDI r8, 0            ; index

build_sine:
    LDI r18, 128
    CMP r8, r18
    BGE r1, above_128
    MOV r17, r18
    SUB r17, r8          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r8
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
    ADD r19, r8
    STORE r19, r18
    ADD r8, r3
    CMP r8, r6
    BLT r1, build_sine

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
    LDI r8, 0
    FILL r8

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r1, pat_gradient
    CMPI r23, 1
    JZ r1, pat_plasma
    CMPI r23, 2
    JZ r1, pat_diamonds
    CMPI r23, 3
    JZ r1, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r1, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r1, key_exit
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
    LDI r11, 0             ; y = 0
    LDI r5, 1
    LDI r12, 256

gy_loop:
    LDI r7, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r2, r7
    LDI r13, SINE
    ADD r13, r2
    LOAD r10, r13           ; R = sine[x]
    ANDI r10, 0xFF

    MOV r2, r7
    ADDI r2, 85
    ANDI r2, 0xFF
    LDI r13, SINE
    ADD r13, r2
    LOAD r0, r13           ; G = sine[(x+85) & 0xFF]
    ANDI r0, 0xFF

    MOV r2, r7
    ADDI r2, 170
    ANDI r2, 0xFF
    LDI r13, SINE
    ADD r13, r2
    LOAD r15, r13           ; B = sine[(x+170) & 0xFF]
    ANDI r15, 0xFF

    ; Pack RGB
    SHLI r10, 16            ; R << 16
    SHLI r0, 8             ; G << 8
    OR r10, r0
    OR r10, r15              ; packed color

    PSET r7, r11, r10

    ADD r7, r5
    CMPI r7, 256
    BLT r1, gx_loop

    ADD r11, r5
    CMPI r11, 256
    BLT r1, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r11, 0             ; y
    LDI r5, 1
    LDI r12, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r9, r20
    SHRI r9, 2            ; slow animation

py_loop:
    LDI r7, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r2, r7
    ADD r2, r9
    ANDI r2, 0xFF
    LDI r13, SINE
    ADD r13, r2
    LOAD r10, r13
    ANDI r10, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r2, r11
    MOV r4, r9
    SHLI r4, 1
    ADD r2, r4
    ANDI r2, 0xFF
    LDI r13, SINE
    ADD r13, r2
    LOAD r0, r13
    ANDI r0, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r10, r0
    SHRI r10, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r13, SINE
    ADD r13, r10
    LOAD r15, r13
    ANDI r15, 0xFF
    SHLI r15, 16            ; R << 16

    ADDI r10, 85
    ANDI r10, 0xFF
    LDI r13, SINE
    ADD r13, r10
    LOAD r14, r13
    ANDI r14, 0xFF
    SHLI r14, 8             ; G << 8

    ADDI r10, 85
    ANDI r10, 0xFF
    LDI r13, SINE
    ADD r13, r10
    LOAD r3, r13
    ANDI r3, 0xFF

    OR r15, r14
    OR r15, r3              ; packed color
    PSET r7, r11, r15

    ADDI r7, 1
    CMPI r7, 256
    BLT r1, px_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r1, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r11, 0             ; y
    LDI r5, 1
    LDI r20, FRAMES
    LOAD r9, r20
    SHRI r9, 3

dy_loop:
    LDI r7, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r2, r7
    SUBI r2, 128
    MOV r13, r11
    SUBI r13, 128
    ADD r2, r13           ; dist = |x-128| + |y-128|
    ADD r2, r9           ; animated phase
    ANDI r2, 0xFF

    ; Color from sine table
    LDI r13, SINE
    ADD r13, r2
    LOAD r10, r13
    ANDI r10, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r10, 8             ; green channel
    ORI r10, 0x80           ; some blue
    SHLI r10, 8             ; shift to R position
    ORI r10, 0x4040         ; some G + B

    PSET r7, r11, r10

    ADDI r7, 1
    CMPI r7, 256
    BLT r1, dx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r1, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r11, 0             ; y
    LDI r5, 1
    LDI r20, FRAMES
    LOAD r9, r20
    SHRI r9, 2

sy_loop:
    LDI r7, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r2, r7
    ADD r2, r11
    ADD r2, r9
    LDI r13, 16
    DIV r2, r13
    LDI r13, 4
    MOD r2, r13           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r2, 0
    JNZ r1, s1
    LDI r10, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r2, 1
    JNZ r1, s2
    LDI r10, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r2, 2
    JNZ r1, s3
    LDI r10, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r10, 0x533483       ; purple

s_draw:
    PSET r7, r11, r10

    ADDI r7, 1
    CMPI r7, 256
    BLT r1, sx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r1, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r11, 0             ; y
    LDI r5, 1
    LDI r20, FRAMES
    LOAD r9, r20
    SHRI r9, 4            ; very slow drift

ny_loop:
    LDI r7, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r2, r7
    LDI r13, 31
    MUL r2, r13
    MOV r13, r11
    LDI r4, 17
    MUL r13, r4
    ADD r2, r13
    LDI r13, 7
    MOV r4, r9
    MUL r4, r13
    ADD r2, r4
    ANDI r2, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r13, 0x1F
    AND r2, r13
    ADDI r2, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r2, 4            ; multiply
    ANDI r2, 0xFF
    ADDI r2, 0x10
    ; Pack as RGB: mostly blue
    MOV r10, r2
    SHLI r10, 16            ; R
    MOV r0, r2
    SHRI r0, 1
    SHLI r0, 8             ; G (half)
    OR r10, r0
    OR r10, r2             ; B (full)
    ORI r10, 0x101020       ; minimum base

    PSET r7, r11, r10

    ADDI r7, 1
    CMPI r7, 256
    BLT r1, nx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r1, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
