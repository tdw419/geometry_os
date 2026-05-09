; DESCRIPTION: Places a yellow line segment connecting (18, 123) to (139, 50).
; PLAN: r0=18(x1), r1=123(y1), r2=139(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 123
LDI r2, 139
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
