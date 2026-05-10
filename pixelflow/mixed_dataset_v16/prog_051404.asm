; DESCRIPTION: Places a purple line segment connecting (89, 167) to (421, 8).
; PLAN: r0=89(x1), r1=167(y1), r2=421(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 167
LDI r2, 421
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
