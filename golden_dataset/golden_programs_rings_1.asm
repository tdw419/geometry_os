; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r10, 1            ; r10 = increment
LDI r13, 256          ; r13 = limit
LDI r0, 128          ; r0 = center (128)

y_loop:
  LDI r4, 0          ; r4 = x

x_loop:
  ; Compute |x - 128|
  LDI r9, 0
  ADD r9, r4         ; r9 = x
  SUB r9, r0         ; r9 = x - 128
  ; If negative (wrapped), negate: 0 - r9
  LDI r8, 0
  CMP r9, r8         ; r7 = sign comparison
  ; r7 > 0 means r9 < r8 (negative)
  ; We can't branch on sign of r7 directly... 
  ; Use BLT: if r9 < 0, negate
  LDI r20, 0
  CMP r9, r20
  BLT r7, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r8, 0
  SUB r8, r9         ; r8 = -r9 = |x-128|
  LDI r9, 0
  ADD r9, r8         ; r9 = |x-128|
abs_x_done:
  ; r9 = |x - 128|

  ; Compute |y - 128|
  LDI r3, 0
  ADD r3, r21        ; r3 = y
  SUB r3, r0         ; r3 = y - 128
  LDI r8, 0
  CMP r3, r8
  LDI r20, 0
  CMP r3, r20
  BLT r7, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r8, 0
  SUB r8, r3
  LDI r3, 0
  ADD r3, r8
abs_y_done:
  ; r3 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r9, r3         ; r9 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r15, 0          ; r15 = ring index
  LDI r6, 16         ; r6 = ring width
div_loop:
  SUB r9, r6
  LDI r8, 0
  CMP r9, r8
  ; If r9 >= 0, increment ring index and continue
  ; BLT r9 < 0 means we overshot
  BLT r7, div_done
  LDI r12, 1
  ADD r15, r12
  JMP div_loop
div_done:
  ; r15 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r6, 6
mod_loop:
  SUB r15, r6
  LDI r8, 0
  CMP r15, r8
  BLT r7, mod_done
  JMP mod_loop
mod_done:
  ADD r15, r6         ; undo last subtraction
  ; r15 = color index (0..5)

  ; Look up color
  JNZ r15, not_red
  LDI r9, 0xFF0000   ; red
  PSET r4, r21, r9
  JMP next_pixel
not_red:
  LDI r8, 1
  SUB r15, r8
  JNZ r15, not_yellow
  LDI r9, 0xFFFF00   ; yellow
  PSET r4, r21, r9
  JMP next_pixel
not_yellow:
  LDI r8, 1
  SUB r15, r8
  JNZ r15, not_green
  LDI r9, 0x00FF00   ; green
  PSET r4, r21, r9
  JMP next_pixel
not_green:
  LDI r8, 1
  SUB r15, r8
  JNZ r15, not_cyan
  LDI r9, 0x00FFFF   ; cyan
  PSET r4, r21, r9
  JMP next_pixel
not_cyan:
  LDI r8, 1
  SUB r15, r8
  JNZ r15, not_blue
  LDI r9, 0x0000FF   ; blue
  PSET r4, r21, r9
  JMP next_pixel
not_blue:
  LDI r9, 0xFF00FF   ; magenta (default)
  PSET r4, r21, r9

next_pixel:
  ; x++
  LDI r8, 1
  ADD r4, r8
  ; If x == 256, next row
  LDI r8, 0
  ADD r8, r4
  SUB r8, r13
  JZ r8, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r8, 1
  ADD r21, r8
  ; If y == 256, done
  LDI r8, 0
  ADD r8, r21
  SUB r8, r13
  JZ r8, done
  JMP y_loop

done:
HALT
