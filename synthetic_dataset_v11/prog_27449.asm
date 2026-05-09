; DESCRIPTION: Composite: . Then Draws a black circle centered at (192, 191) with radius 59. Then Places a black line segment connecting (6, 255) to (100, 73).
; PLAN: r0=192(x), r1=191(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=6(x1), r1=255(y1), r2=100(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (192, 191) with radius 59.
; PLAN: r0=192(x), r1=191(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 191
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black line segment connecting (6, 255) to (100, 73).
; PLAN: r0=6(x1), r1=255(y1), r2=100(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 255
LDI r2, 100
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
