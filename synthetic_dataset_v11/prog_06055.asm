; DESCRIPTION: Places a purple line segment connecting (3, 100) to (143, 47).
; PLAN: r0=3(x1), r1=100(y1), r2=143(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 100
LDI r2, 143
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
