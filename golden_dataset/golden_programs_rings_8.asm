; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r0, 1            ; r0 = increment
LDI r4, 256          ; r4 = limit
LDI r5, 128          ; r5 = center (128)

y_loop:
  LDI r9, 0          ; r9 = x

x_loop:
  ; Compute |x - 128|
  LDI r13, 0
  ADD r13, r9         ; r13 = x
  SUB r13, r5         ; r13 = x - 128
  ; If negative (wrapped), negate: 0 - r13
  LDI r14, 0
  CMP r13, r14         ; r8 = sign comparison
  ; r8 > 0 means r13 < r14 (negative)
  ; We can't branch on sign of r8 directly... 
  ; Use BLT: if r13 < 0, negate
  LDI r20, 0
  CMP r13, r20
  BLT r8, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r14, 0
  SUB r14, r13         ; r14 = -r13 = |x-128|
  LDI r13, 0
  ADD r13, r14         ; r13 = |x-128|
abs_x_done:
  ; r13 = |x - 128|

  ; Compute |y - 128|
  LDI r6, 0
  ADD r6, r21        ; r6 = y
  SUB r6, r5         ; r6 = y - 128
  LDI r14, 0
  CMP r6, r14
  LDI r20, 0
  CMP r6, r20
  BLT r8, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r14, 0
  SUB r14, r6
  LDI r6, 0
  ADD r6, r14
abs_y_done:
  ; r6 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r13, r6         ; r13 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r11, 0          ; r11 = ring index
  LDI r1, 16         ; r1 = ring width
div_loop:
  SUB r13, r1
  LDI r14, 0
  CMP r13, r14
  ; If r13 >= 0, increment ring index and continue
  ; BLT r13 < 0 means we overshot
  BLT r8, div_done
  LDI r10, 1
  ADD r11, r10
  JMP div_loop
div_done:
  ; r11 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r1, 6
mod_loop:
  SUB r11, r1
  LDI r14, 0
  CMP r11, r14
  BLT r8, mod_done
  JMP mod_loop
mod_done:
  ADD r11, r1         ; undo last subtraction
  ; r11 = color index (0..5)

  ; Look up color
  JNZ r11, not_red
  LDI r13, 0xFF0000   ; red
  PSET r9, r21, r13
  JMP next_pixel
not_red:
  LDI r14, 1
  SUB r11, r14
  JNZ r11, not_yellow
  LDI r13, 0xFFFF00   ; yellow
  PSET r9, r21, r13
  JMP next_pixel
not_yellow:
  LDI r14, 1
  SUB r11, r14
  JNZ r11, not_green
  LDI r13, 0x00FF00   ; green
  PSET r9, r21, r13
  JMP next_pixel
not_green:
  LDI r14, 1
  SUB r11, r14
  JNZ r11, not_cyan
  LDI r13, 0x00FFFF   ; cyan
  PSET r9, r21, r13
  JMP next_pixel
not_cyan:
  LDI r14, 1
  SUB r11, r14
  JNZ r11, not_blue
  LDI r13, 0x0000FF   ; blue
  PSET r9, r21, r13
  JMP next_pixel
not_blue:
  LDI r13, 0xFF00FF   ; magenta (default)
  PSET r9, r21, r13

next_pixel:
  ; x++
  LDI r14, 1
  ADD r9, r14
  ; If x == 256, next row
  LDI r14, 0
  ADD r14, r9
  SUB r14, r4
  JZ r14, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r14, 1
  ADD r21, r14
  ; If y == 256, done
  LDI r14, 0
  ADD r14, r21
  SUB r14, r4
  JZ r14, done
  JMP y_loop

done:
HALT
