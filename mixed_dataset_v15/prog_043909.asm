; DESCRIPTION: Places a orange line segment connecting (119, 174) to (238, 96).
; PLAN: r0=119(x1), r1=174(y1), r2=238(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 174
LDI r2, 238
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
