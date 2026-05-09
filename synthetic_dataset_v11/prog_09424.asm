; DESCRIPTION: Places a white line segment connecting (36, 139) to (165, 88).
; PLAN: r0=36(x1), r1=139(y1), r2=165(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 139
LDI r2, 165
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
