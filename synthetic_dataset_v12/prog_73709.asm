; DESCRIPTION: Draws a purple line from (497, 186) to (15, 130).
; PLAN: r0=497(x1), r1=186(y1), r2=15(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 186
LDI r2, 15
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
