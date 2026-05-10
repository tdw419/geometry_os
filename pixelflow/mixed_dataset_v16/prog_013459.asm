; DESCRIPTION: Renders a orange line between points (427, 49) and (92, 56).
; PLAN: r0=427(x1), r1=49(y1), r2=92(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 49
LDI r2, 92
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
