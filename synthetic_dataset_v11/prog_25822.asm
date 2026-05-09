; DESCRIPTION: Places a orange line segment connecting (108, 61) to (19, 1).
; PLAN: r0=108(x1), r1=61(y1), r2=19(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 61
LDI r2, 19
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
