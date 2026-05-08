; DESCRIPTION: This GeOS assembly code draws alternating horizontal stripes of 16 pixels each, starting with red (0xFF0000) and toggling to blue (0x0000FF), across the entire screen. The drawing is performed using the PSET function with a register-based approach, iterating through each pixel in the defined stripe height and width.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r2, 0            ; r2 = y counter
LDI r8, 1            ; increment
LDI r15, 256          ; limit
LDI r14, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r10, 16           ; stripe height
LDI r11, 0            ; stripe pixel counter
LDI r3, 0xFF0000     ; current color (start red)

y_loop:
  LDI r7, 0          ; r7 = x counter

x_loop:
  PSET r7, r2, r3    ; pixel at (x, y) with current color
  ADD r7, r8          ; x++
  LDI r12, 0
  ADD r12, r7
  SUB r12, r15
  JZ r12, next_row
  JMP x_loop

next_row:
  ADD r2, r8          ; y++
  ADD r11, r8          ; stripe pixel counter++
  LDI r12, 0
  ADD r12, r11
  SUB r12, r10
  JNZ r12, check_y
  ; Toggle color and reset counter
  LDI r11, 0
  LDI r12, 0
  ADD r12, r3
  XOR r12, r14
  LDI r3, 0
  ADD r3, r12

check_y:
  LDI r12, 0
  ADD r12, r2
  SUB r12, r15
  JZ r12, done
  JMP y_loop

done:
HALT
