; DESCRIPTION: Places a orange line segment connecting (205, 233) to (61, 241).
; PLAN: r0=205(x1), r1=233(y1), r2=61(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 233
LDI r2, 61
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
