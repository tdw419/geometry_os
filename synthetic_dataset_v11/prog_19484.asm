; DESCRIPTION: Places a purple line segment connecting (246, 162) to (30, 155).
; PLAN: r0=246(x1), r1=162(y1), r2=30(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 162
LDI r2, 30
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
