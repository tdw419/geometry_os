; DESCRIPTION: Places a black line segment connecting (78, 162) to (29, 148).
; PLAN: r0=78(x1), r1=162(y1), r2=29(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 162
LDI r2, 29
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
