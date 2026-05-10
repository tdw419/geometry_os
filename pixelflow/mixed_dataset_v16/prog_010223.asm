; DESCRIPTION: Places a orange line segment connecting (169, 167) to (191, 90).
; PLAN: r0=169(x1), r1=167(y1), r2=191(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 167
LDI r2, 191
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
