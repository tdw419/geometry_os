; DESCRIPTION: Renders a orange line between points (30, 82) and (66, 9).
; PLAN: r0=30(x1), r1=82(y1), r2=66(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 82
LDI r2, 66
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
