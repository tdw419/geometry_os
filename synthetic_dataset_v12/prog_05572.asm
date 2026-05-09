; DESCRIPTION: Places a orange line segment connecting (495, 134) to (59, 74).
; PLAN: r0=495(x1), r1=134(y1), r2=59(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 134
LDI r2, 59
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
