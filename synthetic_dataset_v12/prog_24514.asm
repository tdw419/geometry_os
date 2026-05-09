; DESCRIPTION: Draws a purple line from (194, 4) to (353, 186).
; PLAN: r0=194(x1), r1=4(y1), r2=353(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 4
LDI r2, 353
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
