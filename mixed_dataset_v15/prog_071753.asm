; DESCRIPTION: Places a yellow line segment connecting (303, 92) to (227, 26).
; PLAN: r0=303(x1), r1=92(y1), r2=227(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 92
LDI r2, 227
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
