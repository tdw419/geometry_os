; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r7, 0            ; r7 = x counter
LDI r8, 1            ; increment
LDI r6, 256          ; limit

x_loop:
  LDI r5, 0          ; r5 = y counter

y_loop:
  PSET r7, r5, r7    ; pixel at (x, y) with color = x (r7 serves as both x and color)
  ADD r5, r8          ; y++
  LDI r10, 0
  ADD r10, r5
  SUB r10, r6
  JZ r10, next_x
  JMP y_loop

next_x:
  ADD r7, r8          ; x++
  LDI r10, 0
  ADD r10, r7
  SUB r10, r6
  JZ r10, done
  JMP x_loop

done:
HALT
