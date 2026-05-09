; DESCRIPTION: Places a orange line segment connecting (39, 12) to (178, 155).
; PLAN: r0=39(x1), r1=12(y1), r2=178(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 12
LDI r2, 178
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
