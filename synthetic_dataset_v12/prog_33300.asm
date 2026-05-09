; DESCRIPTION: Places a orange line segment connecting (101, 78) to (433, 86).
; PLAN: r0=101(x1), r1=78(y1), r2=433(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 78
LDI r2, 433
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
