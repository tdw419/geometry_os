; DESCRIPTION: Renders a orange line between points (311, 10) and (425, 104).
; PLAN: r0=311(x1), r1=10(y1), r2=425(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 10
LDI r2, 425
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
