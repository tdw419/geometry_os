; DESCRIPTION: Places a orange line segment connecting (207, 60) to (142, 81).
; PLAN: r0=207(x1), r1=60(y1), r2=142(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 60
LDI r2, 142
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
