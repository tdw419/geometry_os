; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r3, 1            ; r3 = increment
LDI r13, 256          ; r13 = limit
LDI r11, 128          ; r11 = center (128)

y_loop:
  LDI r5, 0          ; r5 = x

x_loop:
  ; Compute |x - 128|
  LDI r7, 0
  ADD r7, r5         ; r7 = x
  SUB r7, r11         ; r7 = x - 128
  ; If negative (wrapped), negate: 0 - r7
  LDI r9, 0
  CMP r7, r9         ; r10 = sign comparison
  ; r10 > 0 means r7 < r9 (negative)
  ; We can't branch on sign of r10 directly... 
  ; Use BLT: if r7 < 0, negate
  LDI r20, 0
  CMP r7, r20
  BLT r10, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r9, 0
  SUB r9, r7         ; r9 = -r7 = |x-128|
  LDI r7, 0
  ADD r7, r9         ; r7 = |x-128|
abs_x_done:
  ; r7 = |x - 128|

  ; Compute |y - 128|
  LDI r12, 0
  ADD r12, r21        ; r12 = y
  SUB r12, r11         ; r12 = y - 128
  LDI r9, 0
  CMP r12, r9
  LDI r20, 0
  CMP r12, r20
  BLT r10, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r9, 0
  SUB r9, r12
  LDI r12, 0
  ADD r12, r9
abs_y_done:
  ; r12 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r7, r12         ; r7 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r0, 0          ; r0 = ring index
  LDI r14, 16         ; r14 = ring width
div_loop:
  SUB r7, r14
  LDI r9, 0
  CMP r7, r9
  ; If r7 >= 0, increment ring index and continue
  ; BLT r7 < 0 means we overshot
  BLT r10, div_done
  LDI r4, 1
  ADD r0, r4
  JMP div_loop
div_done:
  ; r0 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r14, 6
mod_loop:
  SUB r0, r14
  LDI r9, 0
  CMP r0, r9
  BLT r10, mod_done
  JMP mod_loop
mod_done:
  ADD r0, r14         ; undo last subtraction
  ; r0 = color index (0..5)

  ; Look up color
  JNZ r0, not_red
  LDI r7, 0xFF0000   ; red
  PSET r5, r21, r7
  JMP next_pixel
not_red:
  LDI r9, 1
  SUB r0, r9
  JNZ r0, not_yellow
  LDI r7, 0xFFFF00   ; yellow
  PSET r5, r21, r7
  JMP next_pixel
not_yellow:
  LDI r9, 1
  SUB r0, r9
  JNZ r0, not_green
  LDI r7, 0x00FF00   ; green
  PSET r5, r21, r7
  JMP next_pixel
not_green:
  LDI r9, 1
  SUB r0, r9
  JNZ r0, not_cyan
  LDI r7, 0x00FFFF   ; cyan
  PSET r5, r21, r7
  JMP next_pixel
not_cyan:
  LDI r9, 1
  SUB r0, r9
  JNZ r0, not_blue
  LDI r7, 0x0000FF   ; blue
  PSET r5, r21, r7
  JMP next_pixel
not_blue:
  LDI r7, 0xFF00FF   ; magenta (default)
  PSET r5, r21, r7

next_pixel:
  ; x++
  LDI r9, 1
  ADD r5, r9
  ; If x == 256, next row
  LDI r9, 0
  ADD r9, r5
  SUB r9, r13
  JZ r9, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r9, 1
  ADD r21, r9
  ; If y == 256, done
  LDI r9, 0
  ADD r9, r21
  SUB r9, r13
  JZ r9, done
  JMP y_loop

done:
HALT
