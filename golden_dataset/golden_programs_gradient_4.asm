; DESCRIPTION: A blue object centered at the screen with fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r10, 0            ; r10 = x counter
LDI r11, 1            ; increment
LDI r8, 256          ; limit

x_loop:
  LDI r14, 0          ; r14 = y counter

y_loop:
  PSET r10, r14, r10    ; pixel at (x, y) with color = x (r10 serves as both x and color)
  ADD r14, r11          ; y++
  LDI r7, 0
  ADD r7, r14
  SUB r7, r8
  JZ r7, next_x
  JMP y_loop

next_x:
  ADD r10, r11          ; x++
  LDI r7, 0
  ADD r7, r10
  SUB r7, r8
  JZ r7, done
  JMP x_loop

done:
HALT
