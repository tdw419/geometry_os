; DESCRIPTION: Places a black line segment connecting (122, 207) to (55, 28).
; PLAN: r0=122(x1), r1=207(y1), r2=55(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 207
LDI r2, 55
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
