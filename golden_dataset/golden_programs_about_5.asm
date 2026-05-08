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
LDI r6, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r6

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r6

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r6

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r6

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r6

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r6

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r6

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r6

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r6

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r6

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r6

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r6

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r6

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r6

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r6, 0x0D1B2A
FILL r6

; Title bar
LDI r6, 0
LDI r2, 0
LDI r8, 256
LDI r13, 24
LDI r15, 0x1B3A5C
RECTF r6, r2, r8, r13, r15

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r6, 64
LDI r2, 6
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x1B3A5C
DRAWTEXT r6, r2, r8, r13, r15

; =========================================
; Info panel background
; =========================================
LDI r6, 12
LDI r2, 28
LDI r8, 232
LDI r13, 188
LDI r15, 0x141428
RECTF r6, r2, r8, r13, r15

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r6, 24
LDI r2, 36
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r6, 140
LDI r2, 36
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r6, 24
LDI r2, 54
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "113"
LDI r6, 140
LDI r2, 54
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r6, 24
LDI r2, 72
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "32 (r5-r31)"
LDI r6, 140
LDI r2, 72
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r6, 24
LDI r2, 90
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r6, 140
LDI r2, 90
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r6, 24
LDI r2, 108
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r6, 140
LDI r2, 108
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r6, 24
LDI r2, 126
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r6, 140
LDI r2, 126
LDI r8, BUF
LDI r13, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r6, 24
LDI r2, 144
LDI r8, BUF
LDI r13, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; Read TICKS counter
LDI r20, TICKS
LOAD r9, r20            ; r9 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r6, 140
LDI r2, 144
LDI r8, NUMBUF
LDI r13, 0x44FF44
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r6, 180
LDI r2, 144
LDI r8, BUF
LDI r13, 0x44FF44
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; =========================================
; Separator line
; =========================================
LDI r6, 24
LDI r2, 168
LDI r8, 208
LDI r13, 1
LDI r15, 0x333366
RECTF r6, r2, r8, r13, r15

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r6, 48
LDI r2, 174
LDI r8, BUF
LDI r13, 0x6666AA
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r6, 36
LDI r2, 188
LDI r8, BUF
LDI r13, 0x4488BB
LDI r15, 0x141428
DRAWTEXT r6, r2, r8, r13, r15

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r6, 0
LDI r2, 218
LDI r8, 256
LDI r13, 38
LDI r15, 0x0A0A1A
RECTF r6, r2, r8, r13, r15

; Draw 15 color squares
LDI r1, 8       ; x start
LDI r10, 226    ; y
LDI r4, 0      ; index
LDI r0, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r4
    LOAD r22, r20

    ; Draw square
    MOV r6, r1
    MOV r2, r10
    LDI r8, 14
    LDI r13, 14
    MOV r15, r22
    RECTF r6, r2, r8, r13, r15

    ; Advance x
    LDI r9, 16
    ADD r1, r9

    ; Next index
    LDI r9, 1
    ADD r4, r9

    ; Check if done
    CMP r4, r0
    BLT r5, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r6, 80
LDI r2, 244
LDI r8, BUF
LDI r13, 0x666688
LDI r15, 0x0A0A1A
DRAWTEXT r6, r2, r8, r13, r15

HALT

; =========================================
; int_to_str subroutine
; Converts r9 (u32) to decimal string at r20
; Destroys r9-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r9, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r9
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r9 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r9, r17        ; r9 = r9 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r9, its_loop

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
