; DESCRIPTION: Places a yellow line segment connecting (259, 201) to (395, 1).
; PLAN: r0=259(x1), r1=201(y1), r2=395(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 201
LDI r2, 395
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
