; DESCRIPTION: Places a orange line segment connecting (422, 179) to (356, 105).
; PLAN: r0=422(x1), r1=179(y1), r2=356(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 179
LDI r2, 356
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
