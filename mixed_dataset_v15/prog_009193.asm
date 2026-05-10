; DESCRIPTION: Places a green line segment connecting (457, 0) to (109, 36).
; PLAN: r0=457(x1), r1=0(y1), r2=109(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 0
LDI r2, 109
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
