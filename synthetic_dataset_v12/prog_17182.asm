; DESCRIPTION: Places a orange line segment connecting (302, 141) to (188, 140).
; PLAN: r0=302(x1), r1=141(y1), r2=188(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 141
LDI r2, 188
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
