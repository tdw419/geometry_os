; DESCRIPTION: Renders a orange line between points (221, 92) and (107, 88).
; PLAN: r0=221(x1), r1=92(y1), r2=107(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 92
LDI r2, 107
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
