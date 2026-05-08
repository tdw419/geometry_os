; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r0, 1            ; r0 = increment
LDI r6, 256          ; r6 = limit
LDI r8, 128          ; r8 = center (128)

y_loop:
  LDI r3, 0          ; r3 = x

x_loop:
  ; Compute |x - 128|
  LDI r10, 0
  ADD r10, r3         ; r10 = x
  SUB r10, r8         ; r10 = x - 128
  ; If negative (wrapped), negate: 0 - r10
  LDI r4, 0
  CMP r10, r4         ; r1 = sign comparison
  ; r1 > 0 means r10 < r4 (negative)
  ; We can't branch on sign of r1 directly... 
  ; Use BLT: if r10 < 0, negate
  LDI r20, 0
  CMP r10, r20
  BLT r1, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r4, 0
  SUB r4, r10         ; r4 = -r10 = |x-128|
  LDI r10, 0
  ADD r10, r4         ; r10 = |x-128|
abs_x_done:
  ; r10 = |x - 128|

  ; Compute |y - 128|
  LDI r9, 0
  ADD r9, r21        ; r9 = y
  SUB r9, r8         ; r9 = y - 128
  LDI r4, 0
  CMP r9, r4
  LDI r20, 0
  CMP r9, r20
  BLT r1, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r4, 0
  SUB r4, r9
  LDI r9, 0
  ADD r9, r4
abs_y_done:
  ; r9 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r10, r9         ; r10 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r15, 0          ; r15 = ring index
  LDI r11, 16         ; r11 = ring width
div_loop:
  SUB r10, r11
  LDI r4, 0
  CMP r10, r4
  ; If r10 >= 0, increment ring index and continue
  ; BLT r10 < 0 means we overshot
  BLT r1, div_done
  LDI r14, 1
  ADD r15, r14
  JMP div_loop
div_done:
  ; r15 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r11, 6
mod_loop:
  SUB r15, r11
  LDI r4, 0
  CMP r15, r4
  BLT r1, mod_done
  JMP mod_loop
mod_done:
  ADD r15, r11         ; undo last subtraction
  ; r15 = color index (0..5)

  ; Look up color
  JNZ r15, not_red
  LDI r10, 0xFF0000   ; red
  PSET r3, r21, r10
  JMP next_pixel
not_red:
  LDI r4, 1
  SUB r15, r4
  JNZ r15, not_yellow
  LDI r10, 0xFFFF00   ; yellow
  PSET r3, r21, r10
  JMP next_pixel
not_yellow:
  LDI r4, 1
  SUB r15, r4
  JNZ r15, not_green
  LDI r10, 0x00FF00   ; green
  PSET r3, r21, r10
  JMP next_pixel
not_green:
  LDI r4, 1
  SUB r15, r4
  JNZ r15, not_cyan
  LDI r10, 0x00FFFF   ; cyan
  PSET r3, r21, r10
  JMP next_pixel
not_cyan:
  LDI r4, 1
  SUB r15, r4
  JNZ r15, not_blue
  LDI r10, 0x0000FF   ; blue
  PSET r3, r21, r10
  JMP next_pixel
not_blue:
  LDI r10, 0xFF00FF   ; magenta (default)
  PSET r3, r21, r10

next_pixel:
  ; x++
  LDI r4, 1
  ADD r3, r4
  ; If x == 256, next row
  LDI r4, 0
  ADD r4, r3
  SUB r4, r6
  JZ r4, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r4, 1
  ADD r21, r4
  ; If y == 256, done
  LDI r4, 0
  ADD r4, r21
  SUB r4, r6
  JZ r4, done
  JMP y_loop

done:
HALT
