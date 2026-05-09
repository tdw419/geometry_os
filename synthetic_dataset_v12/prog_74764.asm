; DESCRIPTION: Renders a orange line between points (194, 251) and (455, 43).
; PLAN: r0=194(x1), r1=251(y1), r2=455(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 251
LDI r2, 455
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
