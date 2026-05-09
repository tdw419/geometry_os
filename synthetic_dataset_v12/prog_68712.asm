; DESCRIPTION: Places a purple line segment connecting (96, 140) to (157, 2).
; PLAN: r0=96(x1), r1=140(y1), r2=157(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 140
LDI r2, 157
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
