; DESCRIPTION: Display a object using color red at the screen.

; HORIZONTAL_STRIPES -- Draw alternating horizontal stripes
; Each stripe is 16 pixels tall, alternating red (0xFF0000) and blue (0x0000FF)
; Uses PSET (register-based) for all drawing
; Test: rows 0-15 = red, rows 16-31 = blue, rows 32-47 = red, etc.

LDI r3, 0            ; r3 = y counter
LDI r6, 1            ; increment
LDI r11, 256          ; limit
LDI r7, 0xFF00FF     ; toggle mask (red XOR blue)
LDI r14, 16           ; stripe height
LDI r8, 0            ; stripe pixel counter
LDI r9, 0xFF0000     ; current color (start red)

y_loop:
  LDI r2, 0          ; r2 = x counter

x_loop:
  PSET r2, r3, r9    ; pixel at (x, y) with current color
  ADD r2, r6          ; x++
  LDI r4, 0
  ADD r4, r2
  SUB r4, r11
  JZ r4, next_row
  JMP x_loop

next_row:
  ADD r3, r6          ; y++
  ADD r8, r6          ; stripe pixel counter++
  LDI r4, 0
  ADD r4, r8
  SUB r4, r14
  JNZ r4, check_y
  ; Toggle color and reset counter
  LDI r8, 0
  LDI r4, 0
  ADD r4, r9
  XOR r4, r7
  LDI r9, 0
  ADD r9, r4

check_y:
  LDI r4, 0
  ADD r4, r3
  SUB r4, r11
  JZ r4, done
  JMP y_loop

done:
HALT
