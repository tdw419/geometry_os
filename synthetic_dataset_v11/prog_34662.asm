; DESCRIPTION: Places a purple line segment connecting (48, 119) to (55, 194).
; PLAN: r0=48(x1), r1=119(y1), r2=55(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 119
LDI r2, 55
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
