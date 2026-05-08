; DESCRIPTION: A colored object centered at the screen with fixed size.

; font_demo.asm -- Custom Bitmap Font Demo (Phase 98)
; Loads a custom font into RAM, sets it via IOCTL on /dev/screen,
; then renders text using TEXT opcode. The custom font replaces
; the default 5x7 mini font with 8x8 glyphs.

; ── Constants ──
LDI r7, 1
LDI r6, 0xFF00
MOV r30, r6           ; SP = 0xFF00

; ── Step 1: Write "/dev/screen" string to RAM at 0x3000 ──
LDI r14, 0x3000
LDI r1, 47           ; '/'
STORE r14, r1
ADD r14, r7
LDI r1, 100          ; 'd'
STORE r14, r1
ADD r14, r7
LDI r1, 101          ; 'e'
STORE r14, r1
ADD r14, r7
LDI r1, 118          ; 'v'
STORE r14, r1
ADD r14, r7
LDI r1, 47           ; '/'
STORE r14, r1
ADD r14, r7
LDI r1, 115          ; 's'
STORE r14, r1
ADD r14, r7
LDI r1, 99           ; 'c'
STORE r14, r1
ADD r14, r7
LDI r1, 114          ; 'r'
STORE r14, r1
ADD r14, r7
LDI r1, 101          ; 'e'
STORE r14, r1
ADD r14, r7
LDI r1, 101          ; 'e'
STORE r14, r1
ADD r14, r7
LDI r1, 110          ; 'n'
STORE r14, r1
ADD r14, r7
LDI r1, 0            ; null terminator
STORE r14, r1

; ── Step 2: Build custom font in RAM at 0x2000 ──
; Font: 128 glyphs x 8 rows = 1024 u32 words
LDI r13, 0x2000       ; font base address

; Set glyph 'A' (index 65) to a distinctive 8x8 pattern
; This differs from default 5x7 mini font
LDI r17, 65
LDI r18, 8
MUL r17, r18          ; offset = 65*8 = 520
ADD r17, r13          ; r17 = 0x2000 + 520

LDI r20, 0x7E         ; row 0: arch top
STORE r17, r20
ADD r17, r7
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r7
STORE r17, r20        ; row 2
ADD r17, r7
LDI r20, 0xFF         ; row 3: middle bar
STORE r17, r20
ADD r17, r7
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r7
STORE r17, r20        ; row 5
ADD r17, r7
STORE r17, r20        ; row 6
ADD r17, r7
LDI r20, 0            ; row 7
STORE r17, r20

; Set glyph 'B' (index 66) to distinctive pattern
LDI r17, 66
LDI r18, 8
MUL r17, r18
ADD r17, r13

LDI r20, 0xFE         ; row 0
STORE r17, r20
ADD r17, r7
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r7
STORE r17, r20        ; row 2
ADD r17, r7
LDI r20, 0xFE         ; row 3
STORE r17, r20
ADD r17, r7
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r7
STORE r17, r20        ; row 5
ADD r17, r7
LDI r20, 0xFE         ; row 6
STORE r17, r20
ADD r17, r7
LDI r20, 0            ; row 7
STORE r17, r20

; ── Step 3: Open /dev/screen ──
LDI r9, 0x3000        ; path addr
LDI r15, 0             ; mode = 0 (read)
OPEN r9, r15           ; fd in r11

; ── Step 4: Set custom font via IOCTL cmd 2 ──
MOV r5, r11            ; r5 = screen fd
LDI r10, 2             ; cmd = 2 (set font)
LDI r12, 0x2000        ; arg = font RAM address
IOCTL r5, r10, r12
; r11 = 0 on success

; ── Step 5: Write "AB" to RAM ──
LDI r14, 0x4000
LDI r1, 65           ; 'A'
STORE r14, r1
ADD r14, r7
LDI r1, 66           ; 'B'
STORE r14, r1
ADD r14, r7
LDI r1, 0            ; null
STORE r14, r1

; ── Step 6: Render text with custom font ──
LDI r9, 10            ; x = 10
LDI r15, 10            ; y = 10
LDI r5, 0x4000        ; addr of string
TEXT r9, r15, r5

; ── Step 7: Clear font via IOCTL cmd 3 ──
LDI r10, 3             ; cmd = 3 (clear font)
IOCTL r5, r10, r12

HALT
