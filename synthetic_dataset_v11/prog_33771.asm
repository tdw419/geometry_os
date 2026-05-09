; DESCRIPTION: Renders a purple line between points (192, 52) and (62, 11).
; PLAN: r0=192(x1), r1=52(y1), r2=62(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 52
LDI r2, 62
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
