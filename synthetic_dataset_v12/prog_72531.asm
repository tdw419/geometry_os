; DESCRIPTION: Places a orange line segment connecting (117, 57) to (324, 155).
; PLAN: r0=117(x1), r1=57(y1), r2=324(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 57
LDI r2, 324
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
