; DESCRIPTION: Draw object: pos=the screen, color=blue, size=fixed size.

; GRADIENT -- Draw a horizontal blue gradient across the screen
; Each column x gets color = x (blue channel only)
; Uses PSET (register-based) for dynamic coordinates
; Test: column 0 = 0x00, column 255 = 0xFF

LDI r6, 0            ; r6 = x counter
LDI r7, 1            ; increment
LDI r10, 256          ; limit

x_loop:
  LDI r11, 0          ; r11 = y counter

y_loop:
  PSET r6, r11, r6    ; pixel at (x, y) with color = x (r6 serves as both x and color)
  ADD r11, r7          ; y++
  LDI r4, 0
  ADD r4, r11
  SUB r4, r10
  JZ r4, next_x
  JMP y_loop

next_x:
  ADD r6, r7          ; x++
  LDI r4, 0
  ADD r4, r6
  SUB r4, r10
  JZ r4, done
  JMP x_loop

done:
HALT
