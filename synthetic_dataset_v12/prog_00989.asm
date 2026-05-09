; DESCRIPTION: Places a white line segment connecting (119, 45) to (318, 67).
; PLAN: r0=119(x1), r1=45(y1), r2=318(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 45
LDI r2, 318
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
