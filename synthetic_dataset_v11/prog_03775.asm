; DESCRIPTION: Places a orange line segment connecting (73, 40) to (67, 248).
; PLAN: r0=73(x1), r1=40(y1), r2=67(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 40
LDI r2, 67
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
