; SIERPINSKI TRIANGLE -- Fractal pattern using the rule (x & y) == 0
; Each pixel (x, y) is drawn if the bitwise AND of x and y equals zero
; This produces the classic Sierpinski gasket pattern in green

LDI r0, 0            ; r0 = y counter
LDI r1, 1            ; increment
LDI r3, 256          ; limit
LDI r10, 0x00FF66    ; r10 = green color

y_loop:
  LDI r4, 0          ; r4 = x counter

x_loop:
  ; Check if (x & y) == 0
  LDI r5, 0
  ADD r5, r4         ; r5 = x
  AND r5, r0         ; r5 = x & y

  ; If (x & y) == 0, draw pixel
  JNZ r5, skip_pixel
  LDI r6, 0
  ADD r6, r10
  PSET r4, r0, r6

skip_pixel:
  ADD r4, r1          ; x++
  LDI r5, 0
  ADD r5, r4
  SUB r5, r3
  JZ r5, next_y
  JMP x_loop

next_y:
  ADD r0, r1          ; y++
  LDI r5, 0
  ADD r5, r0
  SUB r5, r3
  JZ r5, done
  JMP y_loop

done:
HALT
