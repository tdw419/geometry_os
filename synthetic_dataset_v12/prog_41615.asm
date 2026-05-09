; DESCRIPTION: Draws a purple line from (296, 157) to (88, 133).
; PLAN: r0=296(x1), r1=157(y1), r2=88(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 157
LDI r2, 88
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
