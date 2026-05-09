; DESCRIPTION: Places a orange line segment connecting (469, 14) to (13, 134).
; PLAN: r0=469(x1), r1=14(y1), r2=13(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 14
LDI r2, 13
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
