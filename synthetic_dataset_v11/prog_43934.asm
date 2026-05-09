; DESCRIPTION: Places a orange line segment connecting (225, 251) to (219, 251).
; PLAN: r0=225(x1), r1=251(y1), r2=219(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 251
LDI r2, 219
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
