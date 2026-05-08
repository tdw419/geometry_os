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
    LDI r15, 1             ; increment
    LDI r2, 0            ; index

build_sine:
    LDI r18, 128
    CMP r2, r18
    BGE r7, above_128
    MOV r17, r18
    SUB r17, r2          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r2
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
    ADD r19, r2
    STORE r19, r18
    ADD r2, r15
    CMP r2, r6
    BLT r7, build_sine

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
    LDI r2, 0
    FILL r2

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r7, pat_gradient
    CMPI r23, 1
    JZ r7, pat_plasma
    CMPI r23, 2
    JZ r7, pat_diamonds
    CMPI r23, 3
    JZ r7, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r7, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r7, key_exit
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
    LDI r0, 0             ; y = 0
    LDI r12, 1
    LDI r10, 256

gy_loop:
    LDI r13, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r1, r13
    LDI r14, SINE
    ADD r14, r1
    LOAD r4, r14           ; R = sine[x]
    ANDI r4, 0xFF

    MOV r1, r13
    ADDI r1, 85
    ANDI r1, 0xFF
    LDI r14, SINE
    ADD r14, r1
    LOAD r9, r14           ; G = sine[(x+85) & 0xFF]
    ANDI r9, 0xFF

    MOV r1, r13
    ADDI r1, 170
    ANDI r1, 0xFF
    LDI r14, SINE
    ADD r14, r1
    LOAD r3, r14           ; B = sine[(x+170) & 0xFF]
    ANDI r3, 0xFF

    ; Pack RGB
    SHLI r4, 16            ; R << 16
    SHLI r9, 8             ; G << 8
    OR r4, r9
    OR r4, r3              ; packed color

    PSET r13, r0, r4

    ADD r13, r12
    CMPI r13, 256
    BLT r7, gx_loop

    ADD r0, r12
    CMPI r0, 256
    BLT r7, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r0, 0             ; y
    LDI r12, 1
    LDI r10, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r11, r20
    SHRI r11, 2            ; slow animation

py_loop:
    LDI r13, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r1, r13
    ADD r1, r11
    ANDI r1, 0xFF
    LDI r14, SINE
    ADD r14, r1
    LOAD r4, r14
    ANDI r4, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r1, r0
    MOV r8, r11
    SHLI r8, 1
    ADD r1, r8
    ANDI r1, 0xFF
    LDI r14, SINE
    ADD r14, r1
    LOAD r9, r14
    ANDI r9, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r4, r9
    SHRI r4, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r14, SINE
    ADD r14, r4
    LOAD r3, r14
    ANDI r3, 0xFF
    SHLI r3, 16            ; R << 16

    ADDI r4, 85
    ANDI r4, 0xFF
    LDI r14, SINE
    ADD r14, r4
    LOAD r5, r14
    ANDI r5, 0xFF
    SHLI r5, 8             ; G << 8

    ADDI r4, 85
    ANDI r4, 0xFF
    LDI r14, SINE
    ADD r14, r4
    LOAD r15, r14
    ANDI r15, 0xFF

    OR r3, r5
    OR r3, r15              ; packed color
    PSET r13, r0, r3

    ADDI r13, 1
    CMPI r13, 256
    BLT r7, px_loop

    ADDI r0, 1
    CMPI r0, 256
    BLT r7, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r0, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r11, r20
    SHRI r11, 3

dy_loop:
    LDI r13, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r1, r13
    SUBI r1, 128
    MOV r14, r0
    SUBI r14, 128
    ADD r1, r14           ; dist = |x-128| + |y-128|
    ADD r1, r11           ; animated phase
    ANDI r1, 0xFF

    ; Color from sine table
    LDI r14, SINE
    ADD r14, r1
    LOAD r4, r14
    ANDI r4, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r4, 8             ; green channel
    ORI r4, 0x80           ; some blue
    SHLI r4, 8             ; shift to R position
    ORI r4, 0x4040         ; some G + B

    PSET r13, r0, r4

    ADDI r13, 1
    CMPI r13, 256
    BLT r7, dx_loop

    ADDI r0, 1
    CMPI r0, 256
    BLT r7, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r0, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r11, r20
    SHRI r11, 2

sy_loop:
    LDI r13, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r1, r13
    ADD r1, r0
    ADD r1, r11
    LDI r14, 16
    DIV r1, r14
    LDI r14, 4
    MOD r1, r14           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r1, 0
    JNZ r7, s1
    LDI r4, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r1, 1
    JNZ r7, s2
    LDI r4, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r1, 2
    JNZ r7, s3
    LDI r4, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r4, 0x533483       ; purple

s_draw:
    PSET r13, r0, r4

    ADDI r13, 1
    CMPI r13, 256
    BLT r7, sx_loop

    ADDI r0, 1
    CMPI r0, 256
    BLT r7, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r0, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r11, r20
    SHRI r11, 4            ; very slow drift

ny_loop:
    LDI r13, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r1, r13
    LDI r14, 31
    MUL r1, r14
    MOV r14, r0
    LDI r8, 17
    MUL r14, r8
    ADD r1, r14
    LDI r14, 7
    MOV r8, r11
    MUL r8, r14
    ADD r1, r8
    ANDI r1, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r14, 0x1F
    AND r1, r14
    ADDI r1, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r1, 4            ; multiply
    ANDI r1, 0xFF
    ADDI r1, 0x10
    ; Pack as RGB: mostly blue
    MOV r4, r1
    SHLI r4, 16            ; R
    MOV r9, r1
    SHRI r9, 1
    SHLI r9, 8             ; G (half)
    OR r4, r9
    OR r4, r1             ; B (full)
    ORI r4, 0x101020       ; minimum base

    PSET r13, r0, r4

    ADDI r13, 1
    CMPI r13, 256
    BLT r7, nx_loop

    ADDI r0, 1
    CMPI r0, 256
    BLT r7, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
