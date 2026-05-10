; DESCRIPTION: Places a yellow line segment connecting (198, 88) to (212, 102).
; PLAN: r0=198(x1), r1=88(y1), r2=212(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 88
LDI r2, 212
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
