; SIERPINSKI TRIANGLE -- using bitwise AND pixel method
; A pixel (x, y) is drawn if (x & y) == 0
; This produces the classic Sierpinski triangle fractal
; Color: teal/cyan (0x00DDDD)

LDI r0, 0            ; r0 = x
LDI r1, 256          ; r1 = limit
LDI r7, 1            ; r7 = increment
LDI r8, 0x00DDDD     ; r8 = color (teal)
LDI r4, 0            ; r4 = y

y_loop:
  LDI r0, 0          ; reset x each row

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
  ; x++
  ADD r0, r7
  ; Check if x == 256
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
