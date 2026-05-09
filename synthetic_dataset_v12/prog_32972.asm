; DESCRIPTION: Places a white line segment connecting (129, 30) to (303, 151).
; PLAN: r0=129(x1), r1=30(y1), r2=303(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 30
LDI r2, 303
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
