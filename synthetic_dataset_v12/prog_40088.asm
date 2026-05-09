; DESCRIPTION: Places a white line segment connecting (67, 245) to (40, 129).
; PLAN: r0=67(x1), r1=245(y1), r2=40(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 245
LDI r2, 40
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
