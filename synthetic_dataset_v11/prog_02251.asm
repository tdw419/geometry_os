; DESCRIPTION: Renders a orange line between points (139, 68) and (83, 127).
; PLAN: r0=139(x1), r1=68(y1), r2=83(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 68
LDI r2, 83
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
