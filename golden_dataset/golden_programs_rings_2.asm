; DESCRIPTION: Display a object using color red at the screen.

; RINGS -- Concentric colored rings emanating from center (128,128)
; For each pixel, compute distance from center, map to color
; Distance approximated with Manhattan distance (|dx|+|dy|)
; Ring color cycles through: red, yellow, green, cyan, blue, magenta

LDI r21, 0           ; r21 = y
LDI r13, 1            ; r13 = increment
LDI r8, 256          ; r8 = limit
LDI r12, 128          ; r12 = center (128)

y_loop:
  LDI r14, 0          ; r14 = x

x_loop:
  ; Compute |x - 128|
  LDI r3, 0
  ADD r3, r14         ; r3 = x
  SUB r3, r12         ; r3 = x - 128
  ; If negative (wrapped), negate: 0 - r3
  LDI r11, 0
  CMP r3, r11         ; r7 = sign comparison
  ; r7 > 0 means r3 < r11 (negative)
  ; We can't branch on sign of r7 directly... 
  ; Use BLT: if r3 < 0, negate
  LDI r20, 0
  CMP r3, r20
  BLT r7, abs_x_neg
  JMP abs_x_done
abs_x_neg:
  LDI r11, 0
  SUB r11, r3         ; r11 = -r3 = |x-128|
  LDI r3, 0
  ADD r3, r11         ; r3 = |x-128|
abs_x_done:
  ; r3 = |x - 128|

  ; Compute |y - 128|
  LDI r0, 0
  ADD r0, r21        ; r0 = y
  SUB r0, r12         ; r0 = y - 128
  LDI r11, 0
  CMP r0, r11
  LDI r20, 0
  CMP r0, r20
  BLT r7, abs_y_neg
  JMP abs_y_done
abs_y_neg:
  LDI r11, 0
  SUB r11, r0
  LDI r0, 0
  ADD r0, r11
abs_y_done:
  ; r0 = |y - 128|

  ; distance = |x-128| + |y-128| (Manhattan)
  ADD r3, r0         ; r3 = distance

  ; Ring index = distance / 16 (integer division by repeated subtraction)
  LDI r6, 0          ; r6 = ring index
  LDI r2, 16         ; r2 = ring width
div_loop:
  SUB r3, r2
  LDI r11, 0
  CMP r3, r11
  ; If r3 >= 0, increment ring index and continue
  ; BLT r3 < 0 means we overshot
  BLT r7, div_done
  LDI r9, 1
  ADD r6, r9
  JMP div_loop
div_done:
  ; r6 = ring index (0, 1, 2, ...)

  ; Map ring index to color using mod 6
  ; 0=red, 1=yellow, 2=green, 3=cyan, 4=blue, 5=magenta
  LDI r2, 6
mod_loop:
  SUB r6, r2
  LDI r11, 0
  CMP r6, r11
  BLT r7, mod_done
  JMP mod_loop
mod_done:
  ADD r6, r2         ; undo last subtraction
  ; r6 = color index (0..5)

  ; Look up color
  JNZ r6, not_red
  LDI r3, 0xFF0000   ; red
  PSET r14, r21, r3
  JMP next_pixel
not_red:
  LDI r11, 1
  SUB r6, r11
  JNZ r6, not_yellow
  LDI r3, 0xFFFF00   ; yellow
  PSET r14, r21, r3
  JMP next_pixel
not_yellow:
  LDI r11, 1
  SUB r6, r11
  JNZ r6, not_green
  LDI r3, 0x00FF00   ; green
  PSET r14, r21, r3
  JMP next_pixel
not_green:
  LDI r11, 1
  SUB r6, r11
  JNZ r6, not_cyan
  LDI r3, 0x00FFFF   ; cyan
  PSET r14, r21, r3
  JMP next_pixel
not_cyan:
  LDI r11, 1
  SUB r6, r11
  JNZ r6, not_blue
  LDI r3, 0x0000FF   ; blue
  PSET r14, r21, r3
  JMP next_pixel
not_blue:
  LDI r3, 0xFF00FF   ; magenta (default)
  PSET r14, r21, r3

next_pixel:
  ; x++
  LDI r11, 1
  ADD r14, r11
  ; If x == 256, next row
  LDI r11, 0
  ADD r11, r14
  SUB r11, r8
  JZ r11, next_row
  JMP x_loop

next_row:
  ; y++
  LDI r11, 1
  ADD r21, r11
  ; If y == 256, done
  LDI r11, 0
  ADD r11, r21
  SUB r11, r8
  JZ r11, done
  JMP y_loop

done:
HALT
