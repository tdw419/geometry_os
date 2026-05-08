; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r1, 0            ; r1 = x counter
LDI r0, 1            ; increment
LDI r10, 256          ; limit

x_loop:
  LDI r8, 0          ; r8 = y counter

y_loop:
  PSET r1, r8, r1    ; pixel at (x, y) with color = x (r1 serves as both x and color)
  ADD r8, r0          ; y++
  LDI r14, 0
  ADD r14, r8
  SUB r14, r10
  JZ r14, next_x
  JMP y_loop

next_x:
  ADD r1, r0          ; x++
  LDI r14, 0
  ADD r14, r1
  SUB r14, r10
  JZ r14, done
  JMP x_loop

done:
HALT
