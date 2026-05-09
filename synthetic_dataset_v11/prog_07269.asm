; DESCRIPTION: Renders a orange line between points (233, 86) and (85, 99).
; PLAN: r0=233(x1), r1=86(y1), r2=85(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 86
LDI r2, 85
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
