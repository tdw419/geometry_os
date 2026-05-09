; DESCRIPTION: Renders a purple line between points (115, 232) and (471, 158).
; PLAN: r0=115(x1), r1=232(y1), r2=471(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 232
LDI r2, 471
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
