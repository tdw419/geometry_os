; DESCRIPTION: Places a purple line segment connecting (30, 68) to (112, 84).
; PLAN: r0=30(x1), r1=68(y1), r2=112(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 68
LDI r2, 112
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
