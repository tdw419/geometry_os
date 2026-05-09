; DESCRIPTION: Places a orange line segment connecting (117, 68) to (230, 105).
; PLAN: r0=117(x1), r1=68(y1), r2=230(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 68
LDI r2, 230
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
