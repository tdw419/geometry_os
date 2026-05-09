; DESCRIPTION: Places a blue line segment connecting (24, 106) to (427, 34).
; PLAN: r0=24(x1), r1=106(y1), r2=427(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 106
LDI r2, 427
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
