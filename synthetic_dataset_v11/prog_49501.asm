; DESCRIPTION: Places a purple line segment connecting (110, 43) to (34, 196).
; PLAN: r0=110(x1), r1=43(y1), r2=34(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 43
LDI r2, 34
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
