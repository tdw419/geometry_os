; DESCRIPTION: Renders a orange line between points (19, 104) and (14, 82).
; PLAN: r0=19(x1), r1=104(y1), r2=14(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 104
LDI r2, 14
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
