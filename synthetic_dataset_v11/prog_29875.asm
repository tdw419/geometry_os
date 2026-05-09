; DESCRIPTION: Places a black line segment connecting (67, 142) to (252, 105).
; PLAN: r0=67(x1), r1=142(y1), r2=252(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 142
LDI r2, 252
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
