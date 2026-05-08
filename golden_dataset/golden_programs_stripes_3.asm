; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r15, 0            ; r15 = y counter
LDI r9, 1            ; increment
LDI r14, 256          ; limit
LDI r4, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r6, 16           ; stripe height
LDI r13, 0            ; stripe pixel counter
LDI r8, 0xFF0000     ; current color (start red)

y_loop:
  LDI r11, 0          ; r11 = x counter

x_loop:
  PSET r11, r15, r8    ; pixel at (x, y) with current color
  ADD r11, r9          ; x++
  LDI r0, 0
  ADD r0, r11
  SUB r0, r14
  JZ r0, next_row
  JMP x_loop

next_row:
  ADD r15, r9          ; y++
  ADD r13, r9          ; stripe pixel counter++
  LDI r0, 0
  ADD r0, r13
  SUB r0, r6
  JNZ r0, check_y
  ; Toggle color and reset counter
  LDI r13, 0
  LDI r0, 0
  ADD r0, r8
  XOR r0, r4
  LDI r8, 0
  ADD r8, r0

check_y:
  LDI r0, 0
  ADD r0, r15
  SUB r0, r14
  JZ r0, done
  JMP y_loop

done:
HALT
