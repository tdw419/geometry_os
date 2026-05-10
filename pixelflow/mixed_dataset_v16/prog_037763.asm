; DESCRIPTION: Places a yellow line segment connecting (314, 58) to (388, 48).
; PLAN: r0=314(x1), r1=58(y1), r2=388(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 58
LDI r2, 388
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
