; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
    LDI r1, 1             ; increment
    LDI r12, 0            ; index

build_sine:
    LDI r18, 128
    CMP r12, r18
    BGE r4, above_128
    MOV r17, r18
    SUB r17, r12          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r12
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
    ADD r19, r12
    STORE r19, r18
    ADD r12, r1
    CMP r12, r14
    BLT r4, build_sine

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
    LDI r12, 0
    FILL r12

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r4, pat_gradient
    CMPI r23, 1
    JZ r4, pat_plasma
    CMPI r23, 2
    JZ r4, pat_diamonds
    CMPI r23, 3
    JZ r4, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r4, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r4, key_exit
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
    LDI r8, 1
    LDI r7, 256

gy_loop:
    LDI r15, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r13, r15
    LDI r9, SINE
    ADD r9, r13
    LOAD r3, r9           ; R = sine[x]
    ANDI r3, 0xFF

    MOV r13, r15
    ADDI r13, 85
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r6, r9           ; G = sine[(x+85) & 0xFF]
    ANDI r6, 0xFF

    MOV r13, r15
    ADDI r13, 170
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r0, r9           ; B = sine[(x+170) & 0xFF]
    ANDI r0, 0xFF

    ; Pack RGB
    SHLI r3, 16            ; R << 16
    SHLI r6, 8             ; G << 8
    OR r3, r6
    OR r3, r0              ; packed color

    PSET r15, r11, r3

    ADD r15, r8
    CMPI r15, 256
    BLT r4, gx_loop

    ADD r11, r8
    CMPI r11, 256
    BLT r4, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r11, 0             ; y
    LDI r8, 1
    LDI r7, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r2, r20
    SHRI r2, 2            ; slow animation

py_loop:
    LDI r15, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r13, r15
    ADD r13, r2
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r3, r9
    ANDI r3, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r13, r11
    MOV r5, r2
    SHLI r5, 1
    ADD r13, r5
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r6, r9
    ANDI r6, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r3, r6
    SHRI r3, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r9, SINE
    ADD r9, r3
    LOAD r0, r9
    ANDI r0, 0xFF
    SHLI r0, 16            ; R << 16

    ADDI r3, 85
    ANDI r3, 0xFF
    LDI r9, SINE
    ADD r9, r3
    LOAD r10, r9
    ANDI r10, 0xFF
    SHLI r10, 8             ; G << 8

    ADDI r3, 85
    ANDI r3, 0xFF
    LDI r9, SINE
    ADD r9, r3
    LOAD r1, r9
    ANDI r1, 0xFF

    OR r0, r10
    OR r0, r1              ; packed color
    PSET r15, r11, r0

    ADDI r15, 1
    CMPI r15, 256
    BLT r4, px_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r4, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r11, 0             ; y
    LDI r8, 1
    LDI r20, FRAMES
    LOAD r2, r20
    SHRI r2, 3

dy_loop:
    LDI r15, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r13, r15
    SUBI r13, 128
    MOV r9, r11
    SUBI r9, 128
    ADD r13, r9           ; dist = |x-128| + |y-128|
    ADD r13, r2           ; animated phase
    ANDI r13, 0xFF

    ; Color from sine table
    LDI r9, SINE
    ADD r9, r13
    LOAD r3, r9
    ANDI r3, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r3, 8             ; green channel
    ORI r3, 0x80           ; some blue
    SHLI r3, 8             ; shift to R position
    ORI r3, 0x4040         ; some G + B

    PSET r15, r11, r3

    ADDI r15, 1
    CMPI r15, 256
    BLT r4, dx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r4, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r11, 0             ; y
    LDI r8, 1
    LDI r20, FRAMES
    LOAD r2, r20
    SHRI r2, 2

sy_loop:
    LDI r15, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r13, r15
    ADD r13, r11
    ADD r13, r2
    LDI r9, 16
    DIV r13, r9
    LDI r9, 4
    MOD r13, r9           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r13, 0
    JNZ r4, s1
    LDI r3, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r13, 1
    JNZ r4, s2
    LDI r3, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r13, 2
    JNZ r4, s3
    LDI r3, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r3, 0x533483       ; purple

s_draw:
    PSET r15, r11, r3

    ADDI r15, 1
    CMPI r15, 256
    BLT r4, sx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r4, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r11, 0             ; y
    LDI r8, 1
    LDI r20, FRAMES
    LOAD r2, r20
    SHRI r2, 4            ; very slow drift

ny_loop:
    LDI r15, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r13, r15
    LDI r9, 31
    MUL r13, r9
    MOV r9, r11
    LDI r5, 17
    MUL r9, r5
    ADD r13, r9
    LDI r9, 7
    MOV r5, r2
    MUL r5, r9
    ADD r13, r5
    ANDI r13, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r9, 0x1F
    AND r13, r9
    ADDI r13, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r13, 4            ; multiply
    ANDI r13, 0xFF
    ADDI r13, 0x10
    ; Pack as RGB: mostly blue
    MOV r3, r13
    SHLI r3, 16            ; R
    MOV r6, r13
    SHRI r6, 1
    SHLI r6, 8             ; G (half)
    OR r3, r6
    OR r3, r13             ; B (full)
    ORI r3, 0x101020       ; minimum base

    PSET r15, r11, r3

    ADDI r15, 1
    CMPI r15, 256
    BLT r4, nx_loop

    ADDI r11, 1
    CMPI r11, 256
    BLT r4, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
