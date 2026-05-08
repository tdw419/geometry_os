; DESCRIPTION: Render a red object at the screen.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r9, 0            ; r9 = y counter
LDI r13, 1            ; increment
LDI r6, 256          ; limit
LDI r0, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r1, 16           ; stripe height
LDI r12, 0            ; stripe pixel counter
LDI r2, 0xFF0000     ; current color (start red)

y_loop:
  LDI r8, 0          ; r8 = x counter

x_loop:
  PSET r8, r9, r2    ; pixel at (x, y) with current color
  ADD r8, r13          ; x++
  LDI r5, 0
  ADD r5, r8
  SUB r5, r6
  JZ r5, next_row
  JMP x_loop

next_row:
  ADD r9, r13          ; y++
  ADD r12, r13          ; stripe pixel counter++
  LDI r5, 0
  ADD r5, r12
  SUB r5, r1
  JNZ r5, check_y
  ; Toggle color and reset counter
  LDI r12, 0
  LDI r5, 0
  ADD r5, r2
  XOR r5, r0
  LDI r2, 0
  ADD r2, r5

check_y:
  LDI r5, 0
  ADD r5, r9
  SUB r5, r6
  JZ r5, done
  JMP y_loop

done:
HALT
