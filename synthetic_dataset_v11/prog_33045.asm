; DESCRIPTION: Places a purple line segment connecting (96, 23) to (29, 157).
; PLAN: r0=96(x1), r1=23(y1), r2=29(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 23
LDI r2, 29
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
