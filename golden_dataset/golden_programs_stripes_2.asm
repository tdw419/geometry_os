; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r7, 0            ; r7 = y counter
LDI r5, 1            ; increment
LDI r13, 256          ; limit
LDI r11, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r10, 16           ; stripe height
LDI r14, 0            ; stripe pixel counter
LDI r8, 0xFF0000     ; current color (start red)

y_loop:
  LDI r0, 0          ; r0 = x counter

x_loop:
  PSET r0, r7, r8    ; pixel at (x, y) with current color
  ADD r0, r5          ; x++
  LDI r9, 0
  ADD r9, r0
  SUB r9, r13
  JZ r9, next_row
  JMP x_loop

next_row:
  ADD r7, r5          ; y++
  ADD r14, r5          ; stripe pixel counter++
  LDI r9, 0
  ADD r9, r14
  SUB r9, r10
  JNZ r9, check_y
  ; Toggle color and reset counter
  LDI r14, 0
  LDI r9, 0
  ADD r9, r8
  XOR r9, r11
  LDI r8, 0
  ADD r8, r9

check_y:
  LDI r9, 0
  ADD r9, r7
  SUB r9, r13
  JZ r9, done
  JMP y_loop

done:
HALT
