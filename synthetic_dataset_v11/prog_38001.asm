; DESCRIPTION: Renders a orange line between points (80, 155) and (104, 184).
; PLAN: r0=80(x1), r1=155(y1), r2=104(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 155
LDI r2, 104
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
