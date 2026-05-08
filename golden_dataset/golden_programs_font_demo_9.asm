; DESCRIPTION: This GeOS assembly code loads a custom bitmap font into RAM, sets it as the active font on `/dev/screen` using an IOCTL command, and then renders the text "AB" using the newly set 8x8 glyphs. After rendering, it clears the font settings via another IOCTL command.

; font_demo.asm -- Custom Bitmap Font Demo (Phase 98)
; Loads a custom font into RAM, sets it via IOCTL on /dev/screen,
; then renders text using TEXT opcode. The custom font replaces
; the default 5x7 mini font with 8x8 glyphs.

; ── Constants ──
LDI r0, 1
LDI r6, 0xFF00
MOV r30, r6           ; SP = 0xFF00

; ── Step 1: Write "/dev/screen" string to RAM at 0x3000 ──
LDI r2, 0x3000
LDI r3, 47           ; '/'
STORE r2, r3
ADD r2, r0
LDI r3, 100          ; 'd'
STORE r2, r3
ADD r2, r0
LDI r3, 101          ; 'e'
STORE r2, r3
ADD r2, r0
LDI r3, 118          ; 'v'
STORE r2, r3
ADD r2, r0
LDI r3, 47           ; '/'
STORE r2, r3
ADD r2, r0
LDI r3, 115          ; 's'
STORE r2, r3
ADD r2, r0
LDI r3, 99           ; 'c'
STORE r2, r3
ADD r2, r0
LDI r3, 114          ; 'r'
STORE r2, r3
ADD r2, r0
LDI r3, 101          ; 'e'
STORE r2, r3
ADD r2, r0
LDI r3, 101          ; 'e'
STORE r2, r3
ADD r2, r0
LDI r3, 110          ; 'n'
STORE r2, r3
ADD r2, r0
LDI r3, 0            ; null terminator
STORE r2, r3

; ── Step 2: Build custom font in RAM at 0x2000 ──
; Font: 128 glyphs x 8 rows = 1024 u32 words
LDI r11, 0x2000       ; font base address

; Set glyph 'A' (index 65) to a distinctive 8x8 pattern
; This differs from default 5x7 mini font
LDI r17, 65
LDI r18, 8
MUL r17, r18          ; offset = 65*8 = 520
ADD r17, r11          ; r17 = 0x2000 + 520

LDI r20, 0x7E         ; row 0: arch top
STORE r17, r20
ADD r17, r0
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r0
STORE r17, r20        ; row 2
ADD r17, r0
LDI r20, 0xFF         ; row 3: middle bar
STORE r17, r20
ADD r17, r0
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r0
STORE r17, r20        ; row 5
ADD r17, r0
STORE r17, r20        ; row 6
ADD r17, r0
LDI r20, 0            ; row 7
STORE r17, r20

; Set glyph 'B' (index 66) to distinctive pattern
LDI r17, 66
LDI r18, 8
MUL r17, r18
ADD r17, r11

LDI r20, 0xFE         ; row 0
STORE r17, r20
ADD r17, r0
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r0
STORE r17, r20        ; row 2
ADD r17, r0
LDI r20, 0xFE         ; row 3
STORE r17, r20
ADD r17, r0
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r0
STORE r17, r20        ; row 5
ADD r17, r0
LDI r20, 0xFE         ; row 6
STORE r17, r20
ADD r17, r0
LDI r20, 0            ; row 7
STORE r17, r20

; ── Step 3: Open /dev/screen ──
LDI r5, 0x3000        ; path addr
LDI r9, 0             ; mode = 0 (read)
OPEN r5, r9           ; fd in r8

; ── Step 4: Set custom font via IOCTL cmd 2 ──
MOV r1, r8            ; r1 = screen fd
LDI r4, 2             ; cmd = 2 (set font)
LDI r7, 0x2000        ; arg = font RAM address
IOCTL r1, r4, r7
; r8 = 0 on success

; ── Step 5: Write "AB" to RAM ──
LDI r2, 0x4000
LDI r3, 65           ; 'A'
STORE r2, r3
ADD r2, r0
LDI r3, 66           ; 'B'
STORE r2, r3
ADD r2, r0
LDI r3, 0            ; null
STORE r2, r3

; ── Step 6: Render text with custom font ──
LDI r5, 10            ; x = 10
LDI r9, 10            ; y = 10
LDI r1, 0x4000        ; addr of string
TEXT r5, r9, r1

; ── Step 7: Clear font via IOCTL cmd 3 ──
LDI r4, 3             ; cmd = 3 (clear font)
IOCTL r1, r4, r7

HALT
