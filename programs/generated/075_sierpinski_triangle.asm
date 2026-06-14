; SIERPINSKI TRIANGLE -- Draw Sierpinski triangle using bitwise AND rule
; A pixel at (x, y) is drawn if (x AND y) == 0
; This produces the classic Sierpinski gasket pattern
; Color: cyan (0x00FFFF) on black background

LDI r0, 0            ; r0 = y
LDI r2, 256          ; r2 = limit
LDI r3, 0x00FFFF     ; r3 = cyan color
LDI r4, 1            ; r4 = increment

y_loop:
  LDI r1, 0          ; r1 = x (reset each row)

x_loop:
  ; Check if (x AND y) == 0
  LDI r5, 0
  ADD r5, r1         ; r5 = x
  AND r5, r0         ; r5 = x & y

  ; If result is zero, draw the pixel
  JNZ r5, skip
  PSET r1, r0, r3

skip:
  ; x++
  ADD r1, r4
  ; If x == 256, next row
  LDI r5, 0
  ADD r5, r1
  SUB r5, r2
  JZ r5, next_y
  JMP x_loop

next_y:
  ; y++
  ADD r0, r4
  ; If y == 256, done
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JZ r5, done
  JMP y_loop

done:
HALT
