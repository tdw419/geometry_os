; DESCRIPTION: Places a yellow line segment connecting (190, 9) to (102, 232).
; PLAN: r0=190(x1), r1=9(y1), r2=102(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 9
LDI r2, 102
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
