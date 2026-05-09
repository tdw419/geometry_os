; DESCRIPTION: Places a yellow line segment connecting (163, 47) to (221, 168).
; PLAN: r0=163(x1), r1=47(y1), r2=221(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 47
LDI r2, 221
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
