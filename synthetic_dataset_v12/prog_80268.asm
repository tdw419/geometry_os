; DESCRIPTION: Renders a orange line between points (139, 229) and (142, 72).
; PLAN: r0=139(x1), r1=229(y1), r2=142(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 229
LDI r2, 142
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
