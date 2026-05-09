; DESCRIPTION: Renders a orange line between points (40, 124) and (244, 45).
; PLAN: r0=40(x1), r1=124(y1), r2=244(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 124
LDI r2, 244
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
