; DESCRIPTION: Display a object using color red at the screen.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r7, 1            ; r7 = increment
LDI r10, 256          ; r10 = limit
LDI r0, 128          ; r0 = center (128)

y_loop:
  LDI r14, 0          ; r14 = x

x_loop:
  ; Compute |x - 128|
  LDI r1, 0
  ADD r1, r14         ; r1 = x
  SUB r1, r0         ; r1 = x - 128
  ; If negative (wrapped), negate: 0 - r1
  LDI r5, 0
  CMP r1, r5         ; r3 = sign comparison
  ; r3 > 0 means r1 < r5 (negative)
  ; We can't branch on sign of r3 directly... 
  ; Use BLT: if r1 < 0, negate
  LDI r20, 0
  CMP r1, r20
  BLT r3, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r5, 0
  SUB r5, r1         ; r5 = -r1 = |x-128|
  LDI r1, 0
  ADD r1, r5         ; r1 = |x-128|
abs_x_done:
  ; r1 = |x - 128|

  ; Compute |y - 128|
  LDI r15, 0
  ADD r15, r21        ; r15 = y
  SUB r15, r0         ; r15 = y - 128
  LDI r5, 0
  CMP r15, r5
  LDI r20, 0
  CMP r15, r20
  BLT r3, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r5, 0
  SUB r5, r15
  LDI r15, 0
  ADD r15, r5
abs_y_done:
  ; r15 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r1, r15         ; r1 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r9, 0          ; r9 = ring index
  LDI r11, 16         ; r11 = ring width
div_loop:
  SUB r1, r11
  LDI r5, 0
  CMP r1, r5
  ; If r1 >= 0, increment ring index and continue
  ; BLT r1 < 0 means we overshot
  BLT r3, div_done
  LDI r8, 1
  ADD r9, r8
  JMP div_loop
div_done:
  ; r9 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r11, 6
mod_loop:
  SUB r9, r11
  LDI r5, 0
  CMP r9, r5
  BLT r3, mod_done
  JMP mod_loop
mod_done:
  ADD r9, r11         ; undo last subtraction
  ; r9 = color index (0..5)

  ; Look up color
  JNZ r9, not_red
  LDI r1, 0xFF0000   ; red
  PSET r14, r21, r1
  JMP next_pixel
not_red:
  LDI r5, 1
  SUB r9, r5
  JNZ r9, not_yellow
  LDI r1, 0xFFFF00   ; yellow
  PSET r14, r21, r1
  JMP next_pixel
not_yellow:
  LDI r5, 1
  SUB r9, r5
  JNZ r9, not_green
  LDI r1, 0x00FF00   ; green
  PSET r14, r21, r1
  JMP next_pixel
not_green:
  LDI r5, 1
  SUB r9, r5
  JNZ r9, not_cyan
  LDI r1, 0x00FFFF   ; cyan
  PSET r14, r21, r1
  JMP next_pixel
not_cyan:
  LDI r5, 1
  SUB r9, r5
  JNZ r9, not_blue
  LDI r1, 0x0000FF   ; blue
  PSET r14, r21, r1
  JMP next_pixel
not_blue:
  LDI r1, 0xFF00FF   ; magenta (default)
  PSET r14, r21, r1

next_pixel:
  ; x++
  LDI r5, 1
  ADD r14, r5
  ; If x == 256, next row
  LDI r5, 0
  ADD r5, r14
  SUB r5, r10
  JZ r5, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r5, 1
  ADD r21, r5
  ; If y == 256, done
  LDI r5, 0
  ADD r5, r21
  SUB r5, r10
  JZ r5, done
  JMP y_loop

done:
HALT
