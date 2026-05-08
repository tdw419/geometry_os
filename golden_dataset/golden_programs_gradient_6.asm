; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r13, 0            ; r13 = x counter
LDI r10, 1            ; increment
LDI r6, 256          ; limit

x_loop:
  LDI r2, 0          ; r2 = y counter

y_loop:
  PSET r13, r2, r13    ; pixel at (x, y) with color = x (r13 serves as both x and color)
  ADD r2, r10          ; y++
  LDI r15, 0
  ADD r15, r2
  SUB r15, r6
  JZ r15, next_x
  JMP y_loop

next_x:
  ADD r13, r10          ; x++
  LDI r15, 0
  ADD r15, r13
  SUB r15, r6
  JZ r15, done
  JMP x_loop

done:
HALT
