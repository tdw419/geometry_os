; DESCRIPTION: Renders a orange line between points (65, 68) and (309, 61).
; PLAN: r0=65(x1), r1=68(y1), r2=309(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 68
LDI r2, 309
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
