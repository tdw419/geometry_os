; DESCRIPTION: Places a black line segment connecting (423, 123) to (472, 97).
; PLAN: r0=423(x1), r1=123(y1), r2=472(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 123
LDI r2, 472
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
