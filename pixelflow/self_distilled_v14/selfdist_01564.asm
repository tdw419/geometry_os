; DESCRIPTION: Renders a orange line segment connecting (361, 159) to (7, 89).
; PLAN: r0=361(x1), r1=159(y1), r2=7(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 159
LDI r2, 7
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
