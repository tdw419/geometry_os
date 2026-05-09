; DESCRIPTION: Draws a yellow line from (134, 92) to (498, 135).
; PLAN: r0=134(x1), r1=92(y1), r2=498(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 92
LDI r2, 498
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
