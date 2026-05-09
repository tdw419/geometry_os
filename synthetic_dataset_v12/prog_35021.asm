; DESCRIPTION: Places a white line segment connecting (303, 211) to (67, 64).
; PLAN: r0=303(x1), r1=211(y1), r2=67(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 211
LDI r2, 67
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
