; DESCRIPTION: Renders a purple line between points (107, 218) and (62, 45).
; PLAN: r0=107(x1), r1=218(y1), r2=62(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 218
LDI r2, 62
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
