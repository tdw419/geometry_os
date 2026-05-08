; DESCRIPTION: Geometry OS program to draw a red object.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r9, 1            ; r9 = increment
LDI r5, 256          ; r5 = limit
LDI r0, 128          ; r0 = center (128)

y_loop:
  LDI r11, 0          ; r11 = x

x_loop:
  ; Compute |x - 128|
  LDI r3, 0
  ADD r3, r11         ; r3 = x
  SUB r3, r0         ; r3 = x - 128
  ; If negative (wrapped), negate: 0 - r3
  LDI r2, 0
  CMP r3, r2         ; r7 = sign comparison
  ; r7 > 0 means r3 < r2 (negative)
  ; We can't branch on sign of r7 directly... 
  ; Use BLT: if r3 < 0, negate
  LDI r20, 0
  CMP r3, r20
  BLT r7, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r2, 0
  SUB r2, r3         ; r2 = -r3 = |x-128|
  LDI r3, 0
  ADD r3, r2         ; r3 = |x-128|
abs_x_done:
  ; r3 = |x - 128|

  ; Compute |y - 128|
  LDI r8, 0
  ADD r8, r21        ; r8 = y
  SUB r8, r0         ; r8 = y - 128
  LDI r2, 0
  CMP r8, r2
  LDI r20, 0
  CMP r8, r20
  BLT r7, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r2, 0
  SUB r2, r8
  LDI r8, 0
  ADD r8, r2
abs_y_done:
  ; r8 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r3, r8         ; r3 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r1, 0          ; r1 = ring index
  LDI r6, 16         ; r6 = ring width
div_loop:
  SUB r3, r6
  LDI r2, 0
  CMP r3, r2
  ; If r3 >= 0, increment ring index and continue
  ; BLT r3 < 0 means we overshot
  BLT r7, div_done
  LDI r14, 1
  ADD r1, r14
  JMP div_loop
div_done:
  ; r1 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r6, 6
mod_loop:
  SUB r1, r6
  LDI r2, 0
  CMP r1, r2
  BLT r7, mod_done
  JMP mod_loop
mod_done:
  ADD r1, r6         ; undo last subtraction
  ; r1 = color index (0..5)

  ; Look up color
  JNZ r1, not_red
  LDI r3, 0xFF0000   ; red
  PSET r11, r21, r3
  JMP next_pixel
not_red:
  LDI r2, 1
  SUB r1, r2
  JNZ r1, not_yellow
  LDI r3, 0xFFFF00   ; yellow
  PSET r11, r21, r3
  JMP next_pixel
not_yellow:
  LDI r2, 1
  SUB r1, r2
  JNZ r1, not_green
  LDI r3, 0x00FF00   ; green
  PSET r11, r21, r3
  JMP next_pixel
not_green:
  LDI r2, 1
  SUB r1, r2
  JNZ r1, not_cyan
  LDI r3, 0x00FFFF   ; cyan
  PSET r11, r21, r3
  JMP next_pixel
not_cyan:
  LDI r2, 1
  SUB r1, r2
  JNZ r1, not_blue
  LDI r3, 0x0000FF   ; blue
  PSET r11, r21, r3
  JMP next_pixel
not_blue:
  LDI r3, 0xFF00FF   ; magenta (default)
  PSET r11, r21, r3

next_pixel:
  ; x++
  LDI r2, 1
  ADD r11, r2
  ; If x == 256, next row
  LDI r2, 0
  ADD r2, r11
  SUB r2, r5
  JZ r2, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r2, 1
  ADD r21, r2
  ; If y == 256, done
  LDI r2, 0
  ADD r2, r21
  SUB r2, r5
  JZ r2, done
  JMP y_loop

done:
HALT
