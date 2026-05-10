; DESCRIPTION: Places a blue line segment connecting (272, 103) to (257, 49).
; PLAN: r0=272(x1), r1=103(y1), r2=257(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 103
LDI r2, 257
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
