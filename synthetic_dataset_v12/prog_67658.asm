; DESCRIPTION: Places a orange line segment connecting (400, 6) to (491, 172).
; PLAN: r0=400(x1), r1=6(y1), r2=491(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 6
LDI r2, 491
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
