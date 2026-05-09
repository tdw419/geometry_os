; DESCRIPTION: Draws a purple line from (473, 184) to (297, 34).
; PLAN: r0=473(x1), r1=184(y1), r2=297(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 184
LDI r2, 297
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
