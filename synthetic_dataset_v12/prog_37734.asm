; DESCRIPTION: Draws a purple line from (37, 40) to (292, 114).
; PLAN: r0=37(x1), r1=40(y1), r2=292(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 40
LDI r2, 292
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
