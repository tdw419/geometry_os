; DESCRIPTION: Places a orange line segment connecting (15, 254) to (75, 193).
; PLAN: r0=15(x1), r1=254(y1), r2=75(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 254
LDI r2, 75
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
