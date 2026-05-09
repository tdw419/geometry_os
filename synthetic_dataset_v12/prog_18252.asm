; DESCRIPTION: Renders a orange line between points (125, 155) and (486, 157).
; PLAN: r0=125(x1), r1=155(y1), r2=486(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 155
LDI r2, 486
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
