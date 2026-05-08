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
    LDI r14, 256          ; count
    LDI r11, 1             ; increment
    LDI r8, 0            ; index

build_sine:
    LDI r18, 128
    CMP r8, r18
    BGE r2, above_128
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
    ADD r8, r11
    CMP r8, r14
    BLT r2, build_sine

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
    JZ r2, pat_gradient
    CMPI r23, 1
    JZ r2, pat_plasma
    CMPI r23, 2
    JZ r2, pat_diamonds
    CMPI r23, 3
    JZ r2, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r2, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r2, key_exit
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
    LDI r9, 0             ; y = 0
    LDI r0, 1
    LDI r10, 256

gy_loop:
    LDI r4, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r6, r4
    LDI r1, SINE
    ADD r1, r6
    LOAD r15, r1           ; R = sine[x]
    ANDI r15, 0xFF

    MOV r6, r4
    ADDI r6, 85
    ANDI r6, 0xFF
    LDI r1, SINE
    ADD r1, r6
    LOAD r12, r1           ; G = sine[(x+85) & 0xFF]
    ANDI r12, 0xFF

    MOV r6, r4
    ADDI r6, 170
    ANDI r6, 0xFF
    LDI r1, SINE
    ADD r1, r6
    LOAD r7, r1           ; B = sine[(x+170) & 0xFF]
    ANDI r7, 0xFF

    ; Pack RGB
    SHLI r15, 16            ; R << 16
    SHLI r12, 8             ; G << 8
    OR r15, r12
    OR r15, r7              ; packed color

    PSET r4, r9, r15

    ADD r4, r0
    CMPI r4, 256
    BLT r2, gx_loop

    ADD r9, r0
    CMPI r9, 256
    BLT r2, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r9, 0             ; y
    LDI r0, 1
    LDI r10, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r3, r20
    SHRI r3, 2            ; slow animation

py_loop:
    LDI r4, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r6, r4
    ADD r6, r3
    ANDI r6, 0xFF
    LDI r1, SINE
    ADD r1, r6
    LOAD r15, r1
    ANDI r15, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r6, r9
    MOV r13, r3
    SHLI r13, 1
    ADD r6, r13
    ANDI r6, 0xFF
    LDI r1, SINE
    ADD r1, r6
    LOAD r12, r1
    ANDI r12, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r15, r12
    SHRI r15, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r1, SINE
    ADD r1, r15
    LOAD r7, r1
    ANDI r7, 0xFF
    SHLI r7, 16            ; R << 16

    ADDI r15, 85
    ANDI r15, 0xFF
    LDI r1, SINE
    ADD r1, r15
    LOAD r5, r1
    ANDI r5, 0xFF
    SHLI r5, 8             ; G << 8

    ADDI r15, 85
    ANDI r15, 0xFF
    LDI r1, SINE
    ADD r1, r15
    LOAD r11, r1
    ANDI r11, 0xFF

    OR r7, r5
    OR r7, r11              ; packed color
    PSET r4, r9, r7

    ADDI r4, 1
    CMPI r4, 256
    BLT r2, px_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r2, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r9, 0             ; y
    LDI r0, 1
    LDI r20, FRAMES
    LOAD r3, r20
    SHRI r3, 3

dy_loop:
    LDI r4, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r6, r4
    SUBI r6, 128
    MOV r1, r9
    SUBI r1, 128
    ADD r6, r1           ; dist = |x-128| + |y-128|
    ADD r6, r3           ; animated phase
    ANDI r6, 0xFF

    ; Color from sine table
    LDI r1, SINE
    ADD r1, r6
    LOAD r15, r1
    ANDI r15, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r15, 8             ; green channel
    ORI r15, 0x80           ; some blue
    SHLI r15, 8             ; shift to R position
    ORI r15, 0x4040         ; some G + B

    PSET r4, r9, r15

    ADDI r4, 1
    CMPI r4, 256
    BLT r2, dx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r2, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r9, 0             ; y
    LDI r0, 1
    LDI r20, FRAMES
    LOAD r3, r20
    SHRI r3, 2

sy_loop:
    LDI r4, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r6, r4
    ADD r6, r9
    ADD r6, r3
    LDI r1, 16
    DIV r6, r1
    LDI r1, 4
    MOD r6, r1           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r6, 0
    JNZ r2, s1
    LDI r15, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r6, 1
    JNZ r2, s2
    LDI r15, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r6, 2
    JNZ r2, s3
    LDI r15, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r15, 0x533483       ; purple

s_draw:
    PSET r4, r9, r15

    ADDI r4, 1
    CMPI r4, 256
    BLT r2, sx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r2, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r9, 0             ; y
    LDI r0, 1
    LDI r20, FRAMES
    LOAD r3, r20
    SHRI r3, 4            ; very slow drift

ny_loop:
    LDI r4, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r6, r4
    LDI r1, 31
    MUL r6, r1
    MOV r1, r9
    LDI r13, 17
    MUL r1, r13
    ADD r6, r1
    LDI r1, 7
    MOV r13, r3
    MUL r13, r1
    ADD r6, r13
    ANDI r6, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r1, 0x1F
    AND r6, r1
    ADDI r6, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r6, 4            ; multiply
    ANDI r6, 0xFF
    ADDI r6, 0x10
    ; Pack as RGB: mostly blue
    MOV r15, r6
    SHLI r15, 16            ; R
    MOV r12, r6
    SHRI r12, 1
    SHLI r12, 8             ; G (half)
    OR r15, r12
    OR r15, r6             ; B (full)
    ORI r15, 0x101020       ; minimum base

    PSET r4, r9, r15

    ADDI r4, 1
    CMPI r4, 256
    BLT r2, nx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r2, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
