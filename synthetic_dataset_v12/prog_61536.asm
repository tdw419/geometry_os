; DESCRIPTION: Renders a orange line between points (102, 110) and (244, 166).
; PLAN: r0=102(x1), r1=110(y1), r2=244(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 110
LDI r2, 244
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
