; DESCRIPTION: Places a orange line segment connecting (182, 28) to (54, 157).
; PLAN: r0=182(x1), r1=28(y1), r2=54(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 28
LDI r2, 54
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
