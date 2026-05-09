; DESCRIPTION: Renders a orange line between points (15, 34) and (117, 24).
; PLAN: r0=15(x1), r1=34(y1), r2=117(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 34
LDI r2, 117
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
