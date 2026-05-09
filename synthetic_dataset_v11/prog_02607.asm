; DESCRIPTION: Places a orange line segment connecting (15, 55) to (86, 246).
; PLAN: r0=15(x1), r1=55(y1), r2=86(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 55
LDI r2, 86
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
