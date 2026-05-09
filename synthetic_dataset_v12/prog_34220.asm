; DESCRIPTION: Renders a orange line between points (145, 35) and (140, 20).
; PLAN: r0=145(x1), r1=35(y1), r2=140(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 35
LDI r2, 140
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
