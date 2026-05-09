; DESCRIPTION: Renders a orange line between points (376, 220) and (139, 179).
; PLAN: r0=376(x1), r1=220(y1), r2=139(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 220
LDI r2, 139
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
