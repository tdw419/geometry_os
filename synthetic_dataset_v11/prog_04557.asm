; DESCRIPTION: Places a yellow line segment connecting (68, 22) to (3, 199).
; PLAN: r0=68(x1), r1=22(y1), r2=3(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 22
LDI r2, 3
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
