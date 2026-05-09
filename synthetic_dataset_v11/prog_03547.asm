; DESCRIPTION: Draws a purple line from (122, 40) to (144, 158).
; PLAN: r0=122(x1), r1=40(y1), r2=144(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 40
LDI r2, 144
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
