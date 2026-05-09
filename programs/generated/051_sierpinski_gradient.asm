; SIERPINSKI TRIANGLE with Y-axis color gradient
; Pixel (x,y) drawn if (x & y) == 0 (classic bitwise fractal)
; Color: gradient from dark red (top) to light cyan (bottom)
; r_color = 0x220000 + y * 0x0101

LDI r0, 0            ; r0 = x
LDI r1, 256          ; r1 = limit
LDI r7, 1            ; r7 = increment
LDI r4, 0            ; r4 = y

y_loop:
  LDI r0, 0          ; reset x each row

  ; Compute color = 0x220000 + y * 0x0101
  LDI r8, 0
  ADD r8, r4         ; r8 = y
  LDI r9, 0x0101
  MUL r8, r9         ; r8 = y * 0x0101 (green + blue gradient)
  LDI r10, 0x220000
  OR r8, r10         ; r8 = 0x220000 + gradient = final color

x_loop:
  ; Check if (x & y) == 0
  LDI r2, 0
  ADD r2, r0         ; r2 = x
  AND r2, r4         ; r2 = x & y

  ; If r2 == 0, draw pixel
  JZ r2, draw_pixel
  JMP skip_pixel

draw_pixel:
  PSET r0, r4, r8

skip_pixel:
  ADD r0, r7         ; x++
  LDI r2, 0
  ADD r2, r0
  SUB r2, r1
  JZ r2, advance_y
  JMP x_loop

advance_y:
  ADD r4, r7         ; y++
  LDI r2, 0
  ADD r2, r4
  SUB r2, r1
  JZ r2, done
  JMP y_loop

done:
HALT
