; DESCRIPTION: Draws a blue object at the screen with fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r2, 0            ; r2 = x counter
LDI r3, 1            ; increment
LDI r15, 256          ; limit

x_loop:
  LDI r11, 0          ; r11 = y counter

y_loop:
  PSET r2, r11, r2    ; pixel at (x, y) with color = x (r2 serves as both x and color)
  ADD r11, r3          ; y++
  LDI r12, 0
  ADD r12, r11
  SUB r12, r15
  JZ r12, next_x
  JMP y_loop

next_x:
  ADD r2, r3          ; x++
  LDI r12, 0
  ADD r12, r2
  SUB r12, r15
  JZ r12, done
  JMP x_loop

done:
HALT
