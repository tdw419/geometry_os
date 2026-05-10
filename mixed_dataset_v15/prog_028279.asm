; DESCRIPTION: Renders a orange line between points (191, 85) and (77, 85).
; PLAN: r0=191(x1), r1=85(y1), r2=77(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 85
LDI r2, 77
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
