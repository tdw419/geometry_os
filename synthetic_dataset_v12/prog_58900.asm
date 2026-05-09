; DESCRIPTION: Places a orange line segment connecting (378, 31) to (406, 24).
; PLAN: r0=378(x1), r1=31(y1), r2=406(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 31
LDI r2, 406
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
