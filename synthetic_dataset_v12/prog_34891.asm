; DESCRIPTION: Renders a orange line between points (208, 104) and (125, 93).
; PLAN: r0=208(x1), r1=104(y1), r2=125(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 104
LDI r2, 125
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
