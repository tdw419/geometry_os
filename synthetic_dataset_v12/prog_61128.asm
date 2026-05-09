; DESCRIPTION: Places a orange line segment connecting (328, 72) to (37, 114).
; PLAN: r0=328(x1), r1=72(y1), r2=37(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 72
LDI r2, 37
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
