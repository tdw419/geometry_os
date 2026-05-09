; DESCRIPTION: Places a white line segment connecting (407, 121) to (134, 163).
; PLAN: r0=407(x1), r1=121(y1), r2=134(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 121
LDI r2, 134
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
