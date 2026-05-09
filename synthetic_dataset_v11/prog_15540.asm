; DESCRIPTION: Places a white line segment connecting (49, 143) to (28, 105).
; PLAN: r0=49(x1), r1=143(y1), r2=28(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 143
LDI r2, 28
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
