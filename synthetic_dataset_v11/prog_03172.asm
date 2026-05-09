; DESCRIPTION: Renders a purple line between points (86, 62) and (31, 49).
; PLAN: r0=86(x1), r1=62(y1), r2=31(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 62
LDI r2, 31
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
