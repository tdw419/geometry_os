; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r11, 0            ; r11 = y counter
LDI r3, 1            ; increment
LDI r4, 256          ; limit
LDI r10, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r0, 16           ; stripe height
LDI r1, 0            ; stripe pixel counter
LDI r9, 0xFF0000     ; current color (start red)

y_loop:
  LDI r13, 0          ; r13 = x counter

x_loop:
  PSET r13, r11, r9    ; pixel at (x, y) with current color
  ADD r13, r3          ; x++
  LDI r8, 0
  ADD r8, r13
  SUB r8, r4
  JZ r8, next_row
  JMP x_loop

next_row:
  ADD r11, r3          ; y++
  ADD r1, r3          ; stripe pixel counter++
  LDI r8, 0
  ADD r8, r1
  SUB r8, r0
  JNZ r8, check_y
  ; Toggle color and reset counter
  LDI r1, 0
  LDI r8, 0
  ADD r8, r9
  XOR r8, r10
  LDI r9, 0
  ADD r9, r8

check_y:
  LDI r8, 0
  ADD r8, r11
  SUB r8, r4
  JZ r8, done
  JMP y_loop

done:
HALT
