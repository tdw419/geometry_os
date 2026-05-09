; DESCRIPTION: Places a white line segment connecting (49, 222) to (88, 233).
; PLAN: r0=49(x1), r1=222(y1), r2=88(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 222
LDI r2, 88
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
