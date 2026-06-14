; 011_green_circle_grid4x4.asm -- 4x4 grid of green circles evenly spaced
; Screen 256x256, circles at centers 32, 96, 160, 224

LDI r10, 0x00FF00    ; green color
LDI r11, 20          ; radius

LDI r0, 0            ; row counter (0..3)

row_loop:
  LDI r1, 0          ; col counter (0..3)
  LDI r2, 32         ; x position

col_loop:
  ; y = 32 + row * 64
  LDI r3, 32
  LDI r4, 64
  LDI r5, 0
  ADD r5, r0         ; r5 = row
  MUL r4, r5         ; r4 = 64 * row
  ADD r3, r4         ; r3 = 32 + 64*row

  CIRCLE r2, r3, r11, r10

  ; x += 64
  LDI r4, 64
  ADD r2, r4

  ; col++
  LDI r4, 1
  ADD r1, r4

  ; if col != 4, continue col_loop
  LDI r6, 0
  ADD r6, r1
  LDI r7, 4
  SUB r6, r7
  JNZ r6, col_loop

  ; row++
  LDI r4, 1
  ADD r0, r4

  ; if row != 4, continue row_loop
  LDI r6, 0
  ADD r6, r0
  LDI r7, 4
  SUB r6, r7
  JNZ r6, row_loop

HALT
