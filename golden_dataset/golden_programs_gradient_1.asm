; DESCRIPTION: A blue object centered at the screen with fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r2, 0            ; r2 = x counter
LDI r9, 1            ; increment
LDI r15, 256          ; limit

x_loop:
  LDI r3, 0          ; r3 = y counter

y_loop:
  PSET r2, r3, r2    ; pixel at (x, y) with color = x (r2 serves as both x and color)
  ADD r3, r9          ; y++
  LDI r0, 0
  ADD r0, r3
  SUB r0, r15
  JZ r0, next_x
  JMP y_loop

next_x:
  ADD r2, r9          ; x++
  LDI r0, 0
  ADD r0, r2
  SUB r0, r15
  JZ r0, done
  JMP x_loop

done:
HALT
