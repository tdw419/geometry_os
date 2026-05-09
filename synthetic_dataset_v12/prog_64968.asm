; DESCRIPTION: Draws a purple line from (353, 83) to (101, 189).
; PLAN: r0=353(x1), r1=83(y1), r2=101(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 83
LDI r2, 101
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
