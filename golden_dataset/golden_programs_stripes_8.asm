; DESCRIPTION: Geometry OS program to draw a red object.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r12, 0            ; r12 = y counter
LDI r1, 1            ; increment
LDI r7, 256          ; limit
LDI r10, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r14, 16           ; stripe height
LDI r15, 0            ; stripe pixel counter
LDI r6, 0xFF0000     ; current color (start red)

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  PSET r4, r12, r6    ; pixel at (x, y) with current color
  ADD r4, r1          ; x++
  LDI r2, 0
  ADD r2, r4
  SUB r2, r7
  JZ r2, next_row
  JMP x_loop

next_row:
  ADD r12, r1          ; y++
  ADD r15, r1          ; stripe pixel counter++
  LDI r2, 0
  ADD r2, r15
  SUB r2, r14
  JNZ r2, check_y
  ; Toggle color and reset counter
  LDI r15, 0
  LDI r2, 0
  ADD r2, r6
  XOR r2, r10
  LDI r6, 0
  ADD r6, r2

check_y:
  LDI r2, 0
  ADD r2, r12
  SUB r2, r7
  JZ r2, done
  JMP y_loop

done:
HALT
