; DESCRIPTION: Places a yellow line segment connecting (99, 157) to (85, 254).
; PLAN: r0=99(x1), r1=157(y1), r2=85(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 157
LDI r2, 85
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
