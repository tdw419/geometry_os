; DESCRIPTION: Places a orange line segment connecting (75, 254) to (9, 211).
; PLAN: r0=75(x1), r1=254(y1), r2=9(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 254
LDI r2, 9
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
