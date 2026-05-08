; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r11, 1            ; r11 = increment
LDI r9, 256          ; r9 = limit
LDI r2, 128          ; r2 = center (128)

y_loop:
  LDI r3, 0          ; r3 = x

x_loop:
  ; Compute |x - 128|
  LDI r12, 0
  ADD r12, r3         ; r12 = x
  SUB r12, r2         ; r12 = x - 128
  ; If negative (wrapped), negate: 0 - r12
  LDI r10, 0
  CMP r12, r10         ; r6 = sign comparison
  ; r6 > 0 means r12 < r10 (negative)
  ; We can't branch on sign of r6 directly... 
  ; Use BLT: if r12 < 0, negate
  LDI r20, 0
  CMP r12, r20
  BLT r6, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r10, 0
  SUB r10, r12         ; r10 = -r12 = |x-128|
  LDI r12, 0
  ADD r12, r10         ; r12 = |x-128|
abs_x_done:
  ; r12 = |x - 128|

  ; Compute |y - 128|
  LDI r4, 0
  ADD r4, r21        ; r4 = y
  SUB r4, r2         ; r4 = y - 128
  LDI r10, 0
  CMP r4, r10
  LDI r20, 0
  CMP r4, r20
  BLT r6, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r10, 0
  SUB r10, r4
  LDI r4, 0
  ADD r4, r10
abs_y_done:
  ; r4 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r12, r4         ; r12 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r8, 0          ; r8 = ring index
  LDI r7, 16         ; r7 = ring width
div_loop:
  SUB r12, r7
  LDI r10, 0
  CMP r12, r10
  ; If r12 >= 0, increment ring index and continue
  ; BLT r12 < 0 means we overshot
  BLT r6, div_done
  LDI r14, 1
  ADD r8, r14
  JMP div_loop
div_done:
  ; r8 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r7, 6
mod_loop:
  SUB r8, r7
  LDI r10, 0
  CMP r8, r10
  BLT r6, mod_done
  JMP mod_loop
mod_done:
  ADD r8, r7         ; undo last subtraction
  ; r8 = color index (0..5)

  ; Look up color
  JNZ r8, not_red
  LDI r12, 0xFF0000   ; red
  PSET r3, r21, r12
  JMP next_pixel
not_red:
  LDI r10, 1
  SUB r8, r10
  JNZ r8, not_yellow
  LDI r12, 0xFFFF00   ; yellow
  PSET r3, r21, r12
  JMP next_pixel
not_yellow:
  LDI r10, 1
  SUB r8, r10
  JNZ r8, not_green
  LDI r12, 0x00FF00   ; green
  PSET r3, r21, r12
  JMP next_pixel
not_green:
  LDI r10, 1
  SUB r8, r10
  JNZ r8, not_cyan
  LDI r12, 0x00FFFF   ; cyan
  PSET r3, r21, r12
  JMP next_pixel
not_cyan:
  LDI r10, 1
  SUB r8, r10
  JNZ r8, not_blue
  LDI r12, 0x0000FF   ; blue
  PSET r3, r21, r12
  JMP next_pixel
not_blue:
  LDI r12, 0xFF00FF   ; magenta (default)
  PSET r3, r21, r12

next_pixel:
  ; x++
  LDI r10, 1
  ADD r3, r10
  ; If x == 256, next row
  LDI r10, 0
  ADD r10, r3
  SUB r10, r9
  JZ r10, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r10, 1
  ADD r21, r10
  ; If y == 256, done
  LDI r10, 0
  ADD r10, r21
  SUB r10, r9
  JZ r10, done
  JMP y_loop

done:
HALT
