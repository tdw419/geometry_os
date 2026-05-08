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
    LDI r13, 256          ; count
    LDI r1, 1             ; increment
    LDI r6, 0            ; index

build_sine:
    LDI r18, 128
    CMP r6, r18
    BGE r12, above_128
    MOV r17, r18
    SUB r17, r6          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r6
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
    ADD r19, r6
    STORE r19, r18
    ADD r6, r1
    CMP r6, r13
    BLT r12, build_sine

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
    LDI r6, 0
    FILL r6

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r12, pat_gradient
    CMPI r23, 1
    JZ r12, pat_plasma
    CMPI r23, 2
    JZ r12, pat_diamonds
    CMPI r23, 3
    JZ r12, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r12, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r12, key_exit
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
    LDI r15, 1
    LDI r0, 256

gy_loop:
    LDI r3, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r10, r3
    LDI r7, SINE
    ADD r7, r10
    LOAD r2, r7           ; R = sine[x]
    ANDI r2, 0xFF

    MOV r10, r3
    ADDI r10, 85
    ANDI r10, 0xFF
    LDI r7, SINE
    ADD r7, r10
    LOAD r5, r7           ; G = sine[(x+85) & 0xFF]
    ANDI r5, 0xFF

    MOV r10, r3
    ADDI r10, 170
    ANDI r10, 0xFF
    LDI r7, SINE
    ADD r7, r10
    LOAD r11, r7           ; B = sine[(x+170) & 0xFF]
    ANDI r11, 0xFF

    ; Pack RGB
    SHLI r2, 16            ; R << 16
    SHLI r5, 8             ; G << 8
    OR r2, r5
    OR r2, r11              ; packed color

    PSET r3, r9, r2

    ADD r3, r15
    CMPI r3, 256
    BLT r12, gx_loop

    ADD r9, r15
    CMPI r9, 256
    BLT r12, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r9, 0             ; y
    LDI r15, 1
    LDI r0, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 2            ; slow animation

py_loop:
    LDI r3, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r10, r3
    ADD r10, r14
    ANDI r10, 0xFF
    LDI r7, SINE
    ADD r7, r10
    LOAD r2, r7
    ANDI r2, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r10, r9
    MOV r4, r14
    SHLI r4, 1
    ADD r10, r4
    ANDI r10, 0xFF
    LDI r7, SINE
    ADD r7, r10
    LOAD r5, r7
    ANDI r5, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r2, r5
    SHRI r2, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r7, SINE
    ADD r7, r2
    LOAD r11, r7
    ANDI r11, 0xFF
    SHLI r11, 16            ; R << 16

    ADDI r2, 85
    ANDI r2, 0xFF
    LDI r7, SINE
    ADD r7, r2
    LOAD r8, r7
    ANDI r8, 0xFF
    SHLI r8, 8             ; G << 8

    ADDI r2, 85
    ANDI r2, 0xFF
    LDI r7, SINE
    ADD r7, r2
    LOAD r1, r7
    ANDI r1, 0xFF

    OR r11, r8
    OR r11, r1              ; packed color
    PSET r3, r9, r11

    ADDI r3, 1
    CMPI r3, 256
    BLT r12, px_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r12, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r9, 0             ; y
    LDI r15, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 3

dy_loop:
    LDI r3, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r10, r3
    SUBI r10, 128
    MOV r7, r9
    SUBI r7, 128
    ADD r10, r7           ; dist = |x-128| + |y-128|
    ADD r10, r14           ; animated phase
    ANDI r10, 0xFF

    ; Color from sine table
    LDI r7, SINE
    ADD r7, r10
    LOAD r2, r7
    ANDI r2, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r2, 8             ; green channel
    ORI r2, 0x80           ; some blue
    SHLI r2, 8             ; shift to R position
    ORI r2, 0x4040         ; some G + B

    PSET r3, r9, r2

    ADDI r3, 1
    CMPI r3, 256
    BLT r12, dx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r12, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r9, 0             ; y
    LDI r15, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 2

sy_loop:
    LDI r3, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r10, r3
    ADD r10, r9
    ADD r10, r14
    LDI r7, 16
    DIV r10, r7
    LDI r7, 4
    MOD r10, r7           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r10, 0
    JNZ r12, s1
    LDI r2, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r10, 1
    JNZ r12, s2
    LDI r2, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r10, 2
    JNZ r12, s3
    LDI r2, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r2, 0x533483       ; purple

s_draw:
    PSET r3, r9, r2

    ADDI r3, 1
    CMPI r3, 256
    BLT r12, sx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r12, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r9, 0             ; y
    LDI r15, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 4            ; very slow drift

ny_loop:
    LDI r3, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r10, r3
    LDI r7, 31
    MUL r10, r7
    MOV r7, r9
    LDI r4, 17
    MUL r7, r4
    ADD r10, r7
    LDI r7, 7
    MOV r4, r14
    MUL r4, r7
    ADD r10, r4
    ANDI r10, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r7, 0x1F
    AND r10, r7
    ADDI r10, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r10, 4            ; multiply
    ANDI r10, 0xFF
    ADDI r10, 0x10
    ; Pack as RGB: mostly blue
    MOV r2, r10
    SHLI r2, 16            ; R
    MOV r5, r10
    SHRI r5, 1
    SHLI r5, 8             ; G (half)
    OR r2, r5
    OR r2, r10             ; B (full)
    ORI r2, 0x101020       ; minimum base

    PSET r3, r9, r2

    ADDI r3, 1
    CMPI r3, 256
    BLT r12, nx_loop

    ADDI r9, 1
    CMPI r9, 256
    BLT r12, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
