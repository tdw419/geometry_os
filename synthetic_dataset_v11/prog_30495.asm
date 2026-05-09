; DESCRIPTION: Places a orange line segment connecting (28, 0) to (143, 38).
; PLAN: r0=28(x1), r1=0(y1), r2=143(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 0
LDI r2, 143
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
