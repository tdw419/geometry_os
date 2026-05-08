; DESCRIPTION: Geometry OS program to draw a blue object.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r9, 0            ; r9 = x counter
LDI r14, 1            ; increment
LDI r6, 256          ; limit

x_loop:
  LDI r8, 0          ; r8 = y counter

y_loop:
  PSET r9, r8, r9    ; pixel at (x, y) with color = x (r9 serves as both x and color)
  ADD r8, r14          ; y++
  LDI r7, 0
  ADD r7, r8
  SUB r7, r6
  JZ r7, next_x
  JMP y_loop

next_x:
  ADD r9, r14          ; x++
  LDI r7, 0
  ADD r7, r9
  SUB r7, r6
  JZ r7, done
  JMP x_loop

done:
HALT
