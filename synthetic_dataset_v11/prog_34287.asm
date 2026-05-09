; DESCRIPTION: Renders a orange line between points (162, 82) and (21, 35).
; PLAN: r0=162(x1), r1=82(y1), r2=21(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 82
LDI r2, 21
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
