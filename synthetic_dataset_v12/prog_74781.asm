; DESCRIPTION: Places a yellow line segment connecting (257, 186) to (343, 248).
; PLAN: r0=257(x1), r1=186(y1), r2=343(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 186
LDI r2, 343
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
