; DESCRIPTION: Places a orange line segment connecting (456, 60) to (141, 199).
; PLAN: r0=456(x1), r1=60(y1), r2=141(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 60
LDI r2, 141
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
