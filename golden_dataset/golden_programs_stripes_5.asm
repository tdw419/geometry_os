; DESCRIPTION: Draws a red object at the screen with fixed size.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r8, 0            ; r8 = y counter
LDI r5, 1            ; increment
LDI r14, 256          ; limit
LDI r15, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r11, 16           ; stripe height
LDI r0, 0            ; stripe pixel counter
LDI r2, 0xFF0000     ; current color (start red)

y_loop:
  LDI r3, 0          ; r3 = x counter

x_loop:
  PSET r3, r8, r2    ; pixel at (x, y) with current color
  ADD r3, r5          ; x++
  LDI r10, 0
  ADD r10, r3
  SUB r10, r14
  JZ r10, next_row
  JMP x_loop

next_row:
  ADD r8, r5          ; y++
  ADD r0, r5          ; stripe pixel counter++
  LDI r10, 0
  ADD r10, r0
  SUB r10, r11
  JNZ r10, check_y
  ; Toggle color and reset counter
  LDI r0, 0
  LDI r10, 0
  ADD r10, r2
  XOR r10, r15
  LDI r2, 0
  ADD r2, r10

check_y:
  LDI r10, 0
  ADD r10, r8
  SUB r10, r14
  JZ r10, done
  JMP y_loop

done:
HALT
