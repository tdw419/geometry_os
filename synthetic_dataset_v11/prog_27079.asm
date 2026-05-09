; DESCRIPTION: Places a purple line segment connecting (30, 77) to (30, 73).
; PLAN: r0=30(x1), r1=77(y1), r2=30(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 77
LDI r2, 30
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
