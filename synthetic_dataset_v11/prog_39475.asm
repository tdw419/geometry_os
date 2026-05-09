; DESCRIPTION: Renders a orange line between points (67, 55) and (51, 106).
; PLAN: r0=67(x1), r1=55(y1), r2=51(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 55
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
