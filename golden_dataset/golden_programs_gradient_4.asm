; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r14, 0            ; r14 = x counter
LDI r12, 1            ; increment
LDI r2, 256          ; limit

x_loop:
  LDI r11, 0          ; r11 = y counter

y_loop:
  PSET r14, r11, r14    ; pixel at (x, y) with color = x (r14 serves as both x and color)
  ADD r11, r12          ; y++
  LDI r7, 0
  ADD r7, r11
  SUB r7, r2
  JZ r7, next_x
  JMP y_loop

next_x:
  ADD r14, r12          ; x++
  LDI r7, 0
  ADD r7, r14
  SUB r7, r2
  JZ r7, done
  JMP x_loop

done:
HALT
