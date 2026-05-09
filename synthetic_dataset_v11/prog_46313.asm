; DESCRIPTION: Places a black line segment connecting (238, 4) to (45, 114).
; PLAN: r0=238(x1), r1=4(y1), r2=45(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 4
LDI r2, 45
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
