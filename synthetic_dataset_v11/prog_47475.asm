; DESCRIPTION: Places a orange line segment connecting (77, 76) to (229, 82).
; PLAN: r0=77(x1), r1=76(y1), r2=229(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 76
LDI r2, 229
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
