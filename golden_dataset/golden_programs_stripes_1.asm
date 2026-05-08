; DESCRIPTION: Display a object using color red at the screen.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r5, 0            ; r5 = y counter
LDI r0, 1            ; increment
LDI r2, 256          ; limit
LDI r10, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r13, 16           ; stripe height
LDI r3, 0            ; stripe pixel counter
LDI r14, 0xFF0000     ; current color (start red)

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  PSET r4, r5, r14    ; pixel at (x, y) with current color
  ADD r4, r0          ; x++
  LDI r7, 0
  ADD r7, r4
  SUB r7, r2
  JZ r7, next_row
  JMP x_loop

next_row:
  ADD r5, r0          ; y++
  ADD r3, r0          ; stripe pixel counter++
  LDI r7, 0
  ADD r7, r3
  SUB r7, r13
  JNZ r7, check_y
  ; Toggle color and reset counter
  LDI r3, 0
  LDI r7, 0
  ADD r7, r14
  XOR r7, r10
  LDI r14, 0
  ADD r14, r7

check_y:
  LDI r7, 0
  ADD r7, r5
  SUB r7, r2
  JZ r7, done
  JMP y_loop

done:
HALT
