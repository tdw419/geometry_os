; DESCRIPTION: Draws a yellow line from (88, 92) to (201, 116).
; PLAN: r0=88(x1), r1=92(y1), r2=201(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 92
LDI r2, 201
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
