; DESCRIPTION: Renders a orange line between points (252, 122) and (133, 199).
; PLAN: r0=252(x1), r1=122(y1), r2=133(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 122
LDI r2, 133
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
