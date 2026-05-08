; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r0, 0            ; r0 = y counter
LDI r11, 1            ; increment
LDI r2, 256          ; limit
LDI r3, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r14, 16           ; stripe height
LDI r6, 0            ; stripe pixel counter
LDI r5, 0xFF0000     ; current color (start red)

y_loop:
  LDI r10, 0          ; r10 = x counter

x_loop:
  PSET r10, r0, r5    ; pixel at (x, y) with current color
  ADD r10, r11          ; x++
  LDI r9, 0
  ADD r9, r10
  SUB r9, r2
  JZ r9, next_row
  JMP x_loop

next_row:
  ADD r0, r11          ; y++
  ADD r6, r11          ; stripe pixel counter++
  LDI r9, 0
  ADD r9, r6
  SUB r9, r14
  JNZ r9, check_y
  ; Toggle color and reset counter
  LDI r6, 0
  LDI r9, 0
  ADD r9, r5
  XOR r9, r3
  LDI r5, 0
  ADD r5, r9

check_y:
  LDI r9, 0
  ADD r9, r0
  SUB r9, r2
  JZ r9, done
  JMP y_loop

done:
HALT
