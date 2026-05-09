; DESCRIPTION: Draws a purple line from (54, 29) to (407, 53).
; PLAN: r0=54(x1), r1=29(y1), r2=407(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 29
LDI r2, 407
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
