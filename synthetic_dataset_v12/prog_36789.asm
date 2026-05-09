; DESCRIPTION: Places a yellow line segment connecting (339, 0) to (55, 202).
; PLAN: r0=339(x1), r1=0(y1), r2=55(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 0
LDI r2, 55
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
