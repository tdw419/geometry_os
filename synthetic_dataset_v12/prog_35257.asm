; DESCRIPTION: Places a purple line segment connecting (315, 73) to (75, 62).
; PLAN: r0=315(x1), r1=73(y1), r2=75(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 73
LDI r2, 75
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
