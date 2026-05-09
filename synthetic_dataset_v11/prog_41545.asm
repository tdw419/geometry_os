; DESCRIPTION: Renders a purple line between points (83, 119) and (43, 101).
; PLAN: r0=83(x1), r1=119(y1), r2=43(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 119
LDI r2, 43
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
