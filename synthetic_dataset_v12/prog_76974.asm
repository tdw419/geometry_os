; DESCRIPTION: Places a orange line segment connecting (139, 192) to (302, 217).
; PLAN: r0=139(x1), r1=192(y1), r2=302(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 192
LDI r2, 302
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
