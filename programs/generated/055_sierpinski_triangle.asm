; SIERPINSKI TRIANGLE -- Using bitwise AND trick
; For each pixel (x, y), draw if (x AND y) == 0
; Produces the classic Sierpinski fractal pattern in cyan

LDI r0, 0            ; r0 = y
LDI r1, 1            ; r1 = increment
LDI r2, 256          ; r2 = limit
LDI r10, 0x00FFFF    ; r10 = cyan color

y_loop:
  LDI r4, 0          ; r4 = x

x_loop:
  ; Check if (x AND y) == 0
  LDI r6, 0
  ADD r6, r4          ; r6 = x copy
  LDI r7, 0
  ADD r7, r0          ; r7 = y copy
  AND r6, r7          ; r6 = x & y
  JNZ r6, skip        ; if nonzero, leave black

  ; Draw cyan pixel
  LDI r6, 0
  ADD r6, r10
  PSET r4, r0, r6

skip:
  ADD r4, r1          ; x++
  LDI r5, 0
  ADD r5, r4
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ADD r0, r1          ; y++
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
