; DESCRIPTION: Draws a orange line from (85, 227) to (81, 1).
; PLAN: r0=85(x1), r1=227(y1), r2=81(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 227
LDI r2, 81
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
