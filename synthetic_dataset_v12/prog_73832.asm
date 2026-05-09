; DESCRIPTION: Draws a purple line from (15, 106) to (204, 248).
; PLAN: r0=15(x1), r1=106(y1), r2=204(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 106
LDI r2, 204
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
