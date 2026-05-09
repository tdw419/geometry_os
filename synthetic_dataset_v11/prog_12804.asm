; DESCRIPTION: Places a white line segment connecting (53, 224) to (25, 251).
; PLAN: r0=53(x1), r1=224(y1), r2=25(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 224
LDI r2, 25
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
