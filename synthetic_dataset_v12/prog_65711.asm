; DESCRIPTION: Places a orange line segment connecting (219, 10) to (221, 26).
; PLAN: r0=219(x1), r1=10(y1), r2=221(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 10
LDI r2, 221
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
