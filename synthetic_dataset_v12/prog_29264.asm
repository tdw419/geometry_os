; DESCRIPTION: Draws a magenta line from (179, 142) to (84, 239).
; PLAN: r0=179(x1), r1=142(y1), r2=84(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 142
LDI r2, 84
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
