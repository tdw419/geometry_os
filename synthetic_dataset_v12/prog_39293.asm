; DESCRIPTION: Places a orange line segment connecting (85, 113) to (380, 81).
; PLAN: r0=85(x1), r1=113(y1), r2=380(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 113
LDI r2, 380
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
