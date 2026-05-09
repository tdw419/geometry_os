; DESCRIPTION: Places a yellow line segment connecting (129, 148) to (102, 81).
; PLAN: r0=129(x1), r1=148(y1), r2=102(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 148
LDI r2, 102
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
