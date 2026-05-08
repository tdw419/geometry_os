; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
LDI r3, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r3

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r3

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r3

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r3

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r3

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r3

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r3

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r3

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r3

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r3

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r3

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r3

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r3

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r3

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r3, 0x0D1B2A
FILL r3

; Title bar
LDI r3, 0
LDI r11, 0
LDI r8, 256
LDI r4, 24
LDI r13, 0x1B3A5C
RECTF r3, r11, r8, r4, r13

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r3, 64
LDI r11, 6
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x1B3A5C
DRAWTEXT r3, r11, r8, r4, r13

; =========================================
; Info panel background
; =========================================
LDI r3, 12
LDI r11, 28
LDI r8, 232
LDI r4, 188
LDI r13, 0x141428
RECTF r3, r11, r8, r4, r13

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r3, 24
LDI r11, 36
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r3, 140
LDI r11, 36
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r3, 24
LDI r11, 54
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "113"
LDI r3, 140
LDI r11, 54
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r3, 24
LDI r11, 72
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "32 (r1-r31)"
LDI r3, 140
LDI r11, 72
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r3, 24
LDI r11, 90
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r3, 140
LDI r11, 90
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r3, 24
LDI r11, 108
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r3, 140
LDI r11, 108
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r3, 24
LDI r11, 126
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r3, 140
LDI r11, 126
LDI r8, BUF
LDI r4, 0xFFFFFF
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r3, 24
LDI r11, 144
LDI r8, BUF
LDI r4, 0x8888CC
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; Read TICKS counter
LDI r20, TICKS
LOAD r6, r20            ; r6 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r3, 140
LDI r11, 144
LDI r8, NUMBUF
LDI r4, 0x44FF44
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r3, 180
LDI r11, 144
LDI r8, BUF
LDI r4, 0x44FF44
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; =========================================
; Separator line
; =========================================
LDI r3, 24
LDI r11, 168
LDI r8, 208
LDI r4, 1
LDI r13, 0x333366
RECTF r3, r11, r8, r4, r13

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r3, 48
LDI r11, 174
LDI r8, BUF
LDI r4, 0x6666AA
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r3, 36
LDI r11, 188
LDI r8, BUF
LDI r4, 0x4488BB
LDI r13, 0x141428
DRAWTEXT r3, r11, r8, r4, r13

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r3, 0
LDI r11, 218
LDI r8, 256
LDI r4, 38
LDI r13, 0x0A0A1A
RECTF r3, r11, r8, r4, r13

; Draw 15 color squares
LDI r5, 8       ; x start
LDI r9, 226    ; y
LDI r7, 0      ; index
LDI r0, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r7
    LOAD r22, r20

    ; Draw square
    MOV r3, r5
    MOV r11, r9
    LDI r8, 14
    LDI r4, 14
    MOV r13, r22
    RECTF r3, r11, r8, r4, r13

    ; Advance x
    LDI r6, 16
    ADD r5, r6

    ; Next index
    LDI r6, 1
    ADD r7, r6

    ; Check if done
    CMP r7, r0
    BLT r1, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r3, 80
LDI r11, 244
LDI r8, BUF
LDI r4, 0x666688
LDI r13, 0x0A0A1A
DRAWTEXT r3, r11, r8, r4, r13

HALT

; =========================================
; int_to_str subroutine
; Converts r6 (u32) to decimal string at r20
; Destroys r6-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r6, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r6
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r6 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r6, r17        ; r6 = r6 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r6, its_loop

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
