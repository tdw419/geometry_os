; DESCRIPTION: Renders a orange line between points (70, 6) and (314, 212).
; PLAN: r0=70(x1), r1=6(y1), r2=314(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 6
LDI r2, 314
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
