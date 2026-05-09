; DESCRIPTION: Renders a orange line between points (309, 155) and (226, 183).
; PLAN: r0=309(x1), r1=155(y1), r2=226(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 155
LDI r2, 226
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
