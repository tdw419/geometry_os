; DESCRIPTION: Places a orange line segment connecting (13, 94) to (39, 53).
; PLAN: r0=13(x1), r1=94(y1), r2=39(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 94
LDI r2, 39
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
