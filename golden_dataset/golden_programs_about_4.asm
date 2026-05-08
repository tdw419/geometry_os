; DESCRIPTION: This GeOS assembly code initializes a system information panel displaying version, opcode count, RAM size, screen dimensions, process count, uptime in frames, and color palette. It sets up a palette table, draws the background, title bar, info panel, separators, footer text, and a color palette bar. The code includes an `int_to_str` subroutine to convert integer values to strings for display.

; about.asm -- System Information Panel for Geometry OS
;
; Shows: version, opcode count, RAM size, screen size,
;        process count, uptime (frames), color palette.
;
; Proves: TEXT, DRAWTEXT, RECTF, STRO, RAM introspection,
;         frame counter (TICKS), integer-to-string conversion.
;
; RAM Layout:
;   0x6000-0x60FF  String buffers for text
;   0x6100-0x61FF  Number conversion buffer
;   0x6200-0x623C  Palette color table (15 entries)
;
; Screen Layout (256x256):
;   Row 0-23    Title bar (dark navy)
;   Row 24-220  Info panel
;   Row 220-255 Footer + palette bar
;
; No colons in comments (assembler pitfall)

#define TICKS   0xFFE
#define BUF     0x6000
#define NUMBUF  0x6100
#define PAL     0x6200

; Init stack
LDI r30, 0xFD00
LDI r13, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r13

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r13

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r13

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r13

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r13

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r13

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r13

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r13

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r13

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r13

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r13

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r13

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r13

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r13

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r13, 0x0D1B2A
FILL r13

; Title bar
LDI r13, 0
LDI r15, 0
LDI r9, 256
LDI r1, 24
LDI r12, 0x1B3A5C
RECTF r13, r15, r9, r1, r12

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r13, 64
LDI r15, 6
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x1B3A5C
DRAWTEXT r13, r15, r9, r1, r12

; =========================================
; Info panel background
; =========================================
LDI r13, 12
LDI r15, 28
LDI r9, 232
LDI r1, 188
LDI r12, 0x141428
RECTF r13, r15, r9, r1, r12

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r13, 24
LDI r15, 36
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r13, 140
LDI r15, 36
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r13, 24
LDI r15, 54
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "113"
LDI r13, 140
LDI r15, 54
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r13, 24
LDI r15, 72
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "32 (r7-r31)"
LDI r13, 140
LDI r15, 72
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r13, 24
LDI r15, 90
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r13, 140
LDI r15, 90
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r13, 24
LDI r15, 108
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r13, 140
LDI r15, 108
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r13, 24
LDI r15, 126
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r13, 140
LDI r15, 126
LDI r9, BUF
LDI r1, 0xFFFFFF
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r13, 24
LDI r15, 144
LDI r9, BUF
LDI r1, 0x8888CC
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; Read TICKS counter
LDI r20, TICKS
LOAD r8, r20            ; r8 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r13, 140
LDI r15, 144
LDI r9, NUMBUF
LDI r1, 0x44FF44
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r13, 180
LDI r15, 144
LDI r9, BUF
LDI r1, 0x44FF44
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; =========================================
; Separator line
; =========================================
LDI r13, 24
LDI r15, 168
LDI r9, 208
LDI r1, 1
LDI r12, 0x333366
RECTF r13, r15, r9, r1, r12

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r13, 48
LDI r15, 174
LDI r9, BUF
LDI r1, 0x6666AA
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r13, 36
LDI r15, 188
LDI r9, BUF
LDI r1, 0x4488BB
LDI r12, 0x141428
DRAWTEXT r13, r15, r9, r1, r12

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r13, 0
LDI r15, 218
LDI r9, 256
LDI r1, 38
LDI r12, 0x0A0A1A
RECTF r13, r15, r9, r1, r12

; Draw 15 color squares
LDI r4, 8       ; x start
LDI r10, 226    ; y
LDI r3, 0      ; index
LDI r14, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r3
    LOAD r22, r20

    ; Draw square
    MOV r13, r4
    MOV r15, r10
    LDI r9, 14
    LDI r1, 14
    MOV r12, r22
    RECTF r13, r15, r9, r1, r12

    ; Advance x
    LDI r8, 16
    ADD r4, r8

    ; Next index
    LDI r8, 1
    ADD r3, r8

    ; Check if done
    CMP r3, r14
    BLT r7, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r13, 80
LDI r15, 244
LDI r9, BUF
LDI r1, 0x666688
LDI r12, 0x0A0A1A
DRAWTEXT r13, r15, r9, r1, r12

HALT

; =========================================
; int_to_str subroutine
; Converts r8 (u32) to decimal string at r20
; Destroys r8-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r8, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r8
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r8 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r8, r17        ; r8 = r8 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r8, its_loop

    ; Pop digits into buffer in correct order
its_write:
    POP r18
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r19, 1
    SUB r16, r19
    JNZ r16, its_write

    ; Null terminate
    LDI r18, 0
    STORE r20, r18
    POP r31
    RET

its_zero:
    LDI r18, 48         ; '0'
    STORE r20, r18
    LDI r19, 1
    ADD r20, r19
    LDI r18, 0
    STORE r20, r18
    POP r31
    RET
