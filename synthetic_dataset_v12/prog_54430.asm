; DESCRIPTION: Places a yellow line segment connecting (364, 123) to (308, 123).
; PLAN: r0=364(x1), r1=123(y1), r2=308(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 123
LDI r2, 308
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
