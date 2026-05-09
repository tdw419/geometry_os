; DESCRIPTION: Renders a purple line between points (31, 156) and (89, 16).
; PLAN: r0=31(x1), r1=156(y1), r2=89(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 156
LDI r2, 89
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
