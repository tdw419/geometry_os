; DESCRIPTION: Renders a orange line between points (204, 1) and (2, 233).
; PLAN: r0=204(x1), r1=1(y1), r2=2(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 1
LDI r2, 2
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
