; DESCRIPTION: Places a yellow line segment connecting (31, 163) to (142, 67).
; PLAN: r0=31(x1), r1=163(y1), r2=142(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 163
LDI r2, 142
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
