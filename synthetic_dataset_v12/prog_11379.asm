; DESCRIPTION: Places a orange line segment connecting (373, 176) to (14, 205).
; PLAN: r0=373(x1), r1=176(y1), r2=14(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 176
LDI r2, 14
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
