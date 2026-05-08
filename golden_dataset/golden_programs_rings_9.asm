; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r9, 1            ; r9 = increment
LDI r1, 256          ; r1 = limit
LDI r15, 128          ; r15 = center (128)

y_loop:
  LDI r4, 0          ; r4 = x

x_loop:
  ; Compute |x - 128|
  LDI r13, 0
  ADD r13, r4         ; r13 = x
  SUB r13, r15         ; r13 = x - 128
  ; If negative (wrapped), negate: 0 - r13
  LDI r3, 0
  CMP r13, r3         ; r2 = sign comparison
  ; r2 > 0 means r13 < r3 (negative)
  ; We can't branch on sign of r2 directly... 
  ; Use BLT: if r13 < 0, negate
  LDI r20, 0
  CMP r13, r20
  BLT r2, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r3, 0
  SUB r3, r13         ; r3 = -r13 = |x-128|
  LDI r13, 0
  ADD r13, r3         ; r13 = |x-128|
abs_x_done:
  ; r13 = |x - 128|

  ; Compute |y - 128|
  LDI r8, 0
  ADD r8, r21        ; r8 = y
  SUB r8, r15         ; r8 = y - 128
  LDI r3, 0
  CMP r8, r3
  LDI r20, 0
  CMP r8, r20
  BLT r2, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r3, 0
  SUB r3, r8
  LDI r8, 0
  ADD r8, r3
abs_y_done:
  ; r8 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r13, r8         ; r13 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r11, 0          ; r11 = ring index
  LDI r10, 16         ; r10 = ring width
div_loop:
  SUB r13, r10
  LDI r3, 0
  CMP r13, r3
  ; If r13 >= 0, increment ring index and continue
  ; BLT r13 < 0 means we overshot
  BLT r2, div_done
  LDI r14, 1
  ADD r11, r14
  JMP div_loop
div_done:
  ; r11 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r10, 6
mod_loop:
  SUB r11, r10
  LDI r3, 0
  CMP r11, r3
  BLT r2, mod_done
  JMP mod_loop
mod_done:
  ADD r11, r10         ; undo last subtraction
  ; r11 = color index (0..5)

  ; Look up color
  JNZ r11, not_red
  LDI r13, 0xFF0000   ; red
  PSET r4, r21, r13
  JMP next_pixel
not_red:
  LDI r3, 1
  SUB r11, r3
  JNZ r11, not_yellow
  LDI r13, 0xFFFF00   ; yellow
  PSET r4, r21, r13
  JMP next_pixel
not_yellow:
  LDI r3, 1
  SUB r11, r3
  JNZ r11, not_green
  LDI r13, 0x00FF00   ; green
  PSET r4, r21, r13
  JMP next_pixel
not_green:
  LDI r3, 1
  SUB r11, r3
  JNZ r11, not_cyan
  LDI r13, 0x00FFFF   ; cyan
  PSET r4, r21, r13
  JMP next_pixel
not_cyan:
  LDI r3, 1
  SUB r11, r3
  JNZ r11, not_blue
  LDI r13, 0x0000FF   ; blue
  PSET r4, r21, r13
  JMP next_pixel
not_blue:
  LDI r13, 0xFF00FF   ; magenta (default)
  PSET r4, r21, r13

next_pixel:
  ; x++
  LDI r3, 1
  ADD r4, r3
  ; If x == 256, next row
  LDI r3, 0
  ADD r3, r4
  SUB r3, r1
  JZ r3, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r3, 1
  ADD r21, r3
  ; If y == 256, done
  LDI r3, 0
  ADD r3, r21
  SUB r3, r1
  JZ r3, done
  JMP y_loop

done:
HALT
