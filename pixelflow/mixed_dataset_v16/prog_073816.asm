; DESCRIPTION: Renders a orange line between points (321, 60) and (145, 4).
; PLAN: r0=321(x1), r1=60(y1), r2=145(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 60
LDI r2, 145
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
