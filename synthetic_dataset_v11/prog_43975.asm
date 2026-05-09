; DESCRIPTION: Renders a orange line between points (169, 199) and (191, 2).
; PLAN: r0=169(x1), r1=199(y1), r2=191(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 199
LDI r2, 191
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
