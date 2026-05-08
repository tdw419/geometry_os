; DESCRIPTION: This GeOS assembly code generates concentric colored rings emanating from the center (128,128) of a 256x256 pixel display. Each pixel's color is determined by its Manhattan distance from the center, with the ring index mapped to one of six colors: red, yellow, green, cyan, blue, or magenta.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r3, 1            ; r3 = increment
LDI r1, 256          ; r1 = limit
LDI r14, 128          ; r14 = center (128)

y_loop:
  LDI r13, 0          ; r13 = x

x_loop:
  ; Compute |x - 128|
  LDI r7, 0
  ADD r7, r13         ; r7 = x
  SUB r7, r14         ; r7 = x - 128
  ; If negative (wrapped), negate: 0 - r7
  LDI r0, 0
  CMP r7, r0         ; r9 = sign comparison
  ; r9 > 0 means r7 < r0 (negative)
  ; We can't branch on sign of r9 directly... 
  ; Use BLT: if r7 < 0, negate
  LDI r20, 0
  CMP r7, r20
  BLT r9, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r0, 0
  SUB r0, r7         ; r0 = -r7 = |x-128|
  LDI r7, 0
  ADD r7, r0         ; r7 = |x-128|
abs_x_done:
  ; r7 = |x - 128|

  ; Compute |y - 128|
  LDI r10, 0
  ADD r10, r21        ; r10 = y
  SUB r10, r14         ; r10 = y - 128
  LDI r0, 0
  CMP r10, r0
  LDI r20, 0
  CMP r10, r20
  BLT r9, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r0, 0
  SUB r0, r10
  LDI r10, 0
  ADD r10, r0
abs_y_done:
  ; r10 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r7, r10         ; r7 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r15, 0          ; r15 = ring index
  LDI r6, 16         ; r6 = ring width
div_loop:
  SUB r7, r6
  LDI r0, 0
  CMP r7, r0
  ; If r7 >= 0, increment ring index and continue
  ; BLT r7 < 0 means we overshot
  BLT r9, div_done
  LDI r2, 1
  ADD r15, r2
  JMP div_loop
div_done:
  ; r15 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r6, 6
mod_loop:
  SUB r15, r6
  LDI r0, 0
  CMP r15, r0
  BLT r9, mod_done
  JMP mod_loop
mod_done:
  ADD r15, r6         ; undo last subtraction
  ; r15 = color index (0..5)

  ; Look up color
  JNZ r15, not_red
  LDI r7, 0xFF0000   ; red
  PSET r13, r21, r7
  JMP next_pixel
not_red:
  LDI r0, 1
  SUB r15, r0
  JNZ r15, not_yellow
  LDI r7, 0xFFFF00   ; yellow
  PSET r13, r21, r7
  JMP next_pixel
not_yellow:
  LDI r0, 1
  SUB r15, r0
  JNZ r15, not_green
  LDI r7, 0x00FF00   ; green
  PSET r13, r21, r7
  JMP next_pixel
not_green:
  LDI r0, 1
  SUB r15, r0
  JNZ r15, not_cyan
  LDI r7, 0x00FFFF   ; cyan
  PSET r13, r21, r7
  JMP next_pixel
not_cyan:
  LDI r0, 1
  SUB r15, r0
  JNZ r15, not_blue
  LDI r7, 0x0000FF   ; blue
  PSET r13, r21, r7
  JMP next_pixel
not_blue:
  LDI r7, 0xFF00FF   ; magenta (default)
  PSET r13, r21, r7

next_pixel:
  ; x++
  LDI r0, 1
  ADD r13, r0
  ; If x == 256, next row
  LDI r0, 0
  ADD r0, r13
  SUB r0, r1
  JZ r0, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r0, 1
  ADD r21, r0
  ; If y == 256, done
  LDI r0, 0
  ADD r0, r21
  SUB r0, r1
  JZ r0, done
  JMP y_loop

done:
HALT
