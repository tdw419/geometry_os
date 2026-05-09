; DESCRIPTION: Places a black line segment connecting (34, 148) to (102, 188).
; PLAN: r0=34(x1), r1=148(y1), r2=102(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 148
LDI r2, 102
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
