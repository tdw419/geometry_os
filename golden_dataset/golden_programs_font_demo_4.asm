; DESCRIPTION: Display a object using color colored at the screen.

; font_demo.asm -- Custom Bitmap Font Demo (Phase 98)
; Loads a custom font into RAM, sets it via IOCTL on /dev/screen,
; then renders text using TEXT opcode. The custom font replaces
; the default 5x7 mini font with 8x8 glyphs.

; ── Constants ──
LDI r10, 1
LDI r8, 0xFF00
MOV r30, r8           ; SP = 0xFF00

; ── Step 1: Write "/dev/screen" string to RAM at 0x3000 ──
LDI r12, 0x3000
LDI r1, 47           ; '/'
STORE r12, r1
ADD r12, r10
LDI r1, 100          ; 'd'
STORE r12, r1
ADD r12, r10
LDI r1, 101          ; 'e'
STORE r12, r1
ADD r12, r10
LDI r1, 118          ; 'v'
STORE r12, r1
ADD r12, r10
LDI r1, 47           ; '/'
STORE r12, r1
ADD r12, r10
LDI r1, 115          ; 's'
STORE r12, r1
ADD r12, r10
LDI r1, 99           ; 'c'
STORE r12, r1
ADD r12, r10
LDI r1, 114          ; 'r'
STORE r12, r1
ADD r12, r10
LDI r1, 101          ; 'e'
STORE r12, r1
ADD r12, r10
LDI r1, 101          ; 'e'
STORE r12, r1
ADD r12, r10
LDI r1, 110          ; 'n'
STORE r12, r1
ADD r12, r10
LDI r1, 0            ; null terminator
STORE r12, r1

; ── Step 2: Build custom font in RAM at 0x2000 ──
; Font: 128 glyphs x 8 rows = 1024 u32 words
LDI r4, 0x2000       ; font base address

; Set glyph 'A' (index 65) to a distinctive 8x8 pattern
; This differs from default 5x7 mini font
LDI r17, 65
LDI r18, 8
MUL r17, r18          ; offset = 65*8 = 520
ADD r17, r4          ; r17 = 0x2000 + 520

LDI r20, 0x7E         ; row 0: arch top
STORE r17, r20
ADD r17, r10
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r10
STORE r17, r20        ; row 2
ADD r17, r10
LDI r20, 0xFF         ; row 3: middle bar
STORE r17, r20
ADD r17, r10
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r10
STORE r17, r20        ; row 5
ADD r17, r10
STORE r17, r20        ; row 6
ADD r17, r10
LDI r20, 0            ; row 7
STORE r17, r20

; Set glyph 'B' (index 66) to distinctive pattern
LDI r17, 66
LDI r18, 8
MUL r17, r18
ADD r17, r4

LDI r20, 0xFE         ; row 0
STORE r17, r20
ADD r17, r10
LDI r20, 0x81         ; row 1
STORE r17, r20
ADD r17, r10
STORE r17, r20        ; row 2
ADD r17, r10
LDI r20, 0xFE         ; row 3
STORE r17, r20
ADD r17, r10
LDI r20, 0x81         ; row 4
STORE r17, r20
ADD r17, r10
STORE r17, r20        ; row 5
ADD r17, r10
LDI r20, 0xFE         ; row 6
STORE r17, r20
ADD r17, r10
LDI r20, 0            ; row 7
STORE r17, r20

; ── Step 3: Open /dev/screen ──
LDI r5, 0x3000        ; path addr
LDI r6, 0             ; mode = 0 (read)
OPEN r5, r6           ; fd in r11

; ── Step 4: Set custom font via IOCTL cmd 2 ──
MOV r13, r11            ; r13 = screen fd
LDI r15, 2             ; cmd = 2 (set font)
LDI r3, 0x2000        ; arg = font RAM address
IOCTL r13, r15, r3
; r11 = 0 on success

; ── Step 5: Write "AB" to RAM ──
LDI r12, 0x4000
LDI r1, 65           ; 'A'
STORE r12, r1
ADD r12, r10
LDI r1, 66           ; 'B'
STORE r12, r1
ADD r12, r10
LDI r1, 0            ; null
STORE r12, r1

; ── Step 6: Render text with custom font ──
LDI r5, 10            ; x = 10
LDI r6, 10            ; y = 10
LDI r13, 0x4000        ; addr of string
TEXT r5, r6, r13

; ── Step 7: Clear font via IOCTL cmd 3 ──
LDI r15, 3             ; cmd = 3 (clear font)
IOCTL r13, r15, r3

HALT
