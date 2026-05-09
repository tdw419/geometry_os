; DESCRIPTION: Places a orange line segment connecting (99, 233) to (218, 211).
; PLAN: r0=99(x1), r1=233(y1), r2=218(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 233
LDI r2, 218
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
