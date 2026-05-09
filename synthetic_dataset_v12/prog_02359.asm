; DESCRIPTION: Places a orange line segment connecting (400, 84) to (86, 38).
; PLAN: r0=400(x1), r1=84(y1), r2=86(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 84
LDI r2, 86
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
