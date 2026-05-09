; DESCRIPTION: Draws a purple line from (119, 138) to (40, 122).
; PLAN: r0=119(x1), r1=138(y1), r2=40(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 138
LDI r2, 40
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
