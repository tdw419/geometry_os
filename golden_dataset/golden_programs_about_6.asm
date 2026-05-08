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
LDI r2, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r2

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r2

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r2

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r2

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r2

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r2

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r2

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r2

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r2

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r2

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r2

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r2

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r2

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r2

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r2, 0x0D1B2A
FILL r2

; Title bar
LDI r2, 0
LDI r0, 0
LDI r5, 256
LDI r13, 24
LDI r9, 0x1B3A5C
RECTF r2, r0, r5, r13, r9

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r2, 64
LDI r0, 6
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x1B3A5C
DRAWTEXT r2, r0, r5, r13, r9

; =========================================
; Info panel background
; =========================================
LDI r2, 12
LDI r0, 28
LDI r5, 232
LDI r13, 188
LDI r9, 0x141428
RECTF r2, r0, r5, r13, r9

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r2, 24
LDI r0, 36
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r2, 140
LDI r0, 36
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r2, 24
LDI r0, 54
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "113"
LDI r2, 140
LDI r0, 54
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r2, 24
LDI r0, 72
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "32 (r8-r31)"
LDI r2, 140
LDI r0, 72
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r2, 24
LDI r0, 90
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r2, 140
LDI r0, 90
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r2, 24
LDI r0, 108
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r2, 140
LDI r0, 108
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r2, 24
LDI r0, 126
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r2, 140
LDI r0, 126
LDI r5, BUF
LDI r13, 0xFFFFFF
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r2, 24
LDI r0, 144
LDI r5, BUF
LDI r13, 0x8888CC
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; Read TICKS counter
LDI r20, TICKS
LOAD r10, r20            ; r10 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r2, 140
LDI r0, 144
LDI r5, NUMBUF
LDI r13, 0x44FF44
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r2, 180
LDI r0, 144
LDI r5, BUF
LDI r13, 0x44FF44
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; =========================================
; Separator line
; =========================================
LDI r2, 24
LDI r0, 168
LDI r5, 208
LDI r13, 1
LDI r9, 0x333366
RECTF r2, r0, r5, r13, r9

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r2, 48
LDI r0, 174
LDI r5, BUF
LDI r13, 0x6666AA
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r2, 36
LDI r0, 188
LDI r5, BUF
LDI r13, 0x4488BB
LDI r9, 0x141428
DRAWTEXT r2, r0, r5, r13, r9

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r2, 0
LDI r0, 218
LDI r5, 256
LDI r13, 38
LDI r9, 0x0A0A1A
RECTF r2, r0, r5, r13, r9

; Draw 15 color squares
LDI r7, 8       ; x start
LDI r6, 226    ; y
LDI r14, 0      ; index
LDI r3, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r14
    LOAD r22, r20

    ; Draw square
    MOV r2, r7
    MOV r0, r6
    LDI r5, 14
    LDI r13, 14
    MOV r9, r22
    RECTF r2, r0, r5, r13, r9

    ; Advance x
    LDI r10, 16
    ADD r7, r10

    ; Next index
    LDI r10, 1
    ADD r14, r10

    ; Check if done
    CMP r14, r3
    BLT r8, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r2, 80
LDI r0, 244
LDI r5, BUF
LDI r13, 0x666688
LDI r9, 0x0A0A1A
DRAWTEXT r2, r0, r5, r13, r9

HALT

; =========================================
; int_to_str subroutine
; Converts r10 (u32) to decimal string at r20
; Destroys r10-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r10, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r10
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r10 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r10, r17        ; r10 = r10 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r10, its_loop

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
