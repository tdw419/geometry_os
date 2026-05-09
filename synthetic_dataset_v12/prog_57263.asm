; DESCRIPTION: Places a orange line segment connecting (442, 246) to (59, 9).
; PLAN: r0=442(x1), r1=246(y1), r2=59(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 246
LDI r2, 59
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
