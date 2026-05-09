; DESCRIPTION: Places a black line segment connecting (53, 187) to (40, 109).
; PLAN: r0=53(x1), r1=187(y1), r2=40(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 187
LDI r2, 40
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
