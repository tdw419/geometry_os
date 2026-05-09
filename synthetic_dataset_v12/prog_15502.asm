; DESCRIPTION: Renders a purple line between points (158, 170) and (8, 62).
; PLAN: r0=158(x1), r1=170(y1), r2=8(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 170
LDI r2, 8
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
