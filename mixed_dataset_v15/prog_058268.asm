; DESCRIPTION: Places a black line segment connecting (9, 14) to (58, 72).
; PLAN: r0=9(x1), r1=14(y1), r2=58(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 14
LDI r2, 58
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
