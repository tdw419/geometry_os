; DESCRIPTION: Draws a orange line from (266, 136) to (29, 110).
; PLAN: r0=266(x1), r1=136(y1), r2=29(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 136
LDI r2, 29
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
