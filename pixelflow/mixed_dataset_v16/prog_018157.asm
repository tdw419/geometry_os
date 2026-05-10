; DESCRIPTION: Places a yellow line segment connecting (99, 200) to (472, 185).
; PLAN: r0=99(x1), r1=200(y1), r2=472(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 200
LDI r2, 472
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
