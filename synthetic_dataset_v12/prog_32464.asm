; DESCRIPTION: Renders a orange line between points (212, 11) and (174, 212).
; PLAN: r0=212(x1), r1=11(y1), r2=174(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 11
LDI r2, 174
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
