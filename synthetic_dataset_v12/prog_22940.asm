; DESCRIPTION: Places a purple line segment connecting (368, 95) to (462, 8).
; PLAN: r0=368(x1), r1=95(y1), r2=462(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 95
LDI r2, 462
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
