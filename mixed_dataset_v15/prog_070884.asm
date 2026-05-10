; DESCRIPTION: Places a yellow line segment connecting (83, 141) to (257, 59).
; PLAN: r0=83(x1), r1=141(y1), r2=257(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 141
LDI r2, 257
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
