; DESCRIPTION: Draws a orange line from (85, 38) to (85, 194).
; PLAN: r0=85(x1), r1=38(y1), r2=85(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 38
LDI r2, 85
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
