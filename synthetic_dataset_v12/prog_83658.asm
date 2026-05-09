; DESCRIPTION: Places a orange line segment connecting (285, 7) to (174, 135).
; PLAN: r0=285(x1), r1=7(y1), r2=174(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 7
LDI r2, 174
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
