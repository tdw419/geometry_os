; DESCRIPTION: Draws a blue line from (459, 246) to (85, 137).
; PLAN: r0=459(x1), r1=246(y1), r2=85(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 246
LDI r2, 85
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
