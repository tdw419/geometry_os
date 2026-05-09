; DESCRIPTION: Places a green line segment connecting (344, 114) to (257, 15).
; PLAN: r0=344(x1), r1=114(y1), r2=257(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 114
LDI r2, 257
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
