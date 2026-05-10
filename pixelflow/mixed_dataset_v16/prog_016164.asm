; DESCRIPTION: Places a yellow line segment connecting (131, 238) to (341, 159).
; PLAN: r0=131(x1), r1=238(y1), r2=341(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 238
LDI r2, 341
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
