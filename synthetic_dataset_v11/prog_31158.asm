; DESCRIPTION: Places a yellow line segment connecting (133, 0) to (17, 36).
; PLAN: r0=133(x1), r1=0(y1), r2=17(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 0
LDI r2, 17
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
