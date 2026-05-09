; DESCRIPTION: Places a yellow line segment connecting (139, 54) to (219, 123).
; PLAN: r0=139(x1), r1=54(y1), r2=219(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 54
LDI r2, 219
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
