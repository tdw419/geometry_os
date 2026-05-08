; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r5, 0            ; r5 = y counter
LDI r7, 1            ; increment
LDI r12, 256          ; limit
LDI r11, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r0, 16           ; stripe height
LDI r15, 0            ; stripe pixel counter
LDI r13, 0xFF0000     ; current color (start red)

y_loop:
  LDI r2, 0          ; r2 = x counter

x_loop:
  PSET r2, r5, r13    ; pixel at (x, y) with current color
  ADD r2, r7          ; x++
  LDI r9, 0
  ADD r9, r2
  SUB r9, r12
  JZ r9, next_row
  JMP x_loop

next_row:
  ADD r5, r7          ; y++
  ADD r15, r7          ; stripe pixel counter++
  LDI r9, 0
  ADD r9, r15
  SUB r9, r0
  JNZ r9, check_y
  ; Toggle color and reset counter
  LDI r15, 0
  LDI r9, 0
  ADD r9, r13
  XOR r9, r11
  LDI r13, 0
  ADD r13, r9

check_y:
  LDI r9, 0
  ADD r9, r5
  SUB r9, r12
  JZ r9, done
  JMP y_loop

done:
HALT
