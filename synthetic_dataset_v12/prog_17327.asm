; DESCRIPTION: Places a orange line segment connecting (498, 26) to (387, 100).
; PLAN: r0=498(x1), r1=26(y1), r2=387(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 26
LDI r2, 387
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
