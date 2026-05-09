; DESCRIPTION: Places a yellow line segment connecting (308, 43) to (109, 123).
; PLAN: r0=308(x1), r1=43(y1), r2=109(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 43
LDI r2, 109
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
