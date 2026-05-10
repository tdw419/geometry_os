; DESCRIPTION: Renders a orange line between points (200, 56) and (140, 139).
; PLAN: r0=200(x1), r1=56(y1), r2=140(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 56
LDI r2, 140
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
