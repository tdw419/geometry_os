; DESCRIPTION: Renders a orange line between points (381, 139) and (140, 189).
; PLAN: r0=381(x1), r1=139(y1), r2=140(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 139
LDI r2, 140
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
