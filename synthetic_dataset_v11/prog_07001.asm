; DESCRIPTION: Places a black line segment connecting (14, 227) to (22, 191).
; PLAN: r0=14(x1), r1=227(y1), r2=22(x2), r3=191(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 227
LDI r2, 22
LDI r3, 191
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
