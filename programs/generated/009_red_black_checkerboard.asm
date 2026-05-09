; RED/BLACK CHECKERBOARD -- 16x16 pixel squares using RECTF
; Alternates red (0xFF0000) and black (0x000000) in a checkerboard pattern

LDI r0, 0              ; r0 = cell_y (row index 0..15)
LDI r10, 16            ; r10 = cell size
LDI r20, 256           ; r20 = screen size
LDI r30, 0xFF0000      ; r30 = red
LDI r31, 0x000000      ; r31 = black

y_loop:
  LDI r1, 0            ; r1 = cell_x (col index 0..15)

x_loop:
  ; Parity: (cell_y + cell_x) & 1
  LDI r5, 0
  ADD r5, r0
  ADD r5, r1
  LDI r6, 1
  AND r5, r6

  ; Compute top-left corner: x*16, y*16
  LDI r2, 0
  ADD r2, r1
  MUL r2, r10          ; r2 = x offset
  LDI r3, 0
  ADD r3, r0
  MUL r3, r10          ; r3 = y offset

  ; Pick color
  JZ r5, use_red
  LDI r4, 0
  ADD r4, r31
  JMP draw

use_red:
  LDI r4, 0
  ADD r4, r30

draw:
  RECTF r2, r3, r10, r10, r4

  ; Advance cell_x
  LDI r6, 1
  ADD r1, r6
  ; If cell_x < 16, loop
  LDI r5, 0
  ADD r5, r1
  SUB r5, r10
  JNZ r5, x_loop

  ; Advance cell_y
  ADD r0, r6
  LDI r5, 0
  ADD r5, r0
  SUB r5, r10
  JNZ r5, y_loop

HALT
