; DESCRIPTION: Render a blue object at the screen.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r3, 0            ; r3 = x counter
LDI r13, 1            ; increment
LDI r8, 256          ; limit

x_loop:
  LDI r7, 0          ; r7 = y counter

y_loop:
  PSET r3, r7, r3    ; pixel at (x, y) with color = x (r3 serves as both x and color)
  ADD r7, r13          ; y++
  LDI r9, 0
  ADD r9, r7
  SUB r9, r8
  JZ r9, next_x
  JMP y_loop

next_x:
  ADD r3, r13          ; x++
  LDI r9, 0
  ADD r9, r3
  SUB r9, r8
  JZ r9, done
  JMP x_loop

done:
HALT
