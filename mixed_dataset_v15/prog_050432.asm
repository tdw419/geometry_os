; DESCRIPTION: Places a orange line segment connecting (464, 21) to (477, 110).
; PLAN: r0=464(x1), r1=21(y1), r2=477(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 21
LDI r2, 477
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
