; DESCRIPTION: Renders a orange line between points (112, 26) and (134, 94).
; PLAN: r0=112(x1), r1=26(y1), r2=134(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 26
LDI r2, 134
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
