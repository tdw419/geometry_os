; DESCRIPTION: Draws a yellow line from (258, 89) to (459, 92).
; PLAN: r0=258(x1), r1=89(y1), r2=459(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 89
LDI r2, 459
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
