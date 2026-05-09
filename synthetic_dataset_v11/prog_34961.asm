; DESCRIPTION: Places a orange line segment connecting (57, 104) to (73, 153).
; PLAN: r0=57(x1), r1=104(y1), r2=73(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 104
LDI r2, 73
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
