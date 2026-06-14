; SIERPINSKI TRIANGLE -- Draw Sierpinski triangle using PSET
; Uses the bitwise trick: pixel (x,y) is in the triangle if (x & y) == 0
; Green triangles on black background, centered on screen

LDI r0, 0            ; r0 = y
LDI r2, 256          ; r2 = limit
LDI r1, 1            ; r1 = increment
LDI r10, 0x00FF44    ; r10 = green color
LDI r11, 0           ; r11 = black (unused, just background)

y_loop:
  LDI r3, 0          ; r3 = x

x_loop:
  ; Check if (x & y) == 0 for Sierpinski membership
  LDI r4, 0
  ADD r4, r3         ; r4 = x
  AND r4, r0         ; r4 = x & y
  JNZ r4, skip_pixel  ; if non-zero, skip (not in triangle)

  ; Draw green pixel
  PSET r3, r0, r10

skip_pixel:
  ADD r3, r1         ; x++
  ; Check if x == 256
  LDI r4, 0
  ADD r4, r3
  SUB r4, r2
  JZ r4, next_y
  JMP x_loop

next_y:
  ADD r0, r1         ; y++
  ; Check if y == 256
  LDI r4, 0
  ADD r4, r0
  SUB r4, r2
  JZ r4, done
  JMP y_loop

done:
HALT
