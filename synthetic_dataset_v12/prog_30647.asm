; DESCRIPTION: Draws a purple line from (139, 204) to (192, 99).
; PLAN: r0=139(x1), r1=204(y1), r2=192(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 204
LDI r2, 192
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
