; DESCRIPTION: Places a orange line segment connecting (164, 108) to (101, 99).
; PLAN: r0=164(x1), r1=108(y1), r2=101(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 108
LDI r2, 101
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
