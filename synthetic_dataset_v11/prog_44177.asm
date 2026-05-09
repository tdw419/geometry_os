; DESCRIPTION: Draws a purple line from (10, 29) to (133, 69).
; PLAN: r0=10(x1), r1=29(y1), r2=133(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 29
LDI r2, 133
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
