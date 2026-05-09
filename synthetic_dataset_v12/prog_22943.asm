; DESCRIPTION: Places a orange line segment connecting (117, 206) to (78, 199).
; PLAN: r0=117(x1), r1=206(y1), r2=78(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 206
LDI r2, 78
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
