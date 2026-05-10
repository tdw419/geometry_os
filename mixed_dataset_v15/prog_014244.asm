; DESCRIPTION: Places a black line segment connecting (45, 99) to (53, 14).
; PLAN: r0=45(x1), r1=99(y1), r2=53(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 99
LDI r2, 53
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
