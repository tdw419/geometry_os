; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r3, 0            ; r3 = x counter
LDI r15, 1            ; increment
LDI r14, 256          ; limit

x_loop:
  LDI r9, 0          ; r9 = y counter

y_loop:
  PSET r3, r9, r3    ; pixel at (x, y) with color = x (r3 serves as both x and color)
  ADD r9, r15          ; y++
  LDI r2, 0
  ADD r2, r9
  SUB r2, r14
  JZ r2, next_x
  JMP y_loop

next_x:
  ADD r3, r15          ; x++
  LDI r2, 0
  ADD r2, r3
  SUB r2, r14
  JZ r2, done
  JMP x_loop

done:
HALT
