; DESCRIPTION: Renders a orange line between points (179, 163) and (34, 227).
; PLAN: r0=179(x1), r1=163(y1), r2=34(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 163
LDI r2, 34
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
