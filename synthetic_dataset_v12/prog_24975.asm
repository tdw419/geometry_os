; DESCRIPTION: Places a orange line segment connecting (383, 3) to (449, 145).
; PLAN: r0=383(x1), r1=3(y1), r2=449(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 3
LDI r2, 449
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
