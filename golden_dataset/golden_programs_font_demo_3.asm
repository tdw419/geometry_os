; DESCRIPTION: Display a object using color colored at the screen.

; font_demo.asm -- Custom Bitmap Font Demo (Phase 98)
; Loads a custom font into RAM, sets it via IOCTL on /dev/screen,
; then renders text using TEXT opcode. The custom font replaces
; the default 5x7 mini font with 8x8 glyphs.

; ── Constants ──
LDI r4, 1
LDI r2, 0xFF00
MOV r30, r2           ; SP = 0xFF00

; ── Step 1: Write "/dev/screen" string to RAM at 0x3000 ──
LDI r15, 0x3000
LDI r8, 47           ; '/'
STORE r15, r8
ADD r15, r4
LDI r8, 100          ; 'd'
STORE r15, r8
ADD r15, r4
LDI r8, 101          ; 'e'
STORE r15, r8
ADD r15, r4
LDI r8, 118          ; 'v'
STORE r15, r8
ADD r15, r4
LDI r8, 47           ; '/'
STORE r15, r8
ADD r15, r4
LDI r8, 115          ; 's'
STORE r15, r8
ADD r15, r4
LDI r8, 99           ; 'c'
STORE r15, r8
ADD r15, r4
LDI r8, 114          ; 'r'
STORE r15, r8
ADD r15, r4
LDI r8, 101          ; 'e'
STORE r15, r8
ADD r15, r4
LDI r8, 101          ; 'e'
STORE r15, r8
ADD r15, r4
LDI r8, 110          ; 'n'
STORE r15, r8
ADD r15, r4
LDI r8, 0            ; null terminator
STORE r15, r8

; ── Step 2: Build custom font in RAM at 0x2000 ──
; Font: 128 glyphs x 8 rows = 1024 u32 words
LDI r10, 0x2000       ; font base address

; Set glyph 'A' (index 65) to a distinctive 8x8 pattern
; This differs from default 5x7 mini font
LDI r17, 65
LDI r18, 8
MUL r17, r18          ; offset = 65*8 = 520
ADD r17, r10          ; r17 = 0x2000 + 520

LDI r20, 0x7E         ; row 0: arch top
STORE r17, r20
ADD r17, r4
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r4
STORE r17, r20        ; row 2
ADD r17, r4
LDI r20, 0xFF         ; row 3: middle bar
STORE r17, r20
ADD r17, r4
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r4
STORE r17, r20        ; row 5
ADD r17, r4
STORE r17, r20        ; row 6
ADD r17, r4
LDI r20, 0            ; row 7
STORE r17, r20

; Set glyph 'B' (index 66) to distinctive pattern
LDI r17, 66
LDI r18, 8
MUL r17, r18
ADD r17, r10

LDI r20, 0xFE         ; row 0
STORE r17, r20
ADD r17, r4
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r4
STORE r17, r20        ; row 2
ADD r17, r4
LDI r20, 0xFE         ; row 3
STORE r17, r20
ADD r17, r4
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r4
STORE r17, r20        ; row 5
ADD r17, r4
LDI r20, 0xFE         ; row 6
STORE r17, r20
ADD r17, r4
LDI r20, 0            ; row 7
STORE r17, r20

; ── Step 3: Open /dev/screen ──
LDI r0, 0x3000        ; path addr
LDI r11, 0             ; mode = 0 (read)
OPEN r0, r11           ; fd in r1

; ── Step 4: Set custom font via IOCTL cmd 2 ──
MOV r5, r1            ; r5 = screen fd
LDI r3, 2             ; cmd = 2 (set font)
LDI r14, 0x2000        ; arg = font RAM address
IOCTL r5, r3, r14
; r1 = 0 on success

; ── Step 5: Write "AB" to RAM ──
LDI r15, 0x4000
LDI r8, 65           ; 'A'
STORE r15, r8
ADD r15, r4
LDI r8, 66           ; 'B'
STORE r15, r8
ADD r15, r4
LDI r8, 0            ; null
STORE r15, r8

; ── Step 6: Render text with custom font ──
LDI r0, 10            ; x = 10
LDI r11, 10            ; y = 10
LDI r5, 0x4000        ; addr of string
TEXT r0, r11, r5

; ── Step 7: Clear font via IOCTL cmd 3 ──
LDI r3, 3             ; cmd = 3 (clear font)
IOCTL r5, r3, r14

HALT
