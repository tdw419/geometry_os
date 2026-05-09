; DESCRIPTION: Places a white line segment connecting (49, 48) to (78, 138).
; PLAN: r0=49(x1), r1=48(y1), r2=78(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 48
LDI r2, 78
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
