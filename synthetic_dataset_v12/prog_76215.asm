; DESCRIPTION: Places a black line segment connecting (67, 251) to (66, 162).
; PLAN: r0=67(x1), r1=251(y1), r2=66(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 251
LDI r2, 66
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
