; DESCRIPTION: Places a yellow line segment connecting (257, 2) to (334, 195).
; PLAN: r0=257(x1), r1=2(y1), r2=334(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 2
LDI r2, 334
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
