; DESCRIPTION: Renders a orange line between points (261, 138) and (110, 199).
; PLAN: r0=261(x1), r1=138(y1), r2=110(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 138
LDI r2, 110
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
