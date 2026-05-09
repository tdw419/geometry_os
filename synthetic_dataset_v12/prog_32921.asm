; DESCRIPTION: Renders a orange line between points (319, 148) and (80, 212).
; PLAN: r0=319(x1), r1=148(y1), r2=80(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 148
LDI r2, 80
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
