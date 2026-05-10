; DESCRIPTION: Places a orange line segment connecting (496, 15) to (434, 201).
; PLAN: r0=496(x1), r1=15(y1), r2=434(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 15
LDI r2, 434
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
