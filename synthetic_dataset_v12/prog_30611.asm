; DESCRIPTION: Places a purple line segment connecting (278, 10) to (10, 0).
; PLAN: r0=278(x1), r1=10(y1), r2=10(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 10
LDI r2, 10
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
