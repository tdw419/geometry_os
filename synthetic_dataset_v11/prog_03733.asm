; DESCRIPTION: Places a purple line segment connecting (43, 158) to (233, 63).
; PLAN: r0=43(x1), r1=158(y1), r2=233(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 158
LDI r2, 233
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
