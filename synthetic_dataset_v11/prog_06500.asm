; DESCRIPTION: Renders a orange line between points (89, 120) and (139, 27).
; PLAN: r0=89(x1), r1=120(y1), r2=139(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 120
LDI r2, 139
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
