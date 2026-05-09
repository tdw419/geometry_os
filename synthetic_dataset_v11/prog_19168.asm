; DESCRIPTION: Draws a purple line from (140, 158) to (36, 225).
; PLAN: r0=140(x1), r1=158(y1), r2=36(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 158
LDI r2, 36
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
