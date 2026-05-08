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
LDI r9, 0
LDI r12, 256
LDI r10, 24
LDI r5, 0x1B3A5C
RECTF r13, r9, r12, r10, r5

; Title text
LDI r20, BUF
STRO r20, "About Geometry OS"
LDI r13, 64
LDI r9, 6
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x1B3A5C
DRAWTEXT r13, r9, r12, r10, r5

; =========================================
; Info panel background
; =========================================
LDI r13, 12
LDI r9, 28
LDI r12, 232
LDI r10, 188
LDI r5, 0x141428
RECTF r13, r9, r12, r10, r5

; =========================================
; Info lines (label on left, value on right)
; =========================================

; -- Version --
LDI r20, BUF
STRO r20, "Version"
LDI r13, 24
LDI r9, 36
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "v1.0.0"
LDI r13, 140
LDI r9, 36
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- Opcodes --
LDI r20, BUF
STRO r20, "Opcodes"
LDI r13, 24
LDI r9, 54
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "113"
LDI r13, 140
LDI r9, 54
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- Registers --
LDI r20, BUF
STRO r20, "Registers"
LDI r13, 24
LDI r9, 72
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "32 (r1-r31)"
LDI r13, 140
LDI r9, 72
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- RAM --
LDI r20, BUF
STRO r20, "RAM"
LDI r13, 24
LDI r9, 90
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "65536 x u32 (64K)"
LDI r13, 140
LDI r9, 90
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- Screen --
LDI r20, BUF
STRO r20, "Screen"
LDI r13, 24
LDI r9, 108
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "256 x 256 pixels"
LDI r13, 140
LDI r9, 108
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- Colors --
LDI r20, BUF
STRO r20, "Colors"
LDI r13, 24
LDI r9, 126
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "24-bit RGB (16M)"
LDI r13, 140
LDI r9, 126
LDI r12, BUF
LDI r10, 0xFFFFFF
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; -- Uptime (read TICKS and display) --
LDI r20, BUF
STRO r20, "Uptime"
LDI r13, 24
LDI r9, 144
LDI r12, BUF
LDI r10, 0x8888CC
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; Read TICKS counter
LDI r20, TICKS
LOAD r0, r20            ; r0 = frame count

; Convert to decimal string
LDI r20, NUMBUF
CALL int_to_str

LDI r13, 140
LDI r9, 144
LDI r12, NUMBUF
LDI r10, 0x44FF44
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; Append " frames"
LDI r20, BUF
STRO r20, " frames"
LDI r13, 180
LDI r9, 144
LDI r12, BUF
LDI r10, 0x44FF44
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; =========================================
; Separator line
; =========================================
LDI r13, 24
LDI r9, 168
LDI r12, 208
LDI r10, 1
LDI r5, 0x333366
RECTF r13, r9, r12, r10, r5

; =========================================
; Footer text
; =========================================
LDI r20, BUF
STRO r20, "Geometry OS -- Pixel VM"
LDI r13, 48
LDI r9, 174
LDI r12, BUF
LDI r10, 0x6666AA
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

LDI r20, BUF
STRO r20, "github.com/tdw419/geometry-os"
LDI r13, 36
LDI r9, 188
LDI r12, BUF
LDI r10, 0x4488BB
LDI r5, 0x141428
DRAWTEXT r13, r9, r12, r10, r5

; =========================================
; Color palette bar (bottom decoration)
; =========================================
LDI r13, 0
LDI r9, 218
LDI r12, 256
LDI r10, 38
LDI r5, 0x0A0A1A
RECTF r13, r9, r12, r10, r5

; Draw 15 color squares
LDI r8, 8       ; x start
LDI r4, 226    ; y
LDI r6, 0      ; index
LDI r3, 15     ; count

pal_loop:
    ; Load color from palette table
    LDI r20, PAL
    ADD r20, r6
    LOAD r22, r20

    ; Draw square
    MOV r13, r8
    MOV r9, r4
    LDI r12, 14
    LDI r10, 14
    MOV r5, r22
    RECTF r13, r9, r12, r10, r5

    ; Advance x
    LDI r0, 16
    ADD r8, r0

    ; Next index
    LDI r0, 1
    ADD r6, r0

    ; Check if done
    CMP r6, r3
    BLT r1, pal_loop

; Palette label
LDI r20, BUF
STRO r20, "Color Palette"
LDI r13, 80
LDI r9, 244
LDI r12, BUF
LDI r10, 0x666688
LDI r5, 0x0A0A1A
DRAWTEXT r13, r9, r12, r10, r5

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
