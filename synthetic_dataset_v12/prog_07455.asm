; DESCRIPTION: Places a purple line segment connecting (28, 11) to (360, 1).
; PLAN: r0=28(x1), r1=11(y1), r2=360(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 11
LDI r2, 360
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
