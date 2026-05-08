; DESCRIPTION: Draws a red object at the screen with fixed size.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r2, 1            ; r2 = increment
LDI r7, 256          ; r7 = limit
LDI r8, 128          ; r8 = center (128)

y_loop:
  LDI r5, 0          ; r5 = x

x_loop:
  ; Compute |x - 128|
  LDI r0, 0
  ADD r0, r5         ; r0 = x
  SUB r0, r8         ; r0 = x - 128
  ; If negative (wrapped), negate: 0 - r0
  LDI r11, 0
  CMP r0, r11         ; r15 = sign comparison
  ; r15 > 0 means r0 < r11 (negative)
  ; We can't branch on sign of r15 directly... 
  ; Use BLT: if r0 < 0, negate
  LDI r20, 0
  CMP r0, r20
  BLT r15, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r11, 0
  SUB r11, r0         ; r11 = -r0 = |x-128|
  LDI r0, 0
  ADD r0, r11         ; r0 = |x-128|
abs_x_done:
  ; r0 = |x - 128|

  ; Compute |y - 128|
  LDI r10, 0
  ADD r10, r21        ; r10 = y
  SUB r10, r8         ; r10 = y - 128
  LDI r11, 0
  CMP r10, r11
  LDI r20, 0
  CMP r10, r20
  BLT r15, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r11, 0
  SUB r11, r10
  LDI r10, 0
  ADD r10, r11
abs_y_done:
  ; r10 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r0, r10         ; r0 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r14, 0          ; r14 = ring index
  LDI r13, 16         ; r13 = ring width
div_loop:
  SUB r0, r13
  LDI r11, 0
  CMP r0, r11
  ; If r0 >= 0, increment ring index and continue
  ; BLT r0 < 0 means we overshot
  BLT r15, div_done
  LDI r3, 1
  ADD r14, r3
  JMP div_loop
div_done:
  ; r14 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r13, 6
mod_loop:
  SUB r14, r13
  LDI r11, 0
  CMP r14, r11
  BLT r15, mod_done
  JMP mod_loop
mod_done:
  ADD r14, r13         ; undo last subtraction
  ; r14 = color index (0..5)

  ; Look up color
  JNZ r14, not_red
  LDI r0, 0xFF0000   ; red
  PSET r5, r21, r0
  JMP next_pixel
not_red:
  LDI r11, 1
  SUB r14, r11
  JNZ r14, not_yellow
  LDI r0, 0xFFFF00   ; yellow
  PSET r5, r21, r0
  JMP next_pixel
not_yellow:
  LDI r11, 1
  SUB r14, r11
  JNZ r14, not_green
  LDI r0, 0x00FF00   ; green
  PSET r5, r21, r0
  JMP next_pixel
not_green:
  LDI r11, 1
  SUB r14, r11
  JNZ r14, not_cyan
  LDI r0, 0x00FFFF   ; cyan
  PSET r5, r21, r0
  JMP next_pixel
not_cyan:
  LDI r11, 1
  SUB r14, r11
  JNZ r14, not_blue
  LDI r0, 0x0000FF   ; blue
  PSET r5, r21, r0
  JMP next_pixel
not_blue:
  LDI r0, 0xFF00FF   ; magenta (default)
  PSET r5, r21, r0

next_pixel:
  ; x++
  LDI r11, 1
  ADD r5, r11
  ; If x == 256, next row
  LDI r11, 0
  ADD r11, r5
  SUB r11, r7
  JZ r11, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r11, 1
  ADD r21, r11
  ; If y == 256, done
  LDI r11, 0
  ADD r11, r21
  SUB r11, r7
  JZ r11, done
  JMP y_loop

done:
HALT
