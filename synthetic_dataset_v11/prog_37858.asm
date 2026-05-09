; DESCRIPTION: Renders a yellow line between points (194, 31) and (26, 10).
; PLAN: r0=194(x1), r1=31(y1), r2=26(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 31
LDI r2, 26
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
