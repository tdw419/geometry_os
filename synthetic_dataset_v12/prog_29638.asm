; DESCRIPTION: Places a green line segment connecting (58, 163) to (283, 31).
; PLAN: r0=58(x1), r1=163(y1), r2=283(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 163
LDI r2, 283
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
