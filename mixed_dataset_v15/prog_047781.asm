; DESCRIPTION: Places a yellow line segment connecting (109, 114) to (102, 1).
; PLAN: r0=109(x1), r1=114(y1), r2=102(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 114
LDI r2, 102
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
