; DESCRIPTION: Places a black line segment connecting (22, 29) to (105, 18).
; PLAN: r0=22(x1), r1=29(y1), r2=105(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 29
LDI r2, 105
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
