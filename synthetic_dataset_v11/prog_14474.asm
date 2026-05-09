; DESCRIPTION: Places a orange line segment connecting (43, 25) to (157, 28).
; PLAN: r0=43(x1), r1=25(y1), r2=157(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 25
LDI r2, 157
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
