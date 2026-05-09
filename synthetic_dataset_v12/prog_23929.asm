; DESCRIPTION: Places a black line segment connecting (53, 18) to (58, 87).
; PLAN: r0=53(x1), r1=18(y1), r2=58(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 18
LDI r2, 58
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
