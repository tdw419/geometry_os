; DESCRIPTION: Places a white line segment connecting (53, 24) to (71, 104).
; PLAN: r0=53(x1), r1=24(y1), r2=71(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 24
LDI r2, 71
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
