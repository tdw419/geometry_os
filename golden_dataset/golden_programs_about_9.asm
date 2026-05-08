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
LDI r0, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r0

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r0

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r0

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r0

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r0

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r0

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r0

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r0

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r0

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r0

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r0

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r0

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r0

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r0

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r0, 0x0D1B2A
FILL r0

; Title bar
LDI r0, 0
LDI r4, 0
LDI r7, 256
LDI r5, 24
LDI r11, 0x1B3A5C
RECTF r0, r4, r7, r5, r11

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r0, 64
LDI r4, 6
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x1B3A5C
DRAWTEXT r0, r4, r7, r5, r11

; =========================================
; Info panel background
; =========================================
LDI r0, 12
LDI r4, 28
LDI r7, 232
LDI r5, 188
LDI r11, 0x141428
RECTF r0, r4, r7, r5, r11

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r0, 24
LDI r4, 36
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r0, 140
LDI r4, 36
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r0, 24
LDI r4, 54
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "113"
LDI r0, 140
LDI r4, 54
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r0, 24
LDI r4, 72
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "32 (r13-r31)"
LDI r0, 140
LDI r4, 72
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r0, 24
LDI r4, 90
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r0, 140
LDI r4, 90
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r0, 24
LDI r4, 108
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r0, 140
LDI r4, 108
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r0, 24
LDI r4, 126
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r0, 140
LDI r4, 126
LDI r7, BUF
LDI r5, 0xFFFFFF
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r0, 24
LDI r4, 144
LDI r7, BUF
LDI r5, 0x8888CC
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; Read TICKS counter
LDI r20, TICKS
LOAD r6, r20            ; r6 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r0, 140
LDI r4, 144
LDI r7, NUMBUF
LDI r5, 0x44FF44
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r0, 180
LDI r4, 144
LDI r7, BUF
LDI r5, 0x44FF44
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; =========================================
; Separator line
; =========================================
LDI r0, 24
LDI r4, 168
LDI r7, 208
LDI r5, 1
LDI r11, 0x333366
RECTF r0, r4, r7, r5, r11

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r0, 48
LDI r4, 174
LDI r7, BUF
LDI r5, 0x6666AA
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r0, 36
LDI r4, 188
LDI r7, BUF
LDI r5, 0x4488BB
LDI r11, 0x141428
DRAWTEXT r0, r4, r7, r5, r11

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r0, 0
LDI r4, 218
LDI r7, 256
LDI r5, 38
LDI r11, 0x0A0A1A
RECTF r0, r4, r7, r5, r11

; Draw 15 color squares
LDI r8, 8       ; x start
LDI r3, 226    ; y
LDI r14, 0      ; index
LDI r2, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r14
    LOAD r22, r20

    ; Draw square
    MOV r0, r8
    MOV r4, r3
    LDI r7, 14
    LDI r5, 14
    MOV r11, r22
    RECTF r0, r4, r7, r5, r11

    ; Advance x
    LDI r6, 16
    ADD r8, r6

    ; Next index
    LDI r6, 1
    ADD r14, r6

    ; Check if done
    CMP r14, r2
    BLT r13, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r0, 80
LDI r4, 244
LDI r7, BUF
LDI r5, 0x666688
LDI r11, 0x0A0A1A
DRAWTEXT r0, r4, r7, r5, r11

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
