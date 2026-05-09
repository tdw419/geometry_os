; DESCRIPTION: Places a orange line segment connecting (384, 94) to (335, 205).
; PLAN: r0=384(x1), r1=94(y1), r2=335(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 94
LDI r2, 335
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
