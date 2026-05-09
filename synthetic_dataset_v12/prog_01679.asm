; DESCRIPTION: Places a orange line segment connecting (117, 193) to (342, 11).
; PLAN: r0=117(x1), r1=193(y1), r2=342(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 193
LDI r2, 342
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
