; DESCRIPTION: Draws a purple line from (125, 70) to (88, 67).
; PLAN: r0=125(x1), r1=70(y1), r2=88(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 70
LDI r2, 88
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
