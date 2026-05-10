; DESCRIPTION: Places a blue line segment connecting (314, 25) to (461, 203).
; PLAN: r0=314(x1), r1=25(y1), r2=461(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 25
LDI r2, 461
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
