; DESCRIPTION: Draws a purple line from (216, 246) to (232, 183).
; PLAN: r0=216(x1), r1=246(y1), r2=232(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 246
LDI r2, 232
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
