; DESCRIPTION: Places a yellow line segment connecting (76, 200) to (58, 118).
; PLAN: r0=76(x1), r1=200(y1), r2=58(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 200
LDI r2, 58
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
