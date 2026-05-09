; DESCRIPTION: Draws a purple line from (74, 216) to (200, 245).
; PLAN: r0=74(x1), r1=216(y1), r2=200(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 216
LDI r2, 200
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
