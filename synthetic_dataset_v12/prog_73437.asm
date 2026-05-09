; DESCRIPTION: Draws a purple line from (246, 105) to (420, 62).
; PLAN: r0=246(x1), r1=105(y1), r2=420(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 105
LDI r2, 420
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
