; DESCRIPTION: Places a orange line segment connecting (45, 5) to (159, 81).
; PLAN: r0=45(x1), r1=5(y1), r2=159(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 5
LDI r2, 159
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
