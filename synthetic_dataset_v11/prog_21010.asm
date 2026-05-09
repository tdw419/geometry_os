; DESCRIPTION: Renders a orange line between points (125, 0) and (186, 96).
; PLAN: r0=125(x1), r1=0(y1), r2=186(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 0
LDI r2, 186
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
