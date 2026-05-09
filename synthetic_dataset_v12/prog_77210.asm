; DESCRIPTION: Places a yellow line segment connecting (506, 66) to (339, 165).
; PLAN: r0=506(x1), r1=66(y1), r2=339(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 66
LDI r2, 339
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
