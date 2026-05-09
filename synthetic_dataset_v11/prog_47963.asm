; DESCRIPTION: Places a orange line segment connecting (19, 55) to (87, 159).
; PLAN: r0=19(x1), r1=55(y1), r2=87(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 55
LDI r2, 87
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
