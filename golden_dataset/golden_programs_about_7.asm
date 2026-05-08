; DESCRIPTION: Geometry OS program to draw a colored object.

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
LDI r5, 1

; =========================================
; Init palette table in RAM (15 colors)
; =========================================
LDI r20, PAL

LDI r21, 0xFF0000
STORE r20, r21
ADD r20, r5

LDI r21, 0xFF4400
STORE r20, r21
ADD r20, r5

LDI r21, 0xFF8800
STORE r20, r21
ADD r20, r5

LDI r21, 0xFFCC00
STORE r20, r21
ADD r20, r5

LDI r21, 0xFFFF00
STORE r20, r21
ADD r20, r5

LDI r21, 0x88FF00
STORE r20, r21
ADD r20, r5

LDI r21, 0x00FF44
STORE r20, r21
ADD r20, r5

LDI r21, 0x00FFAA
STORE r20, r21
ADD r20, r5

LDI r21, 0x00FFFF
STORE r20, r21
ADD r20, r5

LDI r21, 0x0088FF
STORE r20, r21
ADD r20, r5

LDI r21, 0x0044FF
STORE r20, r21
ADD r20, r5

LDI r21, 0x4400FF
STORE r20, r21
ADD r20, r5

LDI r21, 0x8800FF
STORE r20, r21
ADD r20, r5

LDI r21, 0xCC00FF
STORE r20, r21
ADD r20, r5

LDI r21, 0xFF00AA
STORE r20, r21

; =========================================
; Draw background
; =========================================
LDI r5, 0x0D1B2A
FILL r5

; Title bar
LDI r5, 0
LDI r4, 0
LDI r7, 256
LDI r14, 24
LDI r8, 0x1B3A5C
RECTF r5, r4, r7, r14, r8

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r5, 64
LDI r4, 6
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x1B3A5C
DRAWTEXT r5, r4, r7, r14, r8

; =========================================
; Info panel background
; =========================================
LDI r5, 12
LDI r4, 28
LDI r7, 232
LDI r14, 188
LDI r8, 0x141428
RECTF r5, r4, r7, r14, r8

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r5, 24
LDI r4, 36
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r5, 140
LDI r4, 36
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r5, 24
LDI r4, 54
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "113"
LDI r5, 140
LDI r4, 54
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r5, 24
LDI r4, 72
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "32 (r11-r31)"
LDI r5, 140
LDI r4, 72
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r5, 24
LDI r4, 90
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r5, 140
LDI r4, 90
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r5, 24
LDI r4, 108
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r5, 140
LDI r4, 108
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r5, 24
LDI r4, 126
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r5, 140
LDI r4, 126
LDI r7, BUF
LDI r14, 0xFFFFFF
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r5, 24
LDI r4, 144
LDI r7, BUF
LDI r14, 0x8888CC
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; Read TICKS counter
LDI r20, TICKS
LOAD r2, r20            ; r2 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r5, 140
LDI r4, 144
LDI r7, NUMBUF
LDI r14, 0x44FF44
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r5, 180
LDI r4, 144
LDI r7, BUF
LDI r14, 0x44FF44
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; =========================================
; Separator line
; =========================================
LDI r5, 24
LDI r4, 168
LDI r7, 208
LDI r14, 1
LDI r8, 0x333366
RECTF r5, r4, r7, r14, r8

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r5, 48
LDI r4, 174
LDI r7, BUF
LDI r14, 0x6666AA
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r5, 36
LDI r4, 188
LDI r7, BUF
LDI r14, 0x4488BB
LDI r8, 0x141428
DRAWTEXT r5, r4, r7, r14, r8

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r5, 0
LDI r4, 218
LDI r7, 256
LDI r14, 38
LDI r8, 0x0A0A1A
RECTF r5, r4, r7, r14, r8

; Draw 15 color squares
LDI r13, 8       ; x start
LDI r10, 226    ; y
LDI r12, 0      ; index
LDI r6, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r12
    LOAD r22, r20

    ; Draw square
    MOV r5, r13
    MOV r4, r10
    LDI r7, 14
    LDI r14, 14
    MOV r8, r22
    RECTF r5, r4, r7, r14, r8

    ; Advance x
    LDI r2, 16
    ADD r13, r2

    ; Next index
    LDI r2, 1
    ADD r12, r2

    ; Check if done
    CMP r12, r6
    BLT r11, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r5, 80
LDI r4, 244
LDI r7, BUF
LDI r14, 0x666688
LDI r8, 0x0A0A1A
DRAWTEXT r5, r4, r7, r14, r8

HALT

; =========================================
; int_to_str subroutine
; Converts r2 (u32) to decimal string at r20
; Destroys r2-r19. Returns string null-terminated.
; =========================================
int_to_str:
    PUSH r31
    LDI r16, 0          ; digit count

    ; Check if zero
    JZ r2, its_zero

    ; Extract digits in reverse onto stack
its_loop:
    MOV r18, r2
    LDI r17, 10
    MOD r18, r17        ; r18 = digit (r2 % 10)
    LDI r19, 48
    ADD r18, r19        ; ASCII '0' + digit
    PUSH r18             ; save digit
    LDI r17, 10
    DIV r2, r17        ; r2 = r2 / 10
    LDI r19, 1
    ADD r16, r19        ; digit count++
    JNZ r2, its_loop

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
