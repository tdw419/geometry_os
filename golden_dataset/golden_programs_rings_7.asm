; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r15, 1            ; r15 = increment
LDI r5, 256          ; r5 = limit
LDI r0, 128          ; r0 = center (128)

y_loop:
  LDI r11, 0          ; r11 = x

x_loop:
  ; Compute |x - 128|
  LDI r14, 0
  ADD r14, r11         ; r14 = x
  SUB r14, r0         ; r14 = x - 128
  ; If negative (wrapped), negate: 0 - r14
  LDI r2, 0
  CMP r14, r2         ; r12 = sign comparison
  ; r12 > 0 means r14 < r2 (negative)
  ; We can't branch on sign of r12 directly... 
  ; Use BLT: if r14 < 0, negate
  LDI r20, 0
  CMP r14, r20
  BLT r12, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r2, 0
  SUB r2, r14         ; r2 = -r14 = |x-128|
  LDI r14, 0
  ADD r14, r2         ; r14 = |x-128|
abs_x_done:
  ; r14 = |x - 128|

  ; Compute |y - 128|
  LDI r10, 0
  ADD r10, r21        ; r10 = y
  SUB r10, r0         ; r10 = y - 128
  LDI r2, 0
  CMP r10, r2
  LDI r20, 0
  CMP r10, r20
  BLT r12, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r2, 0
  SUB r2, r10
  LDI r10, 0
  ADD r10, r2
abs_y_done:
  ; r10 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r14, r10         ; r14 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r4, 0          ; r4 = ring index
  LDI r1, 16         ; r1 = ring width
div_loop:
  SUB r14, r1
  LDI r2, 0
  CMP r14, r2
  ; If r14 >= 0, increment ring index and continue
  ; BLT r14 < 0 means we overshot
  BLT r12, div_done
  LDI r3, 1
  ADD r4, r3
  JMP div_loop
div_done:
  ; r4 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r1, 6
mod_loop:
  SUB r4, r1
  LDI r2, 0
  CMP r4, r2
  BLT r12, mod_done
  JMP mod_loop
mod_done:
  ADD r4, r1         ; undo last subtraction
  ; r4 = color index (0..5)

  ; Look up color
  JNZ r4, not_red
  LDI r14, 0xFF0000   ; red
  PSET r11, r21, r14
  JMP next_pixel
not_red:
  LDI r2, 1
  SUB r4, r2
  JNZ r4, not_yellow
  LDI r14, 0xFFFF00   ; yellow
  PSET r11, r21, r14
  JMP next_pixel
not_yellow:
  LDI r2, 1
  SUB r4, r2
  JNZ r4, not_green
  LDI r14, 0x00FF00   ; green
  PSET r11, r21, r14
  JMP next_pixel
not_green:
  LDI r2, 1
  SUB r4, r2
  JNZ r4, not_cyan
  LDI r14, 0x00FFFF   ; cyan
  PSET r11, r21, r14
  JMP next_pixel
not_cyan:
  LDI r2, 1
  SUB r4, r2
  JNZ r4, not_blue
  LDI r14, 0x0000FF   ; blue
  PSET r11, r21, r14
  JMP next_pixel
not_blue:
  LDI r14, 0xFF00FF   ; magenta (default)
  PSET r11, r21, r14

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
