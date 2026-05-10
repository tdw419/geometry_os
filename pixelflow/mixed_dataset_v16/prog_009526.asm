; DESCRIPTION: Renders a orange line between points (240, 24) and (47, 119).
; PLAN: r0=240(x1), r1=24(y1), r2=47(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 24
LDI r2, 47
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
