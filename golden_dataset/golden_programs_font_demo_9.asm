; DESCRIPTION: Render a colored object at the screen.

; font_demo.asm -- Custom Bitmap Font Demo (Phase 98)
; Loads a custom font into RAM, sets it via IOCTL on /dev/screen,
; then renders text using TEXT opcode. The custom font replaces
; the default 5x7 mini font with 8x8 glyphs.

; ── Constants ──
LDI r5, 1
LDI r9, 0xFF00
MOV r30, r9           ; SP = 0xFF00

; ── Step 1: Write "/dev/screen" string to RAM at 0x3000 ──
LDI r10, 0x3000
LDI r7, 47           ; '/'
STORE r10, r7
ADD r10, r5
LDI r7, 100          ; 'd'
STORE r10, r7
ADD r10, r5
LDI r7, 101          ; 'e'
STORE r10, r7
ADD r10, r5
LDI r7, 118          ; 'v'
STORE r10, r7
ADD r10, r5
LDI r7, 47           ; '/'
STORE r10, r7
ADD r10, r5
LDI r7, 115          ; 's'
STORE r10, r7
ADD r10, r5
LDI r7, 99           ; 'c'
STORE r10, r7
ADD r10, r5
LDI r7, 114          ; 'r'
STORE r10, r7
ADD r10, r5
LDI r7, 101          ; 'e'
STORE r10, r7
ADD r10, r5
LDI r7, 101          ; 'e'
STORE r10, r7
ADD r10, r5
LDI r7, 110          ; 'n'
STORE r10, r7
ADD r10, r5
LDI r7, 0            ; null terminator
STORE r10, r7

; ── Step 2: Build custom font in RAM at 0x2000 ──
; Font: 128 glyphs x 8 rows = 1024 u32 words
LDI r2, 0x2000       ; font base address

; Set glyph 'A' (index 65) to a distinctive 8x8 pattern
; This differs from default 5x7 mini font
LDI r17, 65
LDI r18, 8
MUL r17, r18          ; offset = 65*8 = 520
ADD r17, r2          ; r17 = 0x2000 + 520

LDI r20, 0x7E         ; row 0: arch top
STORE r17, r20
ADD r17, r5
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r5
STORE r17, r20        ; row 2
ADD r17, r5
LDI r20, 0xFF         ; row 3: middle bar
STORE r17, r20
ADD r17, r5
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r5
STORE r17, r20        ; row 5
ADD r17, r5
STORE r17, r20        ; row 6
ADD r17, r5
LDI r20, 0            ; row 7
STORE r17, r20

; Set glyph 'B' (index 66) to distinctive pattern
LDI r17, 66
LDI r18, 8
MUL r17, r18
ADD r17, r2

LDI r20, 0xFE         ; row 0
STORE r17, r20
ADD r17, r5
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r5
STORE r17, r20        ; row 2
ADD r17, r5
LDI r20, 0xFE         ; row 3
STORE r17, r20
ADD r17, r5
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r5
STORE r17, r20        ; row 5
ADD r17, r5
LDI r20, 0xFE         ; row 6
STORE r17, r20
ADD r17, r5
LDI r20, 0            ; row 7
STORE r17, r20

; ── Step 3: Open /dev/screen ──
LDI r12, 0x3000        ; path addr
LDI r3, 0             ; mode = 0 (read)
OPEN r12, r3           ; fd in r11

; ── Step 4: Set custom font via IOCTL cmd 2 ──
MOV r14, r11            ; r14 = screen fd
LDI r0, 2             ; cmd = 2 (set font)
LDI r13, 0x2000        ; arg = font RAM address
IOCTL r14, r0, r13
; r11 = 0 on success

; ── Step 5: Write "AB" to RAM ──
LDI r10, 0x4000
LDI r7, 65           ; 'A'
STORE r10, r7
ADD r10, r5
LDI r7, 66           ; 'B'
STORE r10, r7
ADD r10, r5
LDI r7, 0            ; null
STORE r10, r7

; ── Step 6: Render text with custom font ──
LDI r12, 10            ; x = 10
LDI r3, 10            ; y = 10
LDI r14, 0x4000        ; addr of string
TEXT r12, r3, r14

; ── Step 7: Clear font via IOCTL cmd 3 ──
LDI r0, 3             ; cmd = 3 (clear font)
IOCTL r14, r0, r13

HALT
