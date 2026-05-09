; DESCRIPTION: Places a white line segment connecting (67, 211) to (244, 151).
; PLAN: r0=67(x1), r1=211(y1), r2=244(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 211
LDI r2, 244
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
