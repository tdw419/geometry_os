; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r0, 0            ; r0 = y counter
LDI r8, 1            ; increment
LDI r2, 256          ; limit
LDI r15, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r7, 16           ; stripe height
LDI r5, 0            ; stripe pixel counter
LDI r9, 0xFF0000     ; current color (start red)

y_loop:
  LDI r6, 0          ; r6 = x counter

x_loop:
  PSET r6, r0, r9    ; pixel at (x, y) with current color
  ADD r6, r8          ; x++
  LDI r3, 0
  ADD r3, r6
  SUB r3, r2
  JZ r3, next_row
  JMP x_loop

next_row:
  ADD r0, r8          ; y++
  ADD r5, r8          ; stripe pixel counter++
  LDI r3, 0
  ADD r3, r5
  SUB r3, r7
  JNZ r3, check_y
  ; Toggle color and reset counter
  LDI r5, 0
  LDI r3, 0
  ADD r3, r9
  XOR r3, r15
  LDI r9, 0
  ADD r9, r3

check_y:
  LDI r3, 0
  ADD r3, r0
  SUB r3, r2
  JZ r3, done
  JMP y_loop

done:
HALT
