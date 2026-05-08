; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r15, 0            ; r15 = y counter
LDI r13, 1            ; increment
LDI r1, 256          ; limit
LDI r3, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r7, 16           ; stripe height
LDI r0, 0            ; stripe pixel counter
LDI r14, 0xFF0000     ; current color (start red)

y_loop:
  LDI r9, 0          ; r9 = x counter

x_loop:
  PSET r9, r15, r14    ; pixel at (x, y) with current color
  ADD r9, r13          ; x++
  LDI r12, 0
  ADD r12, r9
  SUB r12, r1
  JZ r12, next_row
  JMP x_loop

next_row:
  ADD r15, r13          ; y++
  ADD r0, r13          ; stripe pixel counter++
  LDI r12, 0
  ADD r12, r0
  SUB r12, r7
  JNZ r12, check_y
  ; Toggle color and reset counter
  LDI r0, 0
  LDI r12, 0
  ADD r12, r14
  XOR r12, r3
  LDI r14, 0
  ADD r14, r12

check_y:
  LDI r12, 0
  ADD r12, r15
  SUB r12, r1
  JZ r12, done
  JMP y_loop

done:
HALT
