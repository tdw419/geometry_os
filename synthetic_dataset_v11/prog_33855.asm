; DESCRIPTION: Places a orange line segment connecting (125, 207) to (124, 238).
; PLAN: r0=125(x1), r1=207(y1), r2=124(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 207
LDI r2, 124
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
