; DESCRIPTION: Places a orange line segment connecting (234, 6) to (330, 131).
; PLAN: r0=234(x1), r1=6(y1), r2=330(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 6
LDI r2, 330
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
