; DESCRIPTION: Renders a orange line between points (112, 20) and (194, 38).
; PLAN: r0=112(x1), r1=20(y1), r2=194(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 20
LDI r2, 194
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
