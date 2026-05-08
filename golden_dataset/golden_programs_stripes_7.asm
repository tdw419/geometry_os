; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r15, 0            ; r15 = y counter
LDI r8, 1            ; increment
LDI r3, 256          ; limit
LDI r1, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r5, 16           ; stripe height
LDI r10, 0            ; stripe pixel counter
LDI r13, 0xFF0000     ; current color (start red)

y_loop:
  LDI r0, 0          ; r0 = x counter

x_loop:
  PSET r0, r15, r13    ; pixel at (x, y) with current color
  ADD r0, r8          ; x++
  LDI r12, 0
  ADD r12, r0
  SUB r12, r3
  JZ r12, next_row
  JMP x_loop

next_row:
  ADD r15, r8          ; y++
  ADD r10, r8          ; stripe pixel counter++
  LDI r12, 0
  ADD r12, r10
  SUB r12, r5
  JNZ r12, check_y
  ; Toggle color and reset counter
  LDI r10, 0
  LDI r12, 0
  ADD r12, r13
  XOR r12, r1
  LDI r13, 0
  ADD r13, r12

check_y:
  LDI r12, 0
  ADD r12, r15
  SUB r12, r3
  JZ r12, done
  JMP y_loop

done:
HALT
