; DESCRIPTION: Places a orange line segment connecting (49, 3) to (399, 175).
; PLAN: r0=49(x1), r1=3(y1), r2=399(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 3
LDI r2, 399
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
