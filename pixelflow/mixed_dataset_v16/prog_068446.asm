; DESCRIPTION: Draws a yellow line from (421, 92) to (110, 102).
; PLAN: r0=421(x1), r1=92(y1), r2=110(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 92
LDI r2, 110
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
