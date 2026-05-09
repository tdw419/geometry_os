; DESCRIPTION: Places a black line segment connecting (91, 245) to (131, 237).
; PLAN: r0=91(x1), r1=245(y1), r2=131(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 245
LDI r2, 131
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
