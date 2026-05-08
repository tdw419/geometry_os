; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r4, 1            ; r4 = increment
LDI r7, 256          ; r7 = limit
LDI r6, 128          ; r6 = center (128)

y_loop:
  LDI r1, 0          ; r1 = x

x_loop:
  ; Compute |x - 128|
  LDI r9, 0
  ADD r9, r1         ; r9 = x
  SUB r9, r6         ; r9 = x - 128
  ; If negative (wrapped), negate: 0 - r9
  LDI r15, 0
  CMP r9, r15         ; r14 = sign comparison
  ; r14 > 0 means r9 < r15 (negative)
  ; We can't branch on sign of r14 directly... 
  ; Use BLT: if r9 < 0, negate
  LDI r20, 0
  CMP r9, r20
  BLT r14, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r15, 0
  SUB r15, r9         ; r15 = -r9 = |x-128|
  LDI r9, 0
  ADD r9, r15         ; r9 = |x-128|
abs_x_done:
  ; r9 = |x - 128|

  ; Compute |y - 128|
  LDI r12, 0
  ADD r12, r21        ; r12 = y
  SUB r12, r6         ; r12 = y - 128
  LDI r15, 0
  CMP r12, r15
  LDI r20, 0
  CMP r12, r20
  BLT r14, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r15, 0
  SUB r15, r12
  LDI r12, 0
  ADD r12, r15
abs_y_done:
  ; r12 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r9, r12         ; r9 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r10, 0          ; r10 = ring index
  LDI r5, 16         ; r5 = ring width
div_loop:
  SUB r9, r5
  LDI r15, 0
  CMP r9, r15
  ; If r9 >= 0, increment ring index and continue
  ; BLT r9 < 0 means we overshot
  BLT r14, div_done
  LDI r11, 1
  ADD r10, r11
  JMP div_loop
div_done:
  ; r10 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r5, 6
mod_loop:
  SUB r10, r5
  LDI r15, 0
  CMP r10, r15
  BLT r14, mod_done
  JMP mod_loop
mod_done:
  ADD r10, r5         ; undo last subtraction
  ; r10 = color index (0..5)

  ; Look up color
  JNZ r10, not_red
  LDI r9, 0xFF0000   ; red
  PSET r1, r21, r9
  JMP next_pixel
not_red:
  LDI r15, 1
  SUB r10, r15
  JNZ r10, not_yellow
  LDI r9, 0xFFFF00   ; yellow
  PSET r1, r21, r9
  JMP next_pixel
not_yellow:
  LDI r15, 1
  SUB r10, r15
  JNZ r10, not_green
  LDI r9, 0x00FF00   ; green
  PSET r1, r21, r9
  JMP next_pixel
not_green:
  LDI r15, 1
  SUB r10, r15
  JNZ r10, not_cyan
  LDI r9, 0x00FFFF   ; cyan
  PSET r1, r21, r9
  JMP next_pixel
not_cyan:
  LDI r15, 1
  SUB r10, r15
  JNZ r10, not_blue
  LDI r9, 0x0000FF   ; blue
  PSET r1, r21, r9
  JMP next_pixel
not_blue:
  LDI r9, 0xFF00FF   ; magenta (default)
  PSET r1, r21, r9

next_pixel:
  ; x++
  LDI r15, 1
  ADD r1, r15
  ; If x == 256, next row
  LDI r15, 0
  ADD r15, r1
  SUB r15, r7
  JZ r15, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r15, 1
  ADD r21, r15
  ; If y == 256, done
  LDI r15, 0
  ADD r15, r21
  SUB r15, r7
  JZ r15, done
  JMP y_loop

done:
HALT
