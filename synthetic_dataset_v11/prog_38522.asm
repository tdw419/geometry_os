; DESCRIPTION: Places a purple line segment connecting (100, 81) to (134, 148).
; PLAN: r0=100(x1), r1=81(y1), r2=134(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 81
LDI r2, 134
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
