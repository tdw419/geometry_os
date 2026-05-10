; DESCRIPTION: Places a orange line segment connecting (498, 54) to (508, 53).
; PLAN: r0=498(x1), r1=54(y1), r2=508(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 54
LDI r2, 508
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
