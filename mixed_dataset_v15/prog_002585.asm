; DESCRIPTION: Places a black line segment connecting (257, 58) to (362, 101).
; PLAN: r0=257(x1), r1=58(y1), r2=362(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 58
LDI r2, 362
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
