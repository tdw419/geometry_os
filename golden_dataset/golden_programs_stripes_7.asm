; DESCRIPTION: Display a object using color red at the screen.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r8, 0            ; r8 = y counter
LDI r4, 1            ; increment
LDI r2, 256          ; limit
LDI r9, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r14, 16           ; stripe height
LDI r6, 0            ; stripe pixel counter
LDI r0, 0xFF0000     ; current color (start red)

y_loop:
  LDI r7, 0          ; r7 = x counter

x_loop:
  PSET r7, r8, r0    ; pixel at (x, y) with current color
  ADD r7, r4          ; x++
  LDI r12, 0
  ADD r12, r7
  SUB r12, r2
  JZ r12, next_row
  JMP x_loop

next_row:
  ADD r8, r4          ; y++
  ADD r6, r4          ; stripe pixel counter++
  LDI r12, 0
  ADD r12, r6
  SUB r12, r14
  JNZ r12, check_y
  ; Toggle color and reset counter
  LDI r6, 0
  LDI r12, 0
  ADD r12, r0
  XOR r12, r9
  LDI r0, 0
  ADD r0, r12

check_y:
  LDI r12, 0
  ADD r12, r8
  SUB r12, r2
  JZ r12, done
  JMP y_loop

done:
HALT
