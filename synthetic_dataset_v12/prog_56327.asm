; DESCRIPTION: Renders a orange line between points (357, 171) and (93, 207).
; PLAN: r0=357(x1), r1=171(y1), r2=93(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 171
LDI r2, 93
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
