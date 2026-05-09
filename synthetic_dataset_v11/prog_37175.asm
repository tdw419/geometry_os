; DESCRIPTION: Places a white line segment connecting (232, 76) to (134, 191).
; PLAN: r0=232(x1), r1=76(y1), r2=134(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 76
LDI r2, 134
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
