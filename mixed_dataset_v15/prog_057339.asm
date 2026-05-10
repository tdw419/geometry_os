; DESCRIPTION: Draws a purple line from (68, 136) to (130, 190).
; PLAN: r0=68(x1), r1=136(y1), r2=130(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 136
LDI r2, 130
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
