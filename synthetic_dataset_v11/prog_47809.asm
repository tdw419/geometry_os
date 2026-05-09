; DESCRIPTION: Places a black line segment connecting (204, 46) to (105, 35).
; PLAN: r0=204(x1), r1=46(y1), r2=105(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 46
LDI r2, 105
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
