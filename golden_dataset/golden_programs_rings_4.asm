; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r6, 1            ; r6 = increment
LDI r7, 256          ; r7 = limit
LDI r12, 128          ; r12 = center (128)

y_loop:
  LDI r1, 0          ; r1 = x

x_loop:
  ; Compute |x - 128|
  LDI r9, 0
  ADD r9, r1         ; r9 = x
  SUB r9, r12         ; r9 = x - 128
  ; If negative (wrapped), negate: 0 - r9
  LDI r8, 0
  CMP r9, r8         ; r15 = sign comparison
  ; r15 > 0 means r9 < r8 (negative)
  ; We can't branch on sign of r15 directly... 
  ; Use BLT: if r9 < 0, negate
  LDI r20, 0
  CMP r9, r20
  BLT r15, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r8, 0
  SUB r8, r9         ; r8 = -r9 = |x-128|
  LDI r9, 0
  ADD r9, r8         ; r9 = |x-128|
abs_x_done:
  ; r9 = |x - 128|

  ; Compute |y - 128|
  LDI r13, 0
  ADD r13, r21        ; r13 = y
  SUB r13, r12         ; r13 = y - 128
  LDI r8, 0
  CMP r13, r8
  LDI r20, 0
  CMP r13, r20
  BLT r15, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r8, 0
  SUB r8, r13
  LDI r13, 0
  ADD r13, r8
abs_y_done:
  ; r13 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r9, r13         ; r9 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r4, 0          ; r4 = ring index
  LDI r14, 16         ; r14 = ring width
div_loop:
  SUB r9, r14
  LDI r8, 0
  CMP r9, r8
  ; If r9 >= 0, increment ring index and continue
  ; BLT r9 < 0 means we overshot
  BLT r15, div_done
  LDI r2, 1
  ADD r4, r2
  JMP div_loop
div_done:
  ; r4 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r14, 6
mod_loop:
  SUB r4, r14
  LDI r8, 0
  CMP r4, r8
  BLT r15, mod_done
  JMP mod_loop
mod_done:
  ADD r4, r14         ; undo last subtraction
  ; r4 = color index (0..5)

  ; Look up color
  JNZ r4, not_red
  LDI r9, 0xFF0000   ; red
  PSET r1, r21, r9
  JMP next_pixel
not_red:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_yellow
  LDI r9, 0xFFFF00   ; yellow
  PSET r1, r21, r9
  JMP next_pixel
not_yellow:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_green
  LDI r9, 0x00FF00   ; green
  PSET r1, r21, r9
  JMP next_pixel
not_green:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_cyan
  LDI r9, 0x00FFFF   ; cyan
  PSET r1, r21, r9
  JMP next_pixel
not_cyan:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_blue
  LDI r9, 0x0000FF   ; blue
  PSET r1, r21, r9
  JMP next_pixel
not_blue:
  LDI r9, 0xFF00FF   ; magenta (default)
  PSET r1, r21, r9

next_pixel:
  ; x++
  LDI r8, 1
  ADD r1, r8
  ; If x == 256, next row
  LDI r8, 0
  ADD r8, r1
  SUB r8, r7
  JZ r8, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r8, 1
  ADD r21, r8
  ; If y == 256, done
  LDI r8, 0
  ADD r8, r21
  SUB r8, r7
  JZ r8, done
  JMP y_loop

done:
HALT
