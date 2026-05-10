; DESCRIPTION: Renders a orange line segment connecting (79, 138) to (238, 3).
; PLAN: r0=79(x1), r1=138(y1), r2=238(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 138
LDI r2, 238
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
