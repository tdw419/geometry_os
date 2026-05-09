; DESCRIPTION: Places a orange line segment connecting (193, 4) to (430, 234).
; PLAN: r0=193(x1), r1=4(y1), r2=430(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 4
LDI r2, 430
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
