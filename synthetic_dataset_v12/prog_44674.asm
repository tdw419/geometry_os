; DESCRIPTION: Places a orange line segment connecting (13, 109) to (400, 238).
; PLAN: r0=13(x1), r1=109(y1), r2=400(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 109
LDI r2, 400
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
