; DESCRIPTION: Renders a orange line between points (78, 71) and (169, 68).
; PLAN: r0=78(x1), r1=71(y1), r2=169(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 71
LDI r2, 169
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
