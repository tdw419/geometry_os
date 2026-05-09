; DESCRIPTION: Draws a purple line from (155, 35) to (202, 248).
; PLAN: r0=155(x1), r1=35(y1), r2=202(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 35
LDI r2, 202
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
