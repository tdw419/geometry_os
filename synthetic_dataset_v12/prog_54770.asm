; DESCRIPTION: Places a orange line segment connecting (157, 6) to (471, 152).
; PLAN: r0=157(x1), r1=6(y1), r2=471(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 6
LDI r2, 471
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
