; DESCRIPTION: Places a white line segment connecting (67, 158) to (109, 245).
; PLAN: r0=67(x1), r1=158(y1), r2=109(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 158
LDI r2, 109
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
