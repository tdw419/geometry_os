; DESCRIPTION: Renders a orange line between points (14, 109) and (38, 153).
; PLAN: r0=14(x1), r1=109(y1), r2=38(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 109
LDI r2, 38
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
