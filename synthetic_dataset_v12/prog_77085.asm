; DESCRIPTION: Places a yellow line segment connecting (336, 163) to (109, 0).
; PLAN: r0=336(x1), r1=163(y1), r2=109(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 163
LDI r2, 109
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
