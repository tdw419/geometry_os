; DESCRIPTION: Renders a orange line between points (82, 185) and (205, 254).
; PLAN: r0=82(x1), r1=185(y1), r2=205(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 185
LDI r2, 205
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
