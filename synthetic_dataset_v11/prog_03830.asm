; DESCRIPTION: Places a orange line segment connecting (170, 39) to (13, 45).
; PLAN: r0=170(x1), r1=39(y1), r2=13(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 39
LDI r2, 13
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
