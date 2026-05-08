; DESCRIPTION: Display a object using color colored at the screen.

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
    LDI r3, 256          ; count
    LDI r15, 1             ; increment
    LDI r11, 0            ; index

build_sine:
    LDI r18, 128
    CMP r11, r18
    BGE r2, above_128
    MOV r17, r18
    SUB r17, r11          ; delta = 128 - i
    JMP do_square
above_128:
    MOV r17, r11
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
    ADD r19, r11
    STORE r19, r18
    ADD r11, r15
    CMP r11, r3
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
    LDI r11, 0
    FILL r11

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
    LDI r6, 0             ; y = 0
    LDI r4, 1
    LDI r10, 256

gy_loop:
    LDI r1, 0             ; x = 0

gx_loop:
    ; Color = sine-based gradient by x
    ; R = sine[x], G = sine[(x+85) & 0xFF], B = sine[(x+170) & 0xFF]
    MOV r8, r1
    LDI r9, SINE
    ADD r9, r8
    LOAD r13, r9           ; R = sine[x]
    ANDI r13, 0xFF

    MOV r8, r1
    ADDI r8, 85
    ANDI r8, 0xFF
    LDI r9, SINE
    ADD r9, r8
    LOAD r5, r9           ; G = sine[(x+85) & 0xFF]
    ANDI r5, 0xFF

    MOV r8, r1
    ADDI r8, 170
    ANDI r8, 0xFF
    LDI r9, SINE
    ADD r9, r8
    LOAD r0, r9           ; B = sine[(x+170) & 0xFF]
    ANDI r0, 0xFF

    ; Pack RGB
    SHLI r13, 16            ; R << 16
    SHLI r5, 8             ; G << 8
    OR r13, r5
    OR r13, r0              ; packed color

    PSET r1, r6, r13

    ADD r1, r4
    CMPI r1, 256
    BLT r2, gx_loop

    ADD r6, r4
    CMPI r6, 256
    BLT r2, gy_loop
    JMP frame_end

; ── Pattern 1: Plasma ─────────────────────────
; Animated plasma using sine table with time offset
pat_plasma:
    LDI r6, 0             ; y
    LDI r4, 1
    LDI r10, 256
    ; Animation offset from frame counter
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 2            ; slow animation

py_loop:
    LDI r1, 0             ; x

px_loop:
    ; v1 = sine[(x + anim) & 0xFF]
    MOV r8, r1
    ADD r8, r14
    ANDI r8, 0xFF
    LDI r9, SINE
    ADD r9, r8
    LOAD r13, r9
    ANDI r13, 0xFF

    ; v2 = sine[(y + anim*2) & 0xFF]
    MOV r8, r6
    MOV r7, r14
    SHLI r7, 1
    ADD r8, r7
    ANDI r8, 0xFF
    LDI r9, SINE
    ADD r9, r8
    LOAD r5, r9
    ANDI r5, 0xFF

    ; v = (v1 + v2) >> 1
    ADD r13, r5
    SHRI r13, 1

    ; R = sine[v], G = sine[(v+85) & 0xFF], B = sine[(v+170) & 0xFF]
    LDI r9, SINE
    ADD r9, r13
    LOAD r0, r9
    ANDI r0, 0xFF
    SHLI r0, 16            ; R << 16

    ADDI r13, 85
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r12, r9
    ANDI r12, 0xFF
    SHLI r12, 8             ; G << 8

    ADDI r13, 85
    ANDI r13, 0xFF
    LDI r9, SINE
    ADD r9, r13
    LOAD r15, r9
    ANDI r15, 0xFF

    OR r0, r12
    OR r0, r15              ; packed color
    PSET r1, r6, r0

    ADDI r1, 1
    CMPI r1, 256
    BLT r2, px_loop

    ADDI r6, 1
    CMPI r6, 256
    BLT r2, py_loop
    JMP frame_end

; ── Pattern 2: Diamond Pattern ────────────────
; Concentric diamonds with animated phase
pat_diamonds:
    LDI r6, 0             ; y
    LDI r4, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 3

dy_loop:
    LDI r1, 0             ; x

dx_loop:
    ; Manhattan distance from center
    MOV r8, r1
    SUBI r8, 128
    MOV r9, r6
    SUBI r9, 128
    ADD r8, r9           ; dist = |x-128| + |y-128|
    ADD r8, r14           ; animated phase
    ANDI r8, 0xFF

    ; Color from sine table
    LDI r9, SINE
    ADD r9, r8
    LOAD r13, r9
    ANDI r13, 0xFF

    ; Create diamond color (cyan-ish)
    SHLI r13, 8             ; green channel
    ORI r13, 0x80           ; some blue
    SHLI r13, 8             ; shift to R position
    ORI r13, 0x4040         ; some G + B

    PSET r1, r6, r13

    ADDI r1, 1
    CMPI r1, 256
    BLT r2, dx_loop

    ADDI r6, 1
    CMPI r6, 256
    BLT r2, dy_loop
    JMP frame_end

; ── Pattern 3: Animated Stripes ───────────────
; Diagonal stripes with color cycling
pat_stripes:
    LDI r6, 0             ; y
    LDI r4, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 2

sy_loop:
    LDI r1, 0             ; x

sx_loop:
    ; stripe = (x + y + anim) / 16 % 4
    MOV r8, r1
    ADD r8, r6
    ADD r8, r14
    LDI r9, 16
    DIV r8, r9
    LDI r9, 4
    MOD r8, r9           ; stripe index 0-3

    ; 4 stripe colors
    CMPI r8, 0
    JNZ r2, s1
    LDI r13, 0x1A1A2E       ; dark navy
    JMP s_draw
s1:
    CMPI r8, 1
    JNZ r2, s2
    LDI r13, 0x16213E       ; dark blue
    JMP s_draw
s2:
    CMPI r8, 2
    JNZ r2, s3
    LDI r13, 0x0F3460       ; medium blue
    JMP s_draw
s3:
    LDI r13, 0x533483       ; purple

s_draw:
    PSET r1, r6, r13

    ADDI r1, 1
    CMPI r1, 256
    BLT r2, sx_loop

    ADDI r6, 1
    CMPI r6, 256
    BLT r2, sy_loop
    JMP frame_end

; ── Pattern 4: Noise Dither ───────────────────
; Random dithered pattern with slow drift
pat_noise:
    LDI r6, 0             ; y
    LDI r4, 1
    LDI r20, FRAMES
    LOAD r14, r20
    SHRI r14, 4            ; very slow drift

ny_loop:
    LDI r1, 0             ; x

nx_loop:
    ; Hash: x*374761393 XOR y*668265263
    ; Use simpler hash to avoid overflow issues
    ; hash = (x * 31 + y * 17 + anim * 7) & 0xFF
    MOV r8, r1
    LDI r9, 31
    MUL r8, r9
    MOV r9, r6
    LDI r7, 17
    MUL r9, r7
    ADD r8, r9
    LDI r9, 7
    MOV r7, r14
    MUL r7, r9
    ADD r8, r7
    ANDI r8, 0xFF

    ; Map to dark colors (0x10-0x30 per channel)
    LDI r9, 0x1F
    AND r8, r9
    ADDI r8, 0x10         ; base 0x10
    ; Make it a blue-ish color
    SHLI r8, 4            ; multiply
    ANDI r8, 0xFF
    ADDI r8, 0x10
    ; Pack as RGB: mostly blue
    MOV r13, r8
    SHLI r13, 16            ; R
    MOV r5, r8
    SHRI r5, 1
    SHLI r5, 8             ; G (half)
    OR r13, r5
    OR r13, r8             ; B (full)
    ORI r13, 0x101020       ; minimum base

    PSET r1, r6, r13

    ADDI r1, 1
    CMPI r1, 256
    BLT r2, nx_loop

    ADDI r6, 1
    CMPI r6, 256
    BLT r2, ny_loop
    JMP frame_end

; ── Frame end ──────────────────────────────────
frame_end:
    FRAME
    JMP main_loop
