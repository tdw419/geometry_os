; DESCRIPTION: This GeOS assembly code draws a horizontal blue gradient across the screen by iterating through each column (x) and setting the pixel color based on the x-coordinate value, using PSET for dynamic coordinates. The blue channel intensity varies from 0x00 at column 0 to 0xFF at column 255.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r2, 0            ; r2 = x counter
LDI r14, 1            ; increment
LDI r5, 256          ; limit

x_loop:
  LDI r12, 0          ; r12 = y counter

y_loop:
  PSET r2, r12, r2    ; pixel at (x, y) with color = x (r2 serves as both x and color)
  ADD r12, r14          ; y++
  LDI r11, 0
  ADD r11, r12
  SUB r11, r5
  JZ r11, next_x
  JMP y_loop

next_x:
  ADD r2, r14          ; x++
  LDI r11, 0
  ADD r11, r2
  SUB r11, r5
  JZ r11, done
  JMP x_loop

done:
HALT
