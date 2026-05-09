; DESCRIPTION: Places a yellow line segment connecting (163, 86) to (238, 233).
; PLAN: r0=163(x1), r1=86(y1), r2=238(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 86
LDI r2, 238
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
