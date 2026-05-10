; DESCRIPTION: Renders a orange line segment connecting (15, 73) to (55, 25).
; PLAN: r0=15(x1), r1=73(y1), r2=55(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 73
LDI r2, 55
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
