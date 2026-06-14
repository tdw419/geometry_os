; diamond_pattern.asm -- Concentric diamond shapes with cycling colors
; Draws nested diamonds from center outward with shifting hues

; Center of screen
LDI r0, 128

; Size counter (distance from center), starts small
LDI r1, 8

; Loop counter (number of diamonds to draw)
LDI r2, 10

; Step size
LDI r4, 12

; Temp register
LDI r5, 0

loop:
  ; Color = size * 0x010101
  LDI r9, 0x010101
  MUL r9, r1          ; r9 = r9 * r1 = size * 0x010101

  ; Top vertex: (128, 128 - size)
  LDI r10, 0
  ADD r10, r0         ; r10 = 128 (center x, preserved)
  LDI r11, 0
  ADD r11, r0         ; r11 = 128
  SUB r11, r1         ; r11 = 128 - size (top y)

  ; Right vertex: (128 + size, 128)
  LDI r12, 0
  ADD r12, r0
  ADD r12, r1         ; r12 = 128 + size (right x)

  ; Bottom vertex: (128, 128 + size)
  LDI r13, 0
  ADD r13, r0
  ADD r13, r1         ; r13 = 128 + size (bottom y)

  ; Left vertex: (128 - size, 128)
  LDI r14, 0
  ADD r14, r0
  SUB r14, r1         ; r14 = 128 - size (left x)

  ; Line: top to right
  LINE r10, r11, r12, r0, r9
  ; Line: right to bottom
  LINE r12, r0, r0, r13, r9
  ; Line: bottom to left
  LINE r0, r13, r14, r0, r9
  ; Line: left to top
  LINE r14, r0, r0, r11, r9

  ; Increase size
  ADD r1, r4

  ; Decrement loop counter
  LDI r5, 1
  SUB r2, r5
  JNZ r2, loop

HALT
