; DESCRIPTION: Renders a orange line between points (37, 244) and (194, 129).
; PLAN: r0=37(x1), r1=244(y1), r2=194(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 244
LDI r2, 194
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
