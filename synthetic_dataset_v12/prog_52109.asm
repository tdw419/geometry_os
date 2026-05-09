; DESCRIPTION: Renders a orange line between points (170, 199) and (324, 69).
; PLAN: r0=170(x1), r1=199(y1), r2=324(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 199
LDI r2, 324
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
