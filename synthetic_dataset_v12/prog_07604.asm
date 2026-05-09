; DESCRIPTION: Draws a orange line from (314, 185) to (382, 181).
; PLAN: r0=314(x1), r1=185(y1), r2=382(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 185
LDI r2, 382
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
