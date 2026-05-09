; DESCRIPTION: Renders a orange line between points (38, 76) and (35, 87).
; PLAN: r0=38(x1), r1=76(y1), r2=35(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 76
LDI r2, 35
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
