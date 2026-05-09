; DESCRIPTION: Places a purple line segment connecting (102, 91) to (104, 184).
; PLAN: r0=102(x1), r1=91(y1), r2=104(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 91
LDI r2, 104
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
