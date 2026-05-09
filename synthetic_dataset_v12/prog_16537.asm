; DESCRIPTION: Places a orange line segment connecting (164, 61) to (378, 35).
; PLAN: r0=164(x1), r1=61(y1), r2=378(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 61
LDI r2, 378
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
