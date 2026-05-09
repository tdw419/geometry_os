; DESCRIPTION: Places a orange line segment connecting (199, 32) to (78, 29).
; PLAN: r0=199(x1), r1=32(y1), r2=78(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 32
LDI r2, 78
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
