; DESCRIPTION: Places a orange line segment connecting (105, 188) to (318, 214).
; PLAN: r0=105(x1), r1=188(y1), r2=318(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 188
LDI r2, 318
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
