; DESCRIPTION: Places a yellow line segment connecting (250, 22) to (114, 102).
; PLAN: r0=250(x1), r1=22(y1), r2=114(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 22
LDI r2, 114
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
