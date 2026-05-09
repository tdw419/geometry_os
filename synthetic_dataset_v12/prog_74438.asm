; DESCRIPTION: Places a orange line segment connecting (293, 117) to (406, 61).
; PLAN: r0=293(x1), r1=117(y1), r2=406(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 117
LDI r2, 406
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
