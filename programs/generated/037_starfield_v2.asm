; 037_starfield_v2.asm -- Deep space starfield with varying brightness and sizes
; Dark navy background, 3 layers of stars at different densities/brightness
; Small stars (1x1 PSET), medium stars (2x2 RECTF), bright stars (3x3 RECTF)

; Fill background: very dark navy
LDI r0, 0x050510
FILL r0

; --- Layer 1: Dim background stars (many, 1x1 pixels) ---
; Place 60 dim stars using loop with stride 7 (prime-ish scatter)
LDI r0, 0            ; counter
LDI r1, 1            ; increment
LDI r2, 60           ; count

dim_loop:
  ; x = (counter * 43 + 17) % 252
  LDI r3, 0
  ADD r3, r0
  LDI r4, 43
  MUL r3, r4
  LDI r4, 17
  ADD r3, r4
  LDI r4, 252
  LDI r5, 0
  ADD r5, r3
  LDI r6, 0
  DIV r6, r4
  MUL r6, r4
  SUB r3, r6         ; r3 = x (mod 252)

  ; y = (counter * 67 + 11) % 252
  LDI r4, 0
  ADD r4, r0
  LDI r5, 67
  MUL r4, r5
  LDI r5, 11
  ADD r4, r5
  LDI r5, 252
  LDI r6, 0
  ADD r6, r4
  LDI r7, 0
  DIV r7, r5
  MUL r7, r5
  SUB r4, r7         ; r4 = y (mod 252)

  ; Dim white: 0x444444
  LDI r7, 0x444444
  PSET r3, r4, r7

  ; Next
  ADD r0, r1
  SUB r0, r2
  JNZ r0, dim_done
  LDI r0, 0
  ADD r0, r1
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, dim_loop

dim_done:

; --- Layer 2: Medium stars (20 stars, 2x2) ---
LDI r0, 0
LDI r2, 20

med_loop:
  ; x = (counter * 59 + 31) % 250
  LDI r3, 0
  ADD r3, r0
  LDI r4, 59
  MUL r3, r4
  LDI r4, 31
  ADD r3, r4
  LDI r4, 250
  LDI r5, 0
  ADD r5, r3
  LDI r6, 0
  DIV r6, r4
  MUL r6, r4
  SUB r3, r6         ; r3 = x

  ; y = (counter * 83 + 47) % 250
  LDI r4, 0
  ADD r4, r0
  LDI r5, 83
  MUL r4, r5
  LDI r5, 47
  ADD r4, r5
  LDI r5, 250
  LDI r6, 0
  ADD r6, r4
  LDI r7, 0
  DIV r7, r5
  MUL r7, r5
  SUB r4, r7         ; r4 = y

  ; Medium white: 0x999999, 2x2
  LDI r7, 0x999999
  LDI r5, 2
  LDI r6, 2
  RECTF r3, r4, r5, r6, r7

  ; Next
  ADD r0, r1
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, med_loop

; --- Layer 3: Bright stars (8 stars, 3x3) ---
LDI r0, 0
LDI r2, 8

bright_loop:
  ; x = (counter * 101 + 71) % 248
  LDI r3, 0
  ADD r3, r0
  LDI r4, 101
  MUL r3, r4
  LDI r4, 71
  ADD r3, r4
  LDI r4, 248
  LDI r5, 0
  ADD r5, r3
  LDI r6, 0
  DIV r6, r4
  MUL r6, r4
  SUB r3, r6         ; r3 = x

  ; y = (counter * 127 + 53) % 248
  LDI r4, 0
  ADD r4, r0
  LDI r5, 127
  MUL r4, r5
  LDI r5, 53
  ADD r4, r5
  LDI r5, 248
  LDI r6, 0
  ADD r6, r4
  LDI r7, 0
  DIV r7, r5
  MUL r7, r5
  SUB r4, r7         ; r4 = y

  ; Bright white: 0xFFFFFF, 3x3
  LDI r7, 0xFFFFFF
  LDI r5, 3
  LDI r6, 3
  RECTF r3, r4, r5, r6, r7

  ; Next
  ADD r0, r1
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, bright_loop

HALT
