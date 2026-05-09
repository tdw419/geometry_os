; DESCRIPTION: Draws a orange line from (83, 56) to (383, 102).
; PLAN: r0=83(x1), r1=56(y1), r2=383(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 56
LDI r2, 383
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
