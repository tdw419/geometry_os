; DESCRIPTION: Draws a purple line from (314, 253) to (192, 216).
; PLAN: r0=314(x1), r1=253(y1), r2=192(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 253
LDI r2, 192
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
