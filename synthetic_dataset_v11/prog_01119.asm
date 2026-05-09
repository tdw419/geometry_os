; DESCRIPTION: Places a yellow line segment connecting (129, 80) to (119, 58).
; PLAN: r0=129(x1), r1=80(y1), r2=119(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 80
LDI r2, 119
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
