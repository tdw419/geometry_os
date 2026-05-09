; DESCRIPTION: Places a orange line segment connecting (385, 13) to (8, 3).
; PLAN: r0=385(x1), r1=13(y1), r2=8(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 13
LDI r2, 8
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
