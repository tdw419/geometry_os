; DESCRIPTION: Render a red object at the screen.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r8, 0            ; r8 = y counter
LDI r1, 1            ; increment
LDI r9, 256          ; limit
LDI r12, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r10, 16           ; stripe height
LDI r14, 0            ; stripe pixel counter
LDI r13, 0xFF0000     ; current color (start red)

y_loop:
  LDI r5, 0          ; r5 = x counter

x_loop:
  PSET r5, r8, r13    ; pixel at (x, y) with current color
  ADD r5, r1          ; x++
  LDI r4, 0
  ADD r4, r5
  SUB r4, r9
  JZ r4, next_row
  JMP x_loop

next_row:
  ADD r8, r1          ; y++
  ADD r14, r1          ; stripe pixel counter++
  LDI r4, 0
  ADD r4, r14
  SUB r4, r10
  JNZ r4, check_y
  ; Toggle color and reset counter
  LDI r14, 0
  LDI r4, 0
  ADD r4, r13
  XOR r4, r12
  LDI r13, 0
  ADD r13, r4

check_y:
  LDI r4, 0
  ADD r4, r8
  SUB r4, r9
  JZ r4, done
  JMP y_loop

done:
HALT
