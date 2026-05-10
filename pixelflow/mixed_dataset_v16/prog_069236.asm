; DESCRIPTION: Renders a orange line between points (463, 105) and (195, 149).
; PLAN: r0=463(x1), r1=105(y1), r2=195(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 105
LDI r2, 195
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
