; DESCRIPTION: Renders a orange line between points (149, 9) and (69, 116).
; PLAN: r0=149(x1), r1=9(y1), r2=69(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 9
LDI r2, 69
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
