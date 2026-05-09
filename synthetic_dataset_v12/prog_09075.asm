; DESCRIPTION: Places a orange line segment connecting (440, 34) to (386, 116).
; PLAN: r0=440(x1), r1=34(y1), r2=386(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 34
LDI r2, 386
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
