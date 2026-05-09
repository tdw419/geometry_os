; DESCRIPTION: Places a yellow line segment connecting (463, 104) to (163, 44).
; PLAN: r0=463(x1), r1=104(y1), r2=163(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 104
LDI r2, 163
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
