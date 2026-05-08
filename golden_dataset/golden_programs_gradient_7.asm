; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r15, 0            ; r15 = x counter
LDI r3, 1            ; increment
LDI r14, 256          ; limit

x_loop:
  LDI r4, 0          ; r4 = y counter

y_loop:
  PSET r15, r4, r15    ; pixel at (x, y) with color = x (r15 serves as both x and color)
  ADD r4, r3          ; y++
  LDI r13, 0
  ADD r13, r4
  SUB r13, r14
  JZ r13, next_x
  JMP y_loop

next_x:
  ADD r15, r3          ; x++
  LDI r13, 0
  ADD r13, r15
  SUB r13, r14
  JZ r13, done
  JMP x_loop

done:
HALT
