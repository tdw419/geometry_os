; DESCRIPTION: Places a yellow line segment connecting (218, 101) to (163, 99).
; PLAN: r0=218(x1), r1=101(y1), r2=163(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 101
LDI r2, 163
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
