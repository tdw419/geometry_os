; DESCRIPTION: Renders a orange line between points (505, 6) and (157, 116).
; PLAN: r0=505(x1), r1=6(y1), r2=157(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 6
LDI r2, 157
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
