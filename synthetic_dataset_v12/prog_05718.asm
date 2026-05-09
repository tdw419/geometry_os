; DESCRIPTION: Places a yellow line segment connecting (257, 101) to (59, 201).
; PLAN: r0=257(x1), r1=101(y1), r2=59(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 101
LDI r2, 59
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
