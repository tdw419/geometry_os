; DESCRIPTION: Draws a orange line from (20, 100) to (12, 223).
; PLAN: r0=20(x1), r1=100(y1), r2=12(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 100
LDI r2, 12
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
