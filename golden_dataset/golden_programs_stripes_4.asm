; DESCRIPTION: Draws a red object at the screen with fixed size.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r12, 0            ; r12 = y counter
LDI r2, 1            ; increment
LDI r10, 256          ; limit
LDI r15, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r11, 16           ; stripe height
LDI r9, 0            ; stripe pixel counter
LDI r8, 0xFF0000     ; current color (start red)

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  PSET r4, r12, r8    ; pixel at (x, y) with current color
  ADD r4, r2          ; x++
  LDI r5, 0
  ADD r5, r4
  SUB r5, r10
  JZ r5, next_row
  JMP x_loop

next_row:
  ADD r12, r2          ; y++
  ADD r9, r2          ; stripe pixel counter++
  LDI r5, 0
  ADD r5, r9
  SUB r5, r11
  JNZ r5, check_y
  ; Toggle color and reset counter
  LDI r9, 0
  LDI r5, 0
  ADD r5, r8
  XOR r5, r15
  LDI r8, 0
  ADD r8, r5

check_y:
  LDI r5, 0
  ADD r5, r12
  SUB r5, r10
  JZ r5, done
  JMP y_loop

done:
HALT
