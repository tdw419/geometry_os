; DESCRIPTION: Places a orange line segment connecting (451, 0) to (238, 196).
; PLAN: r0=451(x1), r1=0(y1), r2=238(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 0
LDI r2, 238
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
