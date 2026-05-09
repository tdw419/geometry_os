; DESCRIPTION: Places a orange line segment connecting (508, 132) to (420, 193).
; PLAN: r0=508(x1), r1=132(y1), r2=420(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 132
LDI r2, 420
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
