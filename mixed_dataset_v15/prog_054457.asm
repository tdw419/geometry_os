; DESCRIPTION: Places a black line segment connecting (380, 197) to (131, 201).
; PLAN: r0=380(x1), r1=197(y1), r2=131(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 197
LDI r2, 131
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
