; DESCRIPTION: Renders a orange line between points (75, 183) and (478, 180).
; PLAN: r0=75(x1), r1=183(y1), r2=478(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 183
LDI r2, 478
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
