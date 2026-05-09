; DESCRIPTION: Places a orange line segment connecting (100, 126) to (308, 129).
; PLAN: r0=100(x1), r1=126(y1), r2=308(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 126
LDI r2, 308
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
