; DESCRIPTION: Draw object: pos=the screen, color=blue, size=fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r10, 0            ; r10 = x counter
LDI r13, 1            ; increment
LDI r6, 256          ; limit

x_loop:
  LDI r14, 0          ; r14 = y counter

y_loop:
  PSET r10, r14, r10    ; pixel at (x, y) with color = x (r10 serves as both x and color)
  ADD r14, r13          ; y++
  LDI r11, 0
  ADD r11, r14
  SUB r11, r6
  JZ r11, next_x
  JMP y_loop

next_x:
  ADD r10, r13          ; x++
  LDI r11, 0
  ADD r11, r10
  SUB r11, r6
  JZ r11, done
  JMP x_loop

done:
HALT
