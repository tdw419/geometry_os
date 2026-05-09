; DESCRIPTION: Places a orange line segment connecting (35, 26) to (18, 38).
; PLAN: r0=35(x1), r1=26(y1), r2=18(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 26
LDI r2, 18
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
