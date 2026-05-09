; DESCRIPTION: Places a black line segment connecting (26, 131) to (237, 11).
; PLAN: r0=26(x1), r1=131(y1), r2=237(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 131
LDI r2, 237
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
