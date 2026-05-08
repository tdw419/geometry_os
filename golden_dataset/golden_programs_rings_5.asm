; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r9, 1            ; r9 = increment
LDI r11, 256          ; r11 = limit
LDI r8, 128          ; r8 = center (128)

y_loop:
  LDI r13, 0          ; r13 = x

x_loop:
  ; Compute |x - 128|
  LDI r12, 0
  ADD r12, r13         ; r12 = x
  SUB r12, r8         ; r12 = x - 128
  ; If negative (wrapped), negate: 0 - r12
  LDI r5, 0
  CMP r12, r5         ; r6 = sign comparison
  ; r6 > 0 means r12 < r5 (negative)
  ; We can't branch on sign of r6 directly... 
  ; Use BLT: if r12 < 0, negate
  LDI r20, 0
  CMP r12, r20
  BLT r6, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r5, 0
  SUB r5, r12         ; r5 = -r12 = |x-128|
  LDI r12, 0
  ADD r12, r5         ; r12 = |x-128|
abs_x_done:
  ; r12 = |x - 128|

  ; Compute |y - 128|
  LDI r2, 0
  ADD r2, r21        ; r2 = y
  SUB r2, r8         ; r2 = y - 128
  LDI r5, 0
  CMP r2, r5
  LDI r20, 0
  CMP r2, r20
  BLT r6, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r5, 0
  SUB r5, r2
  LDI r2, 0
  ADD r2, r5
abs_y_done:
  ; r2 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r12, r2         ; r12 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r3, 0          ; r3 = ring index
  LDI r4, 16         ; r4 = ring width
div_loop:
  SUB r12, r4
  LDI r5, 0
  CMP r12, r5
  ; If r12 >= 0, increment ring index and continue
  ; BLT r12 < 0 means we overshot
  BLT r6, div_done
  LDI r15, 1
  ADD r3, r15
  JMP div_loop
div_done:
  ; r3 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r4, 6
mod_loop:
  SUB r3, r4
  LDI r5, 0
  CMP r3, r5
  BLT r6, mod_done
  JMP mod_loop
mod_done:
  ADD r3, r4         ; undo last subtraction
  ; r3 = color index (0..5)

  ; Look up color
  JNZ r3, not_red
  LDI r12, 0xFF0000   ; red
  PSET r13, r21, r12
  JMP next_pixel
not_red:
  LDI r5, 1
  SUB r3, r5
  JNZ r3, not_yellow
  LDI r12, 0xFFFF00   ; yellow
  PSET r13, r21, r12
  JMP next_pixel
not_yellow:
  LDI r5, 1
  SUB r3, r5
  JNZ r3, not_green
  LDI r12, 0x00FF00   ; green
  PSET r13, r21, r12
  JMP next_pixel
not_green:
  LDI r5, 1
  SUB r3, r5
  JNZ r3, not_cyan
  LDI r12, 0x00FFFF   ; cyan
  PSET r13, r21, r12
  JMP next_pixel
not_cyan:
  LDI r5, 1
  SUB r3, r5
  JNZ r3, not_blue
  LDI r12, 0x0000FF   ; blue
  PSET r13, r21, r12
  JMP next_pixel
not_blue:
  LDI r12, 0xFF00FF   ; magenta (default)
  PSET r13, r21, r12

next_pixel:
  ; x++
  LDI r5, 1
  ADD r13, r5
  ; If x == 256, next row
  LDI r5, 0
  ADD r5, r13
  SUB r5, r11
  JZ r5, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r5, 1
  ADD r21, r5
  ; If y == 256, done
  LDI r5, 0
  ADD r5, r21
  SUB r5, r11
  JZ r5, done
  JMP y_loop

done:
HALT
