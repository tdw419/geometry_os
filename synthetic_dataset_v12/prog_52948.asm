; DESCRIPTION: Places a purple line segment connecting (16, 121) to (134, 47).
; PLAN: r0=16(x1), r1=121(y1), r2=134(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 121
LDI r2, 134
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
