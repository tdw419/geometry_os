; DESCRIPTION: Places a white line segment connecting (495, 43) to (133, 11).
; PLAN: r0=495(x1), r1=43(y1), r2=133(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 43
LDI r2, 133
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
