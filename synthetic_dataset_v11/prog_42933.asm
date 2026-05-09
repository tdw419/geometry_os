; DESCRIPTION: Renders a orange line between points (241, 246) and (205, 149).
; PLAN: r0=241(x1), r1=246(y1), r2=205(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 246
LDI r2, 205
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
