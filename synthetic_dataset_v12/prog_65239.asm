; DESCRIPTION: Renders a orange line between points (211, 171) and (357, 95).
; PLAN: r0=211(x1), r1=171(y1), r2=357(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 171
LDI r2, 357
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
