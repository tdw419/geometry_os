; DESCRIPTION: Places a yellow line segment connecting (22, 123) to (40, 26).
; PLAN: r0=22(x1), r1=123(y1), r2=40(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 123
LDI r2, 40
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
