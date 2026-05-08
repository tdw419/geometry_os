; DESCRIPTION: Render a colored object at the screen.

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
    LDI r6, 1             ; increment
    LDI r10, 0            ; index

build_sine:
    LDI r18, 128
    CMP r10, r18
    BGE r14, above_128
    MOV r17, r18
    SUB r17, r10          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r10
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
    ADD r19, r10
    STORE r19, r18
    ADD r10, r6
    CMP r10, r11
    BLT r14, build_sine

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
    LDI r10, 0
    FILL r10

    ; Load current pattern
    LDI r20, PATTERN
    LOAD r23, r20

    ; Dispatch pattern
    CMPI r23, 0
    JZ r14, pat_gradient
    CMPI r23, 1
    JZ r14, pat_plasma
    CMPI r23, 2
    JZ r14, pat_diamonds
    CMPI r23, 3
    JZ r14, pat_stripes
    ; default: noise
    JMP pat_noise

; ── Key handler ───────────────────────────────
handle_key:
    ; 49 = '1', 50 = '2', etc.
    LDI r20, 49
    CMP r25, r20
    BLT r14, key_exit
    LDI r20, 53
    CMP r25, r20
    BGE r14, key_exit
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
    LDI r15, 0             ; y = 0
    LDI r12, 1
    LDI r7, 256

gy_loop:
    LDI r8, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r4, r8
    LDI r9, SINE
    ADD r9, r4
    LOAD r1, r9           ; R = sine[x]
    ANDI r1, 0xFF

    MOV r4, r8
    ADDI r4, 85
    ANDI r4, 0xFF
    LDI r9, SINE
    ADD r9, r4
    LOAD r13, r9           ; G = sine[(x+85) & 0xFF]
    ANDI r13, 0xFF

    MOV r4, r8
    ADDI r4, 170
    ANDI r4, 0xFF
    LDI r9, SINE
    ADD r9, r4
    LOAD r3, r9           ; B = sine[(x+170) & 0xFF]
    ANDI r3, 0xFF

    ; Pack RGB
    SHLI r1, 16            ; R << 16
    SHLI r13, 8             ; G << 8
    OR r1, r13
    OR r1, r3              ; packed color

    PSET r8, r15, r1

    ADD r8, r12
    CMPI r8, 256
    BLT r14, gx_loop

    ADD r15, r12
    CMPI r15, 256
    BLT r14, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r15, 0             ; y
    LDI r12, 1
    LDI r7, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r0, r20
    SHRI r0, 2            ; slow animation

py_loop:
    LDI r8, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r4, r8
    ADD r4, r0
    ANDI r4, 0xFF
    LDI r9, SINE
    ADD r9, r4
    LOAD r1, r9
    ANDI r1, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r4, r15
    MOV r5, r0
    SHLI r5, 1
    ADD r4, r5
    ANDI r4, 0xFF
    LDI r9, SINE
    ADD r9, r4
    LOAD r13, r9
    ANDI r13, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r1, r13
    SHRI r1, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r9, SINE
    ADD r9, r1
    LOAD r3, r9
    ANDI r3, 0xFF
    SHLI r3, 16            ; R << 16

    ADDI r1, 85
    ANDI r1, 0xFF
    LDI r9, SINE
    ADD r9, r1
    LOAD r2, r9
    ANDI r2, 0xFF
    SHLI r2, 8             ; G << 8

    ADDI r1, 85
    ANDI r1, 0xFF
    LDI r9, SINE
    ADD r9, r1
    LOAD r6, r9
    ANDI r6, 0xFF

    OR r3, r2
    OR r3, r6              ; packed color
    PSET r8, r15, r3

    ADDI r8, 1
    CMPI r8, 256
    BLT r14, px_loop

    ADDI r15, 1
    CMPI r15, 256
    BLT r14, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r15, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r0, r20
    SHRI r0, 3

dy_loop:
    LDI r8, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r4, r8
    SUBI r4, 128
    MOV r9, r15
    SUBI r9, 128
    ADD r4, r9           ; dist = |x-128| + |y-128|
    ADD r4, r0           ; animated phase
    ANDI r4, 0xFF

    ; Color from sine table
    LDI r9, SINE
    ADD r9, r4
    LOAD r1, r9
    ANDI r1, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r1, 8             ; green channel
    ORI r1, 0x80           ; some blue
    SHLI r1, 8             ; shift to R position
    ORI r1, 0x4040         ; some G + B

    PSET r8, r15, r1

    ADDI r8, 1
    CMPI r8, 256
    BLT r14, dx_loop

    ADDI r15, 1
    CMPI r15, 256
    BLT r14, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r15, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r0, r20
    SHRI r0, 2

sy_loop:
    LDI r8, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r4, r8
    ADD r4, r15
    ADD r4, r0
    LDI r9, 16
    DIV r4, r9
    LDI r9, 4
    MOD r4, r9           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r4, 0
    JNZ r14, s1
    LDI r1, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r4, 1
    JNZ r14, s2
    LDI r1, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r4, 2
    JNZ r14, s3
    LDI r1, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r1, 0x533483       ; purple

s_draw:
    PSET r8, r15, r1

    ADDI r8, 1
    CMPI r8, 256
    BLT r14, sx_loop

    ADDI r15, 1
    CMPI r15, 256
    BLT r14, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r15, 0             ; y
    LDI r12, 1
    LDI r20, FRAMES
    LOAD r0, r20
    SHRI r0, 4            ; very slow drift

ny_loop:
    LDI r8, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r4, r8
    LDI r9, 31
    MUL r4, r9
    MOV r9, r15
    LDI r5, 17
    MUL r9, r5
    ADD r4, r9
    LDI r9, 7
    MOV r5, r0
    MUL r5, r9
    ADD r4, r5
    ANDI r4, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r9, 0x1F
    AND r4, r9
    ADDI r4, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r4, 4            ; multiply
    ANDI r4, 0xFF
    ADDI r4, 0x10
    ; Pack as RGB: mostly blue
    MOV r1, r4
    SHLI r1, 16            ; R
    MOV r13, r4
    SHRI r13, 1
    SHLI r13, 8             ; G (half)
    OR r1, r13
    OR r1, r4             ; B (full)
    ORI r1, 0x101020       ; minimum base

    PSET r8, r15, r1

    ADDI r8, 1
    CMPI r8, 256
    BLT r14, nx_loop

    ADDI r15, 1
    CMPI r15, 256
    BLT r14, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
