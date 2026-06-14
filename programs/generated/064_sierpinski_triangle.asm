; SIERPINSKI TRIANGLE -- fractal triangle via bitwise AND
; Pixel (x, y) is drawn if (x AND y) == 0
; Creates a self-similar triangle pattern in green

LDI r0, 0            ; r0 = y
LDI r2, 256          ; r2 = screen limit
LDI r1, 1            ; r1 = increment
LDI r10, 0x00FF00    ; r10 = green color

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  ; Test if (x AND y) == 0
  LDI r5, 0
  ADD r5, r4         ; r5 = x
  AND r5, r0         ; r5 = x AND y
  JZ r5, draw_pixel
  JMP skip_pixel

draw_pixel:
  PSET r4, r0, r10

skip_pixel:
  ; x++
  LDI r7, 1
  ADD r4, r7
  ; if x == 256, next row
  LDI r5, 0
  ADD r5, r4
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ; y++
  ADD r0, r1
  ; if y == 256, done
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
