; DESCRIPTION: Places a white line segment connecting (61, 105) to (472, 67).
; PLAN: r0=61(x1), r1=105(y1), r2=472(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 105
LDI r2, 472
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
