; DESCRIPTION: Places a yellow line segment connecting (202, 251) to (62, 162).
; PLAN: r0=202(x1), r1=251(y1), r2=62(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 251
LDI r2, 62
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
