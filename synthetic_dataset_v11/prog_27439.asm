; DESCRIPTION: Renders a orange line between points (134, 2) and (92, 59).
; PLAN: r0=134(x1), r1=2(y1), r2=92(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 2
LDI r2, 92
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
