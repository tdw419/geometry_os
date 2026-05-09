; DESCRIPTION: Places a orange line segment connecting (94, 131) to (280, 39).
; PLAN: r0=94(x1), r1=131(y1), r2=280(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 131
LDI r2, 280
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
