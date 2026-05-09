; DESCRIPTION: Places a orange line segment connecting (171, 68) to (248, 129).
; PLAN: r0=171(x1), r1=68(y1), r2=248(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 68
LDI r2, 248
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
