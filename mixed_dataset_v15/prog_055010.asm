; DESCRIPTION: Draws a magenta line from (389, 110) to (459, 155).
; PLAN: r0=389(x1), r1=110(y1), r2=459(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 110
LDI r2, 459
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
