; DESCRIPTION: Draw object: pos=the screen, color=blue, size=fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r12, 0            ; r12 = x counter
LDI r0, 1            ; increment
LDI r2, 256          ; limit

x_loop:
  LDI r4, 0          ; r4 = y counter

y_loop:
  PSET r12, r4, r12    ; pixel at (x, y) with color = x (r12 serves as both x and color)
  ADD r4, r0          ; y++
  LDI r1, 0
  ADD r1, r4
  SUB r1, r2
  JZ r1, next_x
  JMP y_loop

next_x:
  ADD r12, r0          ; x++
  LDI r1, 0
  ADD r1, r12
  SUB r1, r2
  JZ r1, done
  JMP x_loop

done:
HALT
