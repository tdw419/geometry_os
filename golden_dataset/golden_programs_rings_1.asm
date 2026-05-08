; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r7, 1            ; r7 = increment
LDI r0, 256          ; r0 = limit
LDI r15, 128          ; r15 = center (128)

y_loop:
  LDI r3, 0          ; r3 = x

x_loop:
  ; Compute |x - 128|
  LDI r1, 0
  ADD r1, r3         ; r1 = x
  SUB r1, r15         ; r1 = x - 128
  ; If negative (wrapped), negate: 0 - r1
  LDI r13, 0
  CMP r1, r13         ; r9 = sign comparison
  ; r9 > 0 means r1 < r13 (negative)
  ; We can't branch on sign of r9 directly... 
  ; Use BLT: if r1 < 0, negate
  LDI r20, 0
  CMP r1, r20
  BLT r9, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r13, 0
  SUB r13, r1         ; r13 = -r1 = |x-128|
  LDI r1, 0
  ADD r1, r13         ; r1 = |x-128|
abs_x_done:
  ; r1 = |x - 128|

  ; Compute |y - 128|
  LDI r6, 0
  ADD r6, r21        ; r6 = y
  SUB r6, r15         ; r6 = y - 128
  LDI r13, 0
  CMP r6, r13
  LDI r20, 0
  CMP r6, r20
  BLT r9, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r13, 0
  SUB r13, r6
  LDI r6, 0
  ADD r6, r13
abs_y_done:
  ; r6 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r1, r6         ; r1 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r10, 0          ; r10 = ring index
  LDI r11, 16         ; r11 = ring width
div_loop:
  SUB r1, r11
  LDI r13, 0
  CMP r1, r13
  ; If r1 >= 0, increment ring index and continue
  ; BLT r1 < 0 means we overshot
  BLT r9, div_done
  LDI r2, 1
  ADD r10, r2
  JMP div_loop
div_done:
  ; r10 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r11, 6
mod_loop:
  SUB r10, r11
  LDI r13, 0
  CMP r10, r13
  BLT r9, mod_done
  JMP mod_loop
mod_done:
  ADD r10, r11         ; undo last subtraction
  ; r10 = color index (0..5)

  ; Look up color
  JNZ r10, not_red
  LDI r1, 0xFF0000   ; red
  PSET r3, r21, r1
  JMP next_pixel
not_red:
  LDI r13, 1
  SUB r10, r13
  JNZ r10, not_yellow
  LDI r1, 0xFFFF00   ; yellow
  PSET r3, r21, r1
  JMP next_pixel
not_yellow:
  LDI r13, 1
  SUB r10, r13
  JNZ r10, not_green
  LDI r1, 0x00FF00   ; green
  PSET r3, r21, r1
  JMP next_pixel
not_green:
  LDI r13, 1
  SUB r10, r13
  JNZ r10, not_cyan
  LDI r1, 0x00FFFF   ; cyan
  PSET r3, r21, r1
  JMP next_pixel
not_cyan:
  LDI r13, 1
  SUB r10, r13
  JNZ r10, not_blue
  LDI r1, 0x0000FF   ; blue
  PSET r3, r21, r1
  JMP next_pixel
not_blue:
  LDI r1, 0xFF00FF   ; magenta (default)
  PSET r3, r21, r1

next_pixel:
  ; x++
  LDI r13, 1
  ADD r3, r13
  ; If x == 256, next row
  LDI r13, 0
  ADD r13, r3
  SUB r13, r0
  JZ r13, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r13, 1
  ADD r21, r13
  ; If y == 256, done
  LDI r13, 0
  ADD r13, r21
  SUB r13, r0
  JZ r13, done
  JMP y_loop

done:
HALT
