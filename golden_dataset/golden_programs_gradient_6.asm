; DESCRIPTION: Display a object using color blue at the screen.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r0, 0            ; r0 = x counter
LDI r2, 1            ; increment
LDI r3, 256          ; limit

x_loop:
  LDI r5, 0          ; r5 = y counter

y_loop:
  PSET r0, r5, r0    ; pixel at (x, y) with color = x (r0 serves as both x and color)
  ADD r5, r2          ; y++
  LDI r14, 0
  ADD r14, r5
  SUB r14, r3
  JZ r14, next_x
  JMP y_loop

next_x:
  ADD r0, r2          ; x++
  LDI r14, 0
  ADD r14, r0
  SUB r14, r3
  JZ r14, done
  JMP x_loop

done:
HALT
