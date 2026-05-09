; DESCRIPTION: Places a purple line segment connecting (2, 40) to (162, 54).
; PLAN: r0=2(x1), r1=40(y1), r2=162(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 40
LDI r2, 162
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
