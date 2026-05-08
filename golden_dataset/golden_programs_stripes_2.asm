; DESCRIPTION: Geometry OS program to draw a red object.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r5, 0            ; r5 = y counter
LDI r8, 1            ; increment
LDI r15, 256          ; limit
LDI r9, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r7, 16           ; stripe height
LDI r11, 0            ; stripe pixel counter
LDI r0, 0xFF0000     ; current color (start red)

y_loop:
  LDI r14, 0          ; r14 = x counter

x_loop:
  PSET r14, r5, r0    ; pixel at (x, y) with current color
  ADD r14, r8          ; x++
  LDI r10, 0
  ADD r10, r14
  SUB r10, r15
  JZ r10, next_row
  JMP x_loop

next_row:
  ADD r5, r8          ; y++
  ADD r11, r8          ; stripe pixel counter++
  LDI r10, 0
  ADD r10, r11
  SUB r10, r7
  JNZ r10, check_y
  ; Toggle color and reset counter
  LDI r11, 0
  LDI r10, 0
  ADD r10, r0
  XOR r10, r9
  LDI r0, 0
  ADD r0, r10

check_y:
  LDI r10, 0
  ADD r10, r5
  SUB r10, r15
  JZ r10, done
  JMP y_loop

done:
HALT
