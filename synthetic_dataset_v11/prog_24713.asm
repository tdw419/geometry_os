; DESCRIPTION: Draws a purple line from (67, 6) to (65, 121).
; PLAN: r0=67(x1), r1=6(y1), r2=65(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 6
LDI r2, 65
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
