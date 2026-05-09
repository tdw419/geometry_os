; DESCRIPTION: Renders a orange line between points (24, 25) and (200, 194).
; PLAN: r0=24(x1), r1=25(y1), r2=200(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 25
LDI r2, 200
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
