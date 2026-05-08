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
LDI r9, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r9

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r9

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r9

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r9

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r9

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r9

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r9

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r9

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r9

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r9

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r9

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r9

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r9

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r9

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r9, 0x0D1B2A
FILL r9

; Title bar
LDI r9, 0
LDI r11, 0
LDI r8, 256
LDI r4, 24
LDI r2, 0x1B3A5C
RECTF r9, r11, r8, r4, r2

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r9, 64
LDI r11, 6
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x1B3A5C
DRAWTEXT r9, r11, r8, r4, r2

; =========================================
; Info panel background
; =========================================
LDI r9, 12
LDI r11, 28
LDI r8, 232
LDI r4, 188
LDI r2, 0x141428
RECTF r9, r11, r8, r4, r2

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r9, 24
LDI r11, 36
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r9, 140
LDI r11, 36
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r9, 24
LDI r11, 54
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "113"
LDI r9, 140
LDI r11, 54
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r9, 24
LDI r11, 72
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "32 (r15-r31)"
LDI r9, 140
LDI r11, 72
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r9, 24
LDI r11, 90
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r9, 140
LDI r11, 90
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r9, 24
LDI r11, 108
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r9, 140
LDI r11, 108
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r9, 24
LDI r11, 126
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r9, 140
LDI r11, 126
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r9, 24
LDI r11, 144
LDI r8, BUF
LDI r4, 0x8888CC
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; Read TICKS counter
LDI r20, TICKS
LOAD r0, r20            ; r0 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r9, 140
LDI r11, 144
LDI r8, NUMBUF
LDI r4, 0x44FF44
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r9, 180
LDI r11, 144
LDI r8, BUF
LDI r4, 0x44FF44
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; =========================================
; Separator line
; =========================================
LDI r9, 24
LDI r11, 168
LDI r8, 208
LDI r4, 1
LDI r2, 0x333366
RECTF r9, r11, r8, r4, r2

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r9, 48
LDI r11, 174
LDI r8, BUF
LDI r4, 0x6666AA
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r9, 36
LDI r11, 188
LDI r8, BUF
LDI r4, 0x4488BB
LDI r2, 0x141428
DRAWTEXT r9, r11, r8, r4, r2

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r9, 0
LDI r11, 218
LDI r8, 256
LDI r4, 38
LDI r2, 0x0A0A1A
RECTF r9, r11, r8, r4, r2

; Draw 15 color squares
LDI r13, 8       ; x start
LDI r1, 226    ; y
LDI r7, 0      ; index
LDI r10, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r7
    LOAD r22, r20

    ; Draw square
    MOV r9, r13
    MOV r11, r1
    LDI r8, 14
    LDI r4, 14
    MOV r2, r22
    RECTF r9, r11, r8, r4, r2

    ; Advance x
    LDI r0, 16
    ADD r13, r0

    ; Next index
    LDI r0, 1
    ADD r7, r0

    ; Check if done
    CMP r7, r10
    BLT r15, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r9, 80
LDI r11, 244
LDI r8, BUF
LDI r4, 0x666688
LDI r2, 0x0A0A1A
DRAWTEXT r9, r11, r8, r4, r2

HALT

; =========================================
; int_to_str subroutine
; Converts r0 (u32) to decimal string at r20
; Destroys r0-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r0, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r0
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r0 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r0, r17        ; r0 = r0 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r0, its_loop

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
