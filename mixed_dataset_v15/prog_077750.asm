; DESCRIPTION: Renders a orange line between points (140, 199) and (378, 148).
; PLAN: r0=140(x1), r1=199(y1), r2=378(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 199
LDI r2, 378
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
