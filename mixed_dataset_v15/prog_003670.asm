; DESCRIPTION: Renders a orange line between points (280, 163) and (89, 53).
; PLAN: r0=280(x1), r1=163(y1), r2=89(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 163
LDI r2, 89
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
