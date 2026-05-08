; DESCRIPTION: Render a colored object at the screen.

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
LDI r1, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r1

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r1

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r1

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r1

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r1

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r1

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r1

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r1

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r1

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r1

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r1

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r1

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r1

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r1

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r1, 0x0D1B2A
FILL r1

; Title bar
LDI r1, 0
LDI r5, 0
LDI r9, 256
LDI r3, 24
LDI r15, 0x1B3A5C
RECTF r1, r5, r9, r3, r15

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r1, 64
LDI r5, 6
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x1B3A5C
DRAWTEXT r1, r5, r9, r3, r15

; =========================================
; Info panel background
; =========================================
LDI r1, 12
LDI r5, 28
LDI r9, 232
LDI r3, 188
LDI r15, 0x141428
RECTF r1, r5, r9, r3, r15

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r1, 24
LDI r5, 36
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r1, 140
LDI r5, 36
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r1, 24
LDI r5, 54
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "113"
LDI r1, 140
LDI r5, 54
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r1, 24
LDI r5, 72
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "32 (r0-r31)"
LDI r1, 140
LDI r5, 72
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r1, 24
LDI r5, 90
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r1, 140
LDI r5, 90
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r1, 24
LDI r5, 108
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r1, 140
LDI r5, 108
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r1, 24
LDI r5, 126
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r1, 140
LDI r5, 126
LDI r9, BUF
LDI r3, 0xFFFFFF
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r1, 24
LDI r5, 144
LDI r9, BUF
LDI r3, 0x8888CC
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; Read TICKS counter
LDI r20, TICKS
LOAD r11, r20            ; r11 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r1, 140
LDI r5, 144
LDI r9, NUMBUF
LDI r3, 0x44FF44
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r1, 180
LDI r5, 144
LDI r9, BUF
LDI r3, 0x44FF44
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; =========================================
; Separator line
; =========================================
LDI r1, 24
LDI r5, 168
LDI r9, 208
LDI r3, 1
LDI r15, 0x333366
RECTF r1, r5, r9, r3, r15

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r1, 48
LDI r5, 174
LDI r9, BUF
LDI r3, 0x6666AA
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r1, 36
LDI r5, 188
LDI r9, BUF
LDI r3, 0x4488BB
LDI r15, 0x141428
DRAWTEXT r1, r5, r9, r3, r15

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r1, 0
LDI r5, 218
LDI r9, 256
LDI r3, 38
LDI r15, 0x0A0A1A
RECTF r1, r5, r9, r3, r15

; Draw 15 color squares
LDI r12, 8       ; x start
LDI r2, 226    ; y
LDI r10, 0      ; index
LDI r4, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r10
    LOAD r22, r20

    ; Draw square
    MOV r1, r12
    MOV r5, r2
    LDI r9, 14
    LDI r3, 14
    MOV r15, r22
    RECTF r1, r5, r9, r3, r15

    ; Advance x
    LDI r11, 16
    ADD r12, r11

    ; Next index
    LDI r11, 1
    ADD r10, r11

    ; Check if done
    CMP r10, r4
    BLT r0, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r1, 80
LDI r5, 244
LDI r9, BUF
LDI r3, 0x666688
LDI r15, 0x0A0A1A
DRAWTEXT r1, r5, r9, r3, r15

HALT

; =========================================
; int_to_str subroutine
; Converts r11 (u32) to decimal string at r20
; Destroys r11-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r11, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r11
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r11 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r11, r17        ; r11 = r11 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r11, its_loop

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
