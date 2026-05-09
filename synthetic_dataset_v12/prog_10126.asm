; DESCRIPTION: Places a green line segment connecting (457, 148) to (58, 4).
; PLAN: r0=457(x1), r1=148(y1), r2=58(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 148
LDI r2, 58
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
