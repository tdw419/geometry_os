; DESCRIPTION: Places a purple line segment connecting (88, 22) to (208, 3).
; PLAN: r0=88(x1), r1=22(y1), r2=208(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 22
LDI r2, 208
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
