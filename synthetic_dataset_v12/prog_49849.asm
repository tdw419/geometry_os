; DESCRIPTION: Renders a orange line between points (435, 163) and (435, 94).
; PLAN: r0=435(x1), r1=163(y1), r2=435(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 163
LDI r2, 435
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
