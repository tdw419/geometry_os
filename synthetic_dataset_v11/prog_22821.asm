; DESCRIPTION: Places a black line segment connecting (142, 214) to (122, 36).
; PLAN: r0=142(x1), r1=214(y1), r2=122(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 214
LDI r2, 122
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
