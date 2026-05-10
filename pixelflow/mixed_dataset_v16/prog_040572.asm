; DESCRIPTION: Draws a magenta line from (457, 10) to (440, 239).
; PLAN: r0=457(x1), r1=10(y1), r2=440(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 10
LDI r2, 440
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
