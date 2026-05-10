; DESCRIPTION: Draws a purple line from (141, 74) to (89, 205).
; PLAN: r0=141(x1), r1=74(y1), r2=89(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 74
LDI r2, 89
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
