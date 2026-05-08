; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r9, 1            ; r9 = increment
LDI r6, 256          ; r6 = limit
LDI r14, 128          ; r14 = center (128)

y_loop:
  LDI r11, 0          ; r11 = x

x_loop:
  ; Compute |x - 128|
  LDI r12, 0
  ADD r12, r11         ; r12 = x
  SUB r12, r14         ; r12 = x - 128
  ; If negative (wrapped), negate: 0 - r12
  LDI r8, 0
  CMP r12, r8         ; r10 = sign comparison
  ; r10 > 0 means r12 < r8 (negative)
  ; We can't branch on sign of r10 directly... 
  ; Use BLT: if r12 < 0, negate
  LDI r20, 0
  CMP r12, r20
  BLT r10, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r8, 0
  SUB r8, r12         ; r8 = -r12 = |x-128|
  LDI r12, 0
  ADD r12, r8         ; r12 = |x-128|
abs_x_done:
  ; r12 = |x - 128|

  ; Compute |y - 128|
  LDI r3, 0
  ADD r3, r21        ; r3 = y
  SUB r3, r14         ; r3 = y - 128
  LDI r8, 0
  CMP r3, r8
  LDI r20, 0
  CMP r3, r20
  BLT r10, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r8, 0
  SUB r8, r3
  LDI r3, 0
  ADD r3, r8
abs_y_done:
  ; r3 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r12, r3         ; r12 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r4, 0          ; r4 = ring index
  LDI r13, 16         ; r13 = ring width
div_loop:
  SUB r12, r13
  LDI r8, 0
  CMP r12, r8
  ; If r12 >= 0, increment ring index and continue
  ; BLT r12 < 0 means we overshot
  BLT r10, div_done
  LDI r2, 1
  ADD r4, r2
  JMP div_loop
div_done:
  ; r4 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r13, 6
mod_loop:
  SUB r4, r13
  LDI r8, 0
  CMP r4, r8
  BLT r10, mod_done
  JMP mod_loop
mod_done:
  ADD r4, r13         ; undo last subtraction
  ; r4 = color index (0..5)

  ; Look up color
  JNZ r4, not_red
  LDI r12, 0xFF0000   ; red
  PSET r11, r21, r12
  JMP next_pixel
not_red:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_yellow
  LDI r12, 0xFFFF00   ; yellow
  PSET r11, r21, r12
  JMP next_pixel
not_yellow:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_green
  LDI r12, 0x00FF00   ; green
  PSET r11, r21, r12
  JMP next_pixel
not_green:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_cyan
  LDI r12, 0x00FFFF   ; cyan
  PSET r11, r21, r12
  JMP next_pixel
not_cyan:
  LDI r8, 1
  SUB r4, r8
  JNZ r4, not_blue
  LDI r12, 0x0000FF   ; blue
  PSET r11, r21, r12
  JMP next_pixel
not_blue:
  LDI r12, 0xFF00FF   ; magenta (default)
  PSET r11, r21, r12

next_pixel:
  ; x++
  LDI r8, 1
  ADD r11, r8
  ; If x == 256, next row
  LDI r8, 0
  ADD r8, r11
  SUB r8, r6
  JZ r8, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r8, 1
  ADD r21, r8
  ; If y == 256, done
  LDI r8, 0
  ADD r8, r21
  SUB r8, r6
  JZ r8, done
  JMP y_loop

done:
HALT
