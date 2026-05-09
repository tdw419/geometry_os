; DESCRIPTION: Places a black line segment connecting (7, 97) to (67, 199).
; PLAN: r0=7(x1), r1=97(y1), r2=67(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 97
LDI r2, 67
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
