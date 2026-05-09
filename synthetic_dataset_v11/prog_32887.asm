; DESCRIPTION: Places a orange line segment connecting (45, 26) to (129, 187).
; PLAN: r0=45(x1), r1=26(y1), r2=129(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 26
LDI r2, 129
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
