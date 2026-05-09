; DESCRIPTION: Places a orange line segment connecting (214, 90) to (106, 102).
; PLAN: r0=214(x1), r1=90(y1), r2=106(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 90
LDI r2, 106
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
