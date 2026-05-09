; DESCRIPTION: Draws a purple line from (33, 34) to (375, 67).
; PLAN: r0=33(x1), r1=34(y1), r2=375(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 34
LDI r2, 375
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
