; DESCRIPTION: Renders a orange line between points (133, 247) and (104, 133).
; PLAN: r0=133(x1), r1=247(y1), r2=104(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 247
LDI r2, 104
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
