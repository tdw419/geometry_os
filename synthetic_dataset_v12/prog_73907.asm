; DESCRIPTION: Draws a purple line from (311, 233) to (194, 36).
; PLAN: r0=311(x1), r1=233(y1), r2=194(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 233
LDI r2, 194
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
