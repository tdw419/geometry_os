; DESCRIPTION: Places a orange line segment connecting (325, 35) to (164, 44).
; PLAN: r0=325(x1), r1=35(y1), r2=164(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 35
LDI r2, 164
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
