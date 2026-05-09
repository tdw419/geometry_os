; DESCRIPTION: Places a orange line segment connecting (401, 40) to (444, 81).
; PLAN: r0=401(x1), r1=40(y1), r2=444(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 40
LDI r2, 444
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
