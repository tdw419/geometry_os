; DESCRIPTION: Draws a orange line from (73, 136) to (318, 34).
; PLAN: r0=73(x1), r1=136(y1), r2=318(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 136
LDI r2, 318
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
