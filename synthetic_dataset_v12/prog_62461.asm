; DESCRIPTION: Draws a blue line from (375, 203) to (484, 114).
; PLAN: r0=375(x1), r1=203(y1), r2=484(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 203
LDI r2, 484
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
